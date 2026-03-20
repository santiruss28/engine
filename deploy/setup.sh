#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# OpenClaw VPS Setup Script
# Para Hetzner Cloud (Ubuntu + Docker preinstalado via cloud-init)
# =============================================================================

DEPLOY_DIR="/opt/openclaw"
COMPOSE_FILE="$DEPLOY_DIR/docker-compose.yml"

echo "==========================================="
echo "  OpenClaw - Setup para VPS"
echo "==========================================="
echo ""

# --- 1. Verificar que Docker está corriendo ---
if ! command -v docker &>/dev/null; then
    echo "[ERROR] Docker no está instalado. Verificá tu cloud-init."
    exit 1
fi

if ! docker info &>/dev/null; then
    echo "[WARN] Docker no responde. Intentando iniciar..."
    sudo systemctl start docker
    sleep 2
    if ! docker info &>/dev/null; then
        echo "[ERROR] No se pudo iniciar Docker."
        exit 1
    fi
fi
echo "[OK] Docker está corriendo"

# --- 2. Verificar docker-compose ---
if command -v docker-compose &>/dev/null; then
    COMPOSE_CMD="docker-compose"
elif docker compose version &>/dev/null 2>&1; then
    COMPOSE_CMD="docker compose"
else
    echo "[ERROR] docker-compose no está instalado."
    exit 1
fi
echo "[OK] Compose disponible: $COMPOSE_CMD"

# --- 3. Crear directorio de deploy ---
sudo mkdir -p "$DEPLOY_DIR"
sudo chown "$(whoami):$(whoami)" "$DEPLOY_DIR"
echo "[OK] Directorio: $DEPLOY_DIR"

# --- 4. Copiar archivos ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$SCRIPT_DIR/docker-compose.yml" "$DEPLOY_DIR/docker-compose.yml"
echo "[OK] docker-compose.yml copiado"

# --- 5. Configurar .env ---
if [ ! -f "$DEPLOY_DIR/.env" ]; then
    # Generar token automáticamente
    GENERATED_TOKEN=$(openssl rand -hex 32)

    cp "$SCRIPT_DIR/.env.example" "$DEPLOY_DIR/.env"
    sed -i "s/^OPENCLAW_GATEWAY_TOKEN=$/OPENCLAW_GATEWAY_TOKEN=$GENERATED_TOKEN/" "$DEPLOY_DIR/.env"

    echo ""
    echo "==========================================="
    echo "  IMPORTANTE: Configurá tu .env"
    echo "==========================================="
    echo ""
    echo "  Se generó un token automáticamente."
    echo "  Editá $DEPLOY_DIR/.env para agregar tus API keys:"
    echo ""
    echo "    nano $DEPLOY_DIR/.env"
    echo ""
    echo "  Tu token de gateway es:"
    echo "    $GENERATED_TOKEN"
    echo ""
    echo "  Guardalo en un lugar seguro."
    echo "==========================================="
    echo ""

    read -rp "¿Ya configuraste las API keys en .env? (s/N): " CONFIRM
    if [[ "$CONFIRM" != "s" && "$CONFIRM" != "S" ]]; then
        echo ""
        echo "Editá $DEPLOY_DIR/.env y después ejecutá:"
        echo "  cd $DEPLOY_DIR && $COMPOSE_CMD up -d"
        exit 0
    fi
else
    echo "[OK] .env ya existe, no se sobreescribe"
fi

# --- 6. Pull de la imagen ---
echo ""
echo "[...] Descargando imagen de OpenClaw..."
cd "$DEPLOY_DIR"
$COMPOSE_CMD pull

# --- 7. Levantar servicios ---
echo ""
echo "[...] Levantando OpenClaw..."
$COMPOSE_CMD up -d

echo ""
echo "==========================================="
echo "  OpenClaw está corriendo!"
echo "==========================================="
echo ""
echo "  Gateway: http://127.0.0.1:18789"
echo ""
echo "  Para acceder desde tu máquina local usá SSH tunnel:"
echo "    ssh -L 18789:127.0.0.1:18789 usuario@tu-vps-ip"
echo ""
echo "  Después abrí: http://localhost:18789"
echo ""
echo "  Comandos útiles:"
echo "    cd $DEPLOY_DIR"
echo "    $COMPOSE_CMD logs -f          # Ver logs"
echo "    $COMPOSE_CMD restart          # Reiniciar"
echo "    $COMPOSE_CMD down             # Detener"
echo "    $COMPOSE_CMD pull && $COMPOSE_CMD up -d  # Actualizar"
echo ""
