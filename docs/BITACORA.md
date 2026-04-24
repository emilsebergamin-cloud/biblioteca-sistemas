# Bitácora de desarrollo — 20-21 de abril 2026

## Resumen ejecutivo

En dos sesiones consecutivas se construyó la plataforma Bibl·AI desde un template vacío de Next.js hasta una aplicación funcional con 6 bloques de contenido, 74 nodos, quiz interactivo, videos curados, y un sistema de diseño editorial completo. La segunda mitad de la sesión se dedicó a resolver problemas de composición visual que resultaron ser más profundos de lo que parecían.

---

## Fase 1: Infraestructura (commits 11dbf37 a e1a858c)

### Lo que hicimos

- **Base de datos:** Diseñamos un esquema de 6 tablas (bloques, nodos, aportes, votos, recursos, quiz_preguntas). Ejecutamos seeds con 6 bloques, 74 nodos de contenido extraídos de PDFs, 29 videos curados y 26 preguntas de quiz.
- **Frontend:** Home con hero animado (BackgroundGradientAnimation), carousel 3D coverflow, página de biblioteca, vista completa de bloque con contenido renderizado.
- **API routes:** /api/bloques, /api/aportes (con rate limiting y sanitización), /api/votos (con manejo de duplicados).
- **Seguridad:** Headers HTTP en next.config.mjs, cliente Supabase server-side separado, sanitización de inputs.

### Commits clave

| Hash | Descripción |
|------|-------------|
| `11dbf37` | feat: home animado, carousel 3D, 74 nodos, API routes, seguridad y cliente server-side |
| `0bd4ed6` | feat: carousel conectado a Supabase |
| `d44a2cc` | feat: vista bloque completa igual a maqueta |
| `e1a858c` | fix: CSS etiquetas y seeds videos/quiz |

---

## Fase 2: El problema del text-align (commits 665a5dd a eea6de9)

### Lo que pensamos que era

El texto de los nodos se veía "justificado" o "raro". Asumimos que era `text-align: justify` viniendo del contenido HTML de Supabase o del CSS.

### Lo que intentamos (y no funcionó)

1. Agregar `text-align: left !important` en globals.css → no cambió nada visualmente.
2. Agregar selectores de atributo `[style*="justify"]` → el contenido HTML no tenía justify inline.
3. Sanitizar el HTML con `.replace(/text-align:justify/gi, 'text-align:left')` antes de render → innecesario, no había justify en el HTML.

### Lo que realmente era

**No era un problema tipográfico.** Era un problema de composición visual: tres ejes de alineación compitiendo (navbar full-width, cabecera centrada, contenido alineado a la izquierda). El ojo no encontraba un eje dominante y todo "se sentía flotando". Después descubrimos que tres reglas con `!important` en globals.css estaban bloqueando los cambios — explicado en la sección "Lección aprendida" más abajo. Esto se documentó en `biblai-fixes-composicion.md`.

### Commits de esta fase

| Hash | Descripción |
|------|-------------|
| `665a5dd` | fix: tipografia fluida y responsive |
| `7094705` | fix: text-align left forzado |
| `7b5cea8` | fix: override text-align del contenido HTML |
| `eea6de9` | fix: sanitizar text-align justify del HTML antes de render |

### Lección aprendida

Tres reglas `text-align: left !important` en globals.css anulaban cualquier cambio posterior en JSX. Esto causó que los 3 fixes siguientes parecieran "no funcionar" cuando en realidad el CSS global los pisaba. Se eliminaron en el commit `37ae719`.

---

## Fase 3: Composición visual del bloque (commits 398046f a 7c8440a)

### Fix 1 — Unificar eje izquierdo (398046f)

Movimos breadcrumb y cabecera dentro del grid CSS con `gridColumn: 2`. Eliminamos los tres ejes de alineación distintos (breadcrumb a 1100px, header a 780px centrado, contenido a la izquierda del grid).

**Resultado:** el eje izquierdo quedó unificado. Pero Emi después decidió que prefería títulos centrados.

### Fix 2 — Subir índice lateral (60619f8 + 6d104f8)

Movimos el `<aside>` del índice como primer hijo del grid y redujimos padding-top acumulado de 96px a 24px.

**Problema descubierto:** al mover el aside, el contenido principal quedó sin `gridColumn` explícito y el auto-placement del grid lo metía en columna 1. Fix incremental en `6d104f8`.

### El bug de los 400px de espacio negro (7c8440a)

**Lo que pensamos:** padding excesivo.

**Lo que realmente era:** El grid tenía múltiples hijos directos (aside, breadcrumb, header, contenido) en columnas distintas. El aside ocupaba solo la fila 1, estirándola a ~400px (la altura de los 11 items del índice). El header caía en fila 2, que empezaba después de esos 400px.

**Solución:** envolver todo el contenido de columna 2 en un wrapper `<div>` único. El grid pasó a tener una sola fila implícita: aside en columna 1, wrapper en columna 2.

### Diseño final (37ae719 + 91eaa76)

- Títulos centrados dentro de columna 2 (`textAlign: 'center'`)
- Cuerpo justificado con hyphens (`text-align: justify` + `hyphens: auto` + `lang="es"`)
- Header a maxWidth 880px (para que el H1 entre en una línea)
- Contenido a maxWidth 780px (ancho óptimo de lectura)
- Paddings verticales reducidos

### Commits de esta fase

| Hash | Descripción |
|------|-------------|
| `398046f` | fix(bloque): unificar eje izquierdo de cabecera, breadcrumb y cuerpo |
| `60619f8` | fix(bloque): subir índice lateral a la altura del H1 (Fix 2) |
| `6d104f8` | fix(bloque): agregar gridColumn explícito al contenido principal |
| `37ae719` | fix(bloque): centrar bloque completo y justificar cuerpo de párrafos |
| `91eaa76` | fix(bloque): título en una sola línea + reducir aire vertical |
| `8a88000` | fix(bloque): reducir espacio vertical superior |
| `7c8440a` | fix(bloque): envolver columna 2 en wrapper único |

---

## Fase 4: Calidad de código (commits 54cd065 a a159a7e)

### Análisis crítico

Se hizo una auditoría del código como senior frontend engineer. Top 3 problemas identificados:

1. **Archivo monolítico de 507 líneas** — fetching, state, UI y quiz en un solo componente. Pendiente para refactor.
2. **`dangerouslySetInnerHTML` sin sanitización** — resuelto con DOMPurify (`1149831`).
3. **`* { max-width: 100% }` en globals.css** — selector universal que afectaba todo el sitio. Posible causa raíz del overflow horizontal. Resuelto acotándolo a `.nodo-content *` (`54cd065`).

### Commits de esta fase

| Hash | Descripción |
|------|-------------|
| `54cd065` | fix(css): eliminar selector universal con max-width: 100% |
| `1149831` | fix(seguridad): sanitizar contenido_html con DOMPurify |
| `a159a7e` | fix(home): reducir aire vertical del hero en mobile |

---

## Pendientes para mañana

### Prioridad alta

1. **Refactor del archivo monolítico** (`src/app/biblioteca/[slug]/page.js`, 507 líneas). Extraer componentes: `QuizSection`, `VideoSection`, `NodoSection`, `BloqueHeader`, `SidebarIndex`.
2. **Encoding de nodos en Supabase.** Los caracteres españoles (tildes, ñ, —) están corruptos en la DB. El archivo `nodos_seed.sql` está correcto en UTF-8, pero al ejecutarlo en el SQL Editor de Supabase se guardó con encoding incorrecto. Hay que borrar y re-insertar.
3. **Overflow horizontal en mobile.** Las tablas del contenido de nodos se salen del viewport en pantallas chicas. Necesita `overflow-x: auto` en el wrapper de tablas.
4. **Responsive mobile crítico:** la vista de bloque en celular real (testeada hoy) tiene tres problemas: (a) sigue habiendo aire vertical excesivo, (b) hay overflow horizontal que permite scroll lateral y muestra fondo blanco, (c) el texto se corta. Requiere sesión dedicada con diagnóstico desde celu real.

### Prioridad media

4. **Accesibilidad:** breadcrumb con `role="navigation"` y `aria-label`, aside con `aria-label`, quiz buttons con roles ARIA.
5. **CSS duplicado:** `.nodo-content td` definido dos veces en globals.css (líneas 202-207 y 243-251).
6. **`isMobile`/`isTablet` via JS** causa flash of wrong layout. Evaluar migración a media queries CSS.
7. **Eliminar archivos muertos:** `BloqueGrid.js` (no se usa), migraciones viejas en `supabase/migrations/`.

### Prioridad baja

8. **Deploy a Vercel** — el proyecto nunca se deployó. Requiere configurar env vars en Vercel.
9. **Responsive del carousel 3D** — en mobile las cards se solapan.
10. **Navbar en páginas oscuras** — el fondo crema (#F7F4EF) de la navbar contrasta mal con el fondo negro (#1A1A1A) de /biblioteca.

---

## Sobre el proceso

Esta sesión fue un caso de manejo de incertidumbre técnica con asistencia de IA (Claude Code para implementación, Claude conversacional para diagnóstico y diseño). Decisiones clave del rol PM:

- Frenar la implementación 4 veces para diagnosticar antes de aplicar fixes a ciegas.
- Pedir diff antes de cada commit (vs. "aplicar y revisar después").
- Separar problemas de código vs. problemas visuales y atacarlos con herramientas distintas.
- Documentar hipótesis incorrectas, no solo soluciones.

El resultado: 8 commits acotados con causa raíz identificada en cada uno, en lugar de un fix monolítico difícil de revertir.

---

## Archivos tocados en la sesión

34 commits, ~8000 líneas de código. Archivos principales:

- `src/app/page.js` — Home con hero animado
- `src/app/biblioteca/[slug]/page.js` — Vista de bloque (507 líneas)
- `src/app/globals.css` — Sistema de diseño completo
- `src/components/Carousel3D.js` — Carousel 3D coverflow
- `src/components/ui/BackgroundGradientAnimation.js` — Gradiente animado
- `supabase/nodos_seed.sql` — 74 nodos de contenido (130KB)
- `supabase/quiz_seed.sql` — 26 preguntas de quiz
- `supabase/recursos_seed.sql` — 29 videos curados

---

### [22 abril 2026 — Arquitectura de material complementario + investigación de aportes](./sesiones/2026-04-22-arquitectura-material-complementario.md)

Sesión de decisiones de producto. Se definió separar el contenido editorial del material complementario (`/material` como subpágina con videos, quiz y aportes). Se investigó el estado de los aportes: la infraestructura está intacta, solo se perdió la UI en un refactor previo. Implementación queda para la siguiente sesión.

**Tags:** arquitectura de información, product decisions, investigación técnica

---

### [22 abril 2026 — Limpieza de seguridad en Supabase + recuperación de aportes como página independiente](./sesiones/2026-04-22-seguridad-supabase-aportes-independiente.md)

Resolución de alertas de seguridad en Supabase (RLS + 15 tablas borradas). Pivoteo del feature "aportes" a página independiente. Plan ejecutado completo: /aportes standalone, header con link nuevo, footer global simplificado, /material limpio. Videos del HTML viejo migrados a Supabase (29 registros). Footer re-iterado dos veces para llegar a la versión minimal correcta.

**Tags:** seguridad, RLS, cleanup, product pivot, aportes, footer, migración de videos

---

### [22 abril 2026 — Responsive mobile/tablet + auditoría editorial de contenido](./sesiones/2026-04-22-responsive-y-auditoria-editorial.md)

Responsive completo en 8 commits: paddings mobile (24px) y tablet (32px) en bloque y material, carousel 3D adaptado con swipe horizontal y peek de cards laterales, tablas transformadas a grid de cards en mobile, callouts responsive, home hero + navbar con clamp fluido. Auditoría editorial de los 6 bloques: comillas simples corregidas a dobles en ~65 frases, error factual Oracle/Stanford corregido, 3 referencias a bloques inexistentes (8 y 9) eliminadas. 11 datos factuales pendientes de verificación manual.

**Tags:** responsive, mobile, tablet, carousel, swipe, tablas, editorial, comillas, auditoría
