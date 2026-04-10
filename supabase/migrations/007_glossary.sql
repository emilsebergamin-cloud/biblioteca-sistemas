-- =============================================================
-- FASE 6b: GLOSARIO
-- Tablas: glossary_terms, node_glossary_terms
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
