# 22 abril 2026 (tarde) — Seguridad Supabase + aportes como página independiente

## Contexto

Durante la ejecución del plan "/material complementario", Supabase envió una alerta crítica de seguridad: tablas expuestas sin RLS, incluyendo tablas con potenciales datos sensibles. Se pausó el trabajo de aportes para atacar seguridad primero.

Paralelamente, al retomar aportes, se detectó un malentendido de producto: lo que se estaba implementando era "comentarios por bloque" cuando en realidad la visión era "página global de aportes de la comunidad". Se re-planificó.

## Trabajo realizado

### Seguridad en Supabase

- Activado RLS en todas las tablas que lo tenían deshabilitado.
- Borradas 15 tablas del schema paralelo en inglés que no se usaban en código (nodes, resources, sessions, modules, learning_paths, learning_path_nodes, entry_questions, entry_question_options, glossary_terms, node_glossary_terms, node_relations, node_resources, node_sections, session_answers, session_node_progress).
- Estado final: 6 tablas en uso (aportes, bloques, nodos, quiz_preguntas, recursos, votos), todas con RLS activo.

### Re-planificación de aportes

Decisión tomada: los aportes NO son comentarios por bloque. Son una página independiente del sitio — un espacio general donde cualquiera puede dejar feedback, sugerencias, mensajes. Equivalente al "libro de visitas" o "buzón de sugerencias".

Plan de 3 commits reversibles:

- Commit 1: crear `/aportes` standalone con formulario y lista.
- Commit 2: crear header global con link "Aportes" + footer global con mini-manifiesto.
- Commit 3: limpiar /material — sacar la sección de aportes y el link del sidebar.

Estado al cierre del documento: Commit 1 en progreso (página creada, pendiente verificación visual y commit).

## Deuda técnica identificada (pendiente de atacar)

### De este día

Archivos del repo que todavía referencian las 15 tablas borradas y hay que limpiar/actualizar:

- `supabase/seeds/001_initial_data.sql` — seeds del schema viejo.
- `supabase/seeds/final_seed.sql` — seeds del schema viejo.
- `supabase/migrations/` — migraciones viejas.
- `docs/product/srs_mvp_biblioteca.md` — documenta schema viejo.
- `docs/foundations/documentacion_plataforma.md` — documenta schema viejo.
- `schema.sql` dice "4 tablas" pero tiene 5 y falta quiz_preguntas.

### Del critique de la sesión anterior (22 abril mañana)

- Código duplicado (~150 líneas) entre `/biblioteca/[slug]/page.js` y `/biblioteca/[slug]/material/page.js`: sidebar, mobile TOC, spinner, colors. A extraer en componentes compartidos: `Sidebar.js`, `MobileTOC.js`, `ScrollToTop.js`, `colors.js`.
- Sidebar de /material marca todos los links de Material como activos: falta IntersectionObserver.
- No hay prev/next entre bloques en /material (solo "volver a la lectura").

### Otros

- Overflow horizontal en mobile (crítico, bloqueante para MVP).
- Aire vertical excesivo en landing y bloques en mobile.
- Tablas responsive en mobile (se rompen).
- Encoding de nodos en Supabase (tildes y ñ corruptas).
- Refactor del archivo monolítico `page.js` del bloque (507 → 405 líneas, sigue siendo grande).
- Responsive intermedio (tablets/iPad).

## Próximos pasos

1. Terminar los 3 commits de /aportes.
2. Debug responsive mobile (crítico).
3. Limpiar deuda de repo listada arriba.
4. Frase editorial "El saber no ocupa lugar" + copy editorial final.
5. Deploy a Vercel del pulido completo.

## Aprendizajes del día

- Validar entendimiento del feature ANTES de implementar: el malentendido de "aportes por bloque vs. aportes globales" costó tiempo pero se descubrió a tiempo gracias a que la usuaria verificó el resultado contra su intención original.
- Las alertas de seguridad de Supabase son un canal valioso y deben atacarse apenas aparecen, aunque interrumpan el flujo de trabajo.
