-- =============================================================
-- FASE 8: DATOS SEMILLA INICIALES
-- =============================================================

-- -----------------------------------------------
-- MODULES (bloques)
-- -----------------------------------------------
INSERT INTO modules (slug, titulo, subtitulo, orden, estado) VALUES
  ('bloque-1',   'Cómo piensan las computadoras',  'Lógica, binario y procesamiento',          1,   'publicado'),
  ('bloque-1-5', 'Cómo se ejecuta un programa',    'Del código al resultado',                   1.5, 'publicado'),
  ('bloque-2',   'Cómo se guarda la información',   'Bases de datos, archivos y almacenamiento', 2,   'publicado'),
  ('bloque-3',   'Cómo se conectan las cosas',      'Redes, internet y APIs',                    3,   'publicado'),
  ('bloque-4',   'Seguridad y privacidad',           'Proteger datos y sistemas',                 4,   'publicado'),
  ('bloque-5',   'Cómo nace un producto digital',    'Del problema a la solución',                5,   'publicado'),
  ('bloque-6',   'Qué es la IA',                     'Inteligencia artificial sin misterio',      6,   'publicado');

-- -----------------------------------------------
-- LEARNING PATHS (rutas de aprendizaje)
-- -----------------------------------------------
INSERT INTO learning_paths (slug, nombre, descripcion) VALUES
  ('ruta-evolutiva', 'Ruta evolutiva',      'Recorrido completo y secuencial por todos los bloques'),
  ('ruta-ia',        'Ruta IA',             'Enfocada en entender inteligencia artificial y sus aplicaciones'),
  ('ruta-producto',  'Ruta producto',       'Cómo se diseñan y construyen productos digitales'),
  ('ruta-seguridad', 'Ruta seguridad',      'Protección de datos, privacidad y riesgos digitales');

-- -----------------------------------------------
-- NODES (algunos nodos base de ejemplo)
-- -----------------------------------------------
INSERT INTO nodes (module_id, slug, titulo, resumen_corto, tipo, aprendizaje_tipo, dificultad, orden_en_modulo, estado, es_clave) VALUES
  ((SELECT id FROM modules WHERE slug = 'bloque-1'),
   'que-es-una-computadora', 'Qué es una computadora', 'Una máquina que sigue instrucciones', 'concepto', 'fundamento', 1, 1, 'publicado', true),
  ((SELECT id FROM modules WHERE slug = 'bloque-1'),
   'como-piensa-en-numeros', 'Cómo piensa en números', 'Todo se reduce a ceros y unos', 'concepto', 'fundamento', 1, 2, 'publicado', true),
  ((SELECT id FROM modules WHERE slug = 'bloque-1'),
   'que-es-un-algoritmo', 'Qué es un algoritmo', 'Una receta paso a paso', 'concepto', 'fundamento', 1, 3, 'publicado', true),
  ((SELECT id FROM modules WHERE slug = 'bloque-6'),
   'que-es-la-ia', 'Qué es la inteligencia artificial', 'Máquinas que aprenden de datos', 'concepto', 'ia', 1, 1, 'publicado', true),
  ((SELECT id FROM modules WHERE slug = 'bloque-5'),
   'del-problema-al-producto', 'Del problema al producto', 'Cómo nace una idea digital', 'concepto', 'producto', 1, 1, 'publicado', true);

-- -----------------------------------------------
-- ENTRY QUESTIONS (onboarding)
-- -----------------------------------------------
INSERT INTO entry_questions (slug, pregunta, tipo, orden) VALUES
  ('nivel-actual',        '¿Cuánto sabés de tecnología?',          'single_choice', 1),
  ('objetivo-principal',  '¿Qué te gustaría lograr?',              'single_choice', 2),
  ('forma-de-aprender',   '¿Cómo preferís aprender?',              'single_choice', 3);

-- Opciones: nivel actual
INSERT INTO entry_question_options (question_id, valor, label, descripcion, orden) VALUES
  ((SELECT id FROM entry_questions WHERE slug = 'nivel-actual'),
   'nulo',    'Arranco de cero',          'No tengo experiencia con tecnología',   1),
  ((SELECT id FROM entry_questions WHERE slug = 'nivel-actual'),
   'basico',  'Sé lo básico',             'Uso apps y herramientas, pero no entiendo cómo funcionan por dentro', 2),
  ((SELECT id FROM entry_questions WHERE slug = 'nivel-actual'),
   'medio',   'Tengo algo de contexto',   'Entiendo algunos conceptos pero me faltan conexiones', 3);

-- Opciones: objetivo principal
INSERT INTO entry_question_options (question_id, valor, label, descripcion, orden) VALUES
  ((SELECT id FROM entry_questions WHERE slug = 'objetivo-principal'),
   'entender',    'Entender cómo funciona todo',   'Quiero una visión general del mundo tech',          1),
  ((SELECT id FROM entry_questions WHERE slug = 'objetivo-principal'),
   'ia',          'Entender la IA',                 'Me interesa saber qué es y cómo se usa',           2),
  ((SELECT id FROM entry_questions WHERE slug = 'objetivo-principal'),
   'producto',    'Crear un producto digital',      'Quiero saber cómo nacen las apps y plataformas',   3),
  ((SELECT id FROM entry_questions WHERE slug = 'objetivo-principal'),
   'seguridad',   'Proteger mis datos',             'Me preocupa la privacidad y seguridad digital',    4);

-- Opciones: forma de aprender
INSERT INTO entry_question_options (question_id, valor, label, descripcion, orden) VALUES
  ((SELECT id FROM entry_questions WHERE slug = 'forma-de-aprender'),
   'lectura',     'Leyendo a mi ritmo',        'Prefiero leer y explorar por mi cuenta',    1),
  ((SELECT id FROM entry_questions WHERE slug = 'forma-de-aprender'),
   'ejemplos',    'Con ejemplos reales',        'Aprendo mejor viendo casos concretos',      2),
  ((SELECT id FROM entry_questions WHERE slug = 'forma-de-aprender'),
   'guiado',      'Con un recorrido guiado',    'Prefiero que me digan por dónde empezar',   3);
