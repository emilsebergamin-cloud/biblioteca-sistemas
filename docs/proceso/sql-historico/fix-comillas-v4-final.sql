-- FIX COMILLAS v4 — frases faltantes

-- agi: 2 nuevas
update nodos set contenido_html = replace(replace(contenido_html, $q$'este modelo hace esto muy bien'$q$, $q$"este modelo hace esto muy bien"$q$), $q$'este modelo puede hacer cualquier cosa que un humano puede hacer'$q$, $q$"este modelo puede hacer cualquier cosa que un humano puede hacer"$q$) where slug = 'agi-que-es-y-por-que-el-debate-importa';

-- como-funciona-un-llm: 1 nueva
update nodos set contenido_html = replace(contenido_html, $q$'El mejor restaurante de Buenos Aires es...'$q$, $q$"El mejor restaurante de Buenos Aires es..."$q$) where slug = 'como-funciona-un-llm';

-- ia-en-latinoamerica: 1 nueva
update nodos set contenido_html = replace(contenido_html, $q$'Giuseppe'$q$, $q$"Giuseppe"$q$) where slug = 'ia-en-latinoamerica';

-- la-arquitectura-transformer: 5 nuevas
update nodos set contenido_html = replace(replace(replace(replace(contenido_html, $q$'ella'$q$, $q$"ella"$q$), $q$'La doctora entró a la sala y ella revisó los resultados'$q$, $q$"La doctora entró a la sala y ella revisó los resultados"$q$), $q$'la doctora'$q$, $q$"la doctora"$q$), $q$'olvidaban'$q$, $q$"olvidaban"$q$) where slug = 'la-arquitectura-transformer';

-- phishing: 1 nueva (me llegó un código — también estaba en este nodo)
update nodos set contenido_html = replace(contenido_html, $q$'me llegó un código de verificación por error al tuyo, me lo mandás?'$q$, $q$"me llegó un código de verificación por error al tuyo, me lo mandás?"$q$) where slug = 'phishing';
