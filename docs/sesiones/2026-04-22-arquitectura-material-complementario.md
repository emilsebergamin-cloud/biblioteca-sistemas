# 22 abril 2026 — Arquitectura de material complementario + investigación de aportes

## Contexto

Sesión de decisiones de producto (no de código). Al testear en mobile se identificaron problemas de responsive que requieren sesión dedicada. Además surgieron tres inquietudes sobre la arquitectura de información del bloque:

1. El índice lateral no incluye videos ni quiz.
2. Los videos y el quiz viven en el mismo scroll del contenido editorial, lo que se siente pesado.
3. La sección de aportes desapareció en algún momento del desarrollo.

## Investigación: estado de los aportes

Claude Code investigó y reportó:
- **Tabla `aportes` en Supabase:** existe, 0 registros.
- **API route `/api/aportes/route.js`:** existe, funcional (GET + POST con rate limiting y sanitización).
- **Funciones `getApprovedAportes()` y `createAporte()`:** existen en `src/lib/db.js`.
- **RLS policies:** `aportes_select_publico` y `aportes_insert_publico` activas.
- **UI de aportes:** existió en `src/app/biblioteca/nodo/[slug]/page.js` (página individual de nodo). Se eliminó en el commit `d44a2cc` cuando se reescribió la vista de bloque para mostrar todos los nodos en una sola página. La nueva vista nunca incluyó aportes.
- **Recuperación:** el código fuente se puede recuperar con `git show 8b50286:"src/app/biblioteca/nodo/[slug]/page.js"`.

Conclusión: no se perdieron datos. La infraestructura está intacta. Solo falta volver a incluir la UI.

## Decisiones de producto tomadas

### Arquitectura del bloque

Se definió una separación editorial clara:
- `/biblioteca/[bloque]` → **contenido editorial puro** (nodos de texto). Lectura lineal.
- `/biblioteca/[bloque]/material` → **material complementario**. Todo lo que gira alrededor del contenido pero no es el texto.

### Contenido de /material

En orden de consumo:

1. **Videos** — refuerzo pasivo.
2. **Quiz** — autoevaluación.
3. **Aportes** — reflexión activa de la comunidad.

Todo en el mismo scroll (sin tabs ni subpáginas), con anclas para navegación desde el índice.

### Granularidad de aportes

Aportes libres con campo opcional "sobre qué tema" (texto libre, no selector). No requiere cambios de schema de DB.

### Índice lateral

Se agrega una segunda sección "Material complementario" con tres links: Videos, Quiz, Aportes — apuntando a `/material#videos`, `/material#quiz`, `/material#aportes`.

## Plan de implementación (3 commits separados)

**Commit A:** crear `/material` duplicando videos + quiz del `page.js` actual + recuperar aportes del commit `8b50286`. No eliminar nada todavía.

**Commit B:** agregar los 3 links al índice lateral.

**Commit C:** eliminar videos y quiz del `page.js` original. Dejar solo los nodos editoriales.

Cada paso es reversible y deja todo funcionando.

## Por qué no se implementó hoy

Se priorizó la decisión de producto sobre la implementación. Implementar sin este nivel de claridad habría llevado a otro debugging confuso. La implementación queda para una sesión dedicada con Claude Code y cabeza fresca.

## Pendientes que van a la sesión siguiente

Ordenados por prioridad:

1. Implementar `/material` (commits A, B, C arriba).
2. Debug responsive mobile crítico (aire vertical, overflow horizontal, texto cortado).
3. Tablas responsive en mobile.
4. Refactor del archivo monolítico de 507 líneas.
5. Responsive intermedio (tablets/iPad).

## Aprendizajes de proceso

- Cuando algo "desaparece", antes de reconstruir: investigar si realmente se borró o solo se dejó de mostrar. Ahorra horas de trabajo duplicado.
- Decisiones de arquitectura de información antes que fixes técnicos: si cambia la navegación, los fixes de responsive pueden necesitar rehacerse.
- Separar sesiones por tipo de trabajo (producto vs implementación vs debug) mejora la concentración y la calidad del output.
