-- =============================================================
-- ESQUEMA MVP — Biblioteca de Sistemas
-- 4 tablas: bloques, nodos, aportes, votos
-- Ejecutar en Supabase SQL Editor
-- =============================================================

-- =============================================================
-- BLOQUES — agrupación temática de alto nivel
-- =============================================================

CREATE TABLE bloques (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  subtitulo text,
  descripcion text,
  orden integer NOT NULL,
  estado text NOT NULL DEFAULT 'borrador',
  color_acento text,
  icono text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_bloques_orden ON bloques (orden);
CREATE INDEX idx_bloques_estado ON bloques (estado);

-- =============================================================
-- NODOS — unidad de contenido dentro de un bloque
-- =============================================================

CREATE TABLE nodos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bloque_id uuid NOT NULL REFERENCES bloques(id) ON DELETE CASCADE,
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  resumen_corto text,
  contenido_html text,
  tipo text NOT NULL DEFAULT 'concepto',
  tags text[],
  dificultad text NOT NULL DEFAULT 'basico',
  orden_en_bloque integer NOT NULL,
  estado text NOT NULL DEFAULT 'borrador',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_nodos_bloque ON nodos (bloque_id, orden_en_bloque);
CREATE INDEX idx_nodos_estado ON nodos (estado);
CREATE INDEX idx_nodos_tipo ON nodos (tipo);

-- =============================================================
-- APORTES — contribuciones de usuarios en cada nodo
-- =============================================================

CREATE TABLE aportes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nodo_id uuid NOT NULL REFERENCES nodos(id) ON DELETE CASCADE,
  contenido text NOT NULL CHECK (char_length(contenido) <= 500),
  autor_nombre text,
  estado text NOT NULL DEFAULT 'pendiente',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_aportes_nodo ON aportes (nodo_id);
CREATE INDEX idx_aportes_estado ON aportes (estado);

-- =============================================================
-- VOTOS — útil / no útil por nodo
-- =============================================================

CREATE TABLE votos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nodo_id uuid NOT NULL REFERENCES nodos(id) ON DELETE CASCADE,
  tipo text NOT NULL,
  session_id text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_voto_por_sesion UNIQUE (nodo_id, session_id)
);

CREATE INDEX idx_votos_nodo ON votos (nodo_id);

-- =============================================================
-- RECURSOS — videos, artículos y herramientas por nodo
-- =============================================================

CREATE TABLE recursos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nodo_id uuid NOT NULL REFERENCES nodos(id) ON DELETE CASCADE,
  titulo text NOT NULL,
  url text NOT NULL,
  tipo text NOT NULL DEFAULT 'video',
  dificultad text NOT NULL DEFAULT 'basico',
  orden integer NOT NULL DEFAULT 1,
  estado text NOT NULL DEFAULT 'publicado',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_recursos_nodo ON recursos (nodo_id, orden);
CREATE INDEX idx_recursos_tipo ON recursos (tipo);
