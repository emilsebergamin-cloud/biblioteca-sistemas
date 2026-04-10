# Biblioteca de IA y Sistemas — Documentación de Producto

**Tipo:** Documento vivo
**Estado:** En construcción activa
**Inicio del proyecto:** Abril 2026
**Responsable:** Emilse Bergamin

---

## Visión del producto

Sistema de aprendizaje guiado para personas no técnicas que explica cómo funciona el mundo tech de forma sistémica, progresiva y sin jerga innecesaria. El valor no está en la cantidad de contenido. Está en la comprensión real que genera.

## Objetivo MVP

Validar comprensión, navegación y claridad conceptual con usuarios reales antes de escalar contenido o funcionalidades.

---

## Arquitectura de la plataforma

### Entidades principales

| Entidad | Función |
|---------|---------|
| modules | Agrupación temática de alto nivel |
| nodes | Unidad de aprendizaje individual dentro de un módulo |
| node_sections | Secciones internas de un nodo (núcleo, profundización, ecosistema) |
| learning_paths | Recorridos guiados que conectan nodos en secuencia |
| sessions | Registro de actividad del usuario |
| onboarding | Flujo de entrada diferido |
| resources | Videos, links, fuentes asociadas a cada nodo |
| glossary | Glosario de términos técnicos en lenguaje humano |

### Principios de arquitectura

- **Idempotencia:** Las operaciones pueden repetirse sin romper el estado del sistema.
- **Relaciones por slug:** Los nodos y módulos se referencian por identificadores legibles.
- **Estructura desacoplada:** Cada entidad puede evolucionar sin romper las demás.
- **Extensible sin romper:** Nuevos bloques, secciones o rutas se agregan sin modificar lo existente.

---

## Stack tecnológico

### Plataforma

| Capa | Tecnología |
|------|------------|
| Base de datos | Supabase (PostgreSQL) |
| Frontend | Next.js |
| Deploy | Vercel |
| IA conversacional | OpenAI API |
| Autenticación | Supabase Auth (sin login en MVP inicial) |

### Herramientas de trabajo utilizadas en el proyecto

| Herramienta | Uso |
|-------------|-----|
| Claude (Anthropic) | Razonamiento de producto, redacción editorial, revisión técnica, arquitectura pedagógica, generación de PDFs |
| Claude Code | Ejecución de código, scripts Python/ReportLab, conexión MCP a Supabase, gestión de archivos |
| ChatGPT (OpenAI) | Consultas complementarias, generación de imágenes, contraste de criterios |
| Supabase | Base de datos relacional, seeds, dashboard de moderación |
| ReportLab | Generación de PDFs estructurados con sistema de etiquetas editorial |
| Vercel / Netlify Drop | Deploy de prototipos HTML |

---

## Decisiones de producto

**Guía primero, personalización después.**
El usuario entra a un recorrido predefinido. La personalización se activa después del onboarding.

**Evitar la exploración caótica.**
El sistema no es una enciclopedia. Es un recorrido con progresión.

**Onboarding diferido.**
El registro ocurre después de que el usuario ya experimentó el valor del producto.

### Flujo de entrada

Entrada → Ruta evolutiva → Nodo → Seguir / Profundizar → Onboarding posterior

---

## Contenido — Estado de bloques

### Completados

| Bloque | Título | Estado | PDF |
|--------|--------|--------|-----|
| 1 | Cómo piensan las computadoras | Completo v2 | biblioteca_bloques_123_v2.pdf |
| 1.5 | Cómo se ejecuta un programa | Completo v2 | biblioteca_bloques_123_v2.pdf |
| 2 | Cómo se guarda la información | Completo v2 | biblioteca_bloques_123_v2.pdf |
| 3 | Cómo se conectan las cosas | Completo v2 | biblioteca_bloques_123_v2.pdf |
| 4 | Seguridad y privacidad | Completo v1 | biblioteca_bloques_456.pdf |
| 5 | Cómo nace un producto digital | Completo v1 | biblioteca_bloques_456.pdf |
| 6 | Qué es la IA | Completo v1 | biblioteca_bloques_456.pdf |

### Pendientes

| Bloque | Título |
|--------|--------|
| 7 | Herramientas que ya podés usar |
| 8 | IA aplicada a tu trabajo |
| 9 | Automatizaciones |
| 10 | Para ir más lejos |
| 0 | Bienvenida |

---

## Estándar editorial — versión base definitiva

Establecido el 10 de abril de 2026. Base de referencia para todos los bloques.

### Estructura interna de cada bloque

- Entrada directa — pregunta o afirmación que engancha
- Parte 1: Núcleo — contenido esencial
- Parte 2: Profundización — opcional
- Parte 3: Ecosistema real — casos latinoamericanos, herramientas actuales
- "Esto cambia cómo decidís" — aplicación práctica accionable
- Señal de navegación
- Frase puente hacia el siguiente bloque
- Fuentes verificadas
- Videos curados con nivel, duración e idioma
- Quiz

### Sistema de etiquetas

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

---

## Notas específicas por bloque

### Bloque 3 — 4 fases

- Fase 1: La conversación básica (cliente, servidor, request, response)
- Fase 2: Las reglas (HTTP, GET/POST, JSON)
- Fase 3: Identidad (autenticación, sesiones, tokens)
- Fase 4: Sistemas complejos (APIs, endpoints, REST, DNS)

### Bloque 5 — 5 momentos del producto

- Entender qué construir
- Decidir qué hacer
- Construir
- Mantener
- Validar

### Bloque 6 — sección adicional

"Cuándo la IA tiene sentido y cuándo no"

---

## Frases puente entre bloques

| Transición | Frase |
|------------|-------|
| B1 → B1.5 | "Ahora sabés qué es el código. El siguiente bloque explica qué pasa cuando ese código se ejecuta." |
| B1.5 → B2/B3 | "Un programa corre, necesita guardar información y comunicarse. B2 explica lo primero, B3 lo segundo." |
| B2 → B3 | "Ya sabés cómo se guarda la información. Ahora falta entender cómo viaja entre sistemas." |
| B3 → B4 | "Ahora que entendés cómo se comunican los sistemas, surge la pregunta: ¿qué pasa cuando esa comunicación es interceptada?" |
| B4 → B5 | "Entendés el mundo de los ataques. El siguiente paso es entender cómo se construye un producto." |
| B5 → B6 | "Entendés cómo se construye un producto digital. Ahora viene la pregunta: ¿cómo cambia todo esto con la IA?" |
| B6 → B7 | "Ahora que entendés cómo funciona la IA, podés empezar a usarla con criterio." |

---

## Registro de sesiones

### Sesión 1 — Fundacional (marzo 2026)

- **Duración estimada:** 4-6 horas
- **Herramientas:** Claude, Supabase, Claude Code
- **Avances:** Visión y MVP definidos. Arquitectura de base de datos diseñada. Seeds ejecutadas. Sistema navegable.
- **Decisiones:** Guía primero. Onboarding diferido. Relaciones por slug.
- **Problema:** Nivel de acoplamiento entre entidades
- **Solución:** Idempotencia + slugs

### Sesión 2 — Bloques 1 al 3 (marzo 2026)

- **Duración estimada:** 6-8 horas
- **Herramientas:** Claude, Claude Code, ReportLab
- **Avances:** Bloques 1, 1.5, 2 y 3 completos. Sistema de etiquetas definido. PDF 1 generado. Videos curados y quizzes.
- **Decisiones:** Sistema de etiquetas narrativas. Stack Python + ReportLab.
- **Problema:** Equilibrio densidad técnica / accesibilidad
- **Solución:** Etiquetas que separan núcleo de profundización

### Sesión 3 — Bloques 4 al 6 (abril 2026)

- **Duración estimada:** 8-10 horas
- **Herramientas:** Claude, Claude Code, ReportLab, búsquedas web
- **Avances:** Bloques 4, 5 y 6 completos. Chequeo de fuentes verificado. PDF 2 generado.
- **Decisiones:** Criterio de ingeniero para revisión técnica. Correcciones: PAMI (~$700k), Verizon (68%), Dropbox (5.000 a 75.000), NotCo (unicornio sin valuación fija).

### Sesión 4 — Reestructuración editorial v2 (10 de abril de 2026)

- **Duración estimada:** 6-8 horas
- **Herramientas:** Claude, Claude Code, ReportLab, pdfplumber
- **Avances:** Estándar editorial definitivo establecido. Bloques 1 al 3 reestructurados. Sección "Esto cambia cómo decidís" incorporada. Señales de navegación y frases puente. Bloque 3 en 4 fases. PDF 1 v2 regenerado. Documentación fundacional generada.
- **Decisiones:** Este estándar es la base para Bloques 7 al 10. Tono humano, no académico.
- **Problema:** Bloque 3 demasiado denso sin pausas
- **Solución:** 4 fases con micro-resúmenes entre fases

---

## Próximos pasos

- Aplicar estándar editorial v2 a Bloques 4, 5 y 6 (regenerar PDF 2)
- Escribir Bloques 7, 8, 9 y 10
- Generar PDF 3 con Bloques 7 al 10
- Construir plataforma HTML/Next.js con Claude Code usando los PDFs como input
- SEO técnico desde el código
- Zona de intercambio con moderación desde Supabase
- Asistente de IA con RAG conectado al contenido de los bloques
