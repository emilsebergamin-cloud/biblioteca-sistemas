# 22 abril 2026 (noche) — Responsive mobile/tablet + auditoría editorial

## Contexto

Después de cerrar el plan de /aportes (3 commits), se ejecutó el plan de responsive mobile/tablet y una auditoría editorial completa del contenido de los 6 bloques.

## Trabajo realizado

### Responsive mobile + tablet (8 commits)

| # | Hash | Descripción |
|---|------|-------------|
| 1 | `67541da` | Padding + tipografía mobile en bloque y material (24px lateral, font 14px, text-align left, hyphens off) |
| 2 | `b447228` | Padding tablet (32px) + ajuste aire lateral mobile |
| 3 | `532b0c0` | Carousel 3D adaptado: 3 sets de positions (mobile/tablet/desktop), swipe horizontal, peek de cards, hover off en touch, centrado vertical en /biblioteca |
| 4 | `2e696b6` | Home hero (SVG clamp, stats gap), navbar (padding clamp), aportes (maxWidth 720px) |
| 5 | `8891c8b` | Tablas: scroll horizontal real con max-width override en descendientes |
| 6 | `82166e4` | Tablas → cards en mobile: transformTablesForMobile parsea HTML y convierte cada fila en card con label:valor |
| A | `ae9cfbb` | Callouts responsive: padding, font-size y margin reducidos en mobile (11 variantes de .tag) |
| B | `3cc991d` | Grid de cards: 1 columna hasta 430px, 2 columnas en 430px+ |

### Auditoría editorial (6 bloques)

Rol: editor editorial profesional, español rioplatense.

**Comillas:** ~65 frases corregidas de `'texto'` (comilla simple) a `"texto"` (comilla doble) en contenido_html de los 74 nodos. Las comillas simples eran un artefacto del escape SQL (`''`) que en la DB quedaban como `'`. Se respetó `McDonald's` como apóstrofe legítimo.

**Error factual corregido:** "dos estudiantes de Stanford fundaron Oracle" → "Larry Ellison leyó el paper, lo tomó como punto de partida, y junto a Bob Miner y Ed Oates fundó Oracle" (nodo bases-de-datos-relacionales, Bloque 2).

**Referencias a bloques inexistentes eliminadas:**
- Bloque 1, nodo que-es-un-algoritmo: "Lo vemos en profundidad en el Bloque 8." → eliminada.
- Bloque 6, nodo las-preguntas-que-no-tienen-respuesta-simple: "que es exactamente lo que exploramos en el Bloque 8" → eliminada.
- Bloque 6, nodo rag-la-solucion-a-las-alucinaciones: "Bloque 9 de automatizaciones" → reemplazada por "muchos asistentes de IA modernos".

**Voz rioplatense:** verificada y respetada en los 6 bloques. Sin correcciones necesarias — el tono es consistente.

## Pendientes para retomar

### Verificación manual (Emi)

11 datos factuales marcados durante la auditoría que requieren chequeo humano:

1. Stack Overflow Developer Survey 2025 — ¿existe publicado? (Bloque 1)
2. 15.000 ingenieros en MercadoLibre (Bloque 1)
3. 3 millones de paquetes en npm (Bloque 1)
4. Oracle vale 300 mil millones de dólares (Bloque 2)
5. Rappi valuada en 5.200 millones (Bloque 2)
6. 3.000 brechas de datos en 2024 / Identity Theft Resource Center (Bloque 4)
7. Arup pagó 25 millones por deepfakes (Bloque 4)
8. 140% aumento phishing en Latinoamérica 2024 (Bloque 4)
9. Multa Meta 1.200 millones euros GDPR (Bloque 4)
10. 35% startups fracasan por no market need / CB Insights (Bloque 5)
11. Context windows de GPT-4, Claude, Gemini — cifras actuales (Bloque 6)

### Próximos pasos

1. Verificar los 11 datos factuales.
2. Push a Vercel.
3. Logo + favicon + OG image.
4. Dominio propio.
5. Post de LinkedIn.
6. Commit 5 del plan responsive (flash of layout) — opcional, no bloqueante.

## Aprendizajes del día

- Las comillas en SQL (`''` escape) generan artefactos en la DB que no son visibles hasta que se renderizan en el browser. Verificar siempre el contenido renderizado, no solo el seed.
- El approach de "un REPLACE por frase" es tedioso pero seguro. Los regex globales en Supabase SQL Editor tienen problemas de escaping que los hacen poco confiables.
- Las tablas de 4+ columnas no caben en mobile — transformarlas a cards es mejor UX que scroll horizontal con indicador.
- El carousel 3D necesitó 3 rondas de ajuste (offsets, height, centrado vertical) para verse bien en mobile. Los valores teóricos no siempre coinciden con la percepción visual real.
