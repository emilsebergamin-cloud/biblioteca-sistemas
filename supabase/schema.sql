-- =============================================================
-- ESQUEMA COMPLETO — Biblioteca de Sistemas (Bibl·AI)
-- 6 tablas: bloques, nodos, aportes, votos, recursos, quiz_preguntas
-- Ejecutar en Supabase SQL Editor
-- Última actualización: 2026-04-23
-- =============================================================

-- =============================================================
-- BLOQUES — agrupación temática de alto nivel
-- =============================================================

CREATE TABLE bloques (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  subtitulo text,
  descripcion text,
  orden integer NOT NULL,
  estado text NOT NULL DEFAULT 'borrador',
  color_acento text,
  icono text,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_bloques_orden ON bloques (orden);
CREATE INDEX idx_bloques_estado ON bloques (estado);

-- =============================================================
-- NODOS — unidad de contenido dentro de un bloque
-- =============================================================

CREATE TABLE nodos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bloque_id uuid NOT NULL REFERENCES bloques(id) ON DELETE CASCADE,
  slug text UNIQUE NOT NULL,
  titulo text NOT NULL,
  resumen_corto text,
  contenido_html text,
  tipo text NOT NULL DEFAULT 'concepto',
  tags text[],
  dificultad text NOT NULL DEFAULT 'basico',
  orden_en_bloque integer NOT NULL,
  estado text NOT NULL DEFAULT 'borrador',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_nodos_bloque ON nodos (bloque_id, orden_en_bloque);
CREATE INDEX idx_nodos_estado ON nodos (estado);
CREATE INDEX idx_nodos_tipo ON nodos (tipo);

-- =============================================================
-- APORTES — contribuciones de usuarios
-- =============================================================

CREATE TABLE aportes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nodo_id uuid REFERENCES nodos(id) ON DELETE CASCADE,
  contenido text NOT NULL CHECK (char_length(contenido) <= 500),
  autor_nombre text,
  estado text NOT NULL DEFAULT 'pendiente',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_aportes_nodo ON aportes (nodo_id);
CREATE INDEX idx_aportes_estado ON aportes (estado);

-- =============================================================
-- VOTOS — útil / no útil por nodo
-- =============================================================

CREATE TABLE votos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nodo_id uuid NOT NULL REFERENCES nodos(id) ON DELETE CASCADE,
  tipo text NOT NULL CHECK (tipo IN ('util', 'no_util')),
  session_id text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),

  CONSTRAINT uq_voto_por_sesion UNIQUE (nodo_id, session_id)
);

CREATE INDEX idx_votos_nodo ON votos (nodo_id);

-- =============================================================
-- RECURSOS — videos, artículos y herramientas por nodo
-- =============================================================

CREATE TABLE recursos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nodo_id uuid NOT NULL REFERENCES nodos(id) ON DELETE CASCADE,
  titulo text NOT NULL,
  url text NOT NULL,
  tipo text NOT NULL DEFAULT 'video',
  dificultad text NOT NULL DEFAULT 'basico',
  orden integer NOT NULL DEFAULT 1,
  estado text NOT NULL DEFAULT 'publicado',
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_recursos_nodo ON recursos (nodo_id, orden);
CREATE INDEX idx_recursos_tipo ON recursos (tipo);

-- =============================================================
-- QUIZ_PREGUNTAS — preguntas de quiz por bloque
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

-- =============================================================
-- ROW LEVEL SECURITY
-- =============================================================

ALTER TABLE bloques ENABLE ROW LEVEL SECURITY;
ALTER TABLE nodos ENABLE ROW LEVEL SECURITY;
ALTER TABLE aportes ENABLE ROW LEVEL SECURITY;
ALTER TABLE votos ENABLE ROW LEVEL SECURITY;
ALTER TABLE recursos ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_preguntas ENABLE ROW LEVEL SECURITY;

-- Lectura pública en todas las tablas
CREATE POLICY "bloques_select_publico" ON bloques FOR SELECT USING (true);
CREATE POLICY "nodos_select_publico" ON nodos FOR SELECT USING (true);
CREATE POLICY "aportes_select_publico" ON aportes FOR SELECT USING (true);
CREATE POLICY "votos_select_publico" ON votos FOR SELECT USING (true);
CREATE POLICY "recursos_select_publico" ON recursos FOR SELECT USING (true);
CREATE POLICY "quiz_select_publico" ON quiz_preguntas FOR SELECT USING (true);

-- Inserción pública en aportes y votos
CREATE POLICY "aportes_insert_publico" ON aportes FOR INSERT WITH CHECK (true);
CREATE POLICY "votos_insert_publico" ON votos FOR INSERT WITH CHECK (true);

-- UPDATE/DELETE en aportes, votos, recursos y quiz_preguntas:
-- solo con service_role (sin policy = bloqueado para anon/authenticated).
-- La restricción de un voto por session_id por nodo se aplica
-- via UNIQUE constraint (uq_voto_por_sesion).
