-- =============================================================
-- FASE 7: INTEGRACIÓN CON TABLAS EXISTENTES
-- Cambio aditivo: agregar node_id a aportes
-- =============================================================

-- Solo agregar si la tabla existe y la columna no existe
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_name = 'aportes' AND table_schema = 'public'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'aportes' AND column_name = 'node_id'
  ) THEN
    ALTER TABLE aportes ADD COLUMN node_id uuid REFERENCES nodes(id) ON DELETE SET NULL;
    CREATE INDEX idx_aportes_node_id ON aportes (node_id);
  END IF;
END $$;
