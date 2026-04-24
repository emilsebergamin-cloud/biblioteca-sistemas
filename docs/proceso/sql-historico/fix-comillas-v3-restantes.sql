-- =============================================================
-- FIX COMILLAS v3 — Las 22 restantes
-- Patterns con $q$ para comillas simples en la DB
-- =============================================================

-- apis-api-keys-vs-tokens (2)
update nodos set contenido_html = replace(replace(contenido_html, $q$'se venció el token'$q$, $q$"se venció el token"$q$), $q$'la API key no tiene permisos suficientes'$q$, $q$"la API key no tiene permisos suficientes"$q$) where slug = 'apis-api-keys-vs-tokens';

-- codigos-de-estado-http (1)
update nodos set contenido_html = replace(contenido_html, $q$'el endpoint está devolviendo un 401'$q$, $q$"el endpoint está devolviendo un 401"$q$) where slug = 'codigos-de-estado-http';

-- del-problema-al-producto (1)
update nodos set contenido_html = replace(contenido_html, $q$'para el Q3'$q$, $q$"para el Q3"$q$) where slug = 'del-problema-al-producto-backlog-priorizacion-roadmap';

-- discovery (2)
update nodos set contenido_html = replace(replace(contenido_html, $q$'¿usarías esto?'$q$, $q$"¿usarías esto?"$q$), $q$'sí'$q$, $q$"sí"$q$) where slug = 'discovery-antes-de-construir';

-- dns (2) — 'guía telefónica' ya se aplicó antes, verificar 'funciona'
update nodos set contenido_html = replace(replace(contenido_html, $q$'guía telefónica'$q$, $q$"guía telefónica"$q$), $q$'funciona'$q$, $q$"funciona"$q$) where slug = 'dns-y-que-pasa-cuando-falla';

-- argentina-cuento-del-tio (1)
update nodos set contenido_html = replace(contenido_html, $q$'me llegó un código de verificación por error al tuyo, me lo mandás?'$q$, $q$"me llegó un código de verificación por error al tuyo, me lo mandás?"$q$) where slug = 'en-argentina-y-latinoamerica-el-cuento-del-tio-digital';

-- la-idea-no-es-el-producto (1)
update nodos set contenido_html = replace(contenido_html, $q$'contrataban'$q$, $q$"contrataban"$q$) where slug = 'la-idea-no-es-el-producto';

-- preguntas-sin-respuesta (2) — 'entidad legal' retry + nueva
update nodos set contenido_html = replace(replace(contenido_html, $q$'una entidad legal separada responsable de sus propias acciones.'$q$, $q$"una entidad legal separada responsable de sus propias acciones."$q$), $q$'¿la IA va a reemplazar mi trabajo?'$q$, $q$"¿la IA va a reemplazar mi trabajo?"$q$) where slug = 'las-preguntas-que-no-tienen-respuesta-simple';

-- los-roles (3) — 'por qué' y 'qué' retry + nueva
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'por qué'$q$, $q$"por qué"$q$), $q$'qué'$q$, $q$"qué"$q$), $q$'¿quién manda en un equipo de producto?'$q$, $q$"¿quién manda en un equipo de producto?"$q$) where slug = 'los-roles-quien-hace-que';

-- metricas (2)
update nodos set contenido_html = replace(replace(contenido_html, $q$'aha'$q$, $q$"aha"$q$), $q$'usuarios que agregan 7 amigos en los primeros 10 días'$q$, $q$"usuarios que agregan 7 amigos en los primeros 10 días"$q$) where slug = 'metricas-como-sabes-si-el-producto-funciona';

-- owasp (1)
update nodos set contenido_html = replace(contenido_html, $q$'revisamos el OWASP antes del lanzamiento'$q$, $q$"revisamos el OWASP antes del lanzamiento"$q$) where slug = 'owasp';

-- phishing (5) — retries + nuevas
update nodos set contenido_html = replace(replace(replace(replace(replace(contenido_html, $q$'Tu cuenta será suspendida en 24 horas'$q$, $q$"Tu cuenta será suspendida en 24 horas"$q$), $q$'Estimado cliente'$q$, $q$"Estimado cliente"$q$), $q$'Tu paquete tiene un problema, hacé click acá.'$q$, $q$"Tu paquete tiene un problema, hacé click acá."$q$), $q$'Soy del área de IT, necesito tu contraseña para actualizar el sistema.'$q$, $q$"Soy del área de IT, necesito tu contraseña para actualizar el sistema."$q$), $q$'Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo.'$q$, $q$"Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo."$q$) where slug = 'phishing';

-- postgresql-supabase (1)
update nodos set contenido_html = replace(contenido_html, $q$'vamos a usar Supabase'$q$, $q$"vamos a usar Supabase"$q$) where slug = 'postgresql-supabase-y-firebase';

-- superficie-de-ataque (1)
update nodos set contenido_html = replace(contenido_html, $q$'¿funciona?'$q$, $q$"¿funciona?"$q$) where slug = 'superficie-de-ataque';

-- tokens-llm (2)
update nodos set contenido_html = replace(replace(contenido_html, $q$'hola'$q$, $q$"hola"$q$), $q$'inteligencia'$q$, $q$"inteligencia"$q$) where slug = 'tokens-la-unidad-basica-del-lenguaje-para-un-llm';

-- websockets (1)
update nodos set contenido_html = replace(contenido_html, $q$'esa feature de notificaciones en tiempo real requiere WebSockets'$q$, $q$"esa feature de notificaciones en tiempo real requiere WebSockets"$q$) where slug = 'websockets-cuando-http-no-alcanza';

-- agi, como-funciona-un-llm, context-window, la-arquitectura-transformer
-- Estos aparecen en la lista pero los fixes del v2 deberían haberlos cubierto.
-- Si siguen con comillas, es por frases que no identifiqué. Retry:

-- agi: 'alcanzó la AGI', 'muy cerca' (retry)
update nodos set contenido_html = replace(replace(contenido_html, $q$'alcanzó la AGI'$q$, $q$"alcanzó la AGI"$q$), $q$'muy cerca'$q$, $q$"muy cerca"$q$) where slug = 'agi-que-es-y-por-que-el-debate-importa';

-- como-funciona-llm: 'Large', 'personalidad', 'sentido común' (retry)
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'Large'$q$, $q$"Large"$q$), $q$'personalidad'$q$, $q$"personalidad"$q$), $q$'sentido común'$q$, $q$"sentido común"$q$) where slug = 'como-funciona-un-llm';

-- context-window: 've', 'olvida', 'campo visual' (retry)
update nodos set contenido_html = replace(replace(replace(contenido_html, $q$'ve'$q$, $q$"ve"$q$), $q$'olvida'$q$, $q$"olvida"$q$), $q$'campo visual'$q$, $q$"campo visual"$q$) where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve';

-- arquitectura-transformer: 'Attention Is All You Need' (retry)
update nodos set contenido_html = replace(contenido_html, $q$'Attention Is All You Need'$q$, $q$"Attention Is All You Need"$q$) where slug = 'la-arquitectura-transformer';
