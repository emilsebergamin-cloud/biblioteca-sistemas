@AGENTS.md

# Bibl·AI — Biblioteca de Sistemas

## Objetivo

Plataforma educativa para personas no técnicas que quieren entender cómo funciona el mundo tech. Contenido en español, tono editorial rioplatense, sin jerga innecesaria.

## Stack

- **Frontend:** Next.js 16.2.3 + React 19 + Tailwind CSS 4
- **Tipografía:** Plus Jakarta Sans (Google Fonts, pesos 400/500/600/700, italic)
- **Base de datos:** Supabase (PostgreSQL)
- **Deploy:** Vercel
- **Autenticación:** No hay en MVP (sesiones anónimas)
- **Dependencias extra:** classnames

## Estructura de archivos

```
src/
├── app/
│   ├── api/
│   │   ├── aportes/route.js    — GET/POST aportes (esquema viejo, pendiente actualizar)
│   │   ├── bloques/route.js    — GET bloques publicados con fallback
│   │   └── votos/route.js      — POST votos (esquema viejo, pendiente actualizar)
│   ├── biblioteca/page.js      — Página /biblioteca con carousel 3D + gradiente
│   ├── globals.css             — Paleta, tokens Tailwind 4, keyframes animaciones
│   ├── layout.js               — Root layout con Plus Jakarta Sans + Navbar
│   └── page.js                 — Home: hero con gradiente animado
├── components/
│   ├── BloqueGrid.js           — Grid con IntersectionObserver (no se usa actualmente)
│   ├── Carousel3D.js           — Carousel coverflow 3D de 6 bloques
│   ├── Navbar.js               — Nav sticky: logo Bibl·AI + link Biblioteca
│   └── ui/
│       └── BackgroundGradientAnimation.js — Fondo animado con blobs interactivos
├── lib/
│   ├── db.js                   — Funciones Supabase (esquema viejo, pendiente actualizar)
│   └── supabase.js             — Cliente Supabase (anon key)
supabase/
├── schema.sql                  — 5 tablas MVP (bloques, nodos, aportes, votos, recursos)
├── seed.sql                    — INSERT de los 6 bloques
├── rls.sql                     — Row Level Security
├── drop_old_tables.sql         — DROP de las 17 tablas viejas
└── migrations/                 — Migraciones del esquema anterior (obsoletas)
```

## Paleta de colores

| Token | Hex | Uso |
|-------|-----|-----|
| --ink | #0D0C0A | Texto principal, títulos |
| --paper | #F7F4EF | Fondo principal |
| --paper2 | #EFEBE3 | Superficies, hover |
| --paper3 | #E5DFD4 | Activo |
| --mist | #C8C0B0 | Bordes suaves, metadata |
| --ghost | #9B9080 | Texto secundario, subtítulos |
| --accent | #3B82F6 | Azul (no usado actualmente) |
| acid green | #C5E832 | Punto del logo, números carousel, stats, highlights |
| lavanda | #A8B4D8 | Subtítulos en cards del carousel |
| fondo oscuro | #1A1A1A | Background de /biblioteca |

## Decisiones de diseño (NO cambiar sin consultar)

- **Tipografía:** Plus Jakarta Sans en todo el proyecto (títulos y cuerpo)
- **Carousel 3D:** Coverflow con 6 cards, perspectiva 1200px, navegación con flechas y dots
- **Efecto gradiente:** BackgroundGradientAnimation con 5 blobs animados + interactividad mouse
- **Hero home:** Gradiente animado de fondo, stats (6/49/0), trazo SVG verde ácido, fadeUp escalonado
- **Navbar:** Logo "Bibl·AI" (punto en verde ácido) a la izquierda, solo link "Biblioteca" a la derecha
- **Página /biblioteca:** Fondo oscuro #1A1A1A con gradiente animado + carousel
- **Sin border-radius en botones CTA**
- **Mobile first en todo**

## Base de datos (5 tablas en supabase/schema.sql)

| Tabla | Campos clave |
|-------|-------------|
| `bloques` | id, slug, titulo, subtitulo, descripcion, orden, estado, color_acento, icono, created_at |
| `nodos` | id, bloque_id (FK), slug, titulo, resumen_corto, contenido_html, tipo, tags[], dificultad, orden_en_bloque, estado, created_at |
| `aportes` | id, nodo_id (FK), contenido (max 500), autor_nombre, estado, created_at |
| `votos` | id, nodo_id (FK), tipo, session_id, created_at — UNIQUE(nodo_id, session_id) |
| `recursos` | id, nodo_id (FK), titulo, url, tipo, dificultad, orden, estado, created_at |

RLS: lectura pública en todo. INSERT público en aportes y votos. Recursos solo service_role.

## Estado actual

### Hecho
- Home con hero animado (gradiente + fadeUp + trazo SVG + stats)
- Página /biblioteca con carousel 3D sobre fondo oscuro
- Carousel3D con 6 cards, navegación, colores actualizados
- BackgroundGradientAnimation funcionando en ambas páginas
- Navbar con logo y link
- Esquema SQL completo (5 tablas)
- Seed de 6 bloques
- RLS configurado
- API route /api/bloques con fallback

### Pendiente
- Ejecutar SQL en Supabase (drop_old_tables → schema → seed → rls)
- Actualizar /api/aportes y /api/votos al nuevo esquema
- Actualizar src/lib/db.js con campos nuevos
- Crear página de vista de nodo individual (/biblioteca/[slug])
- Cargar contenido de los 6 bloques como nodos en la DB
- Eliminar BloqueGrid.js (no se usa)
- Eliminar migraciones viejas en supabase/migrations/

## Próximos pasos

1. Cargar contenido de los 6 bloques como nodos en Supabase
2. Crear página individual de cada nodo (`/biblioteca/[slug]`)
3. Ajustes responsive mobile en todas las páginas

## QUE NO TOCAR

- `src/components/Carousel3D.js` — diseño final validado
- `src/components/ui/BackgroundGradientAnimation.js` — efecto validado
- Textos del hero en `src/app/page.js` — copy aprobada
- Paleta de colores — validada
- Tipografía Plus Jakarta Sans — decisión final
