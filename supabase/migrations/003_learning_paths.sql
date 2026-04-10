-- =============================================================
-- FASE 4: RUTAS DE APRENDIZAJE
-- Tablas: learning_paths, learning_path_nodes
-- =============================================================

CREATE TABLE learning_paths (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  nombre text NOT NULL,
  descripcion text,
  es_publica boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE learning_path_nodes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  path_id uuid NOT NULL REFERENCES learning_paths(id) ON DELETE CASCADE,
  node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  orden integer NOT NULL,
  es_opcional boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_path_node UNIQUE (path_id, node_id)
);

CREATE INDEX idx_lp_nodes_path ON learning_path_nodes (path_id, orden);
CREATE INDEX idx_lp_nodes_node ON learning_path_nodes (node_id);
