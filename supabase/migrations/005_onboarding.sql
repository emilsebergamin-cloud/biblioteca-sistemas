-- =============================================================
-- FASE 6: ONBOARDING Y PREGUNTAS DE ENTRADA
-- Tablas: entry_questions, entry_question_options
-- =============================================================

CREATE TABLE entry_questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  pregunta text NOT NULL,
  tipo text NOT NULL DEFAULT 'single_choice',
  orden integer NOT NULL DEFAULT 0,
  es_activa boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE entry_question_options (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id uuid NOT NULL REFERENCES entry_questions(id) ON DELETE CASCADE,
  valor text NOT NULL,
  label text NOT NULL,
  descripcion text,
  orden integer NOT NULL DEFAULT 0,
  metadata jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_eq_options_question ON entry_question_options (question_id, orden);
