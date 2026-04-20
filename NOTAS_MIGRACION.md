# Notas de migración — esquema viejo → esquema nuevo

## Inconsistencias detectadas

### 1. Tablas renombradas

| Antes (esquema viejo) | Ahora (esquema nuevo) |
|-----------------------|-----------------------|
| `modules` | `bloques` |
| `nodes` | `nodos` |

### 2. API routes usan el esquema viejo

- `src/lib/db.js` hace queries a la tabla `aportes` con campos del esquema anterior:
  - Usa `status` → el nuevo esquema usa `estado`
  - Usa `fecha` para ordenar → el nuevo esquema usa `created_at`
  - Usa `nombre` y `texto` → el nuevo esquema usa `autor_nombre` y `contenido`
- `src/app/api/aportes/route.js` envía `{ nombre, texto, tipo, status }` → debe cambiar a `{ autor_nombre, contenido, nodo_id }`

### 3. Tabla votos

- `src/lib/db.js` función `addVote()` usa `aporte_id` → el nuevo esquema vincula votos a `nodo_id`, no a aportes
- Campo `ip_hash` → reemplazado por `session_id`

### 4. Tablas eliminadas del MVP

Las siguientes tablas del esquema viejo NO existen en el nuevo:
- `node_sections` (contenido ahora vive en `nodos.contenido_html`)
- `node_relations`
- `learning_paths` / `learning_path_nodes`
- `sessions` / `session_node_progress`
- `entry_questions` / `entry_question_options` / `session_answers`
- `glossary_terms` / `node_glossary_terms`
- `resources` / `node_resources`

### 5. Archivos de migraciones viejas

La carpeta `supabase/migrations/` contiene migraciones del esquema anterior. Pueden eliminarse una vez que se confirme que el nuevo esquema funciona.

## Acciones pendientes

- [ ] Actualizar `src/lib/db.js` para usar los nuevos nombres de tablas y campos
- [ ] Actualizar `src/app/api/aportes/route.js` con los campos correctos
- [ ] Actualizar `src/app/api/votos/route.js` con `nodo_id` y `session_id`
- [ ] Ejecutar `schema.sql` en Supabase (SQL Editor)
- [ ] Ejecutar `seed.sql` para cargar los 6 bloques
- [ ] Ejecutar `rls.sql` para activar las políticas de seguridad
- [ ] Decidir si se eliminan las migraciones viejas en `supabase/migrations/`
