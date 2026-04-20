-- =============================================================
-- SEED — Recursos (videos curados) para todos los bloques
-- Extraído de content/BiblAI_v2 (3).html
-- Total: 29 videos
-- Ejecutar DESPUÉS de seed.sql (bloques) y nodos_seed.sql (nodos)
-- =============================================================

-- ─── BLOQUE 1 — Cómo piensan las computadoras (4 videos) ────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1') ORDER BY orden_en_bloque LIMIT 1),
  'freeCodeCamp — Algorithms and Data Structures for Beginners',
  'https://www.youtube.com/watch?v=8hly31xKli0',
  'video',
  'basico',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1') ORDER BY orden_en_bloque LIMIT 1),
  'Fireship — Compiled vs Interpreted in 100 Seconds',
  'https://www.youtube.com/watch?v=N2bXEUSAiTI',
  'video',
  'basico',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1') ORDER BY orden_en_bloque LIMIT 1),
  'Programming with Mosh — Python Tutorial for Beginners',
  'https://www.youtube.com/watch?v=x7X9w_GIm1s',
  'video',
  'basico',
  3,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1') ORDER BY orden_en_bloque LIMIT 1),
  'The Net Ninja — React Tutorial for Beginners',
  'https://www.youtube.com/watch?v=SqcY0GlETPk',
  'video',
  'basico',
  4,
  'publicado'
);

-- ─── BLOQUE 1.5 — Cómo se ejecuta un programa (3 videos) ────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1-5') ORDER BY orden_en_bloque LIMIT 1),
  'CS50 Harvard — How Computers Work',
  'https://www.youtube.com/watch?v=WgXR2QpNS1o',
  'video',
  'basico',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1-5') ORDER BY orden_en_bloque LIMIT 1),
  'Crash Course — Computer Science: How Computers Calculate',
  'https://www.youtube.com/watch?v=FZGugFqdr60',
  'video',
  'basico',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-1-5') ORDER BY orden_en_bloque LIMIT 1),
  'Crash Course — Operating Systems',
  'https://www.youtube.com/watch?v=26QPDBe-NB8',
  'video',
  'basico',
  3,
  'publicado'
);

-- ─── BLOQUE 2 — Cómo se guarda la información (4 videos) ────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-2') ORDER BY orden_en_bloque LIMIT 1),
  'freeCodeCamp — Database Management Systems Full Course',
  'https://www.youtube.com/watch?v=HXV3zeQKqGY',
  'video',
  'basico',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-2') ORDER BY orden_en_bloque LIMIT 1),
  'Fireship — SQL Explained in 100 Seconds',
  'https://www.youtube.com/watch?v=zsjvFFKOm3c',
  'video',
  'basico',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-2') ORDER BY orden_en_bloque LIMIT 1),
  'Programming with Mosh — SQL Tutorial for Beginners',
  'https://www.youtube.com/watch?v=7S_tz1z_5bA',
  'video',
  'basico',
  3,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-2') ORDER BY orden_en_bloque LIMIT 1),
  'ByteByteGo — SQL vs NoSQL Explained',
  'https://www.youtube.com/watch?v=W2Z7fbCLSTw',
  'video',
  'basico',
  4,
  'publicado'
);

-- ─── BLOQUE 3 — Cómo se conectan las cosas (5 videos) ───────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-3') ORDER BY orden_en_bloque LIMIT 1),
  'Fireship — HTTP Crash Course & Exploration',
  'https://www.youtube.com/watch?v=iYM2zFP3Zn0',
  'video',
  'intermedio',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-3') ORDER BY orden_en_bloque LIMIT 1),
  'Programming with Mosh — What is a REST API?',
  'https://www.youtube.com/watch?v=SLwpqD8n3d0',
  'video',
  'basico',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-3') ORDER BY orden_en_bloque LIMIT 1),
  'ByteByteGo — What Is An API?',
  'https://www.youtube.com/watch?v=-mN3VyJuCjM',
  'video',
  'basico',
  3,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-3') ORDER BY orden_en_bloque LIMIT 1),
  'ByteByteGo — How DNS Works',
  'https://www.youtube.com/watch?v=1BfCnjr_Vjg',
  'video',
  'basico',
  4,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-3') ORDER BY orden_en_bloque LIMIT 1),
  'Fireship — OAuth 2.0 & OpenID Connect',
  'https://www.youtube.com/watch?v=996OiexHze0',
  'video',
  'intermedio',
  5,
  'publicado'
);

-- ─── BLOQUE 4 — Seguridad y privacidad (4 videos) ───────────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-4') ORDER BY orden_en_bloque LIMIT 1),
  'CS50 Harvard — Cybersecurity (Lecture 10)',
  'https://www.youtube.com/watch?v=8mBmBarFRwc',
  'video',
  'intermedio',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-4') ORDER BY orden_en_bloque LIMIT 1),
  'Computerphile — Password Security',
  'https://www.youtube.com/watch?v=aEmXa_1OC0w',
  'video',
  'basico',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-4') ORDER BY orden_en_bloque LIMIT 1),
  'Computerphile — How Ransomware Works',
  'https://www.youtube.com/watch?v=jWf9vPBhwNo',
  'video',
  'basico',
  3,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-4') ORDER BY orden_en_bloque LIMIT 1),
  'ByteByteGo — How Big Tech Uses Your Data',
  'https://www.youtube.com/watch?v=KVTou1sL67E',
  'video',
  'basico',
  4,
  'publicado'
);

-- ─── BLOQUE 5 — Cómo nace un producto digital (4 videos) ────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-5') ORDER BY orden_en_bloque LIMIT 1),
  'Y Combinator — How to Talk to Users',
  'https://www.youtube.com/watch?v=MT4Ig2uqjTc',
  'video',
  'basico',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-5') ORDER BY orden_en_bloque LIMIT 1),
  'Fireship — Agile Explained in 100 Seconds',
  'https://www.youtube.com/watch?v=RF8OjbmE8rE',
  'video',
  'basico',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-5') ORDER BY orden_en_bloque LIMIT 1),
  'freeCodeCamp — Scrum Crash Course',
  'https://www.youtube.com/watch?v=9TycLR0TqFA',
  'video',
  'basico',
  3,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-5') ORDER BY orden_en_bloque LIMIT 1),
  'Atlassian — OKRs Explained',
  'https://www.youtube.com/watch?v=RoY3ekCCxlc',
  'video',
  'basico',
  4,
  'publicado'
);

-- ─── BLOQUE 6 — Qué es la IA (5 videos) ─────────────────────

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-6') ORDER BY orden_en_bloque LIMIT 1),
  '3Blue1Brown — But what is a neural network?',
  'https://www.youtube.com/watch?v=aircAruvnKk',
  'video',
  'basico',
  1,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-6') ORDER BY orden_en_bloque LIMIT 1),
  '3Blue1Brown — But what is GPT? Visual intro to transformers',
  'https://www.youtube.com/watch?v=wjZofJX0v4M',
  'video',
  'intermedio',
  2,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-6') ORDER BY orden_en_bloque LIMIT 1),
  'Andrej Karpathy — Intro to Large Language Models',
  'https://www.youtube.com/watch?v=zjkBMFhNj_g',
  'video',
  'intermedio',
  3,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-6') ORDER BY orden_en_bloque LIMIT 1),
  'Fireship — ChatGPT Explained in 5 Minutes',
  'https://www.youtube.com/watch?v=5sLYAQS9sWQ',
  'video',
  'basico',
  4,
  'publicado'
);

INSERT INTO recursos (nodo_id, titulo, url, tipo, dificultad, orden, estado)
VALUES (
  (SELECT id FROM nodos WHERE bloque_id = (SELECT id FROM bloques WHERE slug = 'bloque-6') ORDER BY orden_en_bloque LIMIT 1),
  'Computerphile — AI Hallucination',
  'https://www.youtube.com/watch?v=86ib0sfdFtw',
  'video',
  'basico',
  5,
  'publicado'
);
