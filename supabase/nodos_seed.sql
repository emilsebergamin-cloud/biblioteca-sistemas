-- =============================================================
-- SEED — Nodos de contenido para los 6 bloques
-- Generado a partir de content/bloques_123.txt y content/bloques_456.txt
-- Ejecutar DESPUÉS de seed.sql (bloques)
-- =============================================================

-- =============================================================
-- BLOQUE 1 — Cómo piensan las computadoras
-- =============================================================

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'que-es-un-algoritmo',
  '¿Qué es un algoritmo?',
  'Un algoritmo es simplemente un conjunto de pasos usados para completar una tarea específica.',
  '<p>La palabra ''algoritmo'' suena a cosa de científico con guardapolvo y café frío. En realidad, es una de las ideas más cotidianas que existen — y probablemente ya usaste una hoy a la mañana.</p>
<p>Un algoritmo es simplemente un conjunto de pasos usados para completar una tarea específica. Son los bloques fundamentales de la programación, y permiten que computadoras, teléfonos y sitios web funcionen y tomen decisiones.</p>
<p>Cuando te levantás a la mañana y preparás mate, ejecutás un algoritmo: hervís el agua, esperás que baje a 80°, ponés la yerba, cebás despacio desde el costado. Si hacés los pasos en distinto orden — por ejemplo, tirás el agua hirviendo directo — el resultado cambia. Los algoritmos son sensibles al orden. Las computadoras también, pero con cero margen para la improvisación.</p>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Cuando alguien dice ''el algoritmo de Instagram decidió no mostrar tu post'', está hablando exactamente de esto — una secuencia de reglas que una empresa definió para decidir qué mostrar a quién, cuándo, y con qué prioridad. No es magia, no es capricho. Son instrucciones escritas por personas, con criterios definidos por personas, que reflejan los intereses de un negocio. Lo vemos en profundidad en el Bloque 8.</p></div>',
  ARRAY['spoiler-tecnico'],
  'concepto',
  'basico',
  1,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'que-es-un-lenguaje-de-programacion',
  '¿Qué es un lenguaje de programación?',
  'Las computadoras, en el fondo, solo entienden un idioma: ceros y unos.',
  '<p>Las computadoras, en el fondo, solo entienden un idioma: ceros y unos. Electricidad que pasa o no pasa. Sí o no. Prendido o apagado. Todo lo que hace una computadora — reproducir un video, enviar un mensaje, mostrar una imagen — se reduce a millones de decisiones binarias por segundo.</p>
<p>Escribir instrucciones directamente en ceros y unos es técnicamente posible y prácticamente una pesadilla. Por eso se inventaron los lenguajes de programación: idiomas intermedios que los humanos pueden escribir y leer, y que se traducen automáticamente al lenguaje de la máquina.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Imaginá que querés darle instrucciones a alguien que solo habla mandarín y vos solo hablás castellano. Necesitás un intérprete en el medio. Los lenguajes de programación son ese intérprete entre vos y la máquina — solo que mucho más rápido y sin errores.</p></div>',
  ARRAY['pensalo-asi'],
  'concepto',
  'basico',
  2,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'compilado-vs-interpretado',
  'Compilado vs interpretado — por qué algunos lenguajes son más rápidos',
  'Todos los lenguajes de programación necesitan traducirse al idioma de la máquina.',
  '<p>Todos los lenguajes de programación necesitan traducirse al idioma de la máquina. Pero hay dos formas muy distintas de hacer esa traducción, y eso cambia todo.</p>
<h3>Lenguajes compilados</h3>
<p>Un compilador toma todo el código fuente, lo traduce de una sola vez a código ejecutable en lenguaje de máquina, y genera un archivo que puede correr directamente.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es como traducir un libro entero del inglés al castellano antes de publicarlo. El trabajo de traducción es grande y lleva tiempo, pero una vez hecho, cualquiera puede leerlo rapidísimo porque ya está en su idioma. C++ y Go son lenguajes compilados.</p></div>
<h3>Lenguajes interpretados</h3>
<p>Un intérprete toma el código fuente y lo ejecuta línea por línea, traduciéndolo mientras corre. No genera un archivo ejecutable separado — necesita al intérprete presente cada vez. Python es interpretado — por eso es tan fácil de usar y popular para prototipos y ciencia de datos, aunque no sea el más veloz.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>JavaScript es técnicamente interpretado, pero los navegadores modernos lo compilan ''justo a tiempo'' (Just-In-Time compilation, o JIT) para hacerlo más rápido. Es lo mejor de los dos mundos — y es parte de por qué la web hoy puede correr apps tan complejas directamente en el navegador.</p></div>',
  ARRAY['pensalo-asi', 'vuelta-tecnica'],
  'concepto',
  'basico',
  3,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'el-mapa-del-territorio-python-javascript-sql',
  'El mapa del territorio: Python, JavaScript y SQL',
  'Python es el chef que sabe hacer de todo. JavaScript es el mozo. SQL es el sistema de inventario.',
  '<table><thead><tr><th>LENGUAJE</th><th>PARA QUÉ SIRVE</th><th>DÓNDE LO VAS A ESCUCHAR</th></tr></thead><tbody><tr><td>Python</td><td>IA, datos, automatizaciones, ciencia de datos</td><td>''El modelo fue entrenado en Python'', ''usamos Python para análisis''</td></tr><tr><td>JavaScript</td><td>Web frontend — todo lo que el usuario ve e interactúa</td><td>''La app está en React + JavaScript'', ''el botón no funciona en el frontend''</td></tr><tr><td>SQL</td><td>Consultar y manipular datos en bases de datos relacionales</td><td>''Hacé una query en SQL'', ''el reporte viene de la base de datos''</td></tr></tbody></table>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Python es el chef que sabe hacer de todo. JavaScript es el mozo — el que interactúa con vos directamente. SQL es el sistema de inventario de la cocina — no cocina nada, pero sabe exactamente qué hay, dónde está, y te lo trae cuando lo pedís. Sin el sistema de inventario, el chef más talentoso del mundo no sabe si tiene huevos.</p></div>',
  ARRAY['en-criollo'],
  'concepto',
  'basico',
  4,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'variables-funciones-y-condiciones',
  'Variables, funciones y condiciones — los tres ladrillos de todo',
  'Estos tres conceptos aparecen en todos los lenguajes de programación, sin excepción.',
  '<p>Estos tres conceptos aparecen en todos los lenguajes de programación, sin excepción. Si entendés esto, entendés el 60% de cómo piensa cualquier programa.</p>
<p><strong>Variable</strong> — Un cajón con nombre donde guardás información. El cajón se llama nombre_usuario y adentro dice ''Emi''. Después podés usar ese cajón en cualquier parte del programa sin repetir ''Emi'' cada vez. Si la información cambia, cambiás el contenido del cajón y el programa entero se actualiza solo.</p>
<p><strong>Función</strong> — Una receta guardada que podés reusar cuantas veces quieras. Escribís una vez los pasos para ''calcular el precio con descuento'', le ponés un nombre, y después la llamás cada vez que necesitás ese cálculo sin reescribir todo.</p>
<p><strong>Condición</strong> — Una bifurcación. ''Si pasa esto, hacé aquello. Si no, hacé lo otro.'' Es exactamente como suena. Si el usuario está logueado → mostrá su perfil. Si no → mostrá la pantalla de login. Toda la lógica de cualquier app del mundo está construida sobre estas bifurcaciones apiladas.</p>',
  ARRAY[]::text[],
  'concepto',
  'basico',
  5,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'frameworks-y-librerias',
  'Frameworks y librerías — la diferencia que importa',
  'Una librería es una colección de herramientas que podés usar cuando querás, en el orden que querás.',
  '<p>Una librería es una colección de herramientas que podés usar cuando querás, en el orden que querás. Un framework es una estructura que define cómo se organiza todo tu proyecto — te dice dónde van las cosas, qué orden tienen que tener, cómo se conectan las partes.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Con una librería, vos llamás al código. Con un framework, el framework te llama a vos. El framework pone las reglas del juego; vos jugás dentro de esas reglas.</p></div>',
  ARRAY['en-criollo'],
  'concepto',
  'basico',
  6,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'react-como-se-construyen-las-apps-modernas',
  'React — Cómo se construyen las apps modernas',
  'React es hoy una de las tecnologías más usadas para construir interfaces web.',
  '<p>React es hoy una de las tecnologías más usadas para construir interfaces web. Es una librería de JavaScript de código abierto mantenida por Meta. Según el Stack Overflow Developer Survey 2025, React es una de las tecnologías web más usadas del mundo.</p>
<p>La idea central: las apps de React están construidas con componentes — piezas de interfaz que tienen su propia lógica y apariencia. El estado (state) es la verdad actual de la aplicación. React se encarga de que todos los componentes que dependen del estado se actualicen automáticamente y en sincronía.</p>
<div class="tag latam"><strong>■■ En Argentina y Latinoamérica</strong><p>MercadoLibre, el mayor marketplace de la región con sede en Buenos Aires, usa React en su frontend junto con Angular y Next.js. Su equipo de más de 15.000 ingenieros maneja más de 30.000 microservicios. El blog técnico de MercadoLibre (medium.com/mercadolibre-tech) documenta en detalle cómo evolucionaron de una arquitectura monolítica a una plataforma multicloud — una lectura obligada para entender cómo escala un producto tech regional a nivel global.</p></div>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>React es la razón por la que cuando le das ''me gusta'' a algo en Instagram, el corazón se pone rojo instantáneamente sin que la página entera se recargue. Ese pequeño detalle requirió décadas de evolución técnica para funcionar tan naturalmente.</p></div>',
  ARRAY['latam', 'resumen-subte'],
  'herramienta',
  'basico',
  7,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'nodejs-javascript-del-lado-del-servidor',
  'Node.js — JavaScript del lado del servidor',
  'Antes de Node.js, JavaScript solo podía correr en el navegador.',
  '<p>Antes de Node.js, JavaScript solo podía correr en el navegador. Node.js es un entorno de ejecución de JavaScript que corre fuera del navegador, directamente en el servidor. Node.js usa programación asíncrona — no bloqueante. Puede seguir trabajando mientras espera tareas como leer archivos o hablar con una base de datos.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Un restaurante donde el mozo toma tu pedido, lo pasa a la cocina, y mientras espera que esté listo va tomando el pedido de otras tres mesas. Ese mozo es Node.js. No se queda parado mirando la cocina esperando que termine tu pedido antes de atender a alguien más.</p></div>',
  ARRAY['pensalo-asi'],
  'herramienta',
  'basico',
  8,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'typescript-javascript-con-el-manual-incluido',
  'TypeScript — JavaScript con el manual incluido',
  'En el mundo real, casi nadie escribe JavaScript puro en proyectos serios.',
  '<p>En el mundo real, casi nadie escribe JavaScript puro en proyectos serios. TypeScript es JavaScript con reglas más estrictas que resuelve el problema del tipado estático.</p>
<p>En JavaScript puro, podés crear una variable que hoy guarda un número, mañana un texto, y pasado mañana una lista — y el lenguaje no se queja. Esa flexibilidad es cómoda cuando el proyecto es chico. Con 50 archivos y 8 personas trabajando en paralelo, esa flexibilidad se convierte en caos. Una función espera un número, alguien le manda un texto, y el sistema explota en producción a las 3 de la mañana.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Armar un mueble sin el manual es JavaScript. TypeScript es el manual incluido, que además te grita si estás poniendo el tornillo equivocado antes de que te des cuenta de que armaste la puerta al revés.</p></div>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>TypeScript no corre directamente en el navegador. Se transpila — se convierte automáticamente a JavaScript antes de ejecutarse. Es como escribir en un dialecto propio y tener un traductor que lo convierte al idioma que el navegador entiende. Hoy, la mayoría de los proyectos React en empresas serias usan TypeScript. Cuando ves ''React + TypeScript'' en una búsqueda de trabajo, no es un nice-to-have — es el estándar de la industria en 2026.</p></div>',
  ARRAY['en-criollo', 'vuelta-tecnica'],
  'herramienta',
  'basico',
  9,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'npm-y-package-json',
  'npm y package.json — el App Store del código',
  'npm (Node Package Manager) es el sistema que usa el ecosistema JavaScript para instalar y gestionar código.',
  '<p>npm (Node Package Manager) es el sistema que usa el ecosistema JavaScript para instalar, compartir y gestionar código que otras personas ya escribieron. Tiene más de 3 millones de paquetes disponibles — el ecosistema de librerías más grande del mundo del software.</p>
<p>El package.json es la ''lista de ingredientes'' de cualquier proyecto JavaScript. Lista todas las librerías que el proyecto necesita, sus versiones, y comandos útiles. Cuando alguien te manda un proyecto y te dice ''corré npm install'', lo que hace ese comando es leer el package.json y descargar automáticamente todo lo que lista.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>El package.json es la lista de compras de una receta. npm es el delivery que trae todo lo de la lista. Si alguien cambió un ingrediente sin avisarte — te mandaron harina integral cuando la receta pedía harina común — el plato puede quedar raro. Eso es un conflicto de dependencias — uno de los errores más comunes en desarrollo.</p></div>',
  ARRAY['pensalo-asi'],
  'herramienta',
  'basico',
  10,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-1'),
  'codigo-abierto-vs-codigo-cerrado',
  'Código abierto vs código cerrado — y por qué importa en IA',
  'Código cerrado (propietario): el código fuente es secreto.',
  '<p><strong>Código cerrado (propietario):</strong> el código fuente es secreto. GPT-4 de OpenAI es código cerrado.</p>
<p><strong>Código abierto (open source):</strong> el código es público — cualquiera puede leerlo, auditarlo, modificarlo y construir sobre él. Llama de Meta y muchos modelos de Hugging Face son open source.</p>
<p>Esto determina tres cosas: quién controla la tecnología, quién puede innovar sobre ella, y — esto es lo que casi nadie menciona — quién puede auditarla por errores o sesgos. Un modelo open source puede ser inspeccionado por investigadores independientes del mundo entero. Un modelo cerrado es una caja negra.</p>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>El término ''open source'' fue acuñado en 1998 en una reunión en Palo Alto, después de que Netscape anunciara que liberaría el código fuente de su navegador. Christine Peterson, cofundadora del Foresight Institute, propuso el término como alternativa más accesible a ''free software'' — que en inglés genera confusión porque ''free'' puede significar tanto ''libre'' como ''gratis''. Un problema de traducción que cambió la historia de la industria. Fuente: Open Source Initiative — opensource.org/history</p></div>',
  ARRAY['dato-color'],
  'concepto',
  'basico',
  11,
  'publicado'
);

-- =============================================================
-- BLOQUE 2 — Cómo se guarda la información
-- =============================================================

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'el-problema-que-las-bases-de-datos-vinieron-a-resolver',
  'El problema que las bases de datos vinieron a resolver',
  'Una base de datos es un sistema organizado para almacenar, gestionar y recuperar información.',
  '<p>Imaginá que tenés una verdulería. Al principio anotás todo en un cuaderno. Funciona bien cuando tenés 10 clientes. Cuando tenés 50.000 clientes comprando al mismo tiempo desde sus teléfonos — el cuaderno se prende fuego metafóricamente.</p>
<p>Una base de datos es un sistema organizado para almacenar, gestionar y recuperar información de manera eficiente. Cada vez que iniciás sesión en Instagram, comprás en Mercado Libre, o chequeás tu saldo bancario, hay una base de datos respondiendo tu consulta en tiempo real.</p>',
  ARRAY[]::text[],
  'concepto',
  'basico',
  1,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'excel-vs-base-de-datos-real',
  'Excel vs base de datos real',
  'Excel: diseñado para trabajo manual de una persona, sin reglas de consistencia, no escala bien.',
  '<p><strong>Excel:</strong> diseñado para trabajo manual de una persona, sin reglas de consistencia, no escala bien, no permite acceso simultáneo de muchos usuarios.</p>
<p><strong>Base de datos:</strong> diseñada para miles de usuarios simultáneos, reglas estrictas de tipos de dato, garantía de consistencia, escala a miles de millones de registros.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Excel es una libreta de apuntes. Una base de datos es el sistema de inventario de un supermercado que sabe en tiempo real cuántas unidades de cada producto quedan, cuándo vencen, qué proveedor las trajo, y cuántas se vendieron hoy — y puede responder esa pregunta para 50 empleados al mismo tiempo mientras los clientes compran.</p></div>',
  ARRAY['pensalo-asi'],
  'concepto',
  'basico',
  2,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'sql-el-idioma-con-el-que-le-hablas-a-los-datos',
  'SQL — el idioma con el que le hablás a los datos',
  'SQL son las siglas de Structured Query Language — Lenguaje de Consulta Estructurado.',
  '<p>SQL son las siglas de Structured Query Language — Lenguaje de Consulta Estructurado. La palabra clave es query — consulta. SQL es literalmente el idioma con el que le hacés preguntas a una base de datos. Es declarativo — le decís qué querés, no cómo buscarlo.</p>
<p><strong>Ejemplo de consulta SQL (en castellano):</strong> SELECCIONÁ nombre_cliente, SUMA(total_compra) DE la tabla ventas DONDE el mes sea abril de 2026 AGRUPALOS por cliente ORDENALOS de mayor a menor MOSTRAME solo los primeros 5</p>
<p>Los cuatro comandos fundamentales: SELECT (mostrame), INSERT (agregá), UPDATE (modificá), DELETE (borrá). Todo lo que hace una app con sus datos es alguna combinación de estos cuatro.</p>',
  ARRAY[]::text[],
  'concepto',
  'basico',
  3,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'bases-de-datos-relacionales',
  'Bases de datos relacionales — el estándar de la industria',
  'Las bases de datos relacionales almacenan datos en tablas con columnas y filas.',
  '<p>Las bases de datos relacionales almacenan datos en tablas con columnas y filas. A cada tabla se le asigna una clave primaria — un identificador único para cada registro. Las tablas se vinculan entre sí mediante claves foráneas, evitando repetir datos innecesariamente. Esto se llama normalización.</p>
<p><strong>Tabla usuarios (ejemplo MercadoLibre):</strong></p>
<table><thead><tr><th>ID</th><th>Nombre</th><th>Email</th><th>Ciudad</th></tr></thead><tbody><tr><td>001</td><td>Emi</td><td>emi@mail.com</td><td>Buenos Aires</td></tr><tr><td>002</td><td>Juan</td><td>juan@mail.com</td><td>Córdoba</td></tr></tbody></table>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>El concepto de base de datos relacional fue inventado en 1970 por Edgar F. Codd, matemático británico de IBM, en su paper ''A Relational Model of Data for Large Shared Data Banks'' publicado en Communications of the ACM — la revista más prestigiosa de ciencias de la computación. IBM tardó años en implementar su propia idea porque los ejecutivos no creían que fuera viable. Mientras tanto, dos estudiantes de Stanford leyeron el paper, lo implementaron, y fundaron Oracle. Hoy Oracle vale 300 mil millones de dólares. La historia de ''la empresa que ignoró su propia innovación'' es un clásico.</p></div>',
  ARRAY['dato-color'],
  'concepto',
  'basico',
  4,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'el-schema-la-estructura-que-define-todo',
  'El schema — la estructura que define todo',
  'El schema es la estructura predefinida de una base de datos.',
  '<p>El schema es la estructura predefinida de una base de datos. Define qué tablas existen, qué columnas tiene cada una, qué tipo de dato acepta cada campo, y qué reglas se aplican. Cuando esa estructura necesita cambiar, se hace una migración de schema.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>El schema es el plano de un edificio antes de construirlo. Si alguien quiere agregar una habitación después de que el edificio está construido, hay que hacer una reforma — que en el mundo de las bases de datos se llama migración de schema.</p></div>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>Cuando le pedís a tu equipo ''agregar el campo de fecha de nacimiento al perfil de usuario'', lo que estás pidiendo técnicamente es una migración de schema. Si la tabla de usuarios ya tiene un millón de registros, esa migración tiene que ejecutarse sin interrumpir el servicio. No es un cambio de cinco minutos — y entender por qué te convierte en una mejor PM.</p></div>',
  ARRAY['pensalo-asi', 'resumen-subte'],
  'concepto',
  'basico',
  5,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'transacciones-y-propiedades-acid',
  'Transacciones y propiedades ACID — el estándar de oro',
  'Una transacción es un conjunto de operaciones que se ejecutan como una unidad indivisible.',
  '<p>Una transacción es un conjunto de operaciones que se ejecutan como una unidad indivisible. O todas tienen éxito, o ninguna se aplica. Las transacciones confiables tienen cuatro propiedades conocidas con el acrónimo ACID:</p>
<table><thead><tr><th>Letra</th><th>Propiedad</th><th>Qué significa</th></tr></thead><tbody><tr><td>A</td><td>Atomicity (Atomicidad)</td><td>Todo o nada. O todas las operaciones se completan, o ninguna se aplica.</td></tr><tr><td>C</td><td>Consistency (Consistencia)</td><td>La base de datos siempre pasa de un estado válido a otro. Nunca queda ''rota''.</td></tr><tr><td>I</td><td>Isolation (Aislamiento)</td><td>Las transacciones concurrentes no se ''ven'' entre sí hasta que terminan.</td></tr><tr><td>D</td><td>Durability (Durabilidad)</td><td>Una vez confirmada la transacción, los cambios son permanentes aunque el servidor se apague.</td></tr></tbody></table>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es como cuando hacés una mudanza. O todas las cajas llegan al nuevo departamento, o si el camión se rompe en el camino volvés todo al punto de partida. Lo que no puede pasar es que la mitad de tus pertenencias quede en la calle.</p></div>
<p><strong>Rollback:</strong> Un rollback es deshacer una transacción que falló — volver al estado anterior como si nada hubiera pasado. Si una transferencia bancaria falla a mitad de camino, el rollback garantiza que la plata vuelva a donde estaba. Es la red de seguridad que hace posible la atomicidad.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Cuando escuchás que una base de datos es ''ACID compliant'', significa que garantiza estas cuatro propiedades en todas sus transacciones. PostgreSQL, MySQL y la mayoría de las bases relacionales son ACID compliant por defecto. Algunas bases NoSQL sacrifican partes de ACID para ganar velocidad y escala — es uno de los trade-offs más importantes en arquitectura de sistemas.</p></div>',
  ARRAY['pensalo-asi', 'vuelta-tecnica'],
  'concepto',
  'basico',
  6,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'bases-de-datos-no-relacionales-nosql',
  'Bases de datos no relacionales (NoSQL)',
  'Las bases de datos no relacionales son ideales cuando los datos son variables o no estructurados.',
  '<p>Las bases de datos no relacionales son ideales cuando los datos son variables o no estructurados. Los cuatro tipos principales:</p>
<p><strong>Documentos (MongoDB)</strong> — Guarda datos en formato JSON. Ideal para redes sociales y catálogos.</p>
<p><strong>Clave-valor (Redis)</strong> — Búsquedas ultrarrápidas. Ideal para caché y sesiones.</p>
<p><strong>Columnas anchas (Cassandra)</strong> — Datasets masivos distribuidos. Ideal para apps de alta escala.</p>
<p><strong>Grafos (Neo4j)</strong> — Datos con relaciones complejas. Ideal para redes sociales y detección de fraude.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Una base relacional es un placard con cajones etiquetados — todo tiene su lugar fijo. Una base no relacional es una mochila — tirás lo que necesitás, en el formato que sea, y lo encontrás cuando lo precisás. Menos orden, más flexibilidad.</p></div>
<div class="tag latam"><strong>■■ Rappi — De monolito a microservicios con AWS</strong><p>Rappi, la startup colombiana de delivery valuada en más de 5.200 millones de dólares, comenzó con una arquitectura monolítica que pronto resultó insuficiente. Al escalar a 9 países y 9 líneas de negocio, migró a una arquitectura de microservicios con múltiples bases de datos especializadas: Amazon DocumentDB (compatible con MongoDB) para datos de pedidos, Elasticsearch para búsqueda de catálogo y productos, y AWS para su infraestructura cloud. Cada microservicio está organizado por unidad de negocio y por país.</p></div>',
  ARRAY['en-criollo', 'latam'],
  'concepto',
  'basico',
  7,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-2'),
  'postgresql-supabase-y-firebase',
  'PostgreSQL, Supabase y Firebase — el ecosistema moderno',
  'PostgreSQL es la base de datos relacional de código abierto más usada del mundo.',
  '<p>PostgreSQL es la base de datos relacional de código abierto más usada del mundo. Supabase es una plataforma moderna construida sobre PostgreSQL con herramientas modernas encima. Firebase es la opción de Google, no relacional, ideal para datos en tiempo real.</p>
<div class="tag bonus-track"><strong>★ Bonus track</strong><p>Si tu equipo dice ''vamos a usar Supabase'', ya sabés que están eligiendo PostgreSQL como motor de base de datos, con herramientas modernas encima. Eso cambia cómo podés participar en la conversación técnica — y demuestra que entendés el stack, no solo la superficie.</p></div>',
  ARRAY['bonus-track'],
  'herramienta',
  'basico',
  8,
  'publicado'
);

-- =============================================================
-- BLOQUE 3 — Cómo se conectan las cosas
-- =============================================================

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'internet-vs-la-web',
  'Internet vs la web — una distinción que casi nadie hace',
  'Internet es la infraestructura — los cables submarinos, los servidores, la red global.',
  '<p>Internet es la infraestructura — los cables submarinos, los servidores, la red global de computadoras conectadas entre sí. La World Wide Web es el sistema de páginas, links y contenido que corre sobre esa infraestructura.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Internet son las rutas del país. La web son los autos que circulan por ellas. Podés usar internet sin usar la web — cuando mandás un email o usás WhatsApp, estás usando internet pero no la web.</p></div>',
  ARRAY['en-criollo'],
  'concepto',
  'basico',
  1,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'http-el-idioma-con-el-que-habla-la-web',
  'HTTP — el idioma con el que habla la web',
  'HTTP son las siglas de HyperText Transfer Protocol — Protocolo de Transferencia de Hipertexto.',
  '<p>HTTP son las siglas de HyperText Transfer Protocol — Protocolo de Transferencia de Hipertexto. Fue inventado en 1989 por Tim Berners-Lee. Es el conjunto de reglas que define cómo se comunican los navegadores con los servidores web.</p>
<p>HTTP es un protocolo cliente-servidor: las solicitudes son enviadas por el cliente (el navegador) y el servidor responde. Los mensajes del cliente se llaman requests y los del servidor responses.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es el correo postal. Vos escribís una carta (request), la mandás a una dirección específica, y el destinatario te responde (response). HTTP es exactamente ese sistema, pero digital y en milisegundos.</p></div>',
  ARRAY['pensalo-asi'],
  'concepto',
  'basico',
  2,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'la-evolucion-del-protocolo-http',
  'La evolución del protocolo — HTTP/1.1, HTTP/2 y HTTP/3',
  'El protocolo HTTP no se quedó estático. Evolucionó en tres generaciones importantes.',
  '<p>El protocolo HTTP no se quedó estático. Evolucionó en tres generaciones importantes:</p>
<table><thead><tr><th>Versión</th><th>Año</th><th>Mejora principal</th></tr></thead><tbody><tr><td>HTTP/1.1</td><td>1999</td><td>Base. Una solicitud a la vez por conexión. Genera ''head-of-line blocking'' — las solicitudes se acolan esperando.</td></tr><tr><td>HTTP/2</td><td>2015</td><td>Multiplexing: múltiples solicitudes simultáneas en una sola conexión. Mucho más rápido para sitios complejos.</td></tr><tr><td>HTTP/3</td><td>2022</td><td>Cambia el protocolo subyacente a QUIC. Más rápido y resiliente en conexiones móviles inestables.</td></tr></tbody></table>
<div class="tag spoiler-tecnico"><strong>■ Para los curiosos</strong><p>Abrís las DevTools de tu navegador (F12 → Network) y mirás cualquier solicitud. Podés ver qué versión de HTTP está usando el sitio. Es uno de esos detalles que solo los técnicos suelen notar — y que ahora vos también podés notar.</p></div>',
  ARRAY['spoiler-tecnico'],
  'concepto',
  'basico',
  3,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'https-y-criptografia-de-clave-publica',
  'HTTPS y criptografía de clave pública',
  'La S al final de HTTPS significa Secure. HTTP transmite datos en texto plano.',
  '<p>La S al final de HTTPS significa Secure. HTTP transmite datos en texto plano — visible para cualquiera que intercepte la comunicación. HTTPS encripta esos datos usando criptografía de clave pública.</p>
<p>El servidor tiene dos llaves: una pública que comparte con todo el mundo libremente, y una privada que nunca sale de sus manos. Cualquiera puede encriptar un mensaje usando la clave pública — pero solo el servidor puede desencriptarlo con su clave privada.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es como un buzón con una ranura abierta en la calle. Cualquier persona puede meter una carta — la ranura es la clave pública. Pero solo el dueño tiene la llave para abrirlo y leer las cartas — esa es la clave privada. Alguien puede ver que pusiste una carta, pero no puede leerla. Eso es lo que hace que HTTPS sea seguro incluso en wifi pública.</p></div>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>El candadito verde en la barra del navegador fue introducido por Netscape Navigator en 1994. Fue una decisión de diseño para darle a los usuarios una señal visual de confianza. Treinta años después, ese mismo símbolo sigue siendo la señal universal de ''este sitio es seguro.''</p></div>',
  ARRAY['pensalo-asi', 'dato-color'],
  'concepto',
  'basico',
  4,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'codigos-de-estado-http',
  'Códigos de estado HTTP — cómo el servidor te dice qué pasó',
  'Los códigos de estado HTTP indican el resultado de cada solicitud entre cliente y servidor.',
  '<table><thead><tr><th>Código</th><th>Significado</th><th>Cuándo lo ves</th></tr></thead><tbody><tr><td>200 OK</td><td>Todo salió perfecto</td><td>La respuesta más común. Todo funcionó.</td></tr><tr><td>201 Created</td><td>Se creó algo nuevo</td><td>Al registrar un usuario o crear un recurso.</td></tr><tr><td>400 Bad Request</td><td>La solicitud está mal</td><td>El cliente mandó algo que no tiene sentido.</td></tr><tr><td>401 Unauthorized</td><td>No estás logueado</td><td>Intentás acceder sin iniciar sesión.</td></tr><tr><td>403 Forbidden</td><td>No tenés permiso</td><td>Estás logueado pero no podés hacer eso.</td></tr><tr><td>404 Not Found</td><td>No existe</td><td>La URL no existe — el más famoso del mundo.</td></tr><tr><td>429 Too Many Requests</td><td>Superaste el límite</td><td>Rate limiting — pediste demasiado rápido.</td></tr><tr><td>500 Internal Server Error</td><td>Error del servidor</td><td>Algo se rompió del lado del servidor.</td></tr></tbody></table>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Cuando un desarrollador dice ''el endpoint está devolviendo un 401'', ya sabés que el problema es de autenticación — no de que el recurso no exista. Esa distinción cambia completamente cómo se resuelve el problema.</p></div>',
  ARRAY['vuelta-tecnica'],
  'concepto',
  'basico',
  5,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'autenticacion-vs-autorizacion',
  'Autenticación vs autorización',
  'Autenticación responde ¿quién sos? Autorización responde ¿qué podés hacer?',
  '<p><strong>Autenticación</strong> responde ¿quién sos? Verifica tu identidad. Cuando ingresás tu usuario y contraseña, te autenticás.</p>
<p><strong>Autorización</strong> responde ¿qué podés hacer? Una vez que el sistema sabe quién sos, decide a qué tenés acceso.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>En un boliche, el portero que te pide el DNI hace autenticación — verifica que sos quien decís ser. La lista VIP es autorización — no importa que seas mayor de edad, si no estás en la lista, no pasás. Dos filtros distintos, dos propósitos distintos.</p></div>',
  ARRAY['pensalo-asi'],
  'concepto',
  'basico',
  6,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'oauth-iniciar-sesion-con-google',
  'OAuth — cómo funciona el ''Iniciar sesión con Google''',
  'OAuth es un protocolo de autorización delegada.',
  '<p>OAuth es un protocolo de autorización delegada. En lugar de darle tu contraseña a cada app, le das permiso para acceder a cierta información de tu cuenta en otro servicio — sin que esa app vea tu contraseña nunca.</p>
<p>El flujo: apretás ''Iniciar sesión con Google'' → la app te redirige a Google → Google te pregunta si das permiso → aprobás → Google le entrega un token temporal a la app → la app usa ese token para identificarte sin haber visto tu contraseña nunca.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es exactamente como darle a alguien un vale de estacionamiento en lugar de las llaves del auto. El playero puede mover el auto dentro del estacionamiento — pero no puede llevárselo ni hacer una copia de las llaves.</p></div>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>OAuth resolvió un problema que antes era un desastre — tener una contraseña diferente para cada servicio, o peor, usar la misma en todos. Hoy delegás la autenticación a Google o Apple, que son expertos en seguridad, sin compartir tus credenciales con nadie.</p></div>',
  ARRAY['pensalo-asi', 'resumen-subte'],
  'concepto',
  'basico',
  7,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'get-vs-post',
  'GET vs POST — una diferencia que no es solo de nombre',
  'GET es idempotente — podés hacer la misma solicitud mil veces y el servidor no cambia.',
  '<p>GET es idempotente — podés hacer la misma solicitud mil veces y el servidor no cambia. Es de solo lectura. Los parámetros viajan en la URL — visibles en la barra del navegador.</p>
<p>POST no es idempotente — cada vez que lo ejecutás, hace algo nuevo. Los datos viajan en el cuerpo de la solicitud, invisibles en la URL.</p>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Si un formulario de pago usa GET en lugar de POST, estás exponiendo datos del pago en la URL — visible para cualquiera que mire por encima de tu hombro, guardado en el historial, y potencialmente procesando el cobro dos veces si el usuario recarga. Cuando veas una URL que termina en ?monto=5000&amp;tarjeta=4532... — alguien usó GET donde debería ir POST. Es un error de seguridad grave.</p></div>',
  ARRAY['spoiler-tecnico'],
  'concepto',
  'basico',
  8,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'apis-api-keys-vs-tokens',
  'APIs — API keys vs tokens de autenticación',
  'Una API key identifica a la aplicación que hace la solicitud — es el DNI del software.',
  '<p>Una API key identifica a la aplicación que hace la solicitud — es el DNI del software. Un token de autenticación identifica al usuario — es la pulsera del boliche. Pueden usarse juntos o por separado.</p>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Cuando un desarrollador dice ''se venció el token'', está hablando de la pulsera del usuario. Cuando dice ''la API key no tiene permisos suficientes'', está hablando del DNI de la aplicación. Son errores distintos con soluciones distintas — y confundirlos hace que el debugging tome el doble de tiempo.</p></div>
<div class="tag latam"><strong>■■ MercadoPago — APIs en producción a escala latinoamericana</strong><p>MercadoPago, el brazo fintech de MercadoLibre, es el procesador de pagos más grande de América Latina. Su API REST pública permite a cualquier desarrollador de la región integrar pagos en su app o sitio web. Cada transacción de MercadoPago involucra exactamente los conceptos de este bloque: API keys para identificar la aplicación del comercio, tokens OAuth para identificar al usuario que paga, HTTPS para encriptar los datos de la tarjeta, y propiedades ACID en su base de datos para garantizar que el pago se acredite o se revierta completamente — nunca a medias.</p></div>',
  ARRAY['spoiler-tecnico', 'latam'],
  'concepto',
  'basico',
  9,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'rest-endpoints-rate-limiting-y-json',
  'REST, endpoints, rate limiting y JSON',
  'REST (REpresentational State Transfer) fue definido por Roy Fielding en su tesis doctoral en el año 2000.',
  '<p>REST (REpresentational State Transfer) fue definido por Roy Fielding en su tesis doctoral en el año 2000. Usa GET para leer, POST para crear, PUT/PATCH para actualizar y DELETE para eliminar — exactamente los mismos cuatro comandos del SQL del Bloque 2, solo que a nivel de HTTP.</p>
<p>Un endpoint es la dirección específica de un recurso dentro de una API. El rate limiting existe por razones técnicas (proteger servidores) y de negocio (monetización por volumen de uso).</p>
<p>JSON (JavaScript Object Notation) es el formato de texto en que viajan los datos entre cliente y servidor en el 90% de las APIs modernas. Es legible para humanos y para máquinas:</p>
<p><code>{ "titulo": "Shake It Off", "artista": "Taylor Swift", "album": "1989", "duracion_segundos": 219, "generos": ["pop", "dance-pop"] }</code></p>
<div class="tag bonus-track"><strong>★ Bonus track</strong><p>Antes de JSON, el formato dominante era XML — mucho más verboso y difícil de leer. Comparado con XML, JSON es como pasar de leer un contrato legal lleno de cláusulas a leer un mensaje de WhatsApp. Misma información, mucho menos ruido.</p></div>',
  ARRAY['bonus-track'],
  'concepto',
  'basico',
  10,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'websockets-cuando-http-no-alcanza',
  'WebSockets — cuando HTTP no alcanza',
  'HTTP funciona en modo solicitud-respuesta: vos preguntás, el servidor responde, se cierra la conversación.',
  '<p>HTTP funciona en modo solicitud-respuesta: vos preguntás, el servidor responde, se cierra la conversación. Para chats en tiempo real, precios que se actualizan solos, o Google Docs colaborativo, existe WebSockets — una conexión que queda abierta entre cliente y servidor.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>HTTP es como mandarse cartas — cada una es una conversación separada. WebSockets es como hablar por teléfono — la línea queda abierta y cualquiera habla cuando quiere.</p></div>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>Cuando tu equipo dice ''esa feature de notificaciones en tiempo real requiere WebSockets'', están diciéndote que la infraestructura es más compleja y más cara que una API REST estándar. Es una decisión de arquitectura con impacto directo en costo y tiempo de desarrollo — y es una conversación de producto, no solo técnica.</p></div>',
  ARRAY['en-criollo', 'resumen-subte'],
  'concepto',
  'basico',
  11,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'cors-el-error-que-nadie-entiende',
  'CORS — el error que todo el mundo ve y nadie entiende',
  'CORS (Cross-Origin Resource Sharing) ocurre cuando los navegadores bloquean solicitudes entre dominios.',
  '<p>CORS (Cross-Origin Resource Sharing) ocurre cuando los navegadores bloquean solicitudes entre dominios distintos por seguridad. Si tu app corre en miapp.com e intenta pedirle datos a api.otroservicio.com, el navegador lo bloquea a menos que el servidor lo autorice explícitamente.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es como intentar entrar a un edificio de oficinas desde la puerta trasera. El edificio tiene seguridad que bloquea accesos no autorizados. CORS es ese sistema de seguridad — y para que funcione, el administrador del edificio (el servidor) tiene que agregar tu nombre a la lista de accesos autorizados.</p></div>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>Cuando en una demo todo funciona perfecto pero en producción aparece un error de CORS, no es que el desarrollador rompió algo. Es que el entorno de producción tiene restricciones de seguridad que el de desarrollo no tenía. Entender esto te permite hacer las preguntas correctas en lugar de asumir que algo está roto.</p></div>',
  ARRAY['pensalo-asi', 'resumen-subte'],
  'concepto',
  'basico',
  12,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'cookies-el-archivo-que-sabe-todo-sobre-vos',
  'Cookies — el archivo que sabe todo sobre vos',
  'Una cookie es un pequeño archivo de texto que un servidor le pide al navegador que guarde.',
  '<p>Una cookie es un pequeño archivo de texto que un servidor le pide al navegador que guarde en tu computadora. Existen tres tipos principales:</p>
<p><strong>Cookies de sesión</strong> — Duran mientras tenés el navegador abierto. Mantienen tu sesión activa.</p>
<p><strong>Cookies persistentes</strong> — Se guardan por días o meses. Hacen que semanas después sigas logueado.</p>
<p><strong>Cookies de terceros</strong> — Las más polémicas. Son las que hacen que busques zapatillas y después te aparezcan en Instagram. El aviso de cookies que aceptás en todos los sitios regula exactamente esto.</p>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>Las cookies fueron inventadas en 1994 por Lou Montulli, un ingeniero de Netscape, originalmente para resolver un problema muy práctico: que los carritos de compra de los e-commerce no perdieran los productos cuando el usuario navegaba a otra página. Nadie pensó entonces en las implicancias de privacidad. Treinta años después, las cookies son el centro de una de las batallas legales y de producto más grandes de la industria digital.</p></div>',
  ARRAY['dato-color'],
  'concepto',
  'basico',
  13,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'dns-y-que-pasa-cuando-falla',
  'DNS — y qué pasa cuando falla',
  'Los servidores no tienen nombres — tienen direcciones numéricas llamadas IP.',
  '<p>Los servidores no tienen nombres — tienen direcciones numéricas llamadas IP (como 157.240.22.35). El DNS (Domain Name System) es la guía telefónica de internet: traduce instagram.com a la dirección IP del servidor correspondiente.</p>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>La primera ''guía telefónica'' de internet era un archivo de texto llamado HOSTS.TXT que había que descargar manualmente. En 1983 había crecido tanto que se volvió inmanejable — y así nació el DNS, diseñado por Paul Mockapetris del USC Information Sciences Institute. Hoy maneja miles de millones de consultas por día.</p></div>
<p>Cuando el DNS falla, los sitios web son inaccesibles aunque los servidores estén funcionando perfectamente. En 2016, un ataque masivo tiró el DNS de Dyn — un proveedor DNS — y dejó sin acceso a Twitter, Netflix, Spotify, Reddit y Amazon durante 6-8 horas. Los servidores de esas empresas estaban perfectamente bien. El DNS era el problema.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Si alguna vez tu internet ''funciona'' pero no podés abrir ningún sitio web, podés probar cambiar tu DNS al de Google (8.8.8.8) o Cloudflare (1.1.1.1) — dos de los servidores DNS públicos más rápidos y confiables del mundo. Es una de esas soluciones de 30 segundos que parece magia si no sabés por qué funciona.</p></div>',
  ARRAY['dato-color', 'vuelta-tecnica'],
  'concepto',
  'basico',
  14,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-3'),
  'el-flujo-completo-todo-junto',
  'El flujo completo — todo junto en un ejemplo real',
  'Abrís Spotify en tu teléfono y apretás ''play'' en una canción. ¿Qué pasa?',
  '<p>Abrís Spotify en tu teléfono y apretás ''play'' en una canción. ¿Qué pasa?</p>
<ol>
<li>Tu app (cliente) arma una solicitud HTTP/2 con método GET al endpoint api.spotify.com/tracks/12345, incluyendo tu API key (identifica la app) y tu token de autenticación (te identifica a vos).</li>
<li>La solicitud viaja por internet con HTTPS — encriptada con clave pública.</li>
<li>El servidor verifica tu token (autenticación), confirma que tenés plan activo (autorización), busca la canción en la base de datos.</li>
<li>Verifica que no superaste el rate limit.</li>
<li>Responde con código 200 OK y un JSON con los datos de la canción.</li>
<li>Tu app recibe el JSON, lo interpreta, y empieza a reproducir.</li>
</ol>
<p>Todo eso en menos de un segundo. Eso es lo que pasa cada vez que apretás play.</p>',
  ARRAY[]::text[],
  'caso_real',
  'basico',
  15,
  'publicado'
);

-- =============================================================
-- BLOQUE 4 — Seguridad y privacidad
-- =============================================================

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'por-que-este-bloque-existe',
  'Por qué este bloque existe',
  'La seguridad digital no es un tema de ingenieros. Es un tema de cualquier persona que use internet.',
  '<p>La seguridad digital no es un tema de ingenieros. Es un tema de cualquier persona que tenga una cuenta de email, use una app de banco, trabaje en una empresa, o simplemente exista en internet. Según el Identity Theft Resource Center, hubo más de 3.000 brechas de datos en 2024, potencialmente exponiendo cientos de millones de cuentas.</p>
<div class="tag bonus-track"><strong>★ Have I Been Pwned — chequealo ahora mismo</strong><p>Ingresa tu email en haveibeenpwned.com — un sitio gratuito creado por el investigador de seguridad Troy Hunt. Te dice en qué brechas conocidas apareció tu email, cuándo, y qué información se filtró. Si aparece — y estadísticamente es probable — el bloque explica exactamente qué hacer.</p></div>',
  ARRAY['bonus-track'],
  'concepto',
  'intermedio',
  1,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'las-contrasenas',
  'Las contraseñas — el problema más viejo del mundo digital',
  'Cuando se trata de contraseñas, tres reglas importan más que todo lo demás: longitud, unicidad y complejidad.',
  '<p>Cuando se trata de contraseñas, tres reglas importan más que todo lo demás: longitud, unicidad y complejidad. Una contraseña debería tener al menos 16 caracteres. La longitud aumenta exponencialmente el tiempo que le lleva a un atacante descifrarla.</p>
<p>El problema real no es que la gente use contraseñas débiles — es que usa la misma en múltiples servicios. Cuando una empresa sufre una brecha y tu contraseña queda expuesta, los atacantes la prueban automáticamente en cientos de otros servicios. Si usás la misma en Gmail, en tu banco, y en un foro cualquiera, y el foro tiene una brecha — todas tus cuentas quedan expuestas de golpe.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Es como usar la misma llave para tu casa, tu auto, tu trabajo, y el buzón — y además hacerle copias a todo el mundo sin darte cuenta. Un gestor de contraseñas genera una llave distinta para cada cerradura y las guarda todas por vos. Vos solo recordás dónde está el llavero.</p></div>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>La contraseña más usada del mundo en 2024 fue ''123456''. En segundo lugar, ''password''. En tercer lugar, ''123456789''. La contraseña ''123456'' tarda menos de un segundo en ser descifrada por herramientas automatizadas básicas. En el cuarto puesto apareció ''admin'' — probablemente de routers y dispositivos que nadie configuró correctamente. Fuente: NordPass Most Common Passwords Report 2024.</p></div>',
  ARRAY['pensalo-asi', 'dato-color'],
  'concepto',
  'intermedio',
  2,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'las-decisiones-concretas',
  'Las decisiones concretas — los dos que cambian todo y los tres que suman',
  'No hace falta ser experto en ciberseguridad para estar razonablemente protegido.',
  '<p>No hace falta ser experto en ciberseguridad para estar razonablemente protegido. Estas cinco decisiones eliminan la gran mayoría del riesgo — pero no tienen el mismo peso:</p>
<table><thead><tr><th>Los dos que cambian todo</th><th>Cómo empezar hoy</th></tr></thead><tbody><tr><td>1. Gestor de contraseñas</td><td>Bitwarden (bitwarden.com) es gratuito y open source. Lo instalás en 5 minutos. Genera contraseñas únicas para cada servicio y las recuerda por vos. Sin esto, todo lo demás tiene menos impacto.</td></tr><tr><td>2. 2FA en cuentas críticas</td><td>Descargá Google Authenticator o Authy. Activalos primero en tu email — es la cuenta más crítica porque desde ahí se recuperan todas las demás. Después banco y redes sociales.</td></tr></tbody></table>
<table><thead><tr><th>Los tres que suman</th><th>Cómo empezar hoy</th></tr></thead><tbody><tr><td>3. Actualizaciones de software</td><td>Activá las actualizaciones automáticas en tu teléfono y computadora. Cada actualización que posponés es un parche de seguridad que no instalaste.</td></tr><tr><td>4. Desconfiá de la urgencia</td><td>Ante cualquier mensaje que te presione a actuar ''ahora mismo'', esperá 5 minutos antes de hacer cualquier cosa. Los atacantes usan urgencia porque apaga el pensamiento crítico.</td></tr><tr><td>5. Chequealo en Have I Been Pwned</td><td>Ingresá tu email en haveibeenpwned.com. Si aparece en brechas, cambiá la contraseña de esa cuenta y cualquier otra donde uses la misma.</td></tr></tbody></table>',
  ARRAY[]::text[],
  'herramienta',
  'intermedio',
  3,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'autenticacion-de-dos-factores-2fa',
  'Autenticación de dos factores (2FA / MFA) — la segunda cerradura',
  'Si una contraseña es la primera cerradura, el 2FA es la segunda.',
  '<p>Si una contraseña es la primera cerradura, el 2FA es la segunda. Aunque alguien tenga tu contraseña, no puede entrar sin el segundo factor. El NIST recomienda agregar autenticación multifactor como primera medida de protección.</p>
<p>Los tres tipos de factores: algo que sabés (tu contraseña), algo que tenés (tu teléfono), algo que sos (tu huella dactilar). El 2FA combina al menos dos. Los SMS son la versión menos segura porque pueden ser interceptados mediante SIM swapping. Las apps de autenticación generan códigos localmente en tu dispositivo — son mucho más seguras.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Existe una nueva generación llamada passkeys — claves criptográficas almacenadas en tu dispositivo que reemplazan la contraseña completamente. Usan criptografía de clave pública: tu dispositivo demuestra que sos vos sin que ninguna contraseña viaje por la red. Resistentes al phishing por diseño — si te engañan para ir a un sitio falso, la passkey no funciona porque el dominio es incorrecto. Google, Apple y Microsoft ya las implementan.</p></div>',
  ARRAY['vuelta-tecnica'],
  'concepto',
  'intermedio',
  4,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'phishing',
  'Phishing — cuando el ataque viene disfrazado de confianza',
  'El phishing es el ataque más común del mundo digital, y funciona porque explota la tendencia a confiar.',
  '<p>El phishing es el ataque más común del mundo digital, y funciona no porque las personas sean tontas, sino porque explota algo muy humano: la tendencia a confiar en lo que parece familiar y actuar cuando sentimos urgencia.</p>
<p>La receta del phishing siempre tiene los mismos ingredientes: urgencia artificial (''Tu cuenta será suspendida en 24 horas''), autoridad falsa (parece venir de tu banco, de Google, de la ARCA), y un link o adjunto que lleva a un sitio falso o instala algo malicioso.</p>
<p>Las señales de alerta que siempre hay que revisar: el dominio del remitente (soporte@banco-seguro.com no es lo mismo que soporte@banco.com), hacer hover sobre cualquier link antes de hacer click para ver la URL real, errores de ortografía o diseño raro, tono de urgencia extrema, saludos genéricos (''Estimado cliente'') en lugar de tu nombre.</p>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>En 2024, la empresa británica de ingeniería Arup pagó 25 millones de dólares a estafadores después de una videollamada donde todos los participantes — excepto el empleado que autorizó la transferencia — eran deepfakes generados por IA. El FBI emitió una alerta específica en mayo de 2024 sobre el uso creciente de IA y deepfakes en ataques de phishing.</p></div>',
  ARRAY['dato-color'],
  'concepto',
  'intermedio',
  5,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'ingenieria-social',
  'Ingeniería social — el hack más viejo del mundo',
  'La ingeniería social es el arte de manipular personas para que hagan cosas que no deberían.',
  '<p>La ingeniería social es el arte de manipular personas para que hagan cosas que no deberían o divulguen información que no deberían. El phishing es un tipo — pero hay muchos más. Según el Verizon Data Breach Investigations Report 2024, el 68% de las brechas de datos involucró el elemento humano — errores, negligencia o manipulación. La tecnología no es el problema más grande. La educación es la defensa más efectiva.</p>
<table><thead><tr><th>Tipo</th><th>Descripción</th><th>Cómo funciona</th></tr></thead><tbody><tr><td>Vishing</td><td>Voice phishing — llamada telefónica</td><td>Se hacen pasar por el banco, soporte técnico, o entidad gubernamental. Hoy potenciado con clonación de voz por IA.</td></tr><tr><td>Smishing</td><td>SMS phishing</td><td>''Tu paquete tiene un problema, hacé click acá.'' El formato cambia, la urgencia no.</td></tr><tr><td>Spear phishing</td><td>Phishing dirigido a personas específicas</td><td>El atacante investiga a la víctima — su empresa, cargo, contactos — y construye un mensaje personalizado difícil de detectar.</td></tr><tr><td>Pretexting</td><td>Escenario inventado para ganar confianza</td><td>''Soy del área de IT, necesito tu contraseña para actualizar el sistema.'' Siempre es falso.</td></tr></tbody></table>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>La ingeniería social no hackea computadoras — hackea personas. Funciona porque somos sociales por naturaleza. Cuando alguien parece legítimo, habla con confianza, y crea urgencia, nuestro cerebro tiende a cumplir antes de cuestionar. Conocer cómo funciona es la mejor defensa — porque ningún antivirus protege contra esto.</p></div>',
  ARRAY['en-criollo'],
  'concepto',
  'intermedio',
  6,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'malware-y-ransomware',
  'Malware y ransomware — qué pasa después de que alguien cae en la trampa',
  'El phishing y la ingeniería social son la puerta de entrada. El malware es lo que entra por esa puerta.',
  '<p>El phishing y la ingeniería social son la puerta de entrada. Pero ¿qué entra por esa puerta? Eso es el malware — software malicioso diseñado para dañar, robar, o tomar control de un sistema sin el consentimiento del usuario.</p>
<p>Los tipos más importantes hoy:</p>
<p><strong>Spyware</strong> — software que espía silenciosamente todo lo que hacés. Captura contraseñas mientras las escribís (keylogger), graba pantalla, accede a la cámara. Puede estar activo meses antes de ser detectado.</p>
<p><strong>Ransomware</strong> — el más devastador. La palabra viene del inglés ransom (rescate) + software. Encripta todos tus archivos — fotos, documentos, bases de datos — y los hace completamente inaccesibles. Después aparece un mensaje: ''Pagá X cantidad en criptomonedas en las próximas 48 horas o perdés todo.'' Si no pagás, los datos se publican o se destruyen. Si pagás, no hay garantía de recuperación.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>El phishing es cuando alguien te engaña para que abras la puerta de tu casa. El malware es lo que entra cuando la puerta está abierta. El ransomware es cuando cambian todas las cerraduras de adentro y te piden plata para darte la llave de vuelta — una llave que quizás ni siquiera te dan aunque pagues.</p></div>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>La razón por la que los rescates se piden en Bitcoin o Monero no es un capricho — es porque las transacciones en criptomonedas son difíciles de rastrear y completamente irreversibles. Una vez transferido el dinero, no hay banco que pueda hacer un chargeback. Eso convirtió al ransomware en un negocio de bajo riesgo y alta rentabilidad para el crimen organizado.</p></div>
<p>El detalle más perturbador del ransomware moderno: <strong>Ransomware-as-a-Service (RaaS)</strong>. Existe un modelo de negocio donde grupos criminales desarrollan el software de ransomware y lo alquilan a otros — que no necesitan saber programar — a cambio de un porcentaje del rescate obtenido. Panel de control, soporte técnico, actualizaciones automáticas. Es literalmente el modelo de negocio de Spotify, aplicado al crimen organizado.</p>
<div class="tag latam"><strong>■■ En Argentina — el caso PAMI (2 de agosto de 2023)</strong><p>El 2 de agosto de 2023, a las 6 de la mañana, los sistemas del PAMI — el Instituto Nacional de Servicios Sociales para Jubilados y Pensionados, que atiende a más de 5 millones de afiliados — fueron atacados por el grupo criminal Rhysida, operando bajo el modelo RaaS. El vector de entrada fue un email de phishing que un empleado abrió. Rhysida exigió 25 Bitcoin — aproximadamente $700.000 dólares — como rescate. El PAMI no pagó. En represalia, el grupo publicó 831 GB de información en la dark web: historias clínicas, estudios médicos, datos personales de afiliados.</p></div>',
  ARRAY['pensalo-asi', 'dato-color', 'latam'],
  'concepto',
  'intermedio',
  7,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'vpns-que-son-que-hacen-y-que-no-hacen',
  'VPNs — qué son, qué hacen, y qué NO hacen',
  'Las VPNs son probablemente la tecnología de seguridad más malentendida del mundo digital.',
  '<p>Las VPNs son probablemente la tecnología de seguridad más malentendida del mundo digital. Hay un mito masivo de que una VPN te hace anónimo en internet. No es así, y creerlo puede crear una falsa sensación de seguridad que es peor que no tener VPN.</p>
<table><thead><tr><th>Una VPN SÍ hace</th><th>Una VPN NO hace</th></tr></thead><tbody><tr><td>Encripta tu conexión en redes públicas (wifi de un café, aeropuerto, hotel)</td><td>No te hace anónimo — si iniciás sesión en Google con tu cuenta, Google sabe quién sos</td></tr><tr><td>Oculta tu IP real de los sitios que visitás</td><td>No te protege de malware ni phishing</td></tr><tr><td>Evita que tu proveedor de internet vea qué sitios visitás</td><td>No encripta el contenido de tus mensajes en apps — eso lo hace el cifrado de extremo a extremo</td></tr><tr><td>Permite acceder a contenido bloqueado geográficamente</td><td>No te protege si el proveedor de VPN mismo vende tus datos</td></tr></tbody></table>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Una VPN es como cambiar de auto antes de salir a la ruta. El auto nuevo tiene vidrios polarizados y placas diferentes — más difícil identificarte en el camino. Pero cuando llegás a destino y te bajás con tu cara, todos saben quién sos. La VPN protege el trayecto, no el destino.</p></div>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Una VPN gratuita es frecuentemente peor que no tener VPN. Los servicios gratuitos suelen monetizar registrando y vendiendo tu historial de navegación — que es exactamente lo que querías evitar. Si vas a usar VPN, Proton VPN tiene un plan gratuito genuinamente confiable con política verificada de no-logs.</p></div>',
  ARRAY['en-criollo', 'spoiler-tecnico'],
  'herramienta',
  'intermedio',
  8,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'cifrado-de-extremo-a-extremo-vs-https',
  'Cifrado de extremo a extremo vs HTTPS — dos capas distintas',
  'Esta distinción es crítica y casi nunca se explica correctamente.',
  '<p>Esta distinción es crítica y casi nunca se explica correctamente — especialmente en un contexto donde WhatsApp es el canal de comunicación principal de toda la región.</p>
<table><thead><tr><th>HTTPS</th><th>Cifrado de extremo a extremo (E2E)</th></tr></thead><tbody><tr><td>Encripta el trayecto entre tu dispositivo y el servidor de la app</td><td>Encripta el contenido de tal forma que SOLO vos y tu destinatario pueden descifrarlo</td></tr><tr><td>La empresa que maneja el servidor puede leer tus mensajes</td><td>Ni siquiera la plataforma que transmite el mensaje puede leerlo</td></tr><tr><td>Protege tu conexión, no tu contenido</td><td>Protege el contenido independientemente de quién tenga los servidores</td></tr><tr><td>Ejemplo: cualquier sitio con el candadito verde</td><td>Ejemplo: WhatsApp activa E2E en todos sus chats por defecto</td></tr></tbody></table>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>HTTPS es tener un edificio con seguridad en la entrada — nadie entra sin pasar por el portero. El cifrado de extremo a extremo es hablar en un idioma que solo vos y tu interlocutor entienden, dentro del edificio. Las dos protecciones son distintas y se complementan.</p></div>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Telegram, muy popular en la región, solo aplica E2E en sus ''chats secretos'' — los chats normales se almacenan en sus servidores y pueden ser accedidos. WhatsApp aplica E2E en todos sus chats por defecto. La diferencia es importante y muy poca gente la conoce.</p></div>',
  ARRAY['pensalo-asi', 'spoiler-tecnico'],
  'concepto',
  'intermedio',
  9,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'las-actualizaciones',
  'Las actualizaciones — por qué posponer una puede costarte caro',
  'La mayoría de las actualizaciones no son solo funcionalidades nuevas — son parches de seguridad.',
  '<p>La mayoría de las actualizaciones no son solo funcionalidades nuevas — son parches de seguridad. Cuando una empresa descubre una vulnerabilidad, la arregla y lanza una actualización. Pero entre el descubrimiento y el parche, hay una ventana en que el agujero ya se conoce — y los atacantes escanean internet buscando sistemas que todavía no actualizaron.</p>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>El ataque de ransomware más masivo de la historia — WannaCry, mayo de 2017 — infectó más de 200.000 computadoras en 150 países en pocas horas, incluyendo el sistema de salud público del Reino Unido (NHS), forzando la cancelación de miles de cirugías y consultas. El agujero que WannaCry explotaba ya tenía un parche disponible casi dos meses antes. Las computadoras afectadas simplemente no lo habían instalado.</p></div>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>Actualizar tu sistema operativo y tus apps es el equivalente digital de cambiar la cerradura cuando sabés que alguien tiene una copia de tu llave. Cada actualización que posponés es una puerta que dejás entreabierta con el mapa del agujero publicado.</p></div>',
  ARRAY['spoiler-tecnico', 'resumen-subte'],
  'concepto',
  'intermedio',
  10,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'superficie-de-ataque',
  'Superficie de ataque — el concepto que cambia cómo tomás decisiones',
  'Superficie de ataque es el conjunto total de puntos donde un atacante puede intentar entrar.',
  '<p>Superficie de ataque es el conjunto total de puntos donde un atacante puede intentar entrar a un sistema — cada app instalada, cada cuenta que tenés, cada dispositivo conectado a tu red, cada servicio externo que usa tu empresa. Cuanto más grande la superficie, más vectores de ataque disponibles. Cuanto más chica, menos posibilidades de que algo falle.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Cada app que instalás es una puerta más en tu casa. Más puertas, más chances de que alguna esté mal cerrada, tenga una cerradura vieja, o la fabricó alguien de dudosa reputación. No se trata de no tener puertas — se trata de saber cuántas tenés, para qué sirven, y si están bien cerradas.</p></div>
<div class="tag bonus-track"><strong>★ Bonus track</strong><p>Para PMs y emprendedores — aplicación directa: cada vez que tu equipo adopta una nueva herramienta (un SaaS, una integración, un servicio de terceros), está ampliando la superficie de ataque. La pregunta correcta antes de adoptar cualquier herramienta no es solo ''¿funciona?'' sino ''¿quién tiene acceso a nuestros datos a través de esta herramienta? ¿Tiene 2FA? ¿Cómo maneja una brecha?'' Eso no es paranoia — es criterio de producto.</p></div>',
  ARRAY['en-criollo', 'bonus-track'],
  'concepto',
  'intermedio',
  11,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'privacidad-que-pasa-con-tus-datos',
  'Privacidad — qué pasa con tus datos',
  'Cada vez que usás una app gratuita, aceptás términos de servicio sin leer, o navegás por internet, generás datos.',
  '<p>Cada vez que usás una app gratuita, aceptás términos de servicio sin leer, o navegás por internet, generás datos. Datos sobre lo que comprás, lo que buscás, dónde estás, a qué hora dormís, con quién hablás. La respuesta honesta: la mayoría de los servicios gratuitos financian su existencia vendiendo o usando tus datos para publicidad. Vos no sos el cliente; sos el producto.</p>
<table><thead><tr><th>Categoría</th><th>Qué es</th><th>Ejemplos</th></tr></thead><tbody><tr><td>Datos personales</td><td>Identifican directamente quién sos</td><td>Nombre, email, DNI, dirección</td></tr><tr><td>Datos de comportamiento</td><td>Los más valiosos para publicidad — predicen tus decisiones</td><td>Qué buscás, qué comprás, cuánto tiempo en cada pantalla</td></tr><tr><td>Datos sensibles</td><td>Los más protegidos legalmente y más peligrosos si se filtran</td><td>Salud, orientación sexual, creencias, biometría</td></tr></tbody></table>
<h3>GDPR y tus derechos digitales</h3>
<p>En 2018 entró en vigencia en Europa el GDPR (General Data Protection Regulation) — la ley de privacidad más exigente del mundo. Aunque fue creada en Europa, impone obligaciones a organizaciones en cualquier lugar del mundo que recopilen datos de personas en la UE.</p>
<table><thead><tr><th>Derecho</th><th>Qué significa en la práctica</th></tr></thead><tbody><tr><td>Acceso</td><td>Podés pedirle a cualquier empresa qué datos tiene sobre vos</td></tr><tr><td>Rectificación</td><td>Podés pedir que corrijan datos incorrectos</td></tr><tr><td>Olvido</td><td>Podés pedir que borren tus datos bajo ciertas condiciones</td></tr><tr><td>Portabilidad</td><td>Podés pedir tus datos en formato exportable</td></tr><tr><td>Objetar</td><td>Podés objetar ciertos usos de tus datos, incluyendo publicidad dirigida</td></tr></tbody></table>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>La multa más grande de la historia del GDPR fue impuesta a Meta en 2023: 1.200 millones de euros por transferir datos de usuarios europeos a servidores en Estados Unidos sin las garantías legales adecuadas. La segunda más grande fue a Amazon: 746 millones de euros. Las multas del GDPR pueden llegar al 4% de la facturación global anual.</p></div>',
  ARRAY['dato-color'],
  'concepto',
  'intermedio',
  12,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'owasp',
  'OWASP — la referencia de seguridad en aplicaciones web',
  'El OWASP Top 10 es un reporte con los 10 riesgos de seguridad más críticos para aplicaciones web.',
  '<p>El OWASP Top 10 es un reporte actualizado regularmente con los 10 riesgos de seguridad más críticos para aplicaciones web. Es elaborado por expertos de seguridad de todo el mundo y es la referencia estándar de la industria. Saber que existe te permite participar en conversaciones sobre seguridad con criterio. Cuando un equipo de desarrollo dice ''revisamos el OWASP antes del lanzamiento'', están hablando de un checklist de vulnerabilidades reconocido globalmente.</p>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>OWASP es como la lista de los 10 errores de seguridad más comunes que cometen los desarrolladores al construir apps web. Si tu equipo la revisa antes de lanzar un producto, es una señal de que se toman la seguridad en serio desde el código.</p></div>',
  ARRAY['resumen-subte'],
  'herramienta',
  'intermedio',
  13,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-4'),
  'en-argentina-y-latinoamerica-el-cuento-del-tio-digital',
  'En Argentina y Latinoamérica — el cuento del tío digital',
  'Los intentos de phishing aumentaron un 140% en Latinoamérica en 2024.',
  '<div class="tag latam"><strong>■■ Cifras oficiales 2024</strong><p>Los intentos de phishing aumentaron un 140% en Latinoamérica en 2024. Argentina registró un crecimiento del 300% en actividad de phishing. En toda la región se registraron más de 697 millones de bloqueos de phishing — 1.326 intentos de ataque por minuto. En Argentina, durante 2024 se registraron 34.468 denuncias por delitos informáticos — un aumento del 21,1% respecto a 2023.</p></div>
<p>Las modalidades más comunes en la región:</p>
<p><strong>El WhatsApp robado</strong> — alguien te escribe diciendo ''me llegó un código de verificación por error al tuyo, me lo mandás?'' Si lo mandás, perdés acceso a tu cuenta. Después usan tu cuenta para pedirle plata a tus contactos haciéndose pasar por vos. Es la estafa digital más denunciada en Argentina en 2024.</p>
<p><strong>El phishing de ARCA/AFIP</strong> — emails que simulan ser del organismo fiscal, advirtiendo sobre deudas o multas urgentes. ARCA aclaró oficialmente que nunca se comunica por email, WhatsApp, redes sociales ni teléfono para solicitar pagos o datos personales.</p>
<p><strong>El soporte técnico falso</strong> — alguien llama diciendo ser del banco, de tu compañía de internet, o de Apple/Google. Crean urgencia, te piden instalar una app de acceso remoto, y desde ahí acceden a tus cuentas bancarias y billeteras digitales.</p>
<p><strong>Las inversiones milagrosas</strong> — plataformas publicitadas en redes sociales prometiendo rendimientos imposibles, usando imágenes de celebridades — muchas veces deepfakes — para dar credibilidad.</p>
<div class="tag la-regla-de-oro"><strong>■ La regla de oro que aplica a todos los casos:</strong><p>Cualquier entidad oficial, banco, o empresa seria NUNCA te va a pedir tu contraseña, tu clave fiscal, o un código que te llegó por SMS. Si alguien te lo pide — sea por teléfono, WhatsApp, email, o cualquier otro canal — es una estafa. No importa cuán oficial parezca, no importa la urgencia que genere. Esperá 5 minutos, buscá el número oficial de la entidad, y confirmá directamente.</p></div>',
  ARRAY['latam', 'la-regla-de-oro'],
  'caso_real',
  'intermedio',
  14,
  'publicado'
);

-- =============================================================
-- BLOQUE 5 — Cómo nace un producto digital
-- =============================================================

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'la-idea-no-es-el-producto',
  'La idea no es el producto',
  'Hay un error muy común en el mundo del emprendimiento: confundir la idea con el producto.',
  '<p>Hay un error muy común en el mundo del emprendimiento: confundir la idea con el producto. Una idea es el punto de partida. El producto es lo que sobrevive al contacto con usuarios reales, con limitaciones técnicas, con presupuesto acotado, y con un mercado que no siempre hace lo que esperás.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>El mejor producto del mundo que resuelve un problema que nadie tiene es un fracaso garantizado. El producto mediano que resuelve un problema que le duele a mucha gente tiene posibilidades reales. El problema siempre va antes que la solución.</p></div>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>El concepto de Jobs to Be Done fue desarrollado por Clayton Christensen, profesor de Harvard Business School. La idea central: las personas no compran productos, contratan soluciones para trabajos que necesitan hacer. Cuando McDonald''s estudió por qué la gente compraba milkshakes a la mañana temprano, descubrió que los ''contrataban'' para tener algo que comer mientras manejaban al trabajo. El competidor real no era otro milkshake: era una banana. Entender el trabajo real que hace un producto cambia completamente cómo se diseña.</p></div>',
  ARRAY['en-criollo', 'dato-color'],
  'concepto',
  'intermedio',
  1,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'todo-producto-es-una-hipotesis',
  'Todo producto es una hipótesis',
  'Todo lo que un equipo cree sobre su producto antes de lanzarlo es una hipótesis — no una verdad.',
  '<p>Este es el marco mental más importante del bloque. Todo lo que un equipo cree sobre su producto antes de lanzarlo es una hipótesis — no una verdad.</p>
<table><thead><tr><th>Hipótesis</th><th>Riesgo si es falsa</th></tr></thead><tbody><tr><td>''Nuestros usuarios tienen este problema''</td><td>Construiste algo que nadie quería — el fracaso más caro</td></tr><tr><td>''Esta solución lo resuelve''</td><td>Lanzaste algo que técnicamente funciona pero no resuelve el dolor real</td></tr><tr><td>''Estarán dispuestos a pagar X''</td><td>Tu modelo de negocio no funciona aunque el producto sea bueno</td></tr><tr><td>''Este canal de adquisición va a funcionar''</td><td>Los usuarios no llegan aunque el producto sea excelente</td></tr></tbody></table>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>El 35% de las startups que fracasan lo hacen por ''no market need'' — no existía demanda real para el producto. No porque el equipo no supiera programar — sino porque construyeron sobre una hipótesis que nunca validaron. Fuente: CB Insights 2024.</p></div>',
  ARRAY['spoiler-tecnico'],
  'concepto',
  'intermedio',
  2,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'discovery-antes-de-construir',
  'Discovery — antes de construir una línea de código',
  'La fase de discovery es el período donde el equipo entiende el problema antes de proponer soluciones.',
  '<p>La fase de discovery es el período donde el equipo entiende el problema antes de proponer soluciones. Es la fase que más se saltea cuando hay prisa — y la que más caro cuesta omitir. Discovery es el proceso de reducir el riesgo de las hipótesis más importantes antes de construir. No es una formalidad: es la diferencia entre construir en terreno firme o en arena.</p>
<table><thead><tr><th>Herramienta</th><th>Para qué sirve</th><th>Qué se busca</th></tr></thead><tbody><tr><td>Entrevistas con usuarios</td><td>Conversaciones abiertas donde escuchás más de lo que hablás</td><td>Comportamientos reales: qué hacen hoy, qué les frustra, cómo lo resuelven actualmente. Nunca preguntar ''¿usarías esto?'' — siempre recibe ''sí'' por cortesía</td></tr><tr><td>User personas</td><td>Perfiles semi-ficticios basados en investigación real</td><td>Arquetipos de grupos de usuarios con necesidades y comportamientos similares — no demografías genéricas</td></tr><tr><td>Mapa de empatía</td><td>Herramienta visual</td><td>Lo que el usuario dice, piensa, siente y hace respecto a un problema. Fuerza al equipo a salir de sus suposiciones</td></tr><tr><td>Benchmarking competitivo</td><td>Análisis de soluciones existentes</td><td>Qué hacen bien, qué hacen mal, qué no hacen. El mercado ya habla por sí solo</td></tr></tbody></table>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>La fase de discovery es como hacer el diagnóstico antes de operar. Ningún médico serio opera sin diagnóstico. Lo que cambia si salteás el diagnóstico: operás el órgano equivocado, y el paciente sigue igual de enfermo — solo que ahora con cicatriz.</p></div>',
  ARRAY['pensalo-asi'],
  'concepto',
  'intermedio',
  3,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'del-problema-al-producto-backlog-priorizacion-roadmap',
  'Del problema al producto — backlog, priorización y roadmap',
  'Una vez que el equipo entiende el problema, viene la etapa de definir qué construir.',
  '<p>Una vez que el equipo entiende el problema, viene la etapa de definir qué construir. Estos tres conceptos van siempre juntos en cualquier conversación de producto:</p>
<p><strong>Backlog</strong> — la lista de todo lo que el equipo podría construir. Puede tener decenas o cientos de items. No todo va a llegar a producción — la mayor parte del backlog muere ahí, y eso está bien. La existencia de un backlog largo no indica problema; indica que hay ideas.</p>
<p><strong>Priorización</strong> — el proceso de decidir qué va primero. Hay marcos como RICE, MoSCoW e ICE que ayudan a tomar esas decisiones con criterio en lugar de intuición o política interna. La priorización es donde más se pelean los equipos — porque todos creen que su feature es la más importante.</p>
<p><strong>Roadmap</strong> — la hoja de ruta: qué se va a construir, en qué orden, y con qué horizonte temporal. No es un plan rígido ni un contrato — es una hipótesis de qué crear basada en la información disponible hoy, sujeta a cambio cuando aparezca nueva información.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Uno de los errores más costosos en equipos de producto es tratar el roadmap como un compromiso. Cuando el equipo de ventas le promete a un cliente una feature que está en el roadmap ''para el Q3'', está prometiendo algo que depende de decenas de variables que pueden cambiar — hallazgos de usuarios, bugs críticos, cambios de prioridad del negocio. La gestión de expectativas del roadmap es una de las habilidades más valiosas — y menos enseñadas — de un PM.</p></div>',
  ARRAY['vuelta-tecnica'],
  'concepto',
  'intermedio',
  4,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'waterfall-vs-agile',
  'Waterfall vs Agile — la historia de dos formas de construir',
  'Antes de Agile, la forma dominante era Waterfall (cascada): primero definís todo, después lanzás.',
  '<p>Antes de Agile, la forma dominante era Waterfall (cascada): primero definís todo, después diseñás, después desarrollás, después testeás, después lanzás. Una etapa cae sobre la siguiente. El problema: el mundo cambia mientras construís. Cuando terminabas, ya era tarde para cambiar — habías invertido meses o años en algo que ya no era lo que se necesitaba.</p>
<p>En 2001, diecisiete desarrolladores de software se reunieron en Snowbird, Utah, y escribieron el Manifiesto Ágil — cuatro valores y doce principios que propusieron una alternativa: construir en ciclos cortos, validar frecuentemente, y adaptarse rápido al cambio.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Waterfall es planear las vacaciones completas con itinerario fijo, hoteles reservados, y tours pagados seis meses antes. Agile es reservar el primer destino, ir, ver qué te gustó y qué no, y decidir el siguiente paso con esa información real. Ambas pueden funcionar — pero una funciona mejor cuando el camino es incierto.</p></div>',
  ARRAY['pensalo-asi'],
  'concepto',
  'intermedio',
  5,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'scrum-como-funciona-agile-en-la-practica',
  'Scrum — cómo funciona Agile en la práctica',
  'Scrum es el framework Agile más usado del mundo.',
  '<p>Scrum es el framework Agile más usado del mundo. Organiza el trabajo en ciclos cortos y predecibles llamados sprints — típicamente dos semanas. Al inicio de cada sprint el equipo selecciona items del backlog a construir. Al final hay algo funcional para mostrar — no una presentación: código que corre. Esto se conecta directamente con el concepto de hipótesis: cada sprint es una oportunidad de validar o invalidar algo sobre el producto.</p>
<table><thead><tr><th>Ceremonia</th><th>Cuándo</th><th>Para qué</th></tr></thead><tbody><tr><td>Sprint Planning</td><td>Al inicio del sprint</td><td>¿Qué vamos a construir estas dos semanas y cómo?</td></tr><tr><td>Daily standup</td><td>Todos los días, 15 min max</td><td>¿Qué hice ayer, qué hago hoy, hay algo que me bloquea?</td></tr><tr><td>Sprint Review</td><td>Al final del sprint</td><td>Mostrar lo que se construyó. No una presentación — algo que funciona</td></tr><tr><td>Sprint Retrospective</td><td>Al final del sprint</td><td>¿Qué funcionó, qué no funcionó, qué cambiamos?</td></tr></tbody></table>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>Scrum es como cocinar un menú de degustación en lugar de una cena de cinco platos. En lugar de preparar todo y servir al final, sacás un plato a la vez, el comensal lo prueba, te dice qué le pareció, y ajustás el siguiente plato. Al final de la noche el menú fue co-creado con quien lo comió — no solo imaginado por el chef.</p></div>',
  ARRAY['en-criollo'],
  'concepto',
  'intermedio',
  6,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'los-roles-quien-hace-que',
  'Los roles — quién hace qué, con precisión',
  'Esta es la sección que más confusión genera. La clave es distinguir la capa estratégica y la táctica.',
  '<p>Esta es la sección que más confusión genera. La clave es distinguir dos capas: la estratégica y la táctica. El PM trabaja en el ''por qué'' y el ''qué'' a largo plazo; el PO traduce eso en acciones concretas sprint a sprint.</p>
<table><thead><tr><th>Rol</th><th>Capa</th><th>Se pregunta</th><th>Herramientas principales</th></tr></thead><tbody><tr><td>Product Manager (PM)</td><td>Estratégica</td><td>¿Por qué existe este producto? ¿A quién sirve? ¿A dónde va?</td><td>Roadmap, visión, investigación de mercado, stakeholders</td></tr><tr><td>Product Owner (PO)</td><td>Táctica</td><td>¿Qué entra en el próximo sprint? ¿Con qué criterios se aprueba?</td><td>Backlog, historias de usuario, criterios de aceptación</td></tr><tr><td>Scrum Master</td><td>Proceso</td><td>¿El equipo tiene lo que necesita para trabajar sin fricción?</td><td>Ceremonias Scrum, bloqueos, mejora continua</td></tr><tr><td>UX Designer</td><td>Experiencia</td><td>¿El usuario puede usar esto intuitivamente?</td><td>Investigación de usuarios, wireframes, prototipos</td></tr><tr><td>Desarrolladores</td><td>Construcción</td><td>¿Cómo se construye esto técnica y eficientemente?</td><td>Código, arquitectura, estimaciones, reviews</td></tr><tr><td>QA</td><td>Calidad</td><td>¿Esto funciona como se espera antes de llegar al usuario?</td><td>Testing manual y automatizado, reporte de bugs</td></tr></tbody></table>
<p>Nota: en muchas empresas — especialmente startups — el PM y el PO son la misma persona. En empresas más grandes pueden ser roles separados. La distinción no es de jerarquía — es de horizonte temporal y foco.</p>
<div class="tag bonus-track"><strong>★ Bonus track</strong><p>La pregunta ''¿quién manda en un equipo de producto?'' no tiene una respuesta simple. El PM define qué construir y por qué. Los devs definen cómo construirlo. El diseñador define cómo se ve y se usa. El Scrum Master facilita el proceso. Los productos que funcionan nacen de la tensión productiva entre todos esos roles — no del dominio de uno sobre los demás.</p></div>',
  ARRAY['bonus-track'],
  'concepto',
  'intermedio',
  7,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'mvp-el-concepto-mas-mal-usado',
  'MVP — el concepto más mal usado de la industria',
  'Un MVP no es una versión barata o incompleta del producto final.',
  '<p>MVP (Minimum Viable Product — Producto Mínimo Viable) es uno de los conceptos más usados y más malentendidos. Un MVP no es una versión barata o incompleta del producto final. Es la versión más pequeña posible de un producto que permite validar la hipótesis central del negocio con usuarios reales. El objetivo no es lanzar rápido — es aprender rápido.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Si querés validar si la gente quiere un servicio de delivery de comida saludable, tu MVP no necesita ser una app. Puede ser un grupo de WhatsApp donde tomás pedidos manualmente. Si nadie pide por WhatsApp, no tiene sentido construir la app. Si la gente pide, tenés una señal real para invertir en tecnología. Eso es un MVP — validar la hipótesis con el mínimo esfuerzo posible.</p></div>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>Dropbox no fue lanzado como un producto — fue lanzado como un video de demostración. Antes de escribir una línea de código, el fundador Drew Houston quería saber si la gente quería eso. Cuando el video se hizo viral en la comunidad tech, la lista de espera del beta explotó de 5.000 a 75.000 registros en una sola noche. Eso fue señal suficiente para construir el producto real. El MVP de Dropbox no tenía código.</p></div>',
  ARRAY['pensalo-asi', 'dato-color'],
  'concepto',
  'intermedio',
  8,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'del-codigo-a-los-usuarios-ambientes-deploy-cicd',
  'Del código a los usuarios — ambientes, deploy y CI/CD',
  'Una vez que el equipo construye algo, ¿cómo llega al usuario?',
  '<p>Una vez que el equipo construye algo, ¿cómo llega al usuario? Hay un proceso que casi nadie fuera del mundo técnico conoce — y que explica por qué ''subir un cambio'' no es simplemente apretar un botón.</p>
<table><thead><tr><th>Ambiente</th><th>Quién lo ve</th><th>Para qué</th></tr></thead><tbody><tr><td>Development (dev)</td><td>Solo los desarrolladores</td><td>Donde se construye y prueba localmente. Nadie más lo ve.</td></tr><tr><td>Staging</td><td>El equipo interno</td><td>Copia casi idéntica a producción para testear antes de lanzar. Simula el ambiente real sin afectar usuarios.</td></tr><tr><td>Production (prod)</td><td>Los usuarios reales</td><td>El ambiente real. Un error acá tiene consecuencias reales.</td></tr></tbody></table>
<p><strong>CI/CD (Continuous Integration / Continuous Deployment)</strong> son dos etapas distintas del mismo proceso automatizado:</p>
<p><strong>CI (Continuous Integration)</strong> — cada vez que un desarrollador sube código, un sistema automatizado lo integra con el resto del proyecto y ejecuta tests para detectar si algo se rompió. Es una práctica de calidad que permite que muchos desarrolladores trabajen en paralelo sin pisarse.</p>
<p><strong>CD (Continuous Deployment)</strong> — una vez que el código pasó por CI, el deploy a producción ocurre automáticamente (o semi-automáticamente con aprobación humana). Es una práctica de velocidad. Un equipo puede tener CI sin CD — integra y testea automáticamente, pero el deploy a producción requiere aprobación manual. En sectores regulados como fintech o salud eso es muy común.</p>
<p>¿Por qué le importa esto a alguien que no programa? Porque determina directamente la velocidad a la que el equipo puede responder al feedback. Un equipo con CI/CD maduro puede lanzar un fix en horas. Un equipo sin él puede tardar semanas.</p>
<div class="tag en-criollo"><strong>■ En criollo</strong><p>CI/CD es como tener una línea de montaje con control de calidad automático en cada paso, en lugar de ensamblar todo el auto y recién entonces revisar si funciona al final. Si algo falla, lo detectás en la pieza — no cuando el auto ya está vendido y el cliente lo devuelve.</p></div>',
  ARRAY['en-criollo'],
  'concepto',
  'intermedio',
  9,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'deuda-tecnica',
  'Deuda técnica — el fantasma que todo PM necesita entender',
  'La deuda técnica es el costo futuro de haber tomado atajos en el presente para entregar más rápido.',
  '<p>La deuda técnica (tech debt) es el costo futuro de haber tomado atajos en el presente para entregar más rápido. El término fue acuñado por Ward Cunningham, uno de los autores del Manifiesto Ágil, precisamente para explicar este concepto a stakeholders no técnicos.</p>
<p>Su metáfora original: ''Con dinero prestado podés hacer algo antes — pero hasta que lo devolvés, pagás intereses. El código apresurado funciona igual.''</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>La deuda técnica es exactamente como la deuda financiera. Un préstamo para arrancar un negocio puede ser una decisión inteligente. Seguir pidiendo préstamos sin pagar nunca el capital, acumulando intereses, hasta que el negocio colapsa bajo el peso de las deudas — eso es lo que pasa cuando la deuda técnica no se gestiona.</p></div>
<p>Según una encuesta de Protiviti, casi 7 de cada 10 empresas creen que la deuda técnica está frenando su capacidad de innovar. El promedio de las empresas gasta el 30% de su presupuesto de IT gestionando deuda técnica existente.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>La deuda técnica más peligrosa es la invisible — la que nadie sabe que existe hasta que algo se rompe en producción a las 3 de la mañana. El código que ''funciona'' pero que nadie entiende, que fue escrito hace tres años por alguien que ya no está en el equipo, y que nadie se animó a tocar porque podría romper todo. Ese es el tipo de deuda que paraliza equipos enteros. Para PMs: cuando tu equipo técnico pide tiempo para ''refactorizar'', no están siendo lentos ni caprichosos — están tratando de pagar deuda antes de que los intereses hagan imposible seguir avanzando.</p></div>',
  ARRAY['pensalo-asi', 'vuelta-tecnica'],
  'concepto',
  'intermedio',
  10,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'product-market-fit',
  'Product-Market Fit — el momento que todo lo cambia',
  'Product-market fit (PMF) es el momento en que un producto encuentra el mercado que lo necesita.',
  '<p>Product-market fit (PMF) es el momento en que un producto encuentra el mercado que lo necesita de verdad. Es el hilo conductor que une el MVP (¿llegamos al PMF?), las métricas (¿cómo lo medimos?) y el roadmap (¿qué construimos ahora que sabemos que hay PMF?). Sin PMF, todo lo demás es prematuro.</p>
<p>Marc Andreessen, quien acuñó el término, dijo que es ''el único momento que importa en la vida de una startup.'' Sean Ellis lo operacionalizó con una pregunta simple a usuarios activos: ''¿Qué tan decepcionado/a estarías si este producto desapareciera mañana?'' Si más del 40% responde ''muy decepcionado'', hay PMF. Si no, no hay PMF todavía — y hay que ajustar antes de escalar.</p>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Un producto sin PMF que escala es como agregar pisos a un edificio con cimientos débiles — crece más rápido, pero colapsa peor. El error clásico es confundir tracción inicial (muchos registros, mucho buzz en redes) con PMF real. La métrica que no miente es la retención: si los usuarios que llegaron siguen usando el producto semanas después, hay una señal real. Si no siguen, no importa cuántos llegaron.</p></div>',
  ARRAY['spoiler-tecnico'],
  'concepto',
  'intermedio',
  11,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'metricas-como-sabes-si-el-producto-funciona',
  'Métricas — cómo sabés si el producto está funcionando',
  'Lanzar el producto es el comienzo, no el final. Después viene medir.',
  '<p>Lanzar el producto es el comienzo, no el final. Después viene medir. La clave es entender la jerarquía de las métricas — no son todas iguales ni sirven para lo mismo:</p>
<table><thead><tr><th>Tipo</th><th>Función</th><th>Ejemplos reales</th></tr></thead><tbody><tr><td>North Star Metric</td><td>El norte unificador de todo el equipo. La métrica que mejor captura el valor central que el producto entrega. Si crece de forma sostenida, el producto está generando valor real.</td><td>Spotify: tiempo de escucha. Airbnb: noches reservadas. Facebook (etapa temprana): usuarios que agregan 7 amigos en 10 días.</td></tr><tr><td>Métricas de ciclo de vida</td><td>Monitorean la salud del producto en cada etapa del usuario: activación, retención, churn, DAU/MAU, NPS.</td><td>Activación: ¿el usuario llegó al primer ''aha''? Retención: ¿sigue usando el producto 30 días después? Churn: ¿cuántos abandonaron?</td></tr><tr><td>OKRs</td><td>Conectan la North Star con los objetivos del negocio. Objetivo cualitativo + resultados clave cuantificables. Se revisan trimestralmente.</td><td>Objetivo: mejorar retención mes 1. KR1: activación del día 1 de 40% a 60%. KR2: churn de 45% a 30%. KR3: NPS de nuevos usuarios de 32 a 45.</td></tr><tr><td>Vanity metrics</td><td>El anti-patrón. Métricas que se ven bien en presentaciones pero no dicen nada sobre la salud real del producto.</td><td>Descargas totales (sin medir retención). Registros en landing (sin medir onboarding). Seguidores en redes (sin medir conversión).</td></tr></tbody></table>
<p>Los OKRs (Objectives and Key Results) fueron desarrollados en Intel en los años 70 por Andy Grove, popularizados en Google por John Doerr, y hoy los usan LinkedIn, Spotify, Uber, Microsoft, y prácticamente todas las empresas tech de escala. Son la forma de conectar la estrategia de largo plazo con el trabajo del sprint de esta semana.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>La North Star de Facebook en sus etapas tempranas — ''usuarios que agregan 7 amigos en los primeros 10 días'' — es el ejemplo más poderoso de por qué elegir la métrica correcta cambia todo. No fue obvia: requirió análisis de datos para descubrir que ese comportamiento específico correlacionaba perfectamente con la retención a largo plazo.</p></div>',
  ARRAY['vuelta-tecnica'],
  'concepto',
  'intermedio',
  12,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-5'),
  'los-equipos-en-el-ecosistema-latinoamericano',
  'Los equipos en el ecosistema latinoamericano',
  'En startups early-stage los roles frecuentemente se superponen.',
  '<div class="tag latam"><strong>■■ La realidad del ecosistema regional</strong><p>En startups early-stage los roles frecuentemente se superponen — una misma persona puede ser PM, PO, y hacer algo de QA según el día. Eso no es improvisación — es la realidad de equipos pequeños donde la versatilidad es una ventaja. En empresas tech más maduras como MercadoLibre, Rappi o Ualá, los equipos usan metodologías Agile maduras con roles claramente definidos y múltiples squads trabajando en paralelo. El modelo de squads — equipo pequeño, autónomo y multidisciplinario responsable de una parte del producto — viene del modelo organizacional de Spotify de 2012 y hoy es el estándar en las empresas tech más grandes de la región.</p></div>',
  ARRAY['latam'],
  'caso_real',
  'intermedio',
  13,
  'publicado'
);

-- =============================================================
-- BLOQUE 6 — Qué es la IA
-- =============================================================

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'el-malentendido-mas-grande-sobre-la-ia',
  'El malentendido más grande sobre la IA',
  'Cuando la gente habla de ''inteligencia artificial'' en 2026, generalmente está hablando de cosas distintas.',
  '<p>Cuando la gente habla de ''inteligencia artificial'' en 2026, generalmente está hablando de tres o cuatro cosas distintas sin distinguirlas. Mezcla ChatGPT con las recomendaciones de Netflix con los autos que se manejan solos con los robots de la ciencia ficción. Ese malentendido genera tanto pánico exagerado como confianza excesiva. Este bloque existe para reemplazarlo con un mapa claro.</p>',
  ARRAY[]::text[],
  'concepto',
  'avanzado',
  1,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'las-matrioskas-ia-ml-deep-learning-ia-generativa',
  'Las matrioskas — IA, Machine Learning, Deep Learning e IA Generativa',
  'La mejor forma de entender cómo se relacionan estos conceptos es imaginar muñecas matrioskas.',
  '<p>La mejor forma de entender cómo se relacionan estos conceptos es imaginar muñecas matrioskas — esas muñecas rusas que encajan una dentro de la otra. Cada capa contiene a la anterior y agrega algo nuevo encima.</p>
<table><thead><tr><th>Capa</th><th>Nombre</th><th>Qué es</th><th>Ejemplo</th></tr></thead><tbody><tr><td>1 (la más amplia)</td><td>Inteligencia Artificial</td><td>Cualquier sistema diseñado para realizar tareas que típicamente requieren inteligencia humana — tomar decisiones, reconocer patrones, responder a estímulos</td><td>Un termostato que enciende la calefacción cuando la temperatura baja de cierto punto</td></tr><tr><td>2</td><td>Machine Learning</td><td>En lugar de programar explícitamente las reglas, le damos al sistema ejemplos y dejamos que encuentre las reglas por sí mismo</td><td>Un filtro de spam que aprende a detectar spam a partir de miles de ejemplos — sin que nadie le escriba las reglas</td></tr><tr><td>3</td><td>Deep Learning</td><td>ML que usa redes neuronales con múltiples capas. Puede procesar datos no estructurados (imágenes, audio, texto) y encontrar patrones que ningún humano podría programar</td><td>Reconocimiento facial de tu teléfono, subtítulos automáticos de YouTube, detección de cáncer en imágenes médicas</td></tr><tr><td>4 (la más específica)</td><td>IA Generativa</td><td>Usa todo lo anterior para crear contenido original — texto, imágenes, audio, video, código. No solo reconoce patrones existentes: genera nuevos</td><td>ChatGPT, Claude, Midjourney, Sora, GitHub Copilot</td></tr></tbody></table>
<div class="tag resumen-subte"><strong>■ El resumen para contarle a alguien en el subte</strong><p>IA es el campo. Machine Learning es la técnica de aprender de datos. Deep Learning es ML con redes neuronales complejas. IA Generativa es Deep Learning aplicado a crear cosas nuevas. Son capas que se construyen una sobre la otra — no tecnologías competidoras.</p></div>',
  ARRAY['resumen-subte'],
  'concepto',
  'avanzado',
  2,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'como-funciona-un-llm',
  'Cómo funciona un LLM — sin matemática',
  'ChatGPT, Claude, Gemini — todos son Large Language Models (LLMs).',
  '<p>ChatGPT, Claude, Gemini — todos son Large Language Models (LLMs). Son modelos de lenguaje entrenados sobre enormes cantidades de texto. ''Large'' se refiere tanto a los datos de entrenamiento (billones de palabras) como a la cantidad de parámetros internos — los números ajustables del modelo que pueden llegar a los cientos de miles de millones.</p>
<h3>El pre-entrenamiento: aprender prediciendo</h3>
<p>Un LLM aprende haciendo una tarea aparentemente simple: predecir la siguiente palabra en una secuencia. Se le muestra texto con palabras ocultas y tiene que adivinar cuáles son. Hace eso miles de millones de veces — ajustando sus parámetros internos cada vez que se equivoca — hasta que se vuelve muy bueno en predecir qué texto viene después de qué texto.</p>
<p>Lo revelador: para predecir bien el texto, el modelo termina aprendiendo implícitamente gramática, hechos sobre el mundo, relaciones entre conceptos, estilos de escritura, y patrones de razonamiento — todo sin que nadie se lo enseñe explícitamente. Todo emerge del objetivo de predecir la siguiente palabra a escala masiva.</p>
<h3>RLHF — cómo un modelo predictivo se convierte en un asistente útil</h3>
<p>Un modelo que solo hizo pre-entrenamiento es bueno completando texto — pero no necesariamente útil. Si le escribís ''El mejor restaurante de Buenos Aires es...'' te completa con lo más estadísticamente probable, no con lo más útil para vos.</p>
<p>RLHF (Reinforcement Learning from Human Feedback — Aprendizaje por Refuerzo con Feedback Humano) es la segunda etapa que convierte eso en un asistente. Evaluadores humanos califican distintos outputs del modelo según cuáles son más útiles, honestos y seguros. Esas calificaciones entrenan un modelo de recompensa. Ese modelo de recompensa se usa para afinar el LLM para que responda como los humanos prefieren.</p>
<p>Esa es la diferencia entre GPT-base (solo pre-entrenamiento) y ChatGPT (pre-entrenamiento + RLHF). Lo que parece ''personalidad'' o ''sentido común'' en un chatbot es en gran parte el resultado de ese proceso de alineación humana.</p>',
  ARRAY[]::text[],
  'concepto',
  'avanzado',
  3,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'tokens-la-unidad-basica-del-lenguaje-para-un-llm',
  'Tokens — la unidad básica del lenguaje para un LLM',
  'Un LLM no procesa palabras directamente — procesa tokens.',
  '<p>Un LLM no procesa palabras directamente — procesa tokens. Un token es un fragmento de texto: a veces una palabra completa, a veces parte de una palabra, a veces un símbolo de puntuación. La palabra ''hola'' puede ser un token. La palabra ''inteligencia'' puede dividirse en dos o tres tokens.</p>
<p>Esto explica algunos comportamientos extraños de los LLMs — como que cuenten mal las letras de una palabra, o que cometan errores aritméticos simples. No están procesando letras ni números directamente — están procesando tokens, y ciertas operaciones que para un humano son triviales requieren razonamiento explícito que el modelo puede no tener.</p>',
  ARRAY[]::text[],
  'concepto',
  'avanzado',
  4,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'context-window-el-limite-de-lo-que-el-modelo-ve',
  'Context window — el límite de lo que el modelo ''ve''',
  'El context window es la cantidad máxima de texto que un LLM puede ''ver'' simultáneamente.',
  '<p>El context window (ventana de contexto) es la cantidad máxima de texto que un LLM puede ''ver'' simultáneamente en una conversación. Todo lo que está fuera de esa ventana no existe para el modelo — no lo recuerda, no puede usarlo.</p>
<table><thead><tr><th>Modelo</th><th>Context window aproximado</th></tr></thead><tbody><tr><td>GPT-4 (OpenAI)</td><td>~128.000 tokens</td></tr><tr><td>Claude 3.5 Sonnet / Claude 4 (Anthropic)</td><td>~200.000 tokens (Claude Opus 4 con 1M de contexto disponible)</td></tr><tr><td>Gemini 1.5 Pro (Google)</td><td>~2.000.000 tokens</td></tr><tr><td>Gemini 2.0 (Google)</td><td>~1.000.000 tokens</td></tr></tbody></table>
<p>Nota: estos tamaños son correctos a la fecha de escritura (2026) pero evolucionan con cada nueva versión de cada modelo. Lo importante es el concepto, no los números exactos.</p>
<p>Consecuencias prácticas observables: por qué el modelo ''olvida'' cosas que dijiste al inicio de una conversación larga, por qué pegar un documento muy extenso puede degradar la calidad de las respuestas, por qué algunos modelos manejan mejor documentos extensos que otros. Cuando una conversación supera la ventana de contexto, las partes más antiguas desaparecen del ''campo visual'' del modelo.</p>',
  ARRAY[]::text[],
  'concepto',
  'avanzado',
  5,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'lo-que-la-ia-hace-bien-y-lo-que-hace-mal',
  'Lo que la IA hace bien y lo que hace mal — sin romantizar',
  'Los LLMs generan texto fluido y coherente, pero cometen errores en razonamiento matemático complejo.',
  '<table><thead><tr><th>Lo que los LLMs hacen bien</th><th>Lo que los LLMs hacen mal o con limitaciones</th></tr></thead><tbody><tr><td>Generar texto fluido y coherente sobre temas bien representados en sus datos de entrenamiento</td><td>Razonamiento matemático complejo — cometen errores en operaciones que cualquier calculadora resolvería</td></tr><tr><td>Resumir y reorganizar información</td><td>Hechos muy específicos o recientes — su conocimiento tiene fecha de corte</td></tr><tr><td>Traducir entre idiomas</td><td>Información sobre personas privadas o temas poco representados en internet</td></tr><tr><td>Generar código funcional para tareas conocidas</td><td>Tomar decisiones con consecuencias reales sin supervisión humana</td></tr><tr><td>Explicar conceptos de múltiples formas</td><td>Saber cuándo no saben algo — tienden a responder con confianza aunque estén equivocados</td></tr></tbody></table>',
  ARRAY[]::text[],
  'concepto',
  'avanzado',
  6,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'alucinaciones',
  'Alucinaciones — el problema técnico más importante que hay que entender',
  'El término alucinación en IA describe cuando un modelo genera información falsa con total confianza.',
  '<p>El término alucinación en IA describe cuando un modelo genera información falsa con total confianza — como si fuera un hecho verificado. No es que el modelo ''mienta'' deliberadamente. Es una consecuencia de cómo funciona: predice qué texto es estadísticamente probable que venga después, sin tener un mecanismo interno que verifique si lo que genera es verdad.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Un LLM es excepcionalmente bueno en sonar coherente y confiado. Esas dos cualidades — coherencia y confianza — no tienen correlación necesaria con la veracidad. Un modelo puede generar una cita bibliográfica perfectamente formateada de un paper que no existe, con autores reales y una revista real, pero el artículo es completamente inventado. Suena verdad porque el formato es correcto. No lo es.</p></div>
<div class="tag dato-color"><strong>✦ Dato de color</strong><p>En 2023, un abogado de Nueva York presentó ante la justicia federal citas de casos legales generadas por ChatGPT — casos que no existían. El juez descubrió que las referencias eran inventadas. ChatGPT había generado títulos de casos perfectamente plausibles, con nombres de jueces reales y fechas reales — pero los casos eran ficticios. El abogado fue multado con 5.000 dólares. El modelo no supo que no sabía. Fuente: MIT Sloan (caso Mata v. Avianca).</p></div>
<p>Esto tiene implicancias prácticas directas: cualquier output de un LLM que involucre hechos específicos, cifras, citas, o información técnica requiere verificación independiente antes de usarse en un contexto donde la exactitud importa.</p>',
  ARRAY['pensalo-asi', 'dato-color'],
  'concepto',
  'avanzado',
  7,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'sesgos-en-la-ia',
  'Sesgos en la IA — de dónde vienen y por qué importan',
  'Los modelos de IA aprenden de datos generados por humanos. Y los humanos tienen sesgos.',
  '<p>Los modelos de IA aprenden de datos generados por humanos. Y los humanos tienen sesgos — históricos, culturales, sociales. Esos sesgos quedan codificados en los modelos.</p>
<p><strong>Origen técnico:</strong> los datos de entrenamiento sobrerepresentan algunas culturas, idiomas y perspectivas — y subrepresentan otras. Un modelo entrenado mayormente en inglés y en contenido de Estados Unidos y Europa tendrá una visión del mundo sesgada hacia esa perspectiva. Cuando ese modelo se despliega en Argentina, Colombia o México, las respuestas pueden no reflejar el contexto local.</p>
<p><strong>Amplificación del status quo:</strong> cuando un modelo refuerza las asociaciones más frecuentes en sus datos, amplifica el status quo — incluyendo sus desigualdades. No es neutralidad, es amplificación estadística del pasado.</p>
<p><strong>Ejemplo documentado:</strong> el proyecto Gender Shades de Joy Buolamwini (MIT) encontró disparidades del orden del 30% en tasas de error entre mujeres de piel oscura y hombres de piel clara en sistemas comerciales de reconocimiento facial.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Los sesgos en la IA son un argumento técnico a favor del código abierto — si el código y los datos de entrenamiento son auditables por investigadores independientes, los sesgos pueden ser detectados y corregidos. En modelos cerrados, esa auditoría es imposible. Para PMs: si estás construyendo un producto que usa IA para tomar decisiones sobre personas — filtrar CVs, aprobar créditos, recomendar contenido — los sesgos del modelo son sesgos del producto. Son tu responsabilidad.</p></div>',
  ARRAY['vuelta-tecnica'],
  'concepto',
  'avanzado',
  8,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'la-arquitectura-transformer',
  'La arquitectura Transformer — vuelta de tuerca técnica',
  'El mecanismo que hace posibles los LLMs modernos se llama Transformer.',
  '<p>El mecanismo que hace posibles los LLMs modernos se llama Transformer, introducido en el paper ''Attention Is All You Need'' de investigadores de Google en 2017. La idea central: el modelo puede prestar atención a cualquier parte del texto de entrada simultáneamente, independientemente de qué tan lejos esté — no tiene que procesar el texto palabra por palabra.</p>
<p>Esto permite que cuando el modelo procesa la palabra ''ella'' en la oración ''La doctora entró a la sala y ella revisó los resultados'', entienda que ''ella'' se refiere a ''la doctora'' y no a cualquier otra mujer mencionada — incluso si hay mucho texto entre las dos referencias. Esa capacidad de relacionar cualquier parte del texto con cualquier otra es lo que se llama mecanismo de atención.</p>
<div class="tag vuelta-tecnica"><strong>■ La vuelta de tuerca técnica</strong><p>Antes del Transformer, el estado del arte eran las redes recurrentes (RNNs) — que procesaban el texto secuencialmente, palabra por palabra. Tenían un problema fundamental: ''olvidaban'' el contexto de hace muchas palabras. El Transformer eliminó ese problema al permitir que cada token preste atención a todos los demás simultáneamente. El paper ''Attention Is All You Need'' es uno de los trabajos académicos más citados de la historia de la computación — en solo 9 años cambió completamente el campo.</p></div>',
  ARRAY['vuelta-tecnica'],
  'concepto',
  'avanzado',
  9,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'rag-la-solucion-a-las-alucinaciones',
  'RAG — la solución más importante a las alucinaciones',
  'RAG permite a un LLM acceder a información externa en tiempo real antes de generar su respuesta.',
  '<p>RAG (Retrieval-Augmented Generation — Generación Aumentada por Recuperación) es la técnica por la cual un LLM puede acceder a información externa en tiempo real antes de generar su respuesta — documentos, bases de datos, búsquedas web — en lugar de depender exclusivamente de lo que aprendió durante el entrenamiento.</p>
<p>Es la solución más usada al problema de las alucinaciones y al problema del knowledge cutoff (fecha de corte de conocimiento). Cuando un chatbot de atención al cliente responde correctamente sobre la política de devoluciones actualizada de hoy, no es que el LLM la memorizó — es que tiene RAG: busca la información en la documentación oficial antes de responder.</p>
<div class="tag pensalo-asi"><strong>■ Pensalo así</strong><p>Sin RAG, el LLM es como un experto que estudió muchísimo hasta hace un año y desde entonces no leyó nada nuevo. Sabe mucho, pero su conocimiento tiene una fecha de vencimiento y puede inventar cosas sobre temas donde sus datos son escasos. Con RAG, ese mismo experto puede consultar documentos actualizados antes de responderte — sus respuestas son más precisas y actualizadas.</p></div>
<div class="tag bonus-track"><strong>★ Bonus track</strong><p>La biblioteca que estás leyendo usa RAG en su versión HTML interactiva: el asistente de IA puede acceder al contenido de los bloques antes de responderte, lo que reduce significativamente las alucinaciones sobre temas específicos del contenido. Es exactamente la arquitectura que veremos en el Bloque 9 de automatizaciones.</p></div>',
  ARRAY['pensalo-asi', 'bonus-track'],
  'herramienta',
  'avanzado',
  10,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'agi-que-es-y-por-que-el-debate-importa',
  'AGI — qué es y por qué el debate importa',
  'AGI (Artificial General Intelligence) es una IA que podría realizar cualquier tarea intelectual humana.',
  '<p>AGI (Artificial General Intelligence — Inteligencia Artificial General) es el nombre técnico para una IA que podría realizar cualquier tarea intelectual que un humano puede realizar — con la misma flexibilidad, adaptabilidad y comprensión general. Lo que HAL 9000 o los robots de la ciencia ficción representan.</p>
<p>Los LLMs actuales NO son AGI. Son extremadamente buenos en tareas de lenguaje y razonamiento basado en texto, pero carecen de comprensión genuina del mundo, de capacidad de aprender de forma continua de nuevas experiencias sin re-entrenamiento, y de agencia real sobre su entorno.</p>
<div class="tag spoiler-tecnico"><strong>■ Spoiler técnico</strong><p>Cuando una empresa anuncia que ''alcanzó la AGI'' o que está ''muy cerca'', conviene leer los detalles con cuidado. La definición de AGI es lo suficientemente vaga como para ser usada de formas muy distintas. Lo que importa para el usuario no-técnico es distinguir entre ''este modelo hace esto muy bien'' y ''este modelo puede hacer cualquier cosa que un humano puede hacer'' — dos afirmaciones radicalmente distintas.</p></div>',
  ARRAY['spoiler-tecnico'],
  'concepto',
  'avanzado',
  
  11,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'ia-en-latinoamerica',
  'IA en Latinoamérica — el ecosistema regional',
  'NotCo (Chile) usa IA para diseñar productos de origen vegetal. MercadoLibre usa ML para detección de fraude.',
  '<div class="tag latam"><strong>■■ IA en la región</strong><p><strong>NotCo (Chile)</strong> — empresa de foodtech latinoamericana unicornio que usa IA para diseñar productos de origen vegetal que replican el sabor y textura de la carne y los lácteos. Su algoritmo ''Giuseppe'' analiza miles de ingredientes y sus combinaciones para encontrar perfiles de sabor que imiten productos animales. Uno de los casos más conocidos de IA aplicada a la industria de alimentos en la región.</p>
<p><strong>MercadoLibre</strong> — usa ML extensivamente para detección de fraude en tiempo real en MercadoPago, sistemas de recomendación de productos, y predicción de demanda en su red logística.</p>
<p><strong>El desafío del idioma:</strong> los modelos de lenguaje están predominantemente entrenados en inglés. El español, y mucho más las variantes regionales del español latinoamericano, están subrepresentados. Los modelos tienden a desempeñarse mejor en inglés — un área activa de investigación y desarrollo.</p></div>',
  ARRAY['latam'],
  'caso_real',
  'avanzado',
  12,
  'publicado'
);

INSERT INTO nodos (bloque_id, slug, titulo, resumen_corto, contenido_html, tags, tipo, dificultad, orden_en_bloque, estado)
VALUES (
  (SELECT id FROM bloques WHERE slug = 'bloque-6'),
  'las-preguntas-que-no-tienen-respuesta-simple',
  'Las preguntas que no tienen respuesta simple — y por qué hay que hacerlas',
  '¿Quién es responsable cuando la IA se equivoca? ¿De quién son los datos? ¿Qué pasa con el empleo?',
  '<p><strong>¿Quién es responsable cuando la IA se equivoca?</strong> El caso de Air Canada es ilustrativo: en 2024, un tribunal canadiense ordenó a la aerolínea pagar daños a un cliente por información incorrecta que su chatbot había dado sobre una política de tarifas. Air Canada argumentó que el chatbot era ''una entidad legal separada responsable de sus propias acciones.'' El tribunal rechazó ese argumento. Quien despliega la IA es responsable de sus outputs.</p>
<p><strong>¿De quién son los datos que entrenan los modelos?</strong> Las empresas de IA entrenaron sus modelos con texto e imágenes de internet — incluyendo obras con derechos de autor. Los debates legales sobre esto están activos en múltiples jurisdicciones y no tienen resolución clara todavía.</p>
<p><strong>¿Qué pasa con el empleo?</strong> La IA automatiza tareas, no necesariamente trabajos completos. Un trabajo es un conjunto de tareas. La pregunta relevante no es ''¿la IA va a reemplazar mi trabajo?'' sino ''¿qué tareas de mi trabajo puede automatizar la IA, y hacia dónde puedo redirigir mi energía?'' — que es exactamente lo que exploramos en el Bloque 8.</p>',
  ARRAY[]::text[],
  'concepto',
  'avanzado',
  13,
  'publicado'
);
