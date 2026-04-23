# Bibl·AI — Biblioteca de Sistemas

Plataforma educativa para personas no técnicas que quieren entender cómo funciona el mundo tech. Contenido curado en español rioplatense, organizado en bloques temáticos progresivos: desde cómo piensa una computadora hasta qué es la inteligencia artificial. Sin jerga innecesaria, con analogías reales y contexto latinoamericano.

**[Ver el sitio](https://biblai.app)**

## Stack

- **Frontend:** Next.js + React 19 + Tailwind CSS 4
- **Base de datos:** Supabase (PostgreSQL + RLS)
- **Deploy:** Vercel
- **Tipografía:** Plus Jakarta Sans (Google Fonts)

## Estructura del proyecto

```
src/
├── app/
│   ├── api/              — API routes (bloques, aportes, votos)
│   ├── biblioteca/       — Página principal + vista por bloque + material
│   ├── aportes/          — Página de aportes de la comunidad
│   ├── globals.css       — Paleta, tokens, animaciones
│   ├── layout.js         — Root layout (metadata, navbar, footer)
│   └── page.js           — Home con hero animado
├── components/
│   ├── Carousel3D.js     — Carousel coverflow 3D de bloques
│   ├── Navbar.js         — Nav sticky con logo
│   ├── Footer.js         — Footer del sitio
│   └── ui/               — Componentes visuales (gradiente animado)
├── lib/
│   ├── db.js             — Funciones de acceso a datos
│   └── supabase-server.js — Cliente Supabase server-side
supabase/
├── schema.sql            — Esquema completo (6 tablas + RLS)
├── seed.sql              — Datos iniciales de bloques
├── nodos_seed.sql        — Contenido de los 49 temas
└── quiz_seed.sql         — Preguntas de quiz por bloque
```

## Setup local

```bash
# Clonar el repositorio
git clone https://github.com/emilsebergamin/biblioteca-sistemas.git
cd biblioteca-sistemas

# Instalar dependencias
npm install

# Configurar variables de entorno
cp .env.example .env.local
# Completar NEXT_PUBLIC_SUPABASE_URL y NEXT_PUBLIC_SUPABASE_ANON_KEY

# Levantar el servidor de desarrollo
npm run dev
```

El sitio corre en `http://localhost:3000`.

## Base de datos

El esquema completo está en `supabase/schema.sql` (6 tablas: bloques, nodos, aportes, votos, recursos, quiz_preguntas). Para recrear la DB, ejecutar en orden en el SQL Editor de Supabase:

1. `schema.sql` — tablas, índices y RLS
2. `seed.sql` — bloques iniciales
3. `nodos_seed.sql` — contenido de los temas
4. `quiz_seed.sql` — preguntas de quiz

## Autoría

Hecho por [Emilse Bergamin](https://www.linkedin.com/in/emilsebergamin/) como proyecto personal de aprendizaje.

## Licencia

Código abierto. Contenido editorial con atribución.
