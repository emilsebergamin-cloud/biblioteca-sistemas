# Bibl·AI — Fixes de composición visual, página de bloque

## Contexto del problema

En las páginas de bloque (ej. `/bloque/1` — "Cómo piensan las computadoras"), el usuario percibe el diseño como "raro" o "desbalanceado". Intentos previos asumieron que era un bug de `text-align` o de kerning de Plus Jakarta Sans. **Diagnóstico correcto: no es un problema tipográfico, es un problema de composición y jerarquía visual.**

## Diagnóstico real

La página tiene **tres ejes de alineación compitiendo** simultáneamente, lo que crea disonancia visual:

1. Header (nav superior): full-width, items en extremos.
2. Cabecera del bloque ("BLOQUE 1" + H1 + subtítulo): **centrada horizontalmente**.
3. Cuerpo del contenido + índice lateral: **grid de dos columnas alineado a la izquierda**.

El ojo no encuentra un eje dominante, y además hay exceso de aire vertical en zonas clave. La consecuencia es que todo "se siente flotando".

## Los 4 fixes, en orden de impacto

### Fix 1 — Unificar eje: alinear cabecera del bloque a la izquierda

**Problema:** "BLOQUE 1", el H1 y el subtítulo están centrados (`text-align: center`), mientras que el cuerpo está alineado a la izquierda. Esto crea una ruptura visual al hacer scroll.

**Solución:** alinear la cabecera al mismo eje izquierdo que el cuerpo del texto. Estilo editorial tipo revista (referencia: The New Yorker online, Are.na, Dirt.fyi).

**Cambio esperado en el componente de cabecera del bloque:**

```diff
- <div className="text-center">
+ <div className="text-left">
    <p className="text-xs tracking-widest text-lime">BLOQUE 1</p>
    <h1 className="text-5xl font-bold">Cómo piensan las computadoras</h1>
    <p className="italic text-neutral-400">Lógica, bits y procesamiento</p>
  </div>
```

Si está usando `mx-auto` o `items-center` en el contenedor, también remover.

**Impacto esperado:** ~60% de la sensación de "algo está raro" desaparece con este cambio.

---

### Fix 2 — Subir el índice lateral

**Problema:** el índice ("ÍNDICE" + lista de nodos) arranca a la altura del primer párrafo del cuerpo, no a la altura del H1. Esto lo desconecta visualmente del título del bloque.

**Solución:** que el índice arranque al mismo `top` que el H1 del bloque, y a partir de ahí se vuelva `sticky`.

**Cambio esperado en el layout:**

```diff
  <aside className="w-64">
-   <nav className="mt-32 sticky top-8">
+   <nav className="sticky top-8">
      <p className="text-xs tracking-widest">ÍNDICE</p>
      <ul>...</ul>
    </nav>
  </aside>
```

El grid padre debería tener `items-start` para que el índice no se centre verticalmente.

---

### Fix 3 — Reducir aire entre breadcrumb y título

**Problema:** entre el breadcrumb ("Biblioteca → Cómo piensan las computadoras") y el "BLOQUE 1" hay aproximadamente 80–100px de espacio vacío. Demasiado.

**Solución:** reducir a ~40px.

```diff
- <div className="py-24">  {/* o pt-32, mt-24, etc */}
+ <div className="pt-10 pb-16">
    <p>BLOQUE 1</p>
    <h1>...</h1>
  </div>
```

---

### Fix 4 — Darle peso al header superior

**Problema:** el nav top tiene "Bibl·AI" a la izquierda y "Biblioteca" a la derecha con un océano de vacío en el medio. En pantallas wide se siente desprovisto.

**Solución (elegir una):**

**Opción 4A — Adelgazar el header.** Reducir padding vertical a `py-4`, mantenerlo simple y que el vacío se vuelva intencional, no accidental.

```diff
- <header className="py-8 px-6">
+ <header className="py-4 px-6 border-b border-neutral-200">
```

**Opción 4B — Agregar el bloque actual al centro.** Mostrar en qué bloque estás leyendo, estilo "now reading".

```jsx
<header className="py-4 px-6 flex justify-between items-center">
  <Logo />
  <p className="text-xs text-neutral-500">Bloque 1 · Cómo piensan las computadoras</p>
  <Link href="/biblioteca">Biblioteca</Link>
</header>
```

**Recomendación:** empezar con 4A (más simple, editorial). Si queda seco, sumar 4B.

---

## Orden de ejecución sugerido

1. Aplicar Fix 1 (cabecera a la izquierda) → ver el resultado.
2. Aplicar Fix 2 (índice arriba) → ver el resultado.
3. Aplicar Fix 3 (reducir aire) → ver el resultado.
4. Decidir entre 4A y 4B.

**Importante:** aplicar uno por vez y verificar visualmente antes de pasar al siguiente. Si se aplican los cuatro juntos y algo queda raro, es imposible saber cuál fue.

## Criterios de verificación

Después de aplicar los 4 fixes, la página debería:

- Tener un eje vertical izquierdo claro donde "viven" título, subtítulo, breadcrumb y cuerpo de texto.
- Índice lateral arrancando a la altura del H1, no debajo.
- Menos de 50px de aire entre breadcrumb y "BLOQUE 1".
- Header superior con presencia intencional (adelgazado o con contenido central).
- Sensación general: editorial, legible, con jerarquía clara. Referencia estética: revista online, no landing de SaaS.

## Lo que NO hay que hacer

- No cambiar la fuente (Plus Jakarta Sans está bien).
- No aplicar `letter-spacing` negativo.
- No reducir el ancho del cuerpo de texto a 620px "para que se note que es left-aligned" — el problema no es ese.
- No tocar `text-align: justify` en ningún lado (si aparece en algún sitio, eso sí removerlo, pero no es la causa raíz que buscábamos).

## Después de estos fixes

Queda pendiente resolver el overflow horizontal en mobile. Se abordará como tarea separada una vez que la composición desktop esté estable.
