# Prompt Multi-Agente BiblAI

Leé el CLAUDE.md completo antes de empezar.
Tenés que ejecutar cuatro tareas usando subagentes en paralelo.
No me preguntes nada, ejecutá y reportá al final.

## AGENTE 1 — Contenido DB
Leer content/biblioteca_bloques_123.pdf y
content/biblioteca_bloques_456.pdf.
Generar supabase/nodos_seed.sql con INSERT de todos los
nodos de los 6 bloques con estas reglas:
- bloque_id: SELECT id FROM bloques WHERE slug='bloque-X'
- slug: nombre-del-nodo en minúsculas sin tildes
- titulo: título de la sección tal como aparece en el PDF
- resumen_corto: primera oración, máximo 120 caracteres
- contenido_html: contenido completo en HTML con etiquetas:
  "Pensalo así" → <div class="tag pensalo-asi">
  "En criollo" → <div class="tag en-criollo">
  "Dato de color" → <div class="tag dato-color">
  "La vuelta de tuerca técnica" → <div class="tag vuelta-tecnica">
  "Spoiler técnico" → <div class="tag spoiler-tecnico">
  "El resumen para contarle a alguien en el subte" → <div class="tag resumen-subte">
  "Esto cambia cómo decidís" → <div class="tag esto-cambia">
  "En Argentina y Latinoamérica" → <div class="tag latam">
  "Bonus track" → <div class="tag bonus-track">
- tags[]: array con etiquetas del nodo
- tipo: concepto | caso_real | herramienta | historia
- dificultad: basico | intermedio | avanzado
- orden_en_bloque: número de orden
- estado: publicado
No ejecutar en Supabase, solo generar el archivo SQL.

## AGENTE 2 — API routes
Actualizar src/app/api/aportes/route.js:
- GET: aportes con estado=aprobado filtrados por nodo_id
- POST: insertar con campos nodo_id, contenido, autor_nombre
Actualizar src/app/api/votos/route.js:
- POST: insertar con nodo_id, tipo, session_id
  manejando duplicados por UNIQUE constraint
Actualizar src/lib/db.js con funciones del nuevo esquema.

## AGENTE 3 — Página de nodo individual
Crear src/app/biblioteca/[slug]/page.js con:
- Fetch a Supabase por slug del nodo
- Mostrar: título, resumen_corto, contenido_html, tags
- Sección de recursos (videos/links)
- Sección de aportes aprobados
- Formulario de aporte (nombre opcional + texto max 500)
- Botones voto útil/no útil con session_id en localStorage
- Diseño: fondo #1A1A1A, texto #F7F4EF,
  acento #C5E832, lavanda #A8B4D8
- Link para volver a /biblioteca

## AGENTE 4 — Revisión editorial y técnica
Leer ambos PDFs completos y verificar:
- Precisión técnica de datos, cifras y afirmaciones
- Consistencia de tono entre bloques
- Etiquetas bien aplicadas y en contexto
- Flujo lógico de conceptos en cada bloque
- Datos desactualizados o afirmaciones imprecisas
Generar content/revision_editorial.md con reporte por bloque:
- Lo que está bien
- Lo que necesita corrección con sugerencia específica
- Nivel de confianza en cada dato (alto/medio/bajo)

## Reporte final
Al terminar cada agente reportá qué hizo y si hubo errores.
