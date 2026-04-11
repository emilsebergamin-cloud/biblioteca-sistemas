# SRS — Biblioteca de IA y Sistemas (MVP)

**Versión:** 1.0
**Fecha:** 11 de abril de 2026
**Estado:** Borrador
**Responsable:** Emilse Bergamin
**Basado en:** IEEE 830 (adaptado)

> Documento vivo. Sintetiza el estado actual del MVP y se actualiza a medida que evoluciona el producto y la arquitectura.

---

## 1. Introducción

### 1.1 Propósito

Este documento especifica los requisitos del software para el MVP de Biblioteca de IA y Sistemas, una plataforma educativa web orientada a personas no técnicas que quieren entender cómo funciona el mundo tech en lenguaje humano.

### 1.2 Alcance MVP

- Navegación guiada por módulos y nodos de aprendizaje.
- Lectura de contenido estructurado en secciones editoriales.
- Rutas de aprendizaje predefinidas.
- Sesiones anónimas sin login.
- Onboarding diferido (después de experimentar valor).
- Glosario de términos técnicos en lenguaje humano.
- Recursos asociados a cada nodo (videos, links, fuentes).

### 1.3 Fuera de alcance (MVP)

- Autenticación con login.
- Personalización por perfil de usuario.
- Asistente de IA conversacional.
- Sistema de quiz interactivo.
- Comunidad o foro de usuarios.
- Bloques 7 al 10 y Bloque 0 (Bienvenida).

### 1.4 Público objetivo

Personas no técnicas, hispanohablantes, que quieren entender cómo funciona la tecnología sin jerga innecesaria. No se asume conocimiento previo.

### 1.5 Definiciones

| Término | Definición |
|---------|-----------|
| Módulo (bloque) | Agrupación temática de alto nivel (ej: "Cómo piensan las computadoras") |
| Nodo | Unidad de aprendizaje individual dentro de un módulo |
| Sección | Capa editorial dentro de un nodo (intro, en_criollo, explicacion_central, profundizacion) |
| Ruta | Recorrido guiado que conecta nodos en secuencia |
| Sesión | Registro de actividad de un usuario anónimo |
| Slug | Identificador legible usado para referenciar entidades (ej: `que-es-una-computadora`) |

---

## 2. Descripción general del producto

### 2.1 Problema

Las personas no técnicas no tienen un recurso que explique de forma sistémica, progresiva y sin jerga cómo funciona el mundo tech. Los recursos existentes son fragmentados, técnicos o caóticos.

### 2.2 Solución

Un sistema de aprendizaje guiado que organiza el conocimiento en bloques temáticos con nodos de aprendizaje conectados, recorridos predefinidos y capas de profundización opcional.

### 2.3 Filosofía pedagógica

- El valor no está en la cantidad de contenido. Está en la comprensión real que genera.
- No es una enciclopedia. Es un recorrido con progresión.
- Guía primero, personalización después.
- Tono humano, no académico.

---

## 3. Requisitos funcionales

### RF-01: Navegación por módulos

El sistema debe mostrar los módulos disponibles en orden jerárquico. El usuario puede seleccionar un módulo para ver sus nodos.

### RF-02: Navegación por nodos

Dentro de un módulo, el sistema debe mostrar los nodos ordenados. Cada nodo muestra: título, resumen corto, tipo, dificultad y duración estimada.

### RF-03: Lectura de contenido

Al entrar a un nodo, el sistema debe mostrar sus secciones en orden. Las secciones marcadas como opcionales (`es_opcional = true`) deben poder expandirse o colapsarse.

### RF-04: Rutas de aprendizaje

El sistema debe ofrecer rutas predefinidas que conectan nodos en secuencia. El usuario puede seguir una ruta y avanzar al siguiente nodo.

### RF-05: Sesiones anónimas

El sistema debe crear una sesión anónima al primer acceso (sin login). La sesión se identifica por un token almacenado en el navegador.

### RF-06: Progreso por nodo

El sistema debe registrar el progreso del usuario por nodo dentro de su sesión. Estados posibles: `no_iniciado`, `en_progreso`, `completado`.

### RF-07: Onboarding diferido

El onboarding se presenta después de que el usuario experimentó contenido. Consiste en preguntas de entrada (nivel, objetivo, forma de aprender) con opciones predefinidas. Las respuestas se almacenan vinculadas a la sesión.

### RF-08: Recursos por nodo

Cada nodo puede tener recursos asociados (links, videos, PDFs, herramientas, lecturas). Los recursos se muestran ordenados y pueden ser opcionales.

### RF-09: Glosario

El sistema debe ofrecer un glosario de términos técnicos con definición corta y definición larga. Los términos se vinculan a nodos específicos.

### RF-10: Frases puente

Al completar un nodo o bloque, el sistema debe mostrar una frase puente que oriente al usuario hacia el siguiente paso.

---

## 4. Requisitos no funcionales

### RNF-01: Claridad visual

La interfaz debe ser limpia, con jerarquía tipográfica clara y sin ruido visual. Priorizar legibilidad sobre decoración.

### RNF-02: Tono lúdico adulto

El tono del contenido y la interfaz debe ser accesible y cercano, sin ser infantil. Profesional pero humano.

### RNF-03: Performance

Las páginas de contenido deben cargar en menos de 3 segundos en conexiones estándar. [pendiente definir métricas exactas]

### RNF-04: Mobile first

El diseño debe priorizar la experiencia en dispositivos móviles. Desktop es secundario pero funcional.

### RNF-05: Escalabilidad

La arquitectura debe soportar la incorporación de nuevos bloques, nodos, rutas y funcionalidades sin modificar tablas o componentes existentes.

### RNF-06: SEO

Las páginas de contenido deben ser indexables por motores de búsqueda con metadata correcta. [pendiente definir estrategia SEO completa]

---

## 5. Arquitectura del sistema

### 5.1 Entidades principales

| Entidad | Función |
|---------|---------|
| modules | Agrupación temática de alto nivel |
| nodes | Unidad de aprendizaje individual dentro de un módulo |
| node_sections | Secciones internas de un nodo (núcleo, profundización, ecosistema) |
| node_relations | Conexiones entre nodos (prerequisito, complemento, profundización) |
| learning_paths | Recorridos guiados que conectan nodos en secuencia |
| learning_path_nodes | Nodos asignados a una ruta con orden |
| sessions | Registro de actividad del usuario anónimo |
| session_node_progress | Progreso por nodo por sesión |
| session_answers | Respuestas de onboarding por sesión |
| entry_questions | Preguntas de onboarding |
| entry_question_options | Opciones por pregunta de onboarding |
| resources | Videos, links, fuentes asociadas a cada nodo |
| node_resources | Vinculación nodo-recurso |
| glossary_terms | Glosario de términos técnicos |
| node_glossary_terms | Vinculación nodo-término |
| aportes | Contribuciones de usuarios (existente) |
| votos | Votos sobre aportes (existente) |

### 5.2 Principios de arquitectura

- **Idempotencia:** Las operaciones pueden repetirse sin romper el estado del sistema.
- **Relaciones por slug:** Los nodos y módulos se referencian por identificadores legibles.
- **Estructura desacoplada:** Cada entidad puede evolucionar sin romper las demás.
- **Extensible sin romper:** Nuevos bloques, secciones o rutas se agregan sin modificar lo existente.

### 5.3 Stack tecnológico

| Capa | Tecnología |
|------|------------|
| Base de datos | Supabase (PostgreSQL) |
| Frontend | Next.js |
| Deploy | Vercel |
| IA conversacional | OpenAI API (fase futura) |
| Autenticación | No implementada en MVP inicial. Supabase Auth previsto para fases futuras. |

---

## 6. UX y experiencia

### 6.1 Flujo principal

```
Entrada → Ruta evolutiva → Nodo → Seguir / Profundizar → Onboarding posterior
```

### 6.2 Principios UX

- El usuario nunca se pierde. Siempre hay una señal de navegación.
- El contenido se revela en capas: núcleo primero, profundización opcional.
- No hay exploración caótica. El sistema guía.
- El onboarding no bloquea el acceso al contenido.

### 6.3 Tono

Humano, directo, sin jerga innecesaria. Cuando se usa un término técnico, se explica inmediatamente. Voz rioplatense natural.

---

## 7. Sistema editorial y contenido

### 7.1 Estructura interna de cada bloque

- Entrada directa — pregunta o afirmación que engancha
- Parte 1: Núcleo — contenido esencial
- Parte 2: Profundización — opcional
- Parte 3: Ecosistema real — casos latinoamericanos, herramientas actuales
- "Esto cambia cómo decidís" — aplicación práctica accionable
- Señal de navegación
- Frase puente hacia el siguiente bloque
- Fuentes verificadas
- Videos curados con nivel, duración e idioma
- Quiz [fase futura]

### 7.2 Etiquetas editoriales

| Etiqueta | Función |
|----------|---------|
| ▸ Pensalo así | Analogía central |
| ▸ En criollo | Reformulación directa |
| ▸ El resumen para contarle a alguien en el subte | Síntesis de una oración |
| ✦ Dato de color | Historia real, origen memorable |
| ⚙ La vuelta de tuerca técnica | Profundización opcional |
| ⚡ Spoiler técnico | Detalle que cambia la comprensión |
| ★ Bonus track | Información extra no esencial |
| → Señal de navegación | Por dónde seguir |
| ⚡ Esto cambia cómo decidís | Aplicación práctica |

### 7.3 Estado actual de bloques

#### Completados

| Bloque | Título | Estado |
|--------|--------|--------|
| 1 | Cómo piensan las computadoras | Completo v2 |
| 1.5 | Cómo se ejecuta un programa | Completo v2 |
| 2 | Cómo se guarda la información | Completo v2 |
| 3 | Cómo se conectan las cosas | Completo v2 |
| 4 | Seguridad y privacidad | Completo v1 |
| 5 | Cómo nace un producto digital | Completo v1 |
| 6 | Qué es la IA | Completo v1 |

#### Pendientes

| Bloque | Título |
|--------|--------|
| 0 | Bienvenida |
| 7 | Herramientas que ya podés usar |
| 8 | IA aplicada a tu trabajo |
| 9 | Automatizaciones |
| 10 | Para ir más lejos |

---

## 8. Próximas fases

### Ya implementado

- Base de datos (Supabase / PostgreSQL).
- Módulos, nodos y secciones de contenido.
- Rutas de aprendizaje.
- Sesiones anónimas con progreso.
- Onboarding base (preguntas, opciones, respuestas por sesión).

### Previsto para fases futuras

- IA conversacional (asistente con RAG conectado al contenido de los bloques).
- Comunidad (zona de intercambio con moderación desde Supabase).
- Personalización avanzada (rutas por perfil, recomendaciones basadas en progreso y onboarding).

---

## 9. Restricciones y decisiones clave

| Decisión | Justificación |
|----------|--------------|
| Sin login en MVP | El usuario debe experimentar valor antes de registrarse |
| Onboarding diferido | Reducir fricción de entrada |
| Guía primero | Evitar exploración caótica; recorrido con progresión |
| Relaciones por slug | Identificadores legibles, no dependientes de IDs internos |
| Idempotencia | Permite re-ejecutar seeds y operaciones sin romper datos |
| Estructura desacoplada | Contenido, recorrido, sesiones e interacciones son independientes |
| Tono rioplatense | Audiencia principal hispanohablante latinoamericana |
| Mobile first | Priorizar experiencia en dispositivos móviles |

---

## 10. Conclusión

Este SRS define la base funcional, técnica y editorial del MVP de Biblioteca de IA y Sistemas. El objetivo es validar comprensión, navegación y claridad conceptual con usuarios reales antes de escalar. Toda la arquitectura está diseñada para crecer sin romper lo existente.
