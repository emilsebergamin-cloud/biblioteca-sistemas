-- =============================================================
-- FASE 5: SESIONES SIN LOGIN Y PROGRESO
-- Tablas: sessions, session_node_progress
-- Nota: session_answers se crea en 006 (después de entry_questions)
-- =============================================================

CREATE TABLE sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_token text UNIQUE NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  last_active_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_sessions_token ON sessions (session_token);

-- Progreso por nodo por sesión
CREATE TABLE session_node_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
  node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  estado text NOT NULL DEFAULT 'no_iniciado',
  updated_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_session_node UNIQUE (session_id, node_id)
);

-- estado esperado: 'no_iniciado', 'en_progreso', 'completado'

CREATE INDEX idx_snp_session ON session_node_progress (session_id);
CREATE INDEX idx_snp_node ON session_node_progress (node_id);
