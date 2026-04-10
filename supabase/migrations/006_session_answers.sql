-- =============================================================
-- RESPUESTAS DE ONBOARDING POR SESIÓN
-- Depende de: sessions (004), entry_questions/options (005)
-- =============================================================

CREATE TABLE session_answers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
  question_id uuid NOT NULL REFERENCES entry_questions(id) ON DELETE CASCADE,
  option_id uuid REFERENCES entry_question_options(id) ON DELETE SET NULL,
  respuesta_libre text,
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_session_question UNIQUE (session_id, question_id)
);

CREATE INDEX idx_sa_session ON session_answers (session_id);
CREATE INDEX idx_sa_question ON session_answers (question_id);
