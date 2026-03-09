import sharp from 'sharp';
import { readdir } from 'fs/promises';
import path from 'path';

const ROOT = path.resolve(import.meta.dirname, '..');

const images = [
  { src: 'foto-santi.jpeg', out: 'foto-santi.webp', width: 400 },
  { src: 'foto-lauri.jpg',  out: 'foto-lauri.webp',  width: 400 },
  { src: 'foto-enzo.jpg',   out: 'foto-enzo.webp',   width: 400 },
  { src: 'foto-mili.png',   out: 'foto-mili.webp',   width: 400 },
  { src: 'ISOLOGO_BLANCO.png',         out: 'ISOLOGO_BLANCO.webp',         width: 200 },
  { src: 'ISOLOGO_CIRCULO_BEIGE.png',  out: 'ISOLOGO_CIRCULO_BEIGE.webp',  width: 200 },
  { src: 'LOGO HORIZONTAL ORIGINAL BLANCO.png', out: 'LOGO_HORIZONTAL_ORIGINAL_BLANCO.webp', width: 400 },
];

for (const img of images) {
  const input = path.join(ROOT, img.src);
  const output = path.join(ROOT, img.out);
  try {
    const info = await sharp(input)
      .resize({ width: img.width, withoutEnlargement: true })
      .webp({ quality: 80 })
      .toFile(output);
    console.log(`✓ ${img.src} → ${img.out} (${(info.size / 1024).toFixed(1)}KB)`);
  } catch (e) {
    console.error(`✗ ${img.src}: ${e.message}`);
  }
}
