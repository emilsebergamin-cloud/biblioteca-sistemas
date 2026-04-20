# Revision Editorial — Biblioteca de IA y Sistemas

**Fecha de revision:** 2026-04-20
**Revisado por:** Claude Opus 4.6
**Documentos revisados:** biblioteca_bloques_123.pdf y biblioteca_bloques_456.pdf

---

## BLOQUE 1 — Como piensan las computadoras

### Lo que esta bien

- Excelente apertura con la analogia del mate para explicar algoritmos. Conecta inmediatamente con el publico argentino.
- La tabla comparativa de Python/JavaScript/SQL con la columna "donde lo vas a escuchar" es muy practica y original.
- La analogia chef/mozo/inventario para los lenguajes es memorable y precisa.
- La explicacion de compilado vs interpretado con la analogia del libro traducido es clara y tecnica a la vez.
- Las secciones de variables, funciones y condiciones estan muy bien escritas — simples sin ser simplistas.
- La distincion libreria vs framework con "vos llamas al codigo / el framework te llama a vos" (inversion de control) es tecnicament correcta y clara.
- La seccion de codigo abierto vs cerrado conecta bien con el debate actual de IA.

### Lo que necesita correccion

1. **React: "libreria" vs realidad actual**
   - El texto dice "React es una libreria de JavaScript de codigo abierto mantenida por Meta". Esto es tecnicament correcto segun la definicion oficial de React, pero en la practica React con su ecosistema (React Router, estado, hooks) funciona mas como un framework. Podria agregarse una nota aclaratoria: "Aunque oficialmente se define como libreria, en la practica React y su ecosistema funcionan con muchas convenciones propias de un framework."
   - **Confianza:** medio — es un debate activo en la industria, la definicion oficial dice libreria.

2. **Stack Overflow Developer Survey 2025 — React como "una de las tecnologias web mas usadas del mundo"**
   - La afirmacion es vaga. El survey tiene categorias especificas. Seria mejor citar la posicion exacta o el porcentaje, o al menos decir "segun el Stack Overflow Developer Survey 2025, React sigue entre las tecnologias de frontend mas adoptadas".
   - **Confianza:** medio — la afirmacion general es probablemente correcta, pero la imprecision resta credibilidad en un documento que promete fuentes verificadas.

3. **MercadoLibre: "mas de 15.000 ingenieros" y "mas de 30.000 microservicios"**
   - Estas cifras son plausibles pero dificiles de verificar con precision. MercadoLibre tenia aprox. 12.000-15.000 empleados en ingenieria hacia 2024-2025. Las cifras pueden haber cambiado. Se sugiere agregar "aproximadamente" o "(dato de 2024/2025)".
   - **Confianza:** medio — las cifras son del orden correcto pero podrian estar desactualizadas.

4. **npm: "mas de 2 millones de paquetes"**
   - A principios de 2025, npm supero los 3 millones de paquetes. Para 2026, la cifra de "2 millones" esta desactualizada.
   - **Sugerencia:** Cambiar a "mas de 3 millones de paquetes disponibles" o simplemente "millones de paquetes".
   - **Confianza:** alto — dato verificable en npm stats.

5. **Open source acunado en 1998 — Christine Peterson**
   - Dato correcto. Christine Peterson propuso el termino, confirmado por la OSI.
   - **Confianza:** alto.

6. **"Python es interpretado"**
   - Esto es una simplificacion comun. CPython (la implementacion principal) compila a bytecode y luego lo interpreta en una maquina virtual. Otras implementaciones como PyPy usan JIT. Para el publico objetivo esta simplificacion es aceptable pero deberia decir "Python se usa tipicamente como un lenguaje interpretado" en vez de afirmar categoricamente que "es interpretado".
   - **Confianza:** alto — la simplificacion es estandar en educacion introductoria, pero es una imprecision tecnica.

7. **Tag editorial "Para los curiosos" en Bloque 3 no esta en la guia de tags**
   - En la pagina de "Como usar esta biblioteca" los tags definidos son: Pensalo asi / En criollo / El resumen para contarle a alguien en el subte, Dato de color, La vuelta de tuerca tecnica / Spoiler tecnico, Bonus track, En Argentina y Latinoamerica. Sin embargo, en el Bloque 3 aparece un tag "Para los curiosos" que no esta en la guia. Deberia reemplazarse por uno de los tags oficiales (probablemente "Spoiler tecnico" o "Bonus track").
   - **Confianza:** alto — inconsistencia verificable.

8. **Temperatura del mate: "80 grados"**
   - Tecnicamente la temperatura recomendada del agua para mate es entre 70-80 grados. Decir "esperás que baje a 80" esta bien como dato general pero algunos materos dirian que es alta. Es un detalle menor que no afecta la analogia.
   - **Confianza:** alto — no afecta el contenido tecnico.

### Tags editoriales — Bloque 1

- Spoiler tecnico: usado correctamente (algoritmos de Instagram).
- Pensalo asi: usado correctamente en 3 instancias.
- En criollo: usado correctamente en 3 instancias.
- La vuelta de tuerca tecnica: usado correctamente (JavaScript JIT, TypeScript transpilacion).
- El resumen para contarle a alguien en el subte: usado correctamente (React/Instagram).
- Dato de color: usado correctamente (open source 1998).
- En Argentina y Latinoamerica: usado correctamente (MercadoLibre).
- **Observacion:** buena distribucion de tags. No hay seccion sin al menos un tag contextual.

### Flujo logico

Excelente progresion: algoritmos -> lenguajes -> compilado/interpretado -> lenguajes especificos -> conceptos basicos (variables, funciones, condiciones) -> frameworks/librerias -> React -> Node.js -> TypeScript -> npm -> codigo abierto. La secuencia construye conocimiento de forma acumulativa.

---

## BLOQUE 2 — Como se guarda la informacion

### Lo que esta bien

- La analogia de la verduleria para introducir bases de datos es perfecta para el publico objetivo.
- La comparacion Excel vs base de datos es un punto de entrada excelente — muchos lectores no-tecnicos usan Excel como "base de datos".
- La explicacion de SQL con el ejemplo en castellano es brillante pedagogicamente.
- La tabla ACID esta impecable — cada propiedad bien definida con lenguaje accesible.
- La analogia de la mudanza para ACID es precisa y memorable.
- Los cuatro tipos de bases NoSQL estan bien enumerados con sus casos de uso.
- La mencion de Supabase conecta directamente con el stack del proyecto.

### Lo que necesita correccion

1. **Edgar F. Codd — paper de 1970**
   - Todo correcto: ano, revista (Communications of the ACM), referencia DOI. La anecdota de Oracle tambien es historicamente precisa (Larry Ellison y Bob Miner leyeron el paper de Codd).
   - **Confianza:** alto.

2. **Oracle "vale 300 mil millones de dolares"**
   - La capitalizacion de mercado de Oracle fluctua. En 2025 estuvo entre 300-450 mil millones USD. Para abril 2026, decir "300 mil millones" podria estar desactualizado (posiblemente mas alta o mas baja segun el mercado).
   - **Sugerencia:** Cambiar a "Oracle vale hoy cientos de miles de millones de dolares" para evitar que la cifra quede obsoleta rapidamente.
   - **Confianza:** medio — orden de magnitud correcto, cifra exacta variable.

3. **Rappi valuada en "mas de 5.200 millones de dolares"**
   - Rappi alcanzo una valuacion de 5.250 millones USD en su ronda Serie E en 2021. Pero en el mercado de 2024-2026, muchas valuaciones de startups bajaron significativamente. La valuacion actual real podria ser menor.
   - **Sugerencia:** Agregar "segun su ultima ronda de financiamiento en 2021" o decir "valorada en miles de millones de dolares".
   - **Confianza:** medio — la cifra fue correcta en 2021, puede no reflejar la valoracion actual.

4. **"PostgreSQL es la base de datos relacional de codigo abierto mas usada del mundo"**
   - Esto es debatible. MySQL historicamente tiene mas instalaciones y participacion de mercado. En rankings como DB-Engines (2025), PostgreSQL supero a MySQL en popularidad, asi que la afirmacion es defendible dependiendo del ano y la metrica.
   - **Sugerencia:** Agregar "segun rankings como DB-Engines" o decir "una de las bases de datos relacionales de codigo abierto mas usadas del mundo".
   - **Confianza:** medio — depende de la fuente y metrica utilizada.

5. **Firebase: "no relacional, ideal para datos en tiempo real"**
   - Correcto. Firebase Realtime Database y Cloud Firestore son efectivamente bases NoSQL optimizadas para sincronizacion en tiempo real. La descripcion es precisa aunque simplificada.
   - **Confianza:** alto.

6. **Quiz pregunta 4: "Que es un rollback?"**
   - El concepto de rollback no se explica en el cuerpo del bloque. El quiz pregunta sobre algo que no se enseno explicitamente en el texto. Solo se menciona atomicidad ("todo o nada") pero nunca se usa la palabra "rollback".
   - **Sugerencia:** Agregar una breve mencion de rollback en la seccion de ACID/transacciones, o reformular la pregunta del quiz.
   - **Confianza:** alto — verificable en el texto.

### Tags editoriales — Bloque 2

- Pensalo asi: usado correctamente (Excel vs BD, schema como plano, ACID como mudanza).
- El resumen para contarle a alguien en el subte: usado correctamente (migracion de schema).
- Dato de color: usado correctamente (Codd/Oracle).
- La vuelta de tuerca tecnica: usado correctamente (ACID compliance en NoSQL).
- En criollo: usado correctamente (placard vs mochila).
- En Argentina y Latinoamerica: usado correctamente (Rappi/AWS).
- Bonus track: usado correctamente (Supabase).
- **Observacion:** buena cobertura. Todos los tags del estandar estan representados.

### Flujo logico

Progresion solida: problema que resuelven las BD -> Excel vs BD -> SQL -> BD relacionales -> schema/migraciones -> ACID -> NoSQL -> ecosistema moderno (PostgreSQL/Supabase/Firebase). La construccion es incremental y cada concepto se apoya en el anterior.

---

## BLOQUE 3 — Como se conectan las cosas

### Lo que esta bien

- La distincion internet vs web es un excelente punto de partida que desmitifica un error comun.
- La tabla de evolucion HTTP (1.1/2/3) con anos y mejoras principales es clara y util.
- La explicacion de criptografia de clave publica con la analogia del buzon es excepcionalmente buena.
- La tabla de codigos de estado HTTP es muy practica y bien seleccionada (los mas relevantes).
- La distincion autenticacion vs autorizacion con la analogia del boliche es perfecta para el publico argentino.
- El flujo completo de Spotify al final del bloque integra todos los conceptos magistralmente.
- La seccion de CORS con contexto practico (demo vs produccion) es util para PMs.
- Las cookies estan bien categorizadas con implicancias de privacidad.

### Lo que necesita correccion

1. **HTTP inventado en 1989 por Tim Berners-Lee**
   - Correcto. Berners-Lee propuso HTTP como parte del proyecto de la World Wide Web en el CERN en 1989.
   - **Confianza:** alto.

2. **HTTP/3 ano 2022**
   - HTTP/3 fue estandarizado como RFC 9114 en junio de 2022. Correcto.
   - **Confianza:** alto.

3. **Candadito verde "introducido por Netscape Navigator en 1994"**
   - La primera version de SSL/HTTPS fue implementada en Netscape Navigator 1.0 (finales de 1994). La iconografia exacta del "candadito verde" evoluciono con el tiempo, pero la atribucion a Netscape como origen es correcta.
   - **Confianza:** alto.

4. **Ataque DNS de Dyn en 2016 — "casi 12 horas"**
   - El ataque DDoS a Dyn ocurrio el 21 de octubre de 2016. La duracion real fue de aproximadamente 6-8 horas (tres oleadas de ataques a lo largo del dia), no "casi 12 horas". La cifra esta inflada.
   - **Sugerencia:** Cambiar a "durante varias horas" o "a lo largo de casi todo el dia" para ser mas preciso sin necesidad de un numero exacto.
   - **Confianza:** alto — los reportes de Dyn y la cobertura periodistica indican duracion total del incidente de ~6-8 horas.

5. **REST definido por Roy Fielding "en su tesis doctoral en el ano 2000"**
   - Correcto. Fielding definio REST en su disertacion doctoral en la Universidad de California, Irvine, en 2000.
   - **Confianza:** alto.

6. **JSON en "90% de las APIs modernas"**
   - Cifra aproximada y razonable. No hay un estudio definitivo que confirme exactamente 90%, pero JSON es de lejos el formato dominante en APIs REST modernas.
   - **Sugerencia:** Decir "la gran mayoria" en lugar de "el 90%" para evitar la precision falsa.
   - **Confianza:** medio — orden correcto, cifra exacta no verificable.

7. **Cookies inventadas en 1994 por Lou Montulli**
   - Correcto. Montulli implemento cookies en Netscape Navigator como solucion para el carrito de compras.
   - **Confianza:** alto.

8. **DNS disenado por Paul Mockapetris — ano 1983**
   - Correcto. Mockapetris publico RFC 882 y 883 en noviembre de 1983 definiendo el DNS.
   - **Confianza:** alto.

9. **Tag "Para los curiosos" (pagina 18)**
   - Este tag no existe en el estandar editorial definido en la pagina 2. Ya flaggeado arriba. Aparece solo una vez en este bloque.
   - **Sugerencia:** Reemplazar por "Bonus track" o "Spoiler tecnico".
   - **Confianza:** alto.

10. **"exactamente los mismos cuatro comandos del SQL del Bloque 2, solo que a nivel de HTTP"**
    - La comparacion GET/POST/PUT/DELETE con SELECT/INSERT/UPDATE/DELETE es pedagogicamente util pero tecnicament es una simplificacion fuerte. HTTP y SQL operan en capas completamente distintas. Es aceptable como analogia pero la palabra "exactamente" la hace sonar como equivalencia tecnica.
    - **Sugerencia:** Cambiar "exactamente" a "conceptualmente similar a".
    - **Confianza:** alto — es una cuestion de precision en el lenguaje, no de error factico.

### Tags editoriales — Bloque 3

- En criollo: bien usado (internet = rutas, WebSockets = telefono).
- Pensalo asi: bien usado (HTTP = correo postal, HTTPS = buzon, OAuth = valet parking, CORS = edificio).
- Spoiler tecnico: bien usado (GET vs POST en formularios de pago, API key vs token).
- La vuelta de tuerca tecnica: bien usado (codigos HTTP, DNS solucion practica).
- Dato de color: bien usado (candadito verde, cookies 1994, DNS historia).
- El resumen para contarle a alguien en el subte: bien usado (OAuth, WebSockets, CORS).
- En Argentina y Latinoamerica: bien usado (MercadoPago APIs).
- Bonus track: bien usado (XML vs JSON).
- **"Para los curiosos":** tag no estandar — corregir.

### Flujo logico

Excelente progresion: internet vs web -> HTTP -> evolucion HTTP -> HTTPS/criptografia -> codigos de estado -> autenticacion vs autorizacion -> OAuth -> GET vs POST -> APIs (keys, tokens) -> REST/endpoints/JSON -> WebSockets -> CORS -> cookies -> DNS -> flujo completo integrador. La seccion final del flujo Spotify es un cierre perfecto que recapitula todo el bloque.

---

## BLOQUE 4 — Seguridad y privacidad

### Lo que esta bien

- La estructura "2 que cambian todo + 3 que suman" es brillante pedagogicamente. Prioriza acciones en lugar de abrumar.
- La seccion sobre phishing con senales de alerta concretas es inmediatamente accionable.
- La tabla de ingenieria social (vishing, smishing, spear phishing, pretexting) es completa y bien categorizada.
- La seccion de VPN con tabla "SI hace / NO hace" desmitifica un tema con mucha desinformacion.
- La distincion HTTPS vs E2E es critica y esta muy bien presentada, especialmente con el contexto de WhatsApp vs Telegram.
- La seccion de GDPR con tabla de derechos es clara y relevante.
- El caso PAMI 2023 esta bien documentado con multiples fuentes.
- La seccion de estafas regionales es extremadamente relevante y practica.
- La "regla de oro" al final de la seccion regional es un cierre excelente.

### Lo que necesita correccion

1. **"Mas de 3.000 brechas de datos en 2024" — Identity Theft Resource Center**
   - El ITRC reporto 3.158 brechas en 2024. La cifra "mas de 3.000" es correcta.
   - **Confianza:** alto.

2. **Contrasena "123456" como la mas usada en 2024**
   - Correcto segun NordPass 2024. "password" en segundo lugar y "123456789" en tercero tambien es correcto.
   - **Confianza:** alto.

3. **Contrasena de 16 caracteres minimo**
   - El NIST actualmente recomienda un minimo de 8 caracteres pero favorece contrasenas mas largas. La National Cybersecurity Alliance sugiere 16+. La fuente citada (staysafeonline.org) es correcta, pero podria confundirse con las directrices del NIST que tienen un minimo diferente.
   - **Sugerencia:** Precisar que es la recomendacion de la National Cybersecurity Alliance, no del NIST, para evitar confusion.
   - **Confianza:** medio — la recomendacion de 16 es de staysafeonline.org, no directamente del NIST.

4. **Caso Arup — deepfake de 25 millones de dolares (2024)**
   - El caso fue reportado en febrero de 2024 por la policia de Hong Kong. La empresa confirmada es Arup. La cifra de 25 millones USD (200 millones HKD) es correcta.
   - **Confianza:** alto.

5. **Verizon DBIR 2024 — "68% de las brechas involucro el elemento humano"**
   - El DBIR 2024 reporto que el 68% de las brechas involucro un elemento humano (no malicioso). Correcto.
   - **Confianza:** alto.

6. **WannaCry — "mayo de 2017" — "200.000 computadoras en 150 paises" — "parche disponible casi dos meses antes"**
   - WannaCry exploto el 12 de mayo de 2017. Afecto mas de 200.000 computadoras en 150 paises. Microsoft habia publicado el parche MS17-010 el 14 de marzo de 2017 — casi dos meses antes. Todo correcto.
   - **Confianza:** alto.

7. **Multa a Meta GDPR — "1.200 millones de euros en 2023"**
   - Correcto. La DPC de Irlanda impuso una multa de 1.200 millones de euros a Meta en mayo de 2023.
   - **Confianza:** alto.

8. **Multa a Amazon — "746 millones de euros"**
   - Correcto. Impuesta por la CNPD de Luxemburgo en julio de 2021. Sigue siendo la segunda mas grande.
   - **Confianza:** alto.

9. **Caso PAMI — "2 de agosto de 2023" — "25 Bitcoin" — "$700.000 dolares"**
   - La fecha es correcta. Rhysida fue el grupo atacante. 25 BTC en agosto de 2023 estaba en el rango de ~$725.000 USD. "831 GB de informacion" es la cifra reportada por medios argentinos. Todo verificable.
   - **Confianza:** alto.

10. **Kaspersky — "140% aumento phishing en LATAM" y "300% en Argentina" en 2024**
    - Estas cifras provienen del Kaspersky Panorama de Amenazas LATAM 2024. Los numeros son los reportados por Kaspersky. La cifra exacta puede ser del reporte de 2023 publicado en 2024 o del reporte 2024. Se sugiere verificar si los datos son del reporte para el periodo 2023 o 2024.
    - **Confianza:** medio — las cifras son de Kaspersky pero la precision del periodo podria variar.

11. **"34.468 denuncias por delitos informaticos" en Argentina 2024 — UFECI**
    - Cifra citada como proveniente de la UFECI. Plausible dado el crecimiento reportado.
    - **Confianza:** medio — dificil de verificar independientemente sin acceso al reporte de la UFECI.

12. **"ARCA" vs "AFIP"**
    - El texto menciona "ARCA/AFIP" y "phishing@arca.gob.ar". ARCA (Agencia de Recaudacion y Control Aduanero) reemplazo a la AFIP en octubre de 2024. La mencion dual es correcta para transicion, pero para 2026 deberia usarse solo "ARCA".
    - **Sugerencia:** Cambiar "ARCA/AFIP" a simplemente "ARCA (ex AFIP)" en la primera mencion, y solo "ARCA" en las siguientes.
    - **Confianza:** alto.

### Diferencia de tono: Bloque 4 vs Bloques 1-3

- **Acentos/tildes:** Los bloques 1-3 usan correctamente los acentos y tildes del espanol (como, que, etc.). El bloque 4 (y el PDF 456 en general) NO usa acentos ni tildes en ninguna parte del texto. "como" en lugar de "como", "que" en lugar de "que", "mas" en lugar de "mas". Esta es una **inconsistencia editorial significativa** entre los dos documentos.
- **Sugerencia:** Unificar al estandar del PDF 123 (con acentos). El PDF 456 necesita una pasada completa de correccion ortografica para agregar todos los acentos y tildes faltantes.
- **Confianza:** alto — verificable visualmente comparando ambos documentos.

### Tags editoriales — Bloque 4

- Pensalo asi: bien usado (contrasenas como llaves, phishing/malware/ransomware como puerta, E2E como idioma).
- La vuelta de tuerca tecnica: bien usado (passkeys, WannaCry).
- Dato de color: bien usado (contrasenas mas comunes, deepfakes Arup, cookies cripto, GDPR multas).
- Spoiler tecnico: bien usado (VPN gratuita, Telegram vs WhatsApp E2E).
- En criollo: bien usado (ingenieria social, VPN como auto con vidrios polarizados).
- El resumen para contarle a alguien en el subte: bien usado (OWASP, actualizaciones).
- En Argentina y Latinoamerica: bien usado (caso PAMI, cifras Kaspersky/UFECI, estafas regionales).
- Bonus track: bien usado (superficie de ataque para PMs).
- **"La regla de oro que aplica a todos los casos":** tag no estandar — pero funciona bien como cierre de la seccion regional. Considerar si formalizarlo en el estandar o reemplazarlo.
- **"Have I Been Pwned — chequealo ahora mismo":** usa el icono de Bonus track pero con un texto de accion directa. Funciona bien.

### Flujo logico

Excelente progresion: por que importa -> contrasenas -> acciones concretas priorizadas -> 2FA -> phishing -> ingenieria social -> malware/ransomware -> VPNs -> E2E vs HTTPS -> actualizaciones -> superficie de ataque -> privacidad/GDPR -> OWASP -> estafas regionales. La estructura "amenaza -> defensa -> accion" se mantiene consistente.

---

## BLOQUE 5 — Como nace un producto digital

### Lo que esta bien

- La apertura "la idea no es el producto" es un excelente marco para desmitificar el emprendimiento.
- Jobs to Be Done con el ejemplo del milkshake de McDonald's es un clasico bien contado.
- La tabla de hipotesis/riesgos es excelente para PMs y emprendedores.
- La fase de discovery esta bien presentada con herramientas concretas.
- La explicacion de CI/CD para no-tecnicos ("por que le importa esto a alguien que no programa?") es exactamente lo que el publico necesita.
- La seccion de deuda tecnica con la metafora financiera (acunada por Ward Cunningham) es impecable.
- Product-Market Fit con la operacionalizacion de Sean Ellis (40% "muy decepcionado") es preciso y accionable.
- La jerarquia de metricas (North Star -> ciclo de vida -> OKRs -> vanity metrics) esta muy bien estructurada.
- La tabla de roles (PM/PO/Scrum Master/UX/Devs/QA) con capa estrategica vs tactica es clara.

### Lo que necesita correccion

1. **CB Insights — "35% de las startups fracasan por no market need"**
   - El reporte de CB Insights (actualizado 2024) indica que "no market need" es la razon #1 de fracaso de startups, pero el porcentaje en la version mas reciente es ~35%. En versiones anteriores era 42%. Verificar cual version se esta citando.
   - **Confianza:** medio — el rango esta bien, la cifra exacta depende de la version del reporte.

2. **Manifiesto Agil — "2001, diecisiete desarrolladores, Snowbird, Utah"**
   - Correcto en todos los detalles: 17 firmantes, febrero 2001, The Lodge at Snowbird, Utah.
   - **Confianza:** alto.

3. **Dropbox MVP — "5.000 a 75.000 registros en una sola noche"**
   - Este dato proviene de entrevistas con Drew Houston y se ha citado ampliamente en First Round Review y otros medios. Los numeros exactos varian segun la fuente (algunas dicen 5.000 a 75.000, otras dicen "overnight"). La cifra es ampliamente aceptada pero dificil de verificar con precision.
   - **Confianza:** medio — dato anecdotico ampliamente citado.

4. **OKRs desarrollados por Andy Grove en Intel en los anos 70**
   - Correcto. Andy Grove desarrollo el sistema en Intel, John Doerr lo llevo a Google en 1999.
   - **Confianza:** alto.

5. **Ward Cunningham como "uno de los autores del Manifiesto Agil"**
   - Correcto. Cunningham fue uno de los 17 firmantes del Manifiesto Agil.
   - **Confianza:** alto.

6. **"casi 7 de cada 10 empresas creen que la deuda tecnica esta frenando su capacidad de innovar" — fuente ProdPad citando Protiviti**
   - La fuente original es una encuesta de Protiviti citada por ProdPad. El dato parece provenir de reportes de 2023-2024. "7 de cada 10" (~70%) es la cifra reportada.
   - **Confianza:** medio — dato de encuesta, depende de la muestra y metodologia.

7. **"30% del presupuesto de IT gestionando deuda tecnica"**
   - Este dato se cita frecuentemente en articulos de producto. Algunas fuentes lo atribuyen a McKinsey (que ha reportado hasta 40%). La cifra de 30% es una estimacion comun en la industria.
   - **Confianza:** medio — estadistica de industria sin fuente primaria clara.

8. **Modelo de squads — "viene del modelo organizacional de Spotify de 2012"**
   - Correcto. Spotify publico sus videos de "Spotify Engineering Culture" en 2014 describiendo el modelo que habian implementado desde ~2012. Sin embargo, vale notar que el propio Spotify ha evolucionado significativamente desde ese modelo original, y muchas empresas lo adoptaron de forma dogmatica sin adaptarlo a su contexto.
   - **Sugerencia:** Considerar agregar una nota al respecto — "modelo que Spotify mismo ha evolucionado desde entonces".
   - **Confianza:** alto para la atribucion; la observacion sobre su evolucion es un dato adicional que fortaleceria el texto.

9. **Typo: "ensenadass" (doble 's' al final)**
   - En la seccion de roadmap: "una de las habilidades mas valiosas — y menos ensenadass — de un PM." Falta corregir a "ensenadas".
   - **Confianza:** alto — error tipografico.

10. **North Star de Facebook — "usuarios que agregan 7 amigos en los primeros 10 dias"**
    - Este dato es ampliamente citado en la industria de producto. Algunas fuentes dicen "7 amigos en 10 dias", otras dicen "10 amigos en 14 dias". La variante mas comun es la citada.
    - **Confianza:** medio — dato anecdotico ampliamente repetido, dificil de verificar con fuente primaria de Facebook/Meta.

### Diferencia de tono: misma observacion sobre acentos

- El bloque 5 tambien carece completamente de acentos y tildes, al igual que todo el PDF 456. Repetir la observacion del Bloque 4.

### Tags editoriales — Bloque 5

- En criollo: bien usado (idea vs producto, Scrum como degustacion, CI/CD como linea de montaje).
- Pensalo asi: bien usado (discovery como diagnostico, deuda tecnica como deuda financiera, MVP como WhatsApp).
- Dato de color: bien usado (Jobs to Be Done McDonald's, Dropbox MVP).
- Spoiler tecnico: bien usado (35% fracasan por no market need, PMF sin retencion).
- La vuelta de tuerca tecnica: bien usado (roadmap como compromiso, deuda tecnica invisible, North Star Facebook).
- Bonus track: bien usado (quien manda en un equipo de producto).
- En Argentina y Latinoamerica: bien usado (ecosistema regional, squads, startups vs empresas maduras).
- **Observacion:** buena cobertura, tags bien aplicados en contexto.

### Flujo logico

Excelente progresion: idea no es producto -> hipotesis -> discovery -> backlog/priorizacion/roadmap -> Waterfall vs Agile -> Scrum -> roles -> MVP -> deploy y CI/CD -> deuda tecnica -> PMF -> metricas -> ecosistema LATAM. El arco narrativo es "de la idea al usuario" y se mantiene coherente.

---

## BLOQUE 6 — Que es la IA

### Lo que esta bien

- La metafora de las matrioskas para IA/ML/DL/GenAI es excelente y visualmente intuitiva.
- La tabla de 4 capas con ejemplos concretos es la mejor referencia rapida que he visto para un publico no-tecnico.
- La explicacion de como funciona un LLM "sin matematica" es lograda — el concepto de "predecir la siguiente palabra" es accesible y tecnicament correcto.
- RLHF esta bien explicado con la distincion GPT-base vs ChatGPT.
- La seccion de tokens explica un concepto sutil de forma clara, incluyendo por que los LLMs fallan en contar letras.
- La tabla de context windows es informativa (con la nota de caveat sobre evolucion).
- La tabla "lo que hace bien / lo que hace mal" es honesta y balanceada.
- La seccion de alucinaciones con el caso del abogado de NYC (Mata v. Avianca) es memorable y verificable.
- La seccion de sesgos con Gender Shades (Joy Buolamwini) es rigurosa.
- La seccion de RAG esta bien posicionada como solucion practica a las alucinaciones.
- La seccion de AGI con la advertencia sobre claims corporativos es sabia.
- Las "preguntas sin respuesta simple" al final son un cierre honesto y estimulante.

### Lo que necesita correccion

1. **Context windows — GPT-4 ~128.000 tokens**
   - GPT-4 Turbo tiene una ventana de 128K tokens. GPT-4 base tiene 8K o 32K dependiendo de la version. Para 2026, OpenAI probablemente tiene modelos mas nuevos (GPT-4o, GPT-5, etc.) con ventanas potencialmente diferentes.
   - **Sugerencia:** La nota "estos tamanos son correctos a la fecha de escritura (2026)" es una buena proteccion. Verificar que las cifras sean actuales al momento de publicacion.
   - **Confianza:** medio — correcto para los modelos citados al momento del entrenamiento, pero potencialmente desactualizado para abril 2026.

2. **Claude 3 (Anthropic) ~200.000 tokens**
   - Claude 3 (marzo 2024) tiene una ventana de contexto de 200K tokens. Para abril 2026, Anthropic probablemente tiene Claude 4 u otros modelos. La cifra de Claude 3 es correcta para ese modelo especifico.
   - **Sugerencia:** Actualizar a la version mas reciente de Claude disponible en 2026.
   - **Confianza:** medio — correcto para Claude 3 pero probablemente hay versiones mas nuevas.

3. **Gemini 1.5 Pro ~1.000.000 tokens**
   - Correcto. Gemini 1.5 Pro fue lanzado con una ventana de contexto de 1M tokens (febrero 2024). Para 2026, Google puede tener versiones mas nuevas.
   - **Confianza:** medio — correcto para ese modelo, potencialmente desactualizado.

4. **Paper "Attention Is All You Need" — 2017 — Google**
   - Correcto. Vaswani et al., publicado en NeurIPS 2017, por investigadores de Google Brain y Google Research.
   - **Confianza:** alto.

5. **"en solo 7 anos cambio completamente el campo"**
   - Si se esta escribiendo en 2026, serian 9 anos desde 2017, no 7. Si se escribio el texto original en 2024, la cifra de 7 es correcta. Para la publicacion 2026, deberia ser "en menos de una decada" o "en 9 anos".
   - **Sugerencia:** Cambiar a "en menos de una decada" para no quedar desactualizado.
   - **Confianza:** alto — error aritmetico simple.

6. **Caso Mata v. Avianca — abogado multado con $5.000 dolares (2023)**
   - Correcto. Steven Schwartz fue el abogado. El juez Kevin Castel impuso una multa de $5.000. Caso verificable.
   - **Confianza:** alto.

7. **Gender Shades — "disparidades del orden del 30%"**
   - El estudio de Joy Buolamwini y Timnit Gebru (2018) encontro tasas de error de hasta 34.7% para mujeres de piel oscura vs 0.8% para hombres de piel clara en ciertos sistemas. Decir "disparidades del orden del 30%" es una simplificacion razonable.
   - **Confianza:** alto.

8. **Air Canada chatbot — 2024**
   - Correcto. El caso fue resuelto por el Civil Resolution Tribunal de British Columbia en febrero de 2024. El tribunal ordeno a Air Canada honrar la tarifa incorrecta que su chatbot habia informado.
   - **Confianza:** alto.

9. **NotCo — "empresa de foodtech latinoamericana unicornio"**
   - NotCo alcanzo estatus de unicornio en julio de 2021 con una valoracion de $1.5B. Para 2026, el termino "unicornio" sigue aplicando si no hizo IPO ni bajo de valuacion significativamente.
   - **Confianza:** medio — estatus de unicornio depende de valoracion actual.

10. **LLMs con "trillones de palabras" de datos de entrenamiento**
    - En ingles, "trillion" = 1 billon (10^12). En espanol, "trillon" = 10^18. El texto dice "trillones de palabras" lo cual, si se usa la acepcion del ingles (lo mas probable), seria "billones de palabras" en espanol correcto.
    - **Sugerencia:** Cambiar a "billones de palabras" o "miles de millones de palabras" para evitar la ambiguedad del falso cognado trillion/trillon.
    - **Confianza:** alto — error de traduccion/falso cognado.

### Diferencia de tono: misma observacion sobre acentos

- Bloque 6 tambien sin acentos ni tildes, consistente con el resto del PDF 456.

### Tags editoriales — Bloque 6

- El resumen para contarle a alguien en el subte: bien usado (matrioskas IA/ML/DL/GenAI).
- Pensalo asi: bien usado (alucinaciones como coherencia sin veracidad, RAG como experto con acceso a documentos).
- Dato de color: bien usado (caso Mata v. Avianca).
- La vuelta de tuerca tecnica: bien usado en 3 instancias (sesgos y codigo abierto, Transformer, RNNs vs Transformer).
- Spoiler tecnico: bien usado (AGI claims, que es y que no es).
- Bonus track: bien usado (biblioteca HTML usa RAG).
- En Argentina y Latinoamerica: bien usado (NotCo, MercadoLibre ML, desafio del espanol).
- **Observacion:** excelente cobertura de tags. La seccion tecnica del Transformer tiene dos tags de "vuelta de tuerca tecnica" consecutivos — podria fusionarse en uno para mejorar el ritmo.

### Flujo logico

Excelente progresion: malentendido comun -> matrioskas (IA > ML > DL > GenAI) -> como funciona un LLM -> RLHF -> tokens -> context window -> fortalezas/debilidades -> alucinaciones -> sesgos -> Transformer -> RAG -> AGI -> ecosistema LATAM -> preguntas eticas. La construccion es impecable de lo simple a lo complejo.

---

## HALLAZGOS TRANSVERSALES

### 1. Inconsistencia ortografica critica: acentos y tildes

- **PDF 123 (Bloques 1-3):** Usa correctamente acentos y tildes en todo el texto (como, que, tecnica, informacion, etc.).
- **PDF 456 (Bloques 4-6):** No usa acentos ni tildes en ningun lugar. Todo el texto esta sin acentuar.
- **Impacto:** Alto. Para un documento educativo en espanol, esta inconsistencia es la mas importante de corregir. El PDF 456 necesita una pasada completa de correccion ortografica.
- **Confianza:** alto.

### 2. Tag no estandar: "Para los curiosos"

- Aparece en Bloque 3 (pagina 18). No esta definido en la guia "Como usar esta biblioteca".
- **Accion:** Reemplazar por un tag estandar o formalizarlo en la guia.

### 3. Tag no estandar: "La regla de oro que aplica a todos los casos"

- Aparece en Bloque 4 (pagina 12). No esta en la guia oficial.
- **Accion:** Evaluar si formalizarlo como tag nuevo o absorberlo en "En criollo" o "El resumen para contarle a alguien en el subte".

### 4. Guia "Como usar esta biblioteca" — diferencias entre los dos PDFs

- PDF 123 tiene descripciones mas largas y detalladas de cada tag.
- PDF 456 tiene descripciones mas cortas.
- La de PDF 456 agrega "NotCo" y "PAMI" como ejemplos regionales que no estan en la del PDF 123.
- **Accion:** Unificar en una sola version canonica.

### 5. Consistencia de la calidad de quizzes

- Los quizzes de todos los bloques son de alta calidad. Cada uno testea comprension real, no sentido comun.
- **Excepcion:** Quiz Bloque 2, pregunta 4 (rollback) — pregunta sobre un concepto no explicado en el cuerpo del texto.

### 6. Datos con mayor riesgo de quedar desactualizados

| Dato | Bloque | Riesgo |
|------|--------|--------|
| npm "mas de 2 millones de paquetes" | 1 | Alto — ya son 3M+ |
| Oracle "vale 300 mil millones" | 2 | Medio — fluctua con el mercado |
| Rappi "valuada en 5.200 millones" | 2 | Medio — valuacion de 2021 |
| Context windows de LLMs (GPT-4, Claude 3, Gemini 1.5 Pro) | 6 | Alto — modelos nuevos cada 6 meses |
| "7 anos" desde Attention Is All You Need | 6 | Alto — son 9 anos en 2026 |
| Contrasenas mas comunes (NordPass 2024) | 4 | Bajo — cambian poco |

### 7. Calidad general

La calidad del contenido es notablemente alta. Las analogias son originales, las fuentes son solidas, la progresion pedagogica es clara y construye conocimiento acumulativo. Los bloques se conectan entre si (Bloque 3 referencia a SQL del Bloque 2, Bloque 6 referencia a codigo abierto del Bloque 1, etc.). El nivel de profundidad es apropiado para el publico objetivo sin ser condescendiente.

Las correcciones necesarias son principalmente:
1. **Urgente:** Unificar acentos/tildes entre los dos PDFs
2. **Importante:** Actualizar datos con alto riesgo de obsolescencia (npm, context windows, "7 anos" del Transformer)
3. **Menor:** Estandarizar tags editoriales no oficiales
4. **Menor:** Corregir typo "ensenadass" en Bloque 5
