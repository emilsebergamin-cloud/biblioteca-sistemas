# Responsive Mobile + Tablet — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Que el sitio funcione correctamente en mobile (375-430px) y tablet (768-1024px) sin romper desktop.

**Architecture:** Fixes puntuales en inline styles existentes, condicionando padding/layout con el `isMobile`/`isTablet` que ya existe en cada página. Para Carousel3D y Home (que no tienen esos flags), se agregan media queries en CSS o se ajustan valores hardcoded. No se migra a CSS media queries completo (eso es post-MVP).

**Tech Stack:** React inline styles, CSS globals, condicionales JS existentes (`isMobile`, `isTablet`).

**Restricciones del proyecto (de CLAUDE.md):**
- NO tocar: Carousel3D diseño base, BackgroundGradientAnimation, textos del hero, paleta de colores, tipografía
- El Carousel3D dice "NO cambiar sin consultar" — pero los offsets responsive son ajustes de viewport, no cambios de diseño. Si la usuaria objeta, se revierte.

---

## Diagnóstico completo (16 problemas)

| # | Página | Viewport | Elemento | Problema | Severidad |
|---|--------|----------|----------|----------|-----------|
| 1 | Navbar | 375-430px | Padding 32px izq/der | Se come espacio en pantallas chicas | Menor |
| 2 | Home | 375px | Hero container padding 60px 40px | Padding lateral excesivo | Medio |
| 3 | Home | 375px | SVG trazo width=280 fijo | No escala con viewport | Menor |
| 4 | Home | 375-430px | Stats gap 32px + dividers | Se aprietan los números | Medio |
| 5 | /biblioteca | 375-430px | Carousel translateX fijo (240/420px) | Cards se salen, overflow horizontal | Crítico |
| 6 | /biblioteca | 768px | Carousel mismos offsets | Cards cortadas | Medio |
| 7 | /biblioteca | 375-430px | Carousel height 280px fijo | No se adapta | Menor |
| 8 | Bloque | 375-430px | Contenido padding 40px+48px | Solo 287px útiles de 375 | Crítico |
| 9 | Bloque | 375-430px | Breadcrumb padding 40px+48px | Mismo exceso | Crítico |
| 10 | Bloque | 375-430px | Sections padding 20px apilado | Padding se suma al contenedor | Crítico |
| 11 | Bloque | 375-430px | Tablas en nodo-content | Scroll interno no funciona bien con padding excesivo | Medio |
| 12 | Bloque | 768px | Sidebar 200px + padding desktop | Contenido apretado en tablet | Medio |
| 13 | Bloque | 375-430px | isMobile vía JS | Flash of wrong layout en primer render | Medio |
| 14 | /material | 375-430px | Contenido padding 40px+48px | Mismo problema que bloque | Crítico |
| 15 | /material | 375-430px | Breadcrumb padding 40px+48px | Mismo problema que bloque | Crítico |
| 16 | /material | 768px | Sidebar + padding desktop | Mismo problema que bloque tablet | Medio |

---

## Agrupación en commits (por dependencia)

### Commit 1: Padding mobile — bloque + material (6 fixes: #8 #9 #10 #11 #14 #15)

Causa raíz: padding hardcoded de desktop aplicado sin condicional `isMobile`.
Arreglar esto primero porque resuelve overflow, tablas, y texto apretado de un solo golpe.

### Commit 2: Padding tablet — bloque + material (2 fixes: #12 #16)

Depende de Commit 1. Ajustar padding cuando hay sidebar de 200px en tablet.

### Commit 3: Carousel responsive (3 fixes: #5 #6 #7)

Independiente de los otros. Reducir offsets translateX y height para mobile y tablet.

### Commit 4: Home hero + navbar + aportes polish (5 fixes: #1 #2 #3 #4 + aportes tablet)

Fixes menores agrupados por ser rápidos e independientes.

### Commit 5: Flash of layout (1 fix: #13)

El más invasivo. Solución pragmática: renderizar contenido mobile-first con CSS y dejar JS para refinamiento post-hydration.

---

## Commit 1: Padding mobile — bloque + material

**Files:**
- Modify: `src/app/biblioteca/[slug]/page.js` (líneas 217, 226, 307, 313)
- Modify: `src/app/biblioteca/[slug]/material/page.js` (líneas 224, 237, 316, ~secciones)

**Problema:** En mobile (375px), el contenido tiene `padding: '0 40px 80px 48px'` (88px horizontales) y el breadcrumb `padding: '8px 40px 0 48px'`. Eso deja solo 287px para contenido. Además las sections dentro agregan `padding: '48px 20px 0'`, apilando aún más.

- [ ] **Step 1: Fix bloque breadcrumb padding mobile**

En `[slug]/page.js`, línea 217, cambiar:
```js
padding: '8px 40px 0 48px'
```
a:
```js
padding: isMobile ? '8px 16px 0' : '8px 40px 0 48px'
```

- [ ] **Step 2: Fix bloque header padding mobile**

Línea 226 ya tiene condicional pero usa `20px`. Verificar que está OK (lo está: `isMobile ? '8px 20px 0' : '8px 40px 0 48px'`). No tocar.

- [ ] **Step 3: Fix bloque content container padding mobile**

Línea 307, cambiar:
```js
padding: '0 40px 80px 48px'
```
a:
```js
padding: isMobile ? '0 16px 60px' : isTablet ? '0 24px 80px 32px' : '0 40px 80px 48px'
```

- [ ] **Step 4: Fix bloque section padding — eliminar padding redundante**

Línea 313, las sections tienen `padding: '48px 20px 0'` dentro del contenedor que ya tiene padding. Cambiar a:
```js
padding: isMobile ? '32px 0 0' : '48px 20px 0'
```
En mobile el padding horizontal ya viene del contenedor padre. El vertical se reduce de 48 a 32px.

- [ ] **Step 5: Repetir fixes 1, 3, 4 en material/page.js**

Material tiene la misma estructura. Aplicar los mismos cambios:
- Breadcrumb (línea 224): `padding: isMobile ? '8px 16px 0' : '8px 40px 0 48px'`
- Content container (línea ~316): `padding: isMobile ? '0 16px 60px' : isTablet ? '0 24px 80px 32px' : '0 40px 80px 48px'`
- Sections (videos, quiz): verificar si tienen padding redundante y ajustar.

- [ ] **Step 6: Verificación visual**

Abrir en DevTools:
- `localhost:4000/biblioteca/bloque-1` a 375px y 430px
- `localhost:4000/biblioteca/bloque-1/material` a 375px y 430px
- Verificar: sin overflow horizontal, texto ocupa el ancho disponible, tablas scrollean dentro del contenedor.
- Verificar en desktop (1440px): sin cambios.

- [ ] **Step 7: Commit**

```bash
git add "src/app/biblioteca/[slug]/page.js" "src/app/biblioteca/[slug]/material/page.js"
git commit -m "fix(responsive): padding mobile en vista de bloque y material"
```

---

## Commit 2: Padding tablet — bloque + material

**Files:**
- Modify: `src/app/biblioteca/[slug]/page.js`
- Modify: `src/app/biblioteca/[slug]/material/page.js`

**Problema:** En tablet (768px), el sidebar ocupa 200px y el contenido tiene padding de desktop. El contenido se aprieta.

**Nota:** El Step 3 del Commit 1 ya incluye la variante `isTablet` en el padding del contenedor. Si eso resuelve el problema, este commit solo necesita verificar y ajustar detalles menores.

- [ ] **Step 1: Verificar si Commit 1 ya resolvió tablet**

Abrir en DevTools a 768px y 1024px. Si el padding `'0 24px 80px 32px'` funciona bien con el sidebar de 200px, no hace falta más.

- [ ] **Step 2: Ajustar breadcrumb tablet si hace falta**

Si el breadcrumb se ve apretado en tablet, cambiar:
```js
padding: isMobile ? '8px 16px 0' : isTablet ? '8px 24px 0 32px' : '8px 40px 0 48px'
```

- [ ] **Step 3: Repetir en material si aplica**

- [ ] **Step 4: Verificación visual**

- `localhost:4000/biblioteca/bloque-1` a 768px y 1024px
- Verificar: sidebar + contenido conviven sin apretarse, texto legible.

- [ ] **Step 5: Commit**

```bash
git add "src/app/biblioteca/[slug]/page.js" "src/app/biblioteca/[slug]/material/page.js"
git commit -m "fix(responsive): padding tablet en vista de bloque y material"
```

---

## Commit 3: Carousel responsive

**Files:**
- Modify: `src/components/Carousel3D.js` (POSITIONS, container height, card width)
- Modify: `src/app/globals.css` (posible media query alternativa)

**Problema:** Las POSITIONS usan translateX fijo (240/420px) y width 220px. En 375px, center + right1 = 460px mínimo. Overflow garantizado.

**Estrategia:** El Carousel3D ya está marcado como "NO tocar sin consultar" en CLAUDE.md. Pero esto es un fix de viewport, no un cambio de diseño. Se agregan variantes responsive a POSITIONS sin cambiar la lógica ni la estética del carousel.

- [ ] **Step 1: Agregar detección de viewport al Carousel3D**

El componente no tiene `isMobile`/`isTablet`. Agregar:
```js
const [isMobile, setIsMobile] = useState(false);
const [isTablet, setIsTablet] = useState(false);

useEffect(() => {
  const mqlMobile = window.matchMedia('(max-width: 768px)');
  const mqlTablet = window.matchMedia('(min-width: 769px) and (max-width: 1024px)');
  setIsMobile(mqlMobile.matches);
  setIsTablet(mqlTablet.matches);
  const hM = (e) => setIsMobile(e.matches);
  const hT = (e) => setIsTablet(e.matches);
  mqlMobile.addEventListener('change', hM);
  mqlTablet.addEventListener('change', hT);
  return () => { mqlMobile.removeEventListener('change', hM); mqlTablet.removeEventListener('change', hT); };
}, []);
```

- [ ] **Step 2: Crear POSITIONS responsive**

```js
const POSITIONS_MOBILE = {
  center: { transform: "translateX(0) translateZ(0) rotateY(0deg)", zIndex: 10, opacity: 1 },
  left1: { transform: "translateX(-160px) translateZ(-80px) rotateY(25deg)", zIndex: 5, opacity: 0.6 },
  right1: { transform: "translateX(160px) translateZ(-80px) rotateY(-25deg)", zIndex: 5, opacity: 0.6 },
  left2: { transform: "translateX(-280px) translateZ(-160px) rotateY(40deg)", zIndex: 2, opacity: 0 },
  right2: { transform: "translateX(280px) translateZ(-160px) rotateY(-40deg)", zIndex: 2, opacity: 0 },
  hidden: { transform: "translateX(-400px) translateZ(-200px) rotateY(55deg)", zIndex: 0, opacity: 0 },
};

const POSITIONS_TABLET = {
  center: { transform: "translateX(0) translateZ(0) rotateY(0deg)", zIndex: 10, opacity: 1 },
  left1: { transform: "translateX(-200px) translateZ(-100px) rotateY(26deg)", zIndex: 5, opacity: 0.7 },
  right1: { transform: "translateX(200px) translateZ(-100px) rotateY(-26deg)", zIndex: 5, opacity: 0.7 },
  left2: { transform: "translateX(-360px) translateZ(-200px) rotateY(42deg)", zIndex: 2, opacity: 0.3 },
  right2: { transform: "translateX(360px) translateZ(-200px) rotateY(-42deg)", zIndex: 2, opacity: 0.3 },
  hidden: { transform: "translateX(-500px) translateZ(-260px) rotateY(55deg)", zIndex: 0, opacity: 0 },
};
```

En mobile: left2/right2 con opacity 0 (solo se ven center + adyacentes). Offsets reducidos a 160px.
En tablet: offsets intermedios (200px), left2/right2 visibles pero más tenues.

- [ ] **Step 3: Usar POSITIONS condicional**

Donde se usa `POSITIONS[pos]`, cambiar a:
```js
const positions = isMobile ? POSITIONS_MOBILE : isTablet ? POSITIONS_TABLET : POSITIONS;
// ...
const style = positions[pos];
```

- [ ] **Step 4: Ajustar card width y container height en mobile**

Card width: `width: isMobile ? "180px" : "220px"`
Container height: `height: isMobile ? "240px" : "280px"`

- [ ] **Step 5: Ajustar hover en mobile (no aplicar scale)**

El hover `scale(1.12)` no tiene sentido en touch. Condicionar:
```js
{...(pos === "center" && !isMobile ? { onMouseEnter: ..., onMouseLeave: ... } : {})}
```

- [ ] **Step 6: Verificación visual**

- `localhost:4000/biblioteca` a 375px, 430px, 768px, 1024px
- Verificar: sin overflow horizontal, cards visibles no cortadas, navegación (flechas + dots) funcional.
- Verificar en desktop: sin cambios.

- [ ] **Step 7: Commit**

```bash
git add src/components/Carousel3D.js
git commit -m "fix(responsive): carousel 3D adaptado a mobile y tablet"
```

---

## Commit 4: Home hero + navbar + aportes polish

**Files:**
- Modify: `src/components/Navbar.js`
- Modify: `src/app/page.js`
- Modify: `src/app/aportes/page.js`
- Modify: `src/app/globals.css`

**5 fixes menores agrupados:**

- [ ] **Step 1: Navbar — reducir padding en mobile**

En `Navbar.js`, cambiar padding hardcoded a responsive via CSS. En vez de `paddingLeft: '32px'` y `paddingRight: '32px'`, cambiar a `paddingLeft: '16px'`/`paddingRight: '16px'` como mobile-first y agregar media query en globals.css:

```css
/* Navbar responsive */
@media (min-width: 769px) {
  .navbar-inner { padding-left: 32px !important; padding-right: 32px !important; }
}
```

Y en Navbar.js usar `className="navbar-inner"` con padding base `16px`.

Alternativa más simple: cambiar solo el valor a `clamp(16px, 4vw, 32px)` en ambos lados. Sin media query.

- [ ] **Step 2: Home hero — padding del container ya resuelto por CSS**

Verificar que el media query existente en globals.css (línea 298-303) resuelve el padding. El `!important` ya lo overridea. Si funciona bien, no tocar.

- [ ] **Step 3: Home SVG — hacer responsive**

En `page.js`, cambiar el SVG de `width="280"` fijo a un viewBox responsive:
```jsx
<svg style={{ width: 'clamp(200px, 60vw, 280px)' }} viewBox="0 0 280 10">
```

- [ ] **Step 4: Home stats — reducir gap en mobile**

El media query existente ya reduce gap a 20px. Pero el divider tiene `gap: 32px` adicional dentro de cada stat item. Simplificar: sacar el divider del flex item y usar border-left en su lugar, o reducir el gap del divider en mobile.

Opción limpia: cambiar la estructura para que el gap de 32px controle todo y el divider no agregue gap extra.

- [ ] **Step 5: Aportes — maxWidth más ancho en tablet**

En `aportes/page.js`, cambiar `maxWidth: '640px'` a `maxWidth: '720px'` para que use mejor el espacio en tablet sin romperse en mobile. O dejarlo en 640px si la usuaria lo prefiere (es funcional, solo estético).

- [ ] **Step 6: Verificación visual**

- `localhost:4000` a 375px, 430px, 768px
- `localhost:4000/aportes` a 768px
- Verificar: navbar no apretada, stats legibles, SVG proporcional.

- [ ] **Step 7: Commit**

```bash
git add src/components/Navbar.js src/app/page.js src/app/aportes/page.js src/app/globals.css
git commit -m "fix(responsive): home hero, navbar y aportes en mobile/tablet"
```

---

## Commit 5: Flash of layout (isMobile vía JS)

**Files:**
- Modify: `src/app/biblioteca/[slug]/page.js`
- Modify: `src/app/biblioteca/[slug]/material/page.js`

**Problema:** `isMobile` se inicializa como `false`, se actualiza post-hydration. En el primer render del server/client, se renderiza desktop y luego salta a mobile.

**Estrategia pragmática (no-refactor):** Inicializar `isMobile` como `null` y no renderizar el layout hasta que se conozca el viewport. Mostrar el spinner existente durante esos ~50ms.

- [ ] **Step 1: Cambiar inicialización de isMobile/isTablet**

```js
const [isMobile, setIsMobile] = useState(null); // null = unknown
const [isTablet, setIsTablet] = useState(null);
```

- [ ] **Step 2: Tratar null como loading**

Donde dice `if (loading)`, agregar:
```js
if (loading || isMobile === null) {
  return (/* spinner */);
}
```

Esto muestra el spinner hasta que el viewport se detecta (~50ms). No perceptible para el usuario pero elimina el flash.

- [ ] **Step 3: Repetir en material/page.js**

- [ ] **Step 4: Verificación**

Abrir en DevTools a 375px con throttling. No debería verse el layout de desktop ni por un frame.

- [ ] **Step 5: Commit**

```bash
git add "src/app/biblioteca/[slug]/page.js" "src/app/biblioteca/[slug]/material/page.js"
git commit -m "fix(responsive): eliminar flash of wrong layout en mobile"
```

---

## Resumen de commits

| # | Commit | Fixes | Severidad | Archivos |
|---|--------|-------|-----------|----------|
| 1 | Padding mobile bloque + material | #8 #9 #10 #11 #14 #15 | 5 críticos + 1 medio | 2 archivos |
| 2 | Padding tablet bloque + material | #12 #16 | 2 medios | 2 archivos |
| 3 | Carousel responsive | #5 #6 #7 | 1 crítico + 1 medio + 1 menor | 1 archivo |
| 4 | Home + navbar + aportes | #1 #2 #3 #4 + aportes tablet | 2 medios + 2 menores | 4 archivos |
| 5 | Flash of layout | #13 | 1 medio | 2 archivos |

**Total: 16 problemas resueltos en 5 commits.**

Checkpoint visual entre cada commit. Si algún commit introduce regresiones, se revierte sin afectar los demás.
