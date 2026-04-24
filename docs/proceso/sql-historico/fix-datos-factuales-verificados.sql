-- =============================================================
-- FIX DATOS FACTUALES VERIFICADOS — 23 abril 2026
-- 6 correcciones basadas en verificación manual de Emi
-- Ejecutar en Supabase SQL Editor
-- =============================================================

-- 1. npm: 3 millones → 3,1 millones (Bloque 1)
update nodos set contenido_html = replace(contenido_html, E'más de 3 millones de paquetes disponibles', E'más de 3,1 millones de paquetes disponibles') where slug = 'npm-y-package-json';

-- 2. MercadoLibre: 15.000 ingenieros → 6.000 sólo en Argentina (Bloque 1)
update nodos set contenido_html = replace(contenido_html, E'Su equipo de más de 15.000 ingenieros maneja más de 30.000 microservicios.', E'Su equipo de más de 6.000 ingenieros sólo en Argentina maneja miles de microservicios.') where slug = 'react-como-se-construyen-las-apps-modernas';

-- 3. Oracle: 300 mil millones → 470 mil millones (Bloque 2)
update nodos set contenido_html = replace(contenido_html, E'Hoy Oracle vale 300 mil millones de dólares.', E'Hoy Oracle vale más de 470 mil millones de dólares.') where slug = 'bases-de-datos-relacionales';

-- 4. ITRC brechas: 3.000 → 3.158 (Bloque 4)
update nodos set contenido_html = replace(contenido_html, E'más de 3.000 brechas de datos en 2024', E'más de 3.158 brechas de datos en 2024') where slug = 'por-que-este-bloque-existe';

-- 5. CB Insights: 35% → 42% (Bloque 5)
update nodos set contenido_html = replace(contenido_html, E'El 35% de las startups que fracasan', E'El 42% de las startups que fracasan') where slug = 'todo-producto-es-una-hipotesis';

-- 6. Context windows: reforzar nota existente (Bloque 6)
update nodos set contenido_html = replace(contenido_html, E'Nota: estos tamaños son correctos a la fecha de escritura (2026) pero evolucionan con cada nueva versión de cada modelo. Lo importante es el concepto, no los números exactos.', E'Nota: estos valores son referencias — los modelos evolucionan constantemente y estos números suben con cada nueva versión. Lo importante es entender el concepto, no memorizar las cifras exactas.') where slug = 'context-window-el-limite-de-lo-que-el-modelo-ve';
