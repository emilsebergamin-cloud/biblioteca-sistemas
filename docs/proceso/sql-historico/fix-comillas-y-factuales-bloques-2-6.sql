-- =============================================================
-- FIX EDITORIAL — Bloques 2-6
-- Comillas simples → dobles, errores factuales, refs a bloques inexistentes
-- Ejecutar en Supabase SQL Editor de un solo golpe
-- =============================================================

-- ----- BLOQUE 2 -----

-- Nodo: bases-de-datos-relacionales
-- Fix 1: Comillas en dato-color (paper de Codd, empresa que ignoró)
-- Fix 2: Error factual — "dos estudiantes de Stanford" es incorrecto
update nodos set contenido_html = replace(replace(replace(contenido_html, $$''A Relational Model of Data for Large Shared Data Banks''$$, $$"A Relational Model of Data for Large Shared Data Banks"$$), $$''la empresa que ignoró su propia innovación''$$, $$"la empresa que ignoró su propia innovación"$$), $$dos estudiantes de Stanford leyeron el paper, lo implementaron, y fundaron Oracle$$, $$Larry Ellison leyó el paper, lo tomó como punto de partida, y junto a Bob Miner y Ed Oates fundó Oracle$$) where slug = 'bases-de-datos-relacionales';

-- Nodo: el-schema-la-estructura-que-define-todo
-- Fix: comillas
update nodos set contenido_html = replace(contenido_html, $$''agregar el campo de fecha de nacimiento al perfil de usuario''$$, $$"agregar el campo de fecha de nacimiento al perfil de usuario"$$) where slug = 'el-schema-la-estructura-que-define-todo';

-- Nodo: transacciones-y-propiedades-acid
-- Fix: comillas (rota, ven, ACID compliant)
update nodos set contenido_html = replace(replace(replace(contenido_html, $$''rota''$$, $$"rota"$$), $$''ven''$$, $$"ven"$$), $$''ACID compliant''$$, $$"ACID compliant"$$) where slug = 'transacciones-y-propiedades-acid';

-- ----- BLOQUE 3 -----

-- Nodo: la-evolucion-del-protocolo-http
-- Fix: comillas (head-of-line blocking)
update nodos set contenido_html = replace(contenido_html, $$''head-of-line blocking''$$, $$"head-of-line blocking"$$) where slug = 'la-evolucion-del-protocolo-http';

-- Nodo: https-y-criptografia-de-clave-publica
-- Fix: comillas (este sitio es seguro)
update nodos set contenido_html = replace(contenido_html, $$''este sitio es seguro.''$$, $$"este sitio es seguro."$$) where slug = 'https-y-criptografia-de-clave-publica';

-- Nodo: oauth-iniciar-sesion-con-google
-- Fix: comillas en titulo y contenido (Iniciar sesión con Google)
update nodos set contenido_html = replace(contenido_html, $$''Iniciar sesión con Google''$$, $$"Iniciar sesión con Google"$$) where slug = 'oauth-iniciar-sesion-con-google';

-- Nodo: dns-y-que-pasa-cuando-falla
-- Fix: comillas (guía telefónica)
update nodos set contenido_html = replace(contenido_html, $$''guía telefónica''$$, $$"guía telefónica"$$) where slug = 'dns-y-que-pasa-cuando-falla';

-- Nodo: el-flujo-completo-todo-junto
-- Fix: comillas (play)
update nodos set contenido_html = replace(contenido_html, $$''play''$$, $$"play"$$) where slug = 'el-flujo-completo-todo-junto';

-- ----- BLOQUE 4 -----

-- Nodo: las-contrasenas
-- Fix: comillas (123456, password, 123456789, admin)
update nodos set contenido_html = replace(replace(replace(replace(contenido_html, $$''123456''$$, $$"123456"$$), $$''password''$$, $$"password"$$), $$''123456789''$$, $$"123456789"$$), $$''admin''$$, $$"admin"$$) where slug = 'las-contrasenas';

-- Nodo: las-decisiones-concretas
-- Fix: comillas (ahora mismo)
update nodos set contenido_html = replace(contenido_html, $$''ahora mismo''$$, $$"ahora mismo"$$) where slug = 'las-decisiones-concretas';

-- Nodo: phishing
-- Fix: comillas (Tu cuenta será suspendida)
update nodos set contenido_html = replace(contenido_html, $$''Tu cuenta será suspendida en 24 horas''$$, $$"Tu cuenta será suspendida en 24 horas"$$) where slug = 'phishing';

-- Nodo: ingenieria-social
-- Fix: comillas (Tu paquete tiene un problema, Soy del área de IT)
update nodos set contenido_html = replace(replace(contenido_html, $$''Tu paquete tiene un problema, hacé click acá.''$$, $$"Tu paquete tiene un problema, hacé click acá."$$), $$''Soy del área de IT, necesito tu contraseña para actualizar el sistema.''$$, $$"Soy del área de IT, necesito tu contraseña para actualizar el sistema."$$) where slug = 'ingenieria-social';

-- Nodo: malware-y-ransomware
-- Fix: comillas (Pagá X cantidad, ransom)
update nodos set contenido_html = replace(contenido_html, $$''Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo.''$$, $$"Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo."$$) where slug = 'malware-y-ransomware';

-- Nodo: cifrado-de-extremo-a-extremo-vs-https
-- Fix: comillas (chats secretos)
update nodos set contenido_html = replace(contenido_html, $$''chats secretos''$$, $$"chats secretos"$$) where slug = 'cifrado-de-extremo-a-extremo-vs-https';

-- ----- BLOQUE 5 -----

-- Nodo: la-idea-no-es-el-producto
-- Fix: comillas McDonald's → no tocar, es apóstrofe legítimo en nombre propio

-- Nodo: todo-producto-es-una-hipotesis
-- Fix: comillas en tabla (Nuestros usuarios, Esta solución, etc.)
update nodos set contenido_html = replace(replace(replace(replace(contenido_html, $$''Nuestros usuarios tienen este problema''$$, $$"Nuestros usuarios tienen este problema"$$), $$''Esta solución lo resuelve''$$, $$"Esta solución lo resuelve"$$), $$''Estarán dispuestos a pagar X''$$, $$"Estarán dispuestos a pagar X"$$), $$''Este canal de adquisición va a funcionar''$$, $$"Este canal de adquisición va a funcionar"$$) where slug = 'todo-producto-es-una-hipotesis';

-- Nodo: del-problema-al-producto (no market need)
update nodos set contenido_html = replace(contenido_html, $$''no market need''$$, $$"no market need"$$) where slug = 'todo-producto-es-una-hipotesis';

-- Nodo: los-roles-quien-hace-que
-- Fix: comillas (por qué, qué)
update nodos set contenido_html = replace(replace(contenido_html, $$''por qué''$$, $$"por qué"$$), $$''qué''$$, $$"qué"$$) where slug = 'los-roles-quien-hace-que';

-- Nodo: del-codigo-a-los-usuarios
-- Fix: comillas (subir un cambio)
update nodos set contenido_html = replace(contenido_html, $$''subir un cambio''$$, $$"subir un cambio"$$) where slug = 'del-codigo-a-los-usuarios-ambientes-deploy-cicd';

-- Nodo: deuda-tecnica
-- Fix: comillas (refactorizar, funciona)
update nodos set contenido_html = replace(replace(contenido_html, $$''refactorizar''$$, $$"refactorizar"$$), $$''funciona''$$, $$"funciona"$$) where slug = 'deuda-tecnica';

-- Nodo: product-market-fit
-- Fix: comillas (el único momento, Qué tan decepcionado, muy decepcionado)
update nodos set contenido_html = replace(replace(replace(contenido_html, $$''el único momento que importa en la vida de una startup.''$$, $$"el único momento que importa en la vida de una startup."$$), $$''¿Qué tan decepcionado/a estarías si este producto desapareciera mañana?''$$, $$"¿Qué tan decepcionado/a estarías si este producto desapareciera mañana?"$$), $$''muy decepcionado''$$, $$"muy decepcionado"$$) where slug = 'product-market-fit';

-- ----- BLOQUE 6 -----

-- Nodo: el-malentendido-mas-grande-sobre-la-ia
-- Fix: comillas (inteligencia artificial)
update nodos set contenido_html = replace(contenido_html, $$''inteligencia artificial''$$, $$"inteligencia artificial"$$) where slug = 'el-malentendido-mas-grande-sobre-la-ia';

-- Nodo: como-funciona-un-llm
-- Fix: comillas (Large, personalidad, sentido común)
update nodos set contenido_html = replace(replace(replace(contenido_html, $$''Large''$$, $$"Large"$$), $$''personalidad''$$, $$"personalidad"$$), $$''sentido común''$$, $$"sentido común"$$) where slug = 'como-funciona-un-llm';

-- Nodo: context-window
-- Fix: comillas (ve, olvida)
update nodos set contenido_html = replace(replace(replace(contenido_html, $$''ve''$$, $$"ve"$$), $$''olvida''$$, $$"olvida"$$), $$''campo visual''$$, $$"campo visual"$$) where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve';

-- Nodo: la-arquitectura-transformer
-- Fix: comillas (Attention Is All You Need)
update nodos set contenido_html = replace(contenido_html, $$''Attention Is All You Need''$$, $$"Attention Is All You Need"$$) where slug = 'la-arquitectura-transformer';

-- Nodo: alucinaciones
-- Fix: comillas (mienta)
update nodos set contenido_html = replace(contenido_html, $$''mienta''$$, $$"mienta"$$) where slug = 'alucinaciones';

-- Nodo: agi
-- Fix: comillas (alcanzó la AGI, muy cerca)
update nodos set contenido_html = replace(replace(contenido_html, $$''alcanzó la AGI''$$, $$"alcanzó la AGI"$$), $$''muy cerca''$$, $$"muy cerca"$$) where slug = 'agi-que-es-y-por-que-el-debate-importa';

-- Nodo: las-preguntas-que-no-tienen-respuesta-simple
-- Fix: comillas (entidad legal separada)
-- Fix: referencia a Bloque 8 inexistente
update nodos set contenido_html = replace(replace(contenido_html, $$''una entidad legal separada responsable de sus propias acciones.''$$, $$"una entidad legal separada responsable de sus propias acciones."$$), $$ — que es exactamente lo que exploramos en el Bloque 8.$$, $$.$$) where slug = 'las-preguntas-que-no-tienen-respuesta-simple';

-- Nodo: rag-la-solucion-a-las-alucinaciones
-- Fix: referencia a Bloque 9 inexistente
update nodos set contenido_html = replace(contenido_html, $$Es exactamente la arquitectura que veremos en el Bloque 9 de automatizaciones.$$, $$Es exactamente la arquitectura que usan muchos asistentes de IA modernos.$$) where slug = 'rag-la-solucion-a-las-alucinaciones';

-- Nodo: oauth (titulo tiene comillas en el seed pero verificar en DB)
-- El titulo en el seed es: OAuth — cómo funciona el ''Iniciar sesión con Google''
-- Si en la DB el titulo tiene comillas simples, fix:
update nodos set titulo = replace(titulo, $$'Iniciar sesión con Google'$$, $$"Iniciar sesión con Google"$$) where slug = 'oauth-iniciar-sesion-con-google' and titulo like '%''%';

-- Nodo: context-window (titulo tiene comillas)
update nodos set titulo = replace(titulo, $$'ve'$$, $$"ve"$$) where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve' and titulo like '%''%';

-- Nodo: el-flujo-completo (resumen_corto tiene comillas)
update nodos set resumen_corto = replace(resumen_corto, $$''play''$$, $$"play"$$) where slug = 'el-flujo-completo-todo-junto' and resumen_corto like '%''%';

-- Nodo: el-malentendido (resumen_corto tiene comillas)
update nodos set resumen_corto = replace(resumen_corto, $$''inteligencia artificial''$$, $$"inteligencia artificial"$$) where slug = 'el-malentendido-mas-grande-sobre-la-ia' and resumen_corto like '%''%';
