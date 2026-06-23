import { PGlite } from '@electric-sql/pglite';
import { readFileSync, writeFileSync } from 'fs';

const db = new PGlite();

function run(file) {
  const sql = readFileSync(file, 'utf8');
  return db.exec(sql);
}

await run('supabase/schema.sql');
await run('supabase/seed.sql');
await run('supabase/nodos_seed.sql');
await run('supabase/quiz_seed.sql');

const bloques = (await db.query(
  `SELECT id, slug, titulo, subtitulo, descripcion, orden, estado, color_acento, icono
   FROM bloques ORDER BY orden ASC`
)).rows;

const nodos = (await db.query(
  `SELECT id, bloque_id, slug, titulo, resumen_corto, contenido_html, tipo, tags, dificultad, orden_en_bloque, estado
   FROM nodos ORDER BY bloque_id, orden_en_bloque ASC`
)).rows;

const quiz = (await db.query(
  `SELECT id, bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado
   FROM quiz_preguntas ORDER BY bloque_id, orden ASC`
)).rows;

const recursos = (await db.query(
  `SELECT id, nodo_id, titulo, url, tipo, dificultad, orden, estado
   FROM recursos ORDER BY nodo_id, orden ASC`
)).rows;

const out = `// ARCHIVO GENERADO AUTOMÁTICAMENTE — no editar a mano.
// Fuente: supabase/{seed,nodos_seed,quiz_seed}.sql
// Generar con: node scripts/generar-fallback.mjs
// Sirve como contenido de respaldo cuando Supabase no está disponible,
// de modo que la app funcione igual sin base de datos configurada.

export const BLOQUES = ${JSON.stringify(bloques, null, 2)};

export const NODOS = ${JSON.stringify(nodos, null, 2)};

export const QUIZ_PREGUNTAS = ${JSON.stringify(quiz, null, 2)};

export const RECURSOS = ${JSON.stringify(recursos, null, 2)};
`;

writeFileSync('src/lib/fallback-content.js', out);

console.log('OK:', {
  bloques: bloques.length,
  nodos: nodos.length,
  quiz: quiz.length,
  recursos: recursos.length,
});
