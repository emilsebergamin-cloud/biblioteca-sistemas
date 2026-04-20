-- =============================================================
-- SCHEMA — Tabla de preguntas de quiz por bloque
-- =============================================================

CREATE TABLE quiz_preguntas (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bloque_id uuid NOT NULL REFERENCES bloques(id) ON DELETE CASCADE,
  pregunta text NOT NULL,
  opciones text[] NOT NULL,
  respuesta_correcta integer NOT NULL,
  explicacion text,
  orden integer NOT NULL DEFAULT 1,
  estado text NOT NULL DEFAULT 'publicado',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_quiz_bloque ON quiz_preguntas (bloque_id, orden);
