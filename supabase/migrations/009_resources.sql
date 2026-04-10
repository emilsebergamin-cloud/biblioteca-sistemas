-- =============================================================
-- RECURSOS Y VINCULACIÓN CON NODOS
-- Tablas: resources, node_resources
-- =============================================================

CREATE TABLE resources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  descripcion text,
  url text,
  tipo text NOT NULL DEFAULT 'link',
  created_at timestamptz NOT NULL DEFAULT now()
);

-- tipo esperado: 'link', 'video', 'pdf', 'herramienta', 'lectura'

CREATE INDEX idx_resources_tipo ON resources (tipo);

CREATE TABLE node_resources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  resource_id uuid NOT NULL REFERENCES resources(id) ON DELETE CASCADE,
  orden integer NOT NULL DEFAULT 0,
  es_opcional boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_node_resource UNIQUE (node_id, resource_id)
);

CREATE INDEX idx_nr_node ON node_resources (node_id, orden);
CREATE INDEX idx_nr_resource ON node_resources (resource_id);
