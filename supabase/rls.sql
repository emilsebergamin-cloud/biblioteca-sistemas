-- =============================================================
-- ROW LEVEL SECURITY — Biblioteca de Sistemas MVP
-- Ejecutar DESPUÉS de schema.sql
-- =============================================================

-- Habilitar RLS en todas las tablas
ALTER TABLE bloques ENABLE ROW LEVEL SECURITY;
ALTER TABLE nodos ENABLE ROW LEVEL SECURITY;
ALTER TABLE aportes ENABLE ROW LEVEL SECURITY;
ALTER TABLE votos ENABLE ROW LEVEL SECURITY;

-- =============================================================
-- BLOQUES — lectura pública
-- =============================================================

CREATE POLICY "bloques_select_publico"
  ON bloques FOR SELECT
  USING (true);

-- =============================================================
-- NODOS — lectura pública
-- =============================================================

CREATE POLICY "nodos_select_publico"
  ON nodos FOR SELECT
  USING (true);

-- =============================================================
-- APORTES — lectura pública, inserción pública, modificación restringida
-- =============================================================

CREATE POLICY "aportes_select_publico"
  ON aportes FOR SELECT
  USING (true);

CREATE POLICY "aportes_insert_publico"
  ON aportes FOR INSERT
  WITH CHECK (true);

-- UPDATE y DELETE solo con service_role (no se crean policies,
-- por lo tanto quedan bloqueados para anon/authenticated)

-- =============================================================
-- VOTOS — lectura pública, inserción con restricción de duplicados
-- =============================================================

CREATE POLICY "votos_select_publico"
  ON votos FOR SELECT
  USING (true);

CREATE POLICY "votos_insert_publico"
  ON votos FOR INSERT
  WITH CHECK (true);

-- La restricción de un voto por session_id por nodo se aplica
-- via UNIQUE constraint en schema.sql (uq_voto_por_sesion).
-- Si se intenta insertar un duplicado, Postgres rechaza el INSERT.

-- =============================================================
-- RECURSOS — lectura pública, modificación restringida
-- =============================================================

ALTER TABLE recursos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "recursos_select_publico"
  ON recursos FOR SELECT
  USING (true);

-- INSERT, UPDATE y DELETE solo con service_role (no se crean policies,
-- por lo tanto quedan bloqueados para anon/authenticated)
