-- =============================================================
-- FASE 3: RELACIONES ENTRE NODOS
-- Tabla: node_relations
-- =============================================================

CREATE TABLE node_relations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  from_node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  to_node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  tipo text NOT NULL DEFAULT 'complemento',
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_node_relation UNIQUE (from_node_id, to_node_id, tipo),
  CONSTRAINT chk_no_self_relation CHECK (from_node_id <> to_node_id)
);

-- tipo esperado: 'prerequisito', 'complemento', 'profundizacion'

CREATE INDEX idx_node_relations_from ON node_relations (from_node_id);
CREATE INDEX idx_node_relations_to ON node_relations (to_node_id);
