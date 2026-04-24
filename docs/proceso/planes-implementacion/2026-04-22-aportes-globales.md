# Aportes Globales — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convertir aportes de una sección dentro de `/material` a una página independiente del sitio (`/aportes`), agregar header+footer global, y limpiar `/material`.

**Architecture:** Se crea `/aportes` como página standalone con form+lista. Se ajusta la API y DB para aceptar aportes sin `nodo_id` (globales). Se agrega link en navbar y footer global en layout. Se limpia la sección de aportes de `/material` y los links correspondientes en sidebars.

**Tech Stack:** Next.js 16 (App Router), React 19, Supabase (REST API + server client), Tailwind CSS 4.

---

## Pre-requisito: Migración de DB

La tabla `aportes` tiene `nodo_id uuid NOT NULL`. Para aportes globales necesitamos hacerlo nullable.

**Ejecutar en Supabase SQL Editor antes de empezar:**

```sql
ALTER TABLE aportes ALTER COLUMN nodo_id DROP NOT NULL;
```

Esto no rompe nada existente — los aportes que ya tienen `nodo_id` lo conservan.

---

## File Structure

| Action | File | Responsibility |
|--------|------|----------------|
| **Create** | `src/app/aportes/page.js` | Página /aportes: form + lista de aportes globales |
| **Create** | `src/components/Footer.js` | Footer global del sitio |
| **Modify** | `src/app/api/aportes/route.js` | Aceptar POST sin nodo_id, GET sin filtro |
| **Modify** | `src/lib/db.js:23-33` | createAporte con nodo_id opcional |
| **Modify** | `src/components/Navbar.js` | Agregar link "Aportes" |
| **Modify** | `src/app/layout.js` | Agregar Footer después de main |
| **Modify** | `src/app/biblioteca/[slug]/material/page.js` | Eliminar sección aportes, state, fetch |
| **Modify** | `src/app/biblioteca/[slug]/page.js` | Eliminar link "Aportes" del sidebar y TOC mobile |
| **Modify** | `src/app/biblioteca/[slug]/material/page.js` | Eliminar link "Aportes" del sidebar y TOC mobile |

---

## Commit 1: Crear página /aportes

### Task 1: Ajustar API y DB para aportes globales

**Files:**
- Modify: `src/app/api/aportes/route.js`
- Modify: `src/lib/db.js:23-33`

- [ ] **Step 1: Modificar `createAporte` en db.js para nodo_id opcional**

En `src/lib/db.js`, la función `createAporte` (línea 23) inserta siempre `nodo_id`. Cambiar para que sea opcional:

```js
// Antes (línea 26):
.insert([{ nodo_id, contenido, autor_nombre, estado: 'pendiente' }])

// Después:
.insert([{ nodo_id: nodo_id || null, contenido, autor_nombre, estado: 'pendiente' }])
```

- [ ] **Step 2: Modificar POST en route.js para no requerir nodo_id**

En `src/app/api/aportes/route.js`, la validación (línea 54) exige `nodo_id`. Cambiar:

```js
// Antes (línea 54):
if (!nodo_id || !contenido) {

// Después:
if (!contenido) {
```

Y el rate limiting (línea 63) usa `nodo_id` como key. Para aportes globales, usar `'global'`:

```js
// Antes (línea 63):
if (isRateLimited(session_id, nodo_id)) {

// Después:
if (isRateLimited(session_id, nodo_id || 'global')) {
```

- [ ] **Step 3: Verificar que GET sin nodo_id ya funciona**

`getApprovedAportes` en db.js (línea 5) ya maneja el caso sin nodoId — solo filtra si se pasa. No requiere cambios.

### Task 2: Crear página /aportes

**Files:**
- Create: `src/app/aportes/page.js`

- [ ] **Step 1: Crear `src/app/aportes/page.js`**

Página client-side con:
- Fondo `--paper` (#F7F4EF), color `--ink` (#0D0C0A) — consistente con home, no con tema oscuro de biblioteca
- H1: "Aportes de la comunidad"
- Subtítulo italic muted: "Contanos qué pensás, sugerinos un tema, reportá algo que no funciona."
- Formulario minimalista:
  - Campo "Nombre" (opcional, placeholder "Cómo te llamás (opcional)")
  - Textarea "Tu aporte" (obligatorio, max 500 chars con contador)
  - Botón "Enviar" en accent (#C5E832) con texto oscuro
- Lista de aportes aprobados (nombre, texto, fecha formateada)
- Estado vacío: "Sé la primera persona en dejar un aporte."
- Fetch GET `/api/aportes` (sin nodo_id → trae todos los aprobados)
- POST `/api/aportes` con `contenido`, `autor_nombre`, `session_id` (sin nodo_id)

- [ ] **Step 2: Verificar que compila**

Run: `npx next build` — verificar que `/aportes` aparece en la tabla de rutas.

- [ ] **Step 3: Verificar visualmente en el browser**

Abrir `http://localhost:4000/aportes` y confirmar:
- H1 y subtítulo se ven correctos
- Formulario funciona (enviar un aporte, ver mensaje de confirmación)
- Lista vacía muestra "Sé la primera persona en dejar un aporte."
- Contador de caracteres funciona

- [ ] **Step 4: Mostrar diff al usuario para revisión**

**CHECKPOINT — No avanzar al Commit 2 sin confirmación.**

- [ ] **Step 5: Commit 1**

```bash
git add src/app/aportes/page.js src/app/api/aportes/route.js src/lib/db.js
git commit -m "feat: crear página /aportes como espacio global de feedback"
```

---

## Commit 2: Header global + Footer global

### Task 3: Agregar link "Aportes" al navbar

**Files:**
- Modify: `src/components/Navbar.js`

- [ ] **Step 1: Agregar link "Aportes" al navbar**

Actualmente el navbar tiene solo "Biblioteca" a la derecha. Agregar "Aportes" al lado. Cambiar la estructura de la derecha para tener dos links:

```jsx
<div style={{ display: 'flex', alignItems: 'center', gap: '24px', paddingRight: '32px' }}>
  <Link href="/biblioteca" style={{ fontSize: '14px', fontWeight: 500, color: '#9B9080', textDecoration: 'none' }}>
    Biblioteca
  </Link>
  <Link href="/aportes" style={{ fontSize: '14px', fontWeight: 500, color: '#9B9080', textDecoration: 'none' }}>
    Aportes
  </Link>
</div>
```

### Task 4: Crear Footer global

**Files:**
- Create: `src/components/Footer.js`
- Modify: `src/app/layout.js`

- [ ] **Step 1: Crear `src/components/Footer.js`**

Componente client-side con:
- Fondo `--paper2` (#EFEBE3) para diferenciarse del body
- Padding vertical generoso (60px top, 48px bottom)
- Desktop: dos columnas (izq: logo+tagline, der: mini-nav)
- Mobile: todo stacked verticalmente centrado
- Debajo centrado: "© 2026 · Proyecto educativo personal"

Estructura:
```
┌──────────────────────────────────────────────┐
│  Bibl·AI                    Biblioteca       │
│  El saber no ocupa lugar.   Aportes →        │
│                                              │
│         © 2026 · Proyecto educativo personal │
└──────────────────────────────────────────────┘
```

En mobile:
```
┌──────────────────┐
│     Bibl·AI      │
│ El saber no...   │
│                  │
│   Biblioteca     │
│   Aportes →      │
│                  │
│  © 2026 · ...    │
└──────────────────┘
```

Usar `isMobile` via `matchMedia` (mismo patrón que el resto del proyecto) para el layout responsive.

- [ ] **Step 2: Agregar Footer al layout.js**

En `src/app/layout.js`, después de `<main>`, agregar `<Footer />`:

```jsx
import Footer from "@/components/Footer";

// ...dentro del body:
<Navbar />
<main className="flex-1">{children}</main>
<Footer />
```

- [ ] **Step 3: Verificar que compila**

Run: `npx next build`

- [ ] **Step 4: Verificar visualmente en el browser**

Verificar footer en:
- `http://localhost:4000/` (home)
- `http://localhost:4000/biblioteca` (biblioteca)
- `http://localhost:4000/biblioteca/bloque-1` (bloque)
- `http://localhost:4000/biblioteca/bloque-1/material` (material)
- `http://localhost:4000/aportes` (aportes)
- Verificar en mobile (ventana achicada): elementos se apilan

Verificar navbar: link "Aportes" aparece al lado de "Biblioteca".

- [ ] **Step 5: Mostrar diff al usuario para revisión**

**CHECKPOINT — No avanzar al Commit 3 sin confirmación.**

- [ ] **Step 6: Commit 2**

```bash
git add src/components/Navbar.js src/components/Footer.js src/app/layout.js
git commit -m "feat: agregar link Aportes al header y footer global"
```

---

## Commit 3: Limpiar /material de aportes

### Task 5: Eliminar aportes de material/page.js

**Files:**
- Modify: `src/app/biblioteca/[slug]/material/page.js`

- [ ] **Step 1: Eliminar state de aportes**

Eliminar de `material/page.js`:
- `const [aportes, setAportes] = useState([]);` (línea 35)
- `const [nombre, setNombre] = useState('');` (línea 43)
- `const [texto, setTexto] = useState('');` (línea 44)
- `const [tema, setTema] = useState('');` (línea 45)
- `const [submitting, setSubmitting] = useState(false);` (línea 46)
- `const [submitted, setSubmitted] = useState(false);` (línea 47)

- [ ] **Step 2: Eliminar fetch de aportes**

En el `fetchData`, eliminar el fetch a `/api/aportes` del `Promise.all` (línea 114) y `setAportes` (línea 121).

- [ ] **Step 3: Eliminar función handleSubmitAporte**

Eliminar la función `handleSubmitAporte` completa (líneas 140-175) y el import de `useCallback` (si ya no se usa).

- [ ] **Step 4: Eliminar la sección #aportes del render**

Eliminar la sección `<section id="aportes">` completa (líneas 505-666), que incluye la lista de aportes y el formulario.

- [ ] **Step 5: Eliminar `getSessionId` si ya no se usa**

La función `getSessionId` (líneas 16-23) solo la usaba el form de aportes. Eliminarla.

- [ ] **Step 6: Actualizar materialLinks**

Cambiar el array `materialLinks` (línea 204-208) para quitar "Aportes":

```js
const materialLinks = [
  { id: 'videos', label: 'Videos' },
  { id: 'quiz', label: 'Quiz' },
];
```

### Task 6: Limpiar links de aportes en sidebars

**Files:**
- Modify: `src/app/biblioteca/[slug]/page.js` (sidebar desktop + TOC mobile)

- [ ] **Step 1: Eliminar link "Aportes" del sidebar desktop del bloque**

En `page.js`, en la sección "Material complementario" del sidebar (líneas 201-211), eliminar:

```jsx
<Link href={`/biblioteca/${slug}/material#aportes`} className="indice-item">
  Aportes
</Link>
```

Quedan solo Videos y Quiz.

- [ ] **Step 2: Eliminar link "Aportes" del TOC mobile del bloque**

En el TOC mobile del `page.js`, el array inline (líneas 285-289) tiene 3 items. Eliminar el de aportes:

```js
// Antes:
{ id: 'videos', label: 'Videos' },
{ id: 'quiz', label: 'Quiz' },
{ id: 'aportes', label: 'Aportes' },

// Después:
{ id: 'videos', label: 'Videos' },
{ id: 'quiz', label: 'Quiz' },
```

- [ ] **Step 3: Verificar que compila**

Run: `npx next build`

- [ ] **Step 4: Verificar visualmente**

- `/biblioteca/bloque-1` → sidebar y TOC mobile: solo Videos y Quiz en sección Material
- `/biblioteca/bloque-1/material` → solo Videos + Quiz (sin aportes), sidebar y TOC sin link Aportes
- `/aportes` → sigue funcionando independientemente

- [ ] **Step 5: Mostrar diff al usuario para revisión**

**CHECKPOINT — No commitear sin confirmación.**

- [ ] **Step 6: Commit 3**

```bash
git add src/app/biblioteca/[slug]/material/page.js src/app/biblioteca/[slug]/page.js
git commit -m "refactor: mover aportes de /material a página global /aportes"
```

---

## Resumen de checkpoints

| Momento | Qué se verifica | Quién aprueba |
|---------|----------------|---------------|
| Post Commit 1 | `/aportes` funciona standalone | Emi |
| Post Commit 2 | Footer en todas las páginas + link Aportes en navbar | Emi |
| Post Commit 3 | `/material` limpio de aportes + sidebars actualizados | Emi |
