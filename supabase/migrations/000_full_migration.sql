-- =============================================================
-- MIGRACIÓN COMPLETA — biblioteca-sistemas
-- Ejecutar en Supabase SQL Editor en una sola ejecución
-- =============================================================

-- =============================================================
-- 001: CAPA DE CONTENIDO — modules, nodes, node_sections
-- =============================================================

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

-- =============================================================
-- 002: RELACIONES ENTRE NODOS — node_relations
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

CREATE INDEX idx_node_relations_from ON node_relations (from_node_id);
CREATE INDEX idx_node_relations_to ON node_relations (to_node_id);

-- =============================================================
-- 003: RUTAS DE APRENDIZAJE — learning_paths, learning_path_nodes
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

-- =============================================================
-- 004: SESIONES Y PROGRESO — sessions, session_node_progress
-- =============================================================

CREATE TABLE sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_token text UNIQUE NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  last_active_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_sessions_token ON sessions (session_token);

CREATE TABLE session_node_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id uuid NOT NULL REFERENCES sessions(id) ON DELETE CASCADE,
  node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  estado text NOT NULL DEFAULT 'no_iniciado',
  updated_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_session_node UNIQUE (session_id, node_id)
);

CREATE INDEX idx_snp_session ON session_node_progress (session_id);
CREATE INDEX idx_snp_node ON session_node_progress (node_id);

-- =============================================================
-- 005: ONBOARDING — entry_questions, entry_question_options
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

-- =============================================================
-- 006: RESPUESTAS DE ONBOARDING — session_answers
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

-- =============================================================
-- 007: GLOSARIO — glossary_terms, node_glossary_terms
-- =============================================================

CREATE TABLE glossary_terms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  termino text NOT NULL,
  definicion_corta text NOT NULL,
  definicion_larga text,
  categoria text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_glossary_terms_slug ON glossary_terms (slug);
CREATE INDEX idx_glossary_terms_categoria ON glossary_terms (categoria);

CREATE TABLE node_glossary_terms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  node_id uuid NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  glossary_term_id uuid NOT NULL REFERENCES glossary_terms(id) ON DELETE CASCADE,

  CONSTRAINT uq_node_glossary UNIQUE (node_id, glossary_term_id)
);

CREATE INDEX idx_ngt_node ON node_glossary_terms (node_id);
CREATE INDEX idx_ngt_term ON node_glossary_terms (glossary_term_id);

-- =============================================================
-- 008: INTEGRACIÓN CON APORTES (aditivo, idempotente)
-- =============================================================

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

-- =============================================================
-- 009: RECURSOS — resources, node_resources
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
