-- =============================================================
-- FASE 2: CAPA DE CONTENIDO
-- Tablas: modules, nodes, node_sections
-- =============================================================

-- Módulos (bloques grandes del sistema)
CREATE TABLE modules (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  subtitulo text,
  descripcion text,
  orden numeric NOT NULL,
  estado text NOT NULL DEFAULT 'draft',
  es_publico boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_modules_orden ON modules (orden);
CREATE INDEX idx_modules_estado ON modules (estado);

-- Nodos (unidad real de aprendizaje dentro de cada módulo)
CREATE TABLE nodes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  module_id uuid REFERENCES modules(id) ON DELETE SET NULL,
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  resumen_corto text,
  objetivo text,
  tipo text NOT NULL DEFAULT 'concepto',
  aprendizaje_tipo text,
  dificultad integer NOT NULL DEFAULT 1,
  duracion_estimada_min integer,
  orden_en_modulo integer,
  estado text NOT NULL DEFAULT 'draft',
  es_clave boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_nodes_module_id ON nodes (module_id);
CREATE INDEX idx_nodes_tipo ON nodes (tipo);
CREATE INDEX idx_nodes_estado ON nodes (estado);
CREATE INDEX idx_nodes_orden_en_modulo ON nodes (module_id, orden_en_modulo);

-- Secciones por nodo (capas editoriales múltiples)
CREATE TABLE node_sections (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  section_type text NOT NULL,
  titulo text,
  contenido_md text NOT NULL,
  orden integer NOT NULL,
  es_opcional boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_node_sections_node_id ON node_sections (node_id);
CREATE INDEX idx_node_sections_orden ON node_sections (node_id, orden);
