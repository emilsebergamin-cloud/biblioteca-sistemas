-- =============================================================
-- FIX EDITORIAL v2 — Bloques 2-6
-- Comillas simples ' → dobles " + factuales + refs bloques
-- En la DB las comillas son ' (simples), no '' (dobles)
-- =============================================================

-- ----- BLOQUE 2 -----

-- bases-de-datos-relacionales: comillas + fix Oracle/Stanford
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'A Relational Model of Data for Large Shared Data Banks'$q$, $q$"A Relational Model of Data for Large Shared Data Banks"$q$), $q$'la empresa que ignoró su propia innovación'$q$, $q$"la empresa que ignoró su propia innovación"$q$), $q$dos estudiantes de Stanford leyeron el paper, lo implementaron, y fundaron Oracle$q$, $q$Larry Ellison leyó el paper, lo tomó como punto de partida, y junto a Bob Miner y Ed Oates fundó Oracle$q$) where slug = 'bases-de-datos-relacionales';

-- el-schema: comillas
update nodos set contenido_html = replace(contenido_html, $q$'agregar el campo de fecha de nacimiento al perfil de usuario'$q$, $q$"agregar el campo de fecha de nacimiento al perfil de usuario"$q$) where slug = 'el-schema-la-estructura-que-define-todo';

-- transacciones-acid: comillas
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'rota'$q$, $q$"rota"$q$), $q$'ven'$q$, $q$"ven"$q$), $q$'ACID compliant'$q$, $q$"ACID compliant"$q$) where slug = 'transacciones-y-propiedades-acid';

-- ----- BLOQUE 3 -----

-- evolucion-protocolo-http
update nodos set contenido_html = replace(contenido_html, $q$'head-of-line blocking'$q$, $q$"head-of-line blocking"$q$) where slug = 'la-evolucion-del-protocolo-http';

-- https-criptografia
update nodos set contenido_html = replace(contenido_html, $q$'este sitio es seguro.'$q$, $q$"este sitio es seguro."$q$) where slug = 'https-y-criptografia-de-clave-publica';

-- oauth
update nodos set contenido_html = replace(contenido_html, $q$'Iniciar sesión con Google'$q$, $q$"Iniciar sesión con Google"$q$) where slug = 'oauth-iniciar-sesion-con-google';

-- dns
update nodos set contenido_html = replace(contenido_html, $q$'guía telefónica'$q$, $q$"guía telefónica"$q$) where slug = 'dns-y-que-pasa-cuando-falla';

-- flujo-completo
update nodos set contenido_html = replace(contenido_html, $q$'play'$q$, $q$"play"$q$) where slug = 'el-flujo-completo-todo-junto';

-- ----- BLOQUE 4 -----

-- contrasenas
update nodos set contenido_html = replace(replace(replace(replace(contenido_html, $q$'123456'$q$, $q$"123456"$q$), $q$'password'$q$, $q$"password"$q$), $q$'123456789'$q$, $q$"123456789"$q$), $q$'admin'$q$, $q$"admin"$q$) where slug = 'las-contrasenas';

-- decisiones-concretas
update nodos set contenido_html = replace(contenido_html, $q$'ahora mismo'$q$, $q$"ahora mismo"$q$) where slug = 'las-decisiones-concretas';

-- phishing
update nodos set contenido_html = replace(contenido_html, $q$'Tu cuenta será suspendida en 24 horas'$q$, $q$"Tu cuenta será suspendida en 24 horas"$q$) where slug = 'phishing';

-- ingenieria-social
update nodos set contenido_html = replace(replace(contenido_html, $q$'Tu paquete tiene un problema, hacé click acá.'$q$, $q$"Tu paquete tiene un problema, hacé click acá."$q$), $q$'Soy del área de IT, necesito tu contraseña para actualizar el sistema.'$q$, $q$"Soy del área de IT, necesito tu contraseña para actualizar el sistema."$q$) where slug = 'ingenieria-social';

-- malware-ransomware
update nodos set contenido_html = replace(contenido_html, $q$'Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo.'$q$, $q$"Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo."$q$) where slug = 'malware-y-ransomware';

-- cifrado-e2e
update nodos set contenido_html = replace(contenido_html, $q$'chats secretos'$q$, $q$"chats secretos"$q$) where slug = 'cifrado-de-extremo-a-extremo-vs-https';

-- ----- BLOQUE 5 -----

-- todo-producto-hipotesis: comillas en tabla
update nodos set contenido_html = replace(replace(replace(replace(replace(contenido_html, $q$'Nuestros usuarios tienen este problema'$q$, $q$"Nuestros usuarios tienen este problema"$q$), $q$'Esta solución lo resuelve'$q$, $q$"Esta solución lo resuelve"$q$), $q$'Estarán dispuestos a pagar X'$q$, $q$"Estarán dispuestos a pagar X"$q$), $q$'Este canal de adquisición va a funcionar'$q$, $q$"Este canal de adquisición va a funcionar"$q$), $q$'no market need'$q$, $q$"no market need"$q$) where slug = 'todo-producto-es-una-hipotesis';

-- los-roles: comillas
update nodos set contenido_html = replace(replace(contenido_html, $q$'por qué'$q$, $q$"por qué"$q$), $q$'qué'$q$, $q$"qué"$q$) where slug = 'los-roles-quien-hace-que';

-- del-codigo-a-los-usuarios: comillas
update nodos set contenido_html = replace(contenido_html, $q$'subir un cambio'$q$, $q$"subir un cambio"$q$) where slug = 'del-codigo-a-los-usuarios-ambientes-deploy-cicd';

-- deuda-tecnica: comillas
update nodos set contenido_html = replace(replace(contenido_html, $q$'refactorizar'$q$, $q$"refactorizar"$q$), $q$'funciona'$q$, $q$"funciona"$q$) where slug = 'deuda-tecnica';

-- product-market-fit: comillas
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'el único momento que importa en la vida de una startup.'$q$, $q$"el único momento que importa en la vida de una startup."$q$), $q$'¿Qué tan decepcionado/a estarías si este producto desapareciera mañana?'$q$, $q$"¿Qué tan decepcionado/a estarías si este producto desapareciera mañana?"$q$), $q$'muy decepcionado'$q$, $q$"muy decepcionado"$q$) where slug = 'product-market-fit';

-- ----- BLOQUE 6 -----

-- malentendido-ia: comillas
update nodos set contenido_html = replace(contenido_html, $q$'inteligencia artificial'$q$, $q$"inteligencia artificial"$q$) where slug = 'el-malentendido-mas-grande-sobre-la-ia';

-- como-funciona-llm: comillas
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'Large'$q$, $q$"Large"$q$), $q$'personalidad'$q$, $q$"personalidad"$q$), $q$'sentido común'$q$, $q$"sentido común"$q$) where slug = 'como-funciona-un-llm';

-- context-window: comillas
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'ve'$q$, $q$"ve"$q$), $q$'olvida'$q$, $q$"olvida"$q$), $q$'campo visual'$q$, $q$"campo visual"$q$) where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve';

-- arquitectura-transformer: comillas
update nodos set contenido_html = replace(contenido_html, $q$'Attention Is All You Need'$q$, $q$"Attention Is All You Need"$q$) where slug = 'la-arquitectura-transformer';

-- alucinaciones: comillas
update nodos set contenido_html = replace(contenido_html, $q$'mienta'$q$, $q$"mienta"$q$) where slug = 'alucinaciones';

-- agi: comillas
update nodos set contenido_html = replace(replace(contenido_html, $q$'alcanzó la AGI'$q$, $q$"alcanzó la AGI"$q$), $q$'muy cerca'$q$, $q$"muy cerca"$q$) where slug = 'agi-que-es-y-por-que-el-debate-importa';

-- preguntas-sin-respuesta: comillas + ref Bloque 8
update nodos set contenido_html = replace(replace(contenido_html, $q$'una entidad legal separada responsable de sus propias acciones.'$q$, $q$"una entidad legal separada responsable de sus propias acciones."$q$), $q$ — que es exactamente lo que exploramos en el Bloque 8.$q$, $q$.$q$) where slug = 'las-preguntas-que-no-tienen-respuesta-simple';

-- rag: ref Bloque 9
update nodos set contenido_html = replace(contenido_html, $q$Es exactamente la arquitectura que veremos en el Bloque 9 de automatizaciones.$q$, $q$Es exactamente la arquitectura que usan muchos asistentes de IA modernos.$q$) where slug = 'rag-la-solucion-a-las-alucinaciones';

-- ----- TITULOS Y RESUMEN_CORTO -----

-- oauth titulo
update nodos set titulo = replace(titulo, $q$'Iniciar sesión con Google'$q$, $q$"Iniciar sesión con Google"$q$) where slug = 'oauth-iniciar-sesion-con-google';

-- context-window titulo
update nodos set titulo = replace(titulo, $q$'ve'$q$, $q$"ve"$q$) where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve';

-- flujo-completo resumen_corto
update nodos set resumen_corto = replace(resumen_corto, $q$'play'$q$, $q$"play"$q$) where slug = 'el-flujo-completo-todo-junto';

-- malentendido resumen_corto
update nodos set resumen_corto = replace(resumen_corto, $q$'inteligencia artificial'$q$, $q$"inteligencia artificial"$q$) where slug = 'el-malentendido-mas-grande-sobre-la-ia';

-- context-window resumen_corto
update nodos set resumen_corto = replace(resumen_corto, $q$'ver'$q$, $q$"ver"$q$) where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve';
