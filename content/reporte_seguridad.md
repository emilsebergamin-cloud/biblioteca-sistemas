# Reporte de Seguridad - Biblioteca de Sistemas

Fecha: 2026-04-20

---

## 1. Hallazgos

### 1.1 Sin rate limiting en /api/aportes (CORREGIDO)
El endpoint POST /api/aportes no tenia ningun control de tasa. Un actor malicioso podia enviar aportes ilimitados, saturando la base de datos.

### 1.2 Sin sanitizacion de entrada (CORREGIDO)
Los campos `contenido` y `autor_nombre` se guardaban tal cual en la base de datos, sin escapar HTML. Esto abria la puerta a ataques XSS si el contenido se renderiza sin escapar en algun punto.

### 1.3 Sin headers de seguridad (CORREGIDO)
`next.config.mjs` no definia headers de seguridad HTTP. Esto dejaba la aplicacion vulnerable a clickjacking (iframes) y otros vectores.

### 1.4 Claves API hardcodeadas (NO ENCONTRADO)
Se buscaron patrones `eyJ...` y `https://...supabase.co` en todos los archivos .js dentro de `src/`. No se encontraron claves hardcodeadas. Las claves se leen correctamente de variables de entorno.

### 1.5 Uso de NEXT_PUBLIC_ en contextos inadecuados (HALLAZGO)
- `src/lib/supabase.js`: usa `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY` para crear el cliente Supabase. Este cliente se usa en rutas API del servidor (a traves de `src/lib/db.js`). Para el servidor, seria mas seguro usar una clave `SUPABASE_SERVICE_ROLE_KEY` separada.
- `src/app/biblioteca/[slug]/page.js`: usa las variables NEXT_PUBLIC_ directamente en un componente `'use client'`. Esto es correcto y apropiado - la anon key esta disenada para uso publico, protegida por RLS.

---

## 2. Correcciones aplicadas

### 2.1 Rate limiting en /api/aportes
- Archivo: `src/app/api/aportes/route.js`
- Map en memoria que registra timestamps por combinacion `session_id:nodo_id`.
- Limite: maximo 3 aportes por session_id por nodo por hora.
- Si se excede, retorna HTTP 429.
- Se actualizo el cliente para enviar `session_id` en el POST de aportes.

### 2.2 Sanitizacion de entrada
- Archivo: `src/app/api/aportes/route.js`
- Funcion `escapeHtml()` reemplaza `< > & " '` por entidades HTML.
- Se aplica a `contenido` y `autor_nombre` antes de guardar en la base de datos.

### 2.3 Headers de seguridad
- Archivo: `next.config.mjs`
- Headers para todas las rutas:
  - `X-Frame-Options: DENY`
  - `X-Content-Type-Options: nosniff`
  - `Referrer-Policy: strict-origin-when-cross-origin`
  - `Permissions-Policy: camera=(), microphone=()`

---

## 3. Recomendaciones pendientes

### 3.1 Separar claves de Supabase por contexto
Crear un cliente Supabase separado para el servidor que use `SUPABASE_SERVICE_ROLE_KEY` (sin prefijo NEXT_PUBLIC_). Usar en `src/lib/db.js` para operaciones del servidor.

### 3.2 Rate limiting persistente
El rate limiting actual es en memoria y se pierde al reiniciar el servidor. Para produccion considerar Upstash Redis o rate limiting a nivel PostgreSQL.

### 3.3 Content Security Policy (CSP)
Agregar header `Content-Security-Policy` para controlar scripts y recursos.

### 3.4 Validacion de longitud en el servidor
Agregar validacion server-side de longitud maxima para `contenido` (500) y `autor_nombre` (100).

### 3.5 dangerouslySetInnerHTML
En `src/app/biblioteca/[slug]/page.js` se usa `dangerouslySetInnerHTML` para `nodo.contenido_html`. Si en el futuro se permite contenido generado por usuarios, debe sanitizarse con DOMPurify.
