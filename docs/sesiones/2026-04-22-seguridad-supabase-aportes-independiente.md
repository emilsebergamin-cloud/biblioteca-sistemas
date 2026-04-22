# 22 abril 2026 (tarde) — Seguridad Supabase + aportes como página independiente

## Contexto

Durante la ejecución del plan "/material complementario", Supabase envió una alerta crítica de seguridad: tablas expuestas sin RLS, incluyendo tablas con potenciales datos sensibles. Se pausó el trabajo de aportes para atacar seguridad primero.

Paralelamente, al retomar aportes, se detectó un malentendido de producto: lo que se estaba implementando era "comentarios por bloque" cuando en realidad la visión era "página global de aportes de la comunidad". Se re-planificó.

## Trabajo realizado

### Seguridad en Supabase

- Activado RLS en todas las tablas que lo tenían deshabilitado.
- Borradas 15 tablas del schema paralelo en inglés que no se usaban en código (nodes, resources, sessions, modules, learning_paths, learning_path_nodes, entry_questions, entry_question_options, glossary_terms, node_glossary_terms, node_relations, node_resources, node_sections, session_answers, session_node_progress).
- Estado final: 6 tablas en uso (aportes, bloques, nodos, quiz_preguntas, recursos, votos), todas con RLS activo.

### Migración de videos

- Extracción de 29 videos curados desde el HTML de maqueta (`content/BiblAI_v2 (3).html`).
- Ejecución del seed `supabase/recursos_seed.sql` en Supabase.
- 29 registros cargados en la tabla `recursos`.

### Re-planificación de aportes

Decisión tomada: los aportes NO son comentarios por bloque. Son una página independiente del sitio — un espacio general donde cualquiera puede dejar feedback, sugerencias, mensajes. Equivalente al "libro de visitas" o "buzón de sugerencias".

### Plan de /aportes — completado

Plan de 3 commits reversibles, todos ejecutados:

- **Commit 1** (`0d8165b`): crear `/aportes` standalone con formulario y lista. API actualizada para aceptar `nodo_id` opcional (aportes globales). Verificación visual aprobada.
- **Commit 2** (`fd66a50`): agregar link "Aportes" al navbar global + crear componente `Footer.js` con copyright, firma de autoría, y variante minimal para /aportes.
- **Commit 2b** (`173a121`): fix de footer — simplificado a copyright-only en todas las páginas. Se eliminó "Bibl·AI + frase" y sección "Navegación" porque eran redundantes con el header. Footer iterado dos veces hasta llegar a la versión correcta.
- **Commit 3** (`173a121`): limpiar `/material` de aportes (-207 líneas). Se eliminó: estado (`aportes`, `nombre`, `texto`, `tema`, `submitting`, `submitted`), fetch de aportes, `handleSubmitAporte`, `getSessionId`, sección `#aportes` completa del render, link "Aportes" del sidebar desktop y TOC mobile en vista de bloque. Subtítulo de /material actualizado a "Videos y quiz para...".

## Pendientes

### Bloqueantes para MVP

- Responsive mobile (overflow horizontal, aire excesivo, tablas rotas).
- Frase editorial "El saber no ocupa lugar" como epígrafe del bloque (reemplazando el breadcrumb actual).
- Deploy del pulido completo a Vercel.

### Pulido antes de shippeo público

- Limpieza de repo: `supabase/seeds/001_initial_data.sql`, `supabase/seeds/final_seed.sql`, `supabase/migrations/` viejas, `schema.sql` desactualizado, `docs/product/srs_mvp_biblioteca.md`, `docs/foundations/documentacion_plataforma.md`.
- Encoding de nodos en Supabase (tildes y ñ corruptas).
- Responsive intermedio (tablets/iPad).

### Deuda técnica (post-MVP)

- Refactor del archivo monolítico (`src/app/biblioteca/[slug]/page.js`, 405 líneas + `material/page.js` que también creció).
- Código duplicado entre bloque y /material (~150 líneas: sidebar, TOC mobile, colors).
- Sidebar de /material marca todos los links como activos (falta IntersectionObserver).
- Sin prev/next entre bloques en /material.

### Shippeo público

- Screenshots finales desktop + mobile.
- Video corto (30-60s) navegando el sitio.
- Post de LinkedIn acompañante.

## Aprendizajes del día

- Validar entendimiento del feature ANTES de implementar: el malentendido de "aportes por bloque vs. aportes globales" costó tiempo pero se descubrió a tiempo gracias a que la usuaria verificó el resultado contra su intención original.
- Las alertas de seguridad de Supabase son un canal valioso y deben atacarse apenas aparecen, aunque interrumpan el flujo de trabajo.
- Iterar el diseño del footer con feedback real (dos rondas) fue más eficiente que intentar acertar de una: la primera versión con logo + navegación era visualmente correcta pero redundante con el header.
