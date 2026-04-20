-- =============================================================
-- SEED — Preguntas de quiz para todos los bloques
-- Extraído de content/BiblAI_v2 (3).html
-- Total: 26 preguntas
-- Ejecutar DESPUÉS de quiz_schema.sql y seed.sql (bloques)
-- =============================================================

-- ─── BLOQUE 1 — Cómo piensan las computadoras (3 preguntas) ──

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  '¿Qué es un algoritmo?',
  ARRAY['Una función matemática compleja', 'Un conjunto de pasos para completar una tarea específica', 'Un lenguaje de programación', 'El idioma nativo de las computadoras'],
  1,
  'Correcto. Pasos ordenados para llegar a un resultado — finitos, deterministas y sensibles al orden.',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  '¿Qué lenguaje es el único que corre nativo en el navegador?',
  ARRAY['Python', 'TypeScript', 'JavaScript', 'SQL'],
  2,
  'JavaScript es el único lenguaje que los navegadores entienden directamente.',
  2,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  '¿Para qué sirve SQL?',
  ARRAY['Para construir interfaces web', 'Para entrenar modelos de IA', 'Para consultar y manipular datos en bases de datos relacionales', 'Para gestionar el sistema operativo'],
  2,
  'SQL habla con los datos.',
  3,
  'publicado'
);

-- ─── BLOQUE 1.5 — Cómo se ejecuta un programa (2 preguntas) ──

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  '¿Cuál es la diferencia entre RAM y disco?',
  ARRAY['La RAM es más lenta pero puede guardar más datos', 'La RAM es el espacio de trabajo temporal y rápido; el disco es el almacenamiento permanente', 'El disco solo lo usan los desarrolladores', 'Son lo mismo con distintos nombres'],
  1,
  'RAM = escritorio (rápido, temporal). Disco = cajón (permanente).',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  '¿Por qué existe el ambiente de staging?',
  ARRAY['Para que los desarrolladores trabajen más rápido', 'Para atrapar errores en un ambiente que simula producción antes de que lleguen a los usuarios reales', 'Porque production es demasiado caro', 'Es opcional'],
  1,
  'Staging es la última red de seguridad. Un error en staging es barato; en producción es costoso.',
  2,
  'publicado'
);

-- ─── BLOQUE 2 — Cómo se guarda la información (3 preguntas) ──

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  '¿Qué es un schema de base de datos?',
  ARRAY['El lenguaje de programación usado', 'La estructura predefinida que define qué tablas existen, qué columnas tienen y qué tipo de dato acepta cada campo', 'El archivo de respaldo', 'El sistema de autenticación'],
  1,
  'El schema es el plano del edificio. Cambiarlo cuando ya hay datos es una migración.',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  '¿Qué significa la A de ACID?',
  ARRAY['Authorization', 'Atomicity — que la transacción se ejecuta completa o no se ejecuta en absoluto', 'Availability', 'Asynchronous'],
  1,
  'Atomicity: o todo pasa o nada pasa.',
  2,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  '¿Cuándo conviene usar una base de datos no relacional?',
  ARRAY['Siempre, porque es más moderna', 'Cuando los datos son muy estructurados y predecibles', 'Cuando los datos son variables o no estructurados, o se necesita escalar a volúmenes masivos con baja latencia', 'Solo para redes sociales'],
  2,
  'NoSQL brilla cuando la estructura varía o cuando se necesita escalar masivamente.',
  3,
  'publicado'
);

-- ─── BLOQUE 3 — Cómo se conectan las cosas (6 preguntas) ─────

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  '¿Cuál es la diferencia entre internet y la World Wide Web?',
  ARRAY['Son exactamente lo mismo', 'Internet es la infraestructura de red global; la web es el sistema de páginas y contenido que corre sobre esa infraestructura', 'La web es más antigua que internet', 'Internet es privado; la web es pública'],
  1,
  'Internet son las rutas. La web son los autos que circulan por ellas.',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  '¿Cuál es la diferencia entre autenticación y autorización?',
  ARRAY['Son sinónimos', 'Autenticación verifica quién sos; autorización decide qué podés hacer — son dos filtros distintos', 'Autenticación es para usuarios; autorización es para aplicaciones', 'La autorización siempre va antes'],
  1,
  'El portero del boliche hace autenticación (DNI). La lista VIP es autorización.',
  2,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  '¿Qué pasa cuando el DNS falla?',
  ARRAY['Internet se cae completamente', 'Solo los sitios nuevos dejan de funcionar', 'Los sitios web son inaccesibles aunque los servidores estén funcionando perfectamente', 'La conexión se vuelve más lenta'],
  2,
  'En 2016, el ataque a Dyn tiró Twitter, Netflix y Amazon. Sus servidores estaban perfectos. Solo el DNS había caído.',
  3,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  '¿Por qué GET no debería usarse para formularios de pago?',
  ARRAY['GET es más lento que POST', 'Los parámetros de GET viajan visibles en la URL — expone datos sensibles y puede procesar el cobro dos veces si el usuario recarga', 'GET no soporta datos encriptados', 'Los servidores de pagos no aceptan GET'],
  1,
  'Una URL con ?monto=5000 visible en el historial es un error de seguridad grave.',
  4,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  '¿Qué es un endpoint?',
  ARRAY['El servidor principal de una empresa', 'La dirección específica de un recurso dentro de una API — la puerta exacta para pedir algo específico', 'El formato en que viajan los datos', 'El sistema de autenticación de una API'],
  1,
  'Si la API es el edificio, el endpoint es la puerta específica.',
  5,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  '¿Cuándo conviene usar WebSockets en lugar de una API REST?',
  ARRAY['Siempre — WebSockets es más moderno', 'Cuando necesitás comunicación en tiempo real bidireccional — chats, precios en vivo, colaboración simultánea', 'Solo para aplicaciones móviles', 'Cuando el rate limit de la API REST es insuficiente'],
  1,
  'REST es para solicitud-respuesta. WebSockets es para cuando necesitás una conexión que quede abierta.',
  6,
  'publicado'
);

-- ─── BLOQUE 4 — Seguridad y privacidad (4 preguntas) ─────────

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  '¿Cuál es el mayor riesgo de reusar la misma contraseña?',
  ARRAY['Que sea más fácil de adivinar', 'Que una sola brecha en cualquier servicio expone todas tus cuentas automáticamente', 'Que los servicios la compartan entre sí', 'Que sea rechazada por ser demasiado simple'],
  1,
  'Eso se llama credential stuffing.',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  '¿Qué es el 2FA?',
  ARRAY['Una contraseña más larga', 'Un segundo factor de verificación que requiere algo que tenés (tu teléfono) además de algo que sabés (tu contraseña)', 'Un sistema de backup para contraseñas olvidadas', 'El nombre técnico para el login biométrico'],
  1,
  'El 2FA agrega una capa que un atacante no puede superar aunque tenga tu contraseña.',
  2,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'La diferencia entre HTTPS y cifrado de extremo a extremo:',
  ARRAY['HTTPS es más seguro porque lo usan los bancos', 'HTTPS encripta el trayecto — la empresa puede leer el contenido. El E2E encripta el contenido de forma que ni la plataforma puede leerlo', 'Son sinónimos', 'El cifrado E2E solo funciona en apps de pago'],
  1,
  'Con HTTPS el servidor puede leer lo que mandás. Con E2E ni el servidor puede leerlo.',
  3,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  '¿Por qué el ransomware pide pagos en Bitcoin o Monero?',
  ARRAY['Porque es más rápido', 'Porque las transacciones son difíciles de rastrear e irreversibles — no hay banco que pueda revertir una transferencia', 'Porque los atacantes no tienen cuentas bancarias', 'Por razones fiscales'],
  1,
  'La irreversibilidad es la clave. Una vez transferido el dinero, no hay chargeback posible.',
  4,
  'publicado'
);

-- ─── BLOQUE 5 — Cómo nace un producto digital (4 preguntas) ──

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  '¿Cuál es la razón número uno por la que fallan los productos digitales según CB Insights?',
  ARRAY['Problemas técnicos irresolubles', 'Falta de financiamiento', 'No existía demanda real — construyeron algo que nadie quería', 'El equipo no tenía experiencia'],
  2,
  'El 35% de las startups falla por ''no market need''.',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  '¿Qué es un MVP correctamente entendido?',
  ARRAY['Una versión barata e incompleta del producto final', 'La versión más pequeña posible que permite validar la hipótesis central del negocio con usuarios reales', 'El primer prototipo visual', 'El producto lanzado antes de tener todas las features'],
  1,
  'La palabra clave es ''viable'' — no ''mínimo''.',
  2,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'La diferencia entre CI y CD es:',
  ARRAY['Son exactamente lo mismo', 'CI integra y testea el código automáticamente; CD lleva ese código a producción — son dos etapas distintas', 'CI es para el frontend y CD es para el backend', 'CI es para equipos pequeños y CD para equipos grandes'],
  1,
  'CI = integración + testing automático. CD = deploy automático o semi-automático.',
  3,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  '¿Cómo saber si un producto alcanzó el product-market fit según Sean Ellis?',
  ARRAY['Cuando tiene más de 1.000 usuarios activos', 'Cuando el 40% o más de los usuarios activos dice que estaría ''muy decepcionado'' si el producto desapareciera', 'Cuando el churn es menor al 5% mensual', 'Cuando la North Star Metric supera el benchmark'],
  1,
  'El 40% de Ellis es el umbral empírico que separa a los productos que crecen de los que no.',
  4,
  'publicado'
);

-- ─── BLOQUE 6 — Qué es la IA (4 preguntas) ──────────────────

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  '¿Cuál es la relación correcta entre IA, ML, Deep Learning e IA Generativa?',
  ARRAY['Son sinónimos', 'Son tecnologías competidoras', 'Son capas donde cada concepto es un subconjunto del anterior — IA contiene ML, ML contiene Deep Learning, Deep Learning contiene IA Generativa', 'Son etapas históricas secuenciales'],
  2,
  'Son matrioskas. IA es el campo más amplio, IA Generativa es la capa más específica.',
  1,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  '¿Qué es RLHF y por qué importa?',
  ARRAY['Es el proceso de entrenamiento inicial donde el modelo aprende de internet', 'Es la segunda etapa donde feedback humano alinea el modelo para que sea útil, honesto y seguro — es la diferencia entre GPT-base y ChatGPT', 'Es el sistema que detecta alucinaciones en tiempo real', 'Permite al modelo actualizar su conocimiento automáticamente'],
  1,
  'Sin RLHF, un LLM puede generar texto plausible pero sin distinguir entre contenido útil y dañino.',
  2,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'Una alucinación en un LLM ocurre porque:',
  ARRAY['El modelo fue entrenado con datos incorrectos deliberadamente', 'El modelo predice qué texto es estadísticamente probable sin verificar si lo que genera es verdad', 'El modelo intenta engañar al usuario', 'El modelo no tiene suficientes parámetros'],
  1,
  'La alucinación no es intencional — el modelo puede generar una cita perfectamente formateada de un paper que no existe.',
  3,
  'publicado'
);

INSERT INTO quiz_preguntas (bloque_id, pregunta, opciones, respuesta_correcta, explicacion, orden, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  '¿Qué es RAG?',
  ARRAY['Una técnica para hacer modelos más pequeños', 'La técnica por la cual un LLM puede acceder a información externa actualizada antes de generar su respuesta — solución principal a alucinaciones y knowledge cutoff', 'Un método de entrenamiento alternativo al RLHF', 'Un tipo de prompt engineering'],
  1,
  'Sin RAG el LLM sabe solo lo que aprendió hasta su fecha de corte. Con RAG puede consultar documentos actualizados.',
  4,
  'publicado'
);
