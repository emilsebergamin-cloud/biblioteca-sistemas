# Material Complementario — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Separar el material complementario (videos, quiz, aportes) del contenido editorial de cada bloque, creando una subpágina `/biblioteca/[slug]/material`.

**Architecture:** La página `/biblioteca/[slug]/page.js` actual (507 líneas) tiene todo mezclado: nodos editoriales + videos + quiz. Se crea una nueva ruta `/biblioteca/[slug]/material/page.js` que recibe videos, quiz y aportes (recuperados del commit `8b50286`). Luego se limpian del archivo original. Tres commits reversibles, cada uno deja todo funcionando.

**Tech Stack:** Next.js 16 (App Router), React 19, Supabase (REST API directa), DOMPurify, Tailwind CSS 4.

---

## File Structure

| Action | File | Responsibility |
|--------|------|----------------|
| **Create** | `src/app/biblioteca/[slug]/material/page.js` | Página de material complementario: videos, quiz, aportes |
| **Modify** | `src/app/biblioteca/[slug]/page.js` (lines 323-446) | Eliminar secciones de videos y quiz |
| **Modify** | `src/app/biblioteca/[slug]/page.js` (sidebar, lines 182-215) | Agregar links a /material en el índice lateral |

---

## Commit A: Crear `/biblioteca/[slug]/material`

### Task 1: Crear la página de material complementario

**Files:**
- Create: `src/app/biblioteca/[slug]/material/page.js`

**Pre-requisito:** Ejecutar skill `shape` para definir estructura visual (breadcrumb, layout, secciones). Las decisiones de shape se aplican en este paso.

- [ ] **Step 1: Crear el archivo `material/page.js`**

Este archivo es un componente client-side que:
1. Lee el `slug` de params
2. Fetch del bloque, recursos (videos), quiz_preguntas y aportes aprobados
3. Renderiza 3 secciones con anclas: `#videos`, `#quiz`, `#aportes`
4. Incluye formulario de aportes (recuperado del commit `8b50286`)
5. Incluye breadcrumb: Biblioteca → [Bloque] → Material complementario

Datos a fetchear:
- `bloques?slug=eq.${slug}` → para título y metadata
- `nodos?bloque_id=eq.${id}` → para obtener nodo IDs (necesarios para recursos y aportes)
- `recursos?nodo_id=in.(${ids})` → videos
- `quiz_preguntas?bloque_id=eq.${id}` → quiz
- `/api/aportes?nodo_id=${firstNodoId}` → aportes aprobados (nota: aportes son por nodo, no por bloque — decisión de UX pendiente en shape)

Componentes a incluir del código existente:
- **Videos:** líneas 323-367 de `[slug]/page.js` actual (sección "Videos curados")
- **Quiz:** líneas 369-446 de `[slug]/page.js` actual (sección quiz completa con estado)
- **Aportes:** recuperar del commit `8b50286` — incluye: lista de aportes aprobados, formulario con nombre + texto + contador 500 chars, estado submitted, fetch a `/api/aportes`

Paleta de colores: misma que `[slug]/page.js` (objeto `colors` en línea 135-143).

- [ ] **Step 2: Verificar que el dev server compila sin errores**

Run: `npm run dev` — verificar que `/biblioteca/internet-no-es-magia/material` carga (o cualquier slug válido).

- [ ] **Step 3: Verificar visualmente en el navegador**

Abrir `/biblioteca/internet-no-es-magia/material` y confirmar:
- [ ] Breadcrumb muestra: Biblioteca → Internet no es magia → Material complementario
- [ ] Sección Videos aparece con los videos del bloque
- [ ] Sección Quiz funciona (seleccionar respuesta, ver feedback)
- [ ] Sección Aportes muestra formulario y lista (vacía por ahora)
- [ ] Las anclas `#videos`, `#quiz`, `#aportes` scrollean correctamente

- [ ] **Step 4: Mostrar diff al usuario para revisión**

**CHECKPOINT — No avanzar al Commit B sin confirmación de Emi.**

- [ ] **Step 5: Commit A**

```bash
git add src/app/biblioteca/[slug]/material/page.js
git commit -m "feat: crear página /material con videos, quiz y aportes"
```

---

## Commit B: Agregar links al índice lateral

### Task 2: Agregar sección "Material complementario" al sidebar

**Files:**
- Modify: `src/app/biblioteca/[slug]/page.js` (lines 193-214, sidebar desktop)
- Modify: `src/app/biblioteca/[slug]/page.js` (lines 246-284, TOC mobile)

- [ ] **Step 1: Agregar links en sidebar desktop**

Después del `</nav>` del índice de nodos (línea 213), agregar una segunda sección:

```jsx
{/* Material complementario */}
<div style={{ marginTop: '24px', paddingTop: '16px', borderTop: `1px solid ${colors.border}` }}>
  <p style={{
    fontSize: '10px', fontWeight: 700, letterSpacing: '0.14em',
    textTransform: 'uppercase', color: colors.lavanda,
    marginBottom: '12px',
  }}>
    Material
  </p>
  <nav style={{ display: 'flex', flexDirection: 'column' }}>
    <Link href={`/biblioteca/${slug}/material#videos`} className="indice-item">
      Videos
    </Link>
    <Link href={`/biblioteca/${slug}/material#quiz`} className="indice-item">
      Quiz
    </Link>
    <Link href={`/biblioteca/${slug}/material#aportes`} className="indice-item">
      Aportes
    </Link>
  </nav>
</div>
```

- [ ] **Step 2: Agregar links en TOC mobile**

Después de la lista de nodos del TOC mobile (antes del cierre del `</nav>` en ~línea 282), agregar los mismos 3 links con el separador visual.

- [ ] **Step 3: Verificar visualmente**

- [ ] Desktop: sidebar muestra dos secciones (Índice + Material) separadas por línea
- [ ] Mobile: TOC desplegable incluye los 3 links al final
- [ ] Click en cada link navega a `/material#videos`, `#quiz`, `#aportes`

- [ ] **Step 4: Mostrar diff al usuario para revisión**

**CHECKPOINT — No avanzar al Commit C sin confirmación de Emi.**

- [ ] **Step 5: Commit B**

```bash
git add src/app/biblioteca/[slug]/page.js
git commit -m "feat: agregar links a /material en índice lateral y TOC mobile"
```

---

## Commit C: Limpiar page.js original

### Task 3: Eliminar videos y quiz del page.js del bloque

**Files:**
- Modify: `src/app/biblioteca/[slug]/page.js`

- [ ] **Step 1: Eliminar la sección de videos curados**

Eliminar líneas 323-367 (sección `{/* Videos curados */}` completa, incluyendo el `{recursos.length > 0 && (...)}`).

- [ ] **Step 2: Eliminar la sección de quiz**

Eliminar líneas 369-446 (sección `{/* Quiz */}` completa, incluyendo el `{quizPreguntas.length > 0 && (...)}`).

- [ ] **Step 3: Eliminar state y fetching que ya no se usan**

Eliminar del componente:
- State: `recursos`, `quizPreguntas`, `quizAnswers`, `quizRevealed` (líneas 22-25)
- Setters correspondientes
- Fetch de `quizRes` (línea 79) y `recursosRes` (líneas 89-97)
- Función `handleQuizAnswer` (líneas 129-133)

Mantener: `bloque`, `nodos`, `allBloques`, `loading`, `error`, `activeNodo`, `tocOpen`, `isMobile`, `isTablet` — todo eso sigue siendo necesario para la página editorial.

- [ ] **Step 4: Verificar que compila sin errores**

Run: `npm run dev` — sin errores de variables no definidas ni imports no usados.

- [ ] **Step 5: Verificar visualmente ambas páginas**

- [ ] `/biblioteca/internet-no-es-magia` → solo nodos editoriales, sin videos ni quiz
- [ ] `/biblioteca/internet-no-es-magia/material` → videos + quiz + aportes funcionando
- [ ] Links del sidebar navegan correctamente entre las dos páginas
- [ ] Prev/Next entre bloques sigue funcionando

- [ ] **Step 6: Mostrar diff al usuario para revisión**

**CHECKPOINT — No commitear sin confirmación de Emi.**

- [ ] **Step 7: Commit C**

```bash
git add src/app/biblioteca/[slug]/page.js
git commit -m "refactor: separar contenido editorial de material complementario"
```

---

## Post-Commit C: Critique

- [ ] **Step 8: Ejecutar skill `critique` sobre la página completa**

Evaluar si el split editorial/material quedó bien:
- ¿La página editorial se siente más liviana?
- ¿La página de material tiene coherencia visual?
- ¿La navegación entre las dos es clara?
- ¿Hay redundancia de código entre ambos archivos?

---

## Resumen de checkpoints

| Momento | Qué se verifica | Quién aprueba |
|---------|----------------|---------------|
| Post Commit A | `/material` funciona standalone | Emi |
| Post Commit B | Links en sidebar navegan a `/material` | Emi |
| Post Commit C | `page.js` limpio + todo sigue funcionando | Emi |
| Post Commit C | Critique del split completo | Claude + Emi |
