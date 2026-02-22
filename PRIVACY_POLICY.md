# Política de Privacidad — Engine Consulting Bot Middleware

**Última actualización:** febrero 2026

---

## 1. Introducción

Engine Consulting ("nosotros", "nuestro") opera un servicio de middleware que conecta bots de Telegram con motores de inteligencia artificial, con integración opcional a Google Drive para el almacenamiento de archivos.

Esta política de privacidad explica qué información recopilamos, cómo la utilizamos y los derechos que tienen los usuarios sobre sus datos.

## 2. Información que recopilamos

### 2.1 Usuarios de Telegram (usuarios finales)

Cuando interactúas con un bot operado a través de nuestro servicio, recopilamos:

- **Identificador de usuario de Telegram** (user ID) y **nombre** (first_name) proporcionados por la API de Telegram.
- **Mensajes de texto** enviados al bot.
- **Imágenes, fotos y archivos de audio** enviados al bot.
- **Historial de conversaciones** entre el usuario y el bot.
- **Estadísticas de uso**: cantidad de tokens procesados, tiempo de respuesta y métricas de rendimiento por mensaje.

### 2.2 Clientes (operadores de bots)

Los clientes que acceden al panel de administración proporcionan:

- **Nombre de usuario y contraseña** para autenticación (las contraseñas se almacenan como hash bcrypt, nunca en texto plano).
- **Credenciales de Google Drive** (refresh token OAuth2) cuando conectan su cuenta de Google Drive al servicio.

## 3. Cómo usamos la información

Utilizamos la información recopilada exclusivamente para:

- **Procesar mensajes**: enviar los mensajes del usuario al motor de IA y devolver las respuestas al bot de Telegram.
- **Almacenar archivos**: subir imágenes y archivos de audio al Google Drive del cliente, cuando este lo ha configurado, para su almacenamiento y gestión.
- **Mantener el contexto de conversación**: preservar el historial de chat para que el bot pueda ofrecer respuestas coherentes.
- **Estadísticas de uso**: generar métricas agregadas de consumo para los operadores de bots.
- **Autenticación**: verificar la identidad de los clientes en el panel de administración.

No vendemos, alquilamos ni compartimos información personal con terceros con fines comerciales.

## 4. Servicios de terceros

Nuestro servicio transmite datos a los siguientes proveedores para su funcionamiento:

| Servicio | Datos compartidos | Política de privacidad |
|----------|-------------------|----------------------|
| **Telegram** | Respuestas de texto, indicadores de escritura | [telegram.org/privacy](https://telegram.org/privacy) |
| **Dify** | Mensajes, imágenes, audio, identificador de usuario, ID de conversación | [dify.ai/privacy](https://dify.ai/privacy) |
| **Google Drive** | Archivos de imagen y audio subidos por los usuarios | [policies.google.com/privacy](https://policies.google.com/privacy) |

## 5. Uso de Google Drive (scope limitado)

Nuestro servicio solicita acceso a Google Drive utilizando el scope `drive.file`, que limita el acceso **exclusivamente a los archivos creados por esta aplicación**. Esto significa que:

- **No accedemos** a ningún otro archivo existente en el Google Drive del usuario.
- **No leemos, modificamos ni eliminamos** archivos que no hayan sido creados por este servicio.
- **Solo creamos** archivos nuevos (imágenes y audios recibidos por el bot) en la carpeta configurada por el cliente.
- Los refresh tokens de OAuth2 se almacenan de forma segura en el servidor y se utilizan únicamente para autenticar las operaciones de subida de archivos.
- El cliente puede desconectar su Google Drive en cualquier momento desde el panel de administración, lo cual revoca el acceso del servicio.

## 6. Almacenamiento y seguridad

- Los datos se almacenan en una base de datos SQLite en el servidor del operador.
- Las contraseñas se almacenan como hash bcrypt (no en texto plano).
- Todas las comunicaciones con servicios externos se realizan a través de HTTPS.
- El acceso al panel de administración requiere autenticación.
- Los archivos subidos a Google Drive quedan bajo el control y almacenamiento de la cuenta de Google del cliente.

## 7. Retención de datos

- **Conversaciones**: se almacenan de forma indefinida hasta que el operador las elimine manualmente desde el panel de administración.
- **Archivos en Google Drive**: permanecen en la cuenta de Google del cliente y están bajo su control total.
- **Estadísticas de uso**: se almacenan de forma indefinida con agregación mensual.
- **Cuentas de usuario**: se mantienen hasta que un administrador las elimine.

## 8. Derechos del usuario

Los usuarios finales y clientes tienen derecho a:

- **Solicitar la eliminación** de sus datos personales.
- **Solicitar información** sobre qué datos se almacenan.
- **Desconectar Google Drive** en cualquier momento, revocando el acceso del servicio a su cuenta.

Para ejercer estos derechos, contacte al operador del servicio a través de [www.engineconsulting.com.ar](https://www.engineconsulting.com.ar).

## 9. Cambios a esta política

Nos reservamos el derecho de actualizar esta política de privacidad. Cualquier cambio será publicado en esta misma página con la fecha de actualización correspondiente.

## 10. Contacto

Para consultas sobre privacidad o protección de datos:

**Engine Consulting**
Web: [www.engineconsulting.com.ar](https://www.engineconsulting.com.ar)

---
---

# Privacy Policy — Engine Consulting Bot Middleware

**Last updated:** February 2026

---

## 1. Introduction

Engine Consulting ("we", "our", "us") operates a middleware service that connects Telegram bots with artificial intelligence engines, with optional Google Drive integration for file storage.

This privacy policy explains what information we collect, how we use it, and the rights users have regarding their data.

## 2. Information We Collect

### 2.1 Telegram Users (End Users)

When you interact with a bot operated through our service, we collect:

- **Telegram user ID** and **name** (first_name) as provided by the Telegram API.
- **Text messages** sent to the bot.
- **Images, photos, and audio files** sent to the bot.
- **Conversation history** between the user and the bot.
- **Usage statistics**: token counts, response times, and performance metrics per message.

### 2.2 Clients (Bot Operators)

Clients who access the administration panel provide:

- **Username and password** for authentication (passwords are stored as bcrypt hashes, never in plain text).
- **Google Drive credentials** (OAuth2 refresh token) when they connect their Google Drive account to the service.

## 3. How We Use Information

We use the collected information exclusively to:

- **Process messages**: send user messages to the AI engine and return responses to the Telegram bot.
- **Store files**: upload images and audio files to the client's Google Drive, when configured, for storage and management.
- **Maintain conversation context**: preserve chat history so the bot can provide coherent responses.
- **Usage statistics**: generate aggregated consumption metrics for bot operators.
- **Authentication**: verify client identity in the administration panel.

We do not sell, rent, or share personal information with third parties for commercial purposes.

## 4. Third-Party Services

Our service transmits data to the following providers for its operation:

| Service | Data Shared | Privacy Policy |
|---------|-------------|----------------|
| **Telegram** | Text responses, typing indicators | [telegram.org/privacy](https://telegram.org/privacy) |
| **Dify** | Messages, images, audio, user ID, conversation ID | [dify.ai/privacy](https://dify.ai/privacy) |
| **Google Drive** | Image and audio files uploaded by users | [policies.google.com/privacy](https://policies.google.com/privacy) |

## 5. Google Drive Usage (Limited Scope)

Our service requests access to Google Drive using the `drive.file` scope, which limits access **exclusively to files created by this application**. This means:

- We **do not access** any other existing files in the user's Google Drive.
- We **do not read, modify, or delete** files that were not created by this service.
- We **only create** new files (images and audio received by the bot) in the folder configured by the client.
- OAuth2 refresh tokens are stored securely on the server and are used solely to authenticate file upload operations.
- The client can disconnect their Google Drive at any time from the administration panel, which revokes the service's access.

## 6. Storage and Security

- Data is stored in a SQLite database on the operator's server.
- Passwords are stored as bcrypt hashes (not in plain text).
- All communications with external services are conducted over HTTPS.
- Access to the administration panel requires authentication.
- Files uploaded to Google Drive remain under the control and storage of the client's Google account.

## 7. Data Retention

- **Conversations**: stored indefinitely until the operator manually deletes them from the administration panel.
- **Files on Google Drive**: remain in the client's Google account and are under their full control.
- **Usage statistics**: stored indefinitely with monthly aggregation.
- **User accounts**: maintained until an administrator deletes them.

## 8. User Rights

End users and clients have the right to:

- **Request deletion** of their personal data.
- **Request information** about what data is stored.
- **Disconnect Google Drive** at any time, revoking the service's access to their account.

To exercise these rights, contact the service operator at [www.engineconsulting.com.ar](https://www.engineconsulting.com.ar).

## 9. Changes to This Policy

We reserve the right to update this privacy policy. Any changes will be published on this same page with the corresponding update date.

## 10. Contact

For privacy or data protection inquiries:

**Engine Consulting**
Web: [www.engineconsulting.com.ar](https://www.engineconsulting.com.ar)
