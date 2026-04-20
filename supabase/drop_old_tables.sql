-- =============================================================
-- DROP TABLAS VIEJAS — Biblioteca de Sistemas
-- Elimina el esquema anterior antes de crear el nuevo
-- Ejecutar en Supabase SQL Editor ANTES de schema.sql
-- =============================================================

DROP TABLE IF EXISTS relaciones_de_nodos CASCADE;
DROP TABLE IF EXISTS recursos_de_nodo CASCADE;
DROP TABLE IF EXISTS secciones_de_nodo CASCADE;
DROP TABLE IF EXISTS recursos CASCADE;
DROP TABLE IF EXISTS respuestas_de_sesion CASCADE;
DROP TABLE IF EXISTS progreso_nodo_sesion CASCADE;
DROP TABLE IF EXISTS sesiones CASCADE;
DROP TABLE IF EXISTS opciones_de_pregunta_de_entrada CASCADE;
DROP TABLE IF EXISTS preguntas_de_entrada CASCADE;
DROP TABLE IF EXISTS glosario_terminos CASCADE;
DROP TABLE IF EXISTS nodo_glosario_terminos CASCADE;
DROP TABLE IF EXISTS nodos_ruta_aprendizaje CASCADE;
DROP TABLE IF EXISTS rutas_de_aprendizaje CASCADE;
DROP TABLE IF EXISTS modulos CASCADE;
DROP TABLE IF EXISTS nodos CASCADE;
DROP TABLE IF EXISTS aportes CASCADE;
DROP TABLE IF EXISTS votos CASCADE;
