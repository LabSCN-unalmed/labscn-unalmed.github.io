---
layout: curso
title: 'Trabajos'
curso: 'estadistica-descriptiva'
order: 5
---


## Contenido
{: .no_toc}

* ToC
{: toc}


## Trabajos individuales

### Primer trabajo individual.

#### Objetivo.

Construir una gráfica que corrija o mejore una gráfica
publicada en un  medio impreso en Colombia como
fecha más antigua el 31 de diciembre de 2018.

#### Actividades.

1. Buscar en una publicación colombiana, no más antigua que
31 de diciembre de 2018,  una gráfica informativa
que muestre problemas o que se pueda proponer una mejor
representación.
2. Construir una base de datos que represente los datos graficados
   en la publicación.
3. Construir una nueva gráfica que mejore la publicada
   (solo con funciones básicas del R, sin utilizar paquetes adicionales).
4. Realizar un informe en donde se muestre la gráfica original y
   la propuesta e indicar por qué la nueva gráfica es una mejora
   con respecto a la anterior.

#### Documentos para entregar.

1. Archivo en formato **.xls** o **.xlsx** con la base de datos.
2. Archivo en formato **.Rmd** que construye el archivo **html**.
3. Archivo en formato **.html** con el informe y que **no** incluya
   el código.

#### Fecha de entrega.   

Jueves, 20 de junio de 2019 antes de las 23:59
[hora oficial de Colombia](http://horalegal.inm.gov.co/)
al correo **krcabrer@unal.edu.co** y no olvidar en asunto **[EDAED]**.


### Segundo trabajo individual.

#### Objetivo.

Realizar un análisis descriptivo y exploratorio de
los resultados de las pruebas Saber 11.

#### Indicaciones.

De acuerdo al último dígito de su número de identificación
se tomarán como variables a considerar para determinar
su relación con el puntaje global (PUNT_GLOBAL).

|Último dígito | Variables demográficas |
|--------|---------|
|0 - 4   | EDAD (Considere solo edades entre 17 y 22 años inclusive) |
|5 - 9   | ESTUD_GENERO |


|Penúltimo dígito | Variables explicativas 1 |
|--------|---------|--------|
|0       |  FAMI_ESTRATOVIVIENDA, FAMI_TIENEAUTOMOVIL |
|1       |  FAMI_PERSONASHOGAR, FAMI_TIENEMOTOCICLETA |
|2       |  FAMI_EDUCACIONPADRE, FAMI_TIENECONSOLAVIDEOJUEGOS|
|3       |  FAMI_EDUCACIONMADRE, FAMI_NUMLIBROS |
|4       |  FAMI_TRABAJOLABORPADRE, FAMI_COMELECHEDERIVADOS |
|5       |  FAMI_TRABAJOLABORMADRE, FAMI_COMECARNEPESCADOOHUEVO |
|6       |  FAMI_TIENEINTERNET, FAMI_COMECEREALFRUTOSLEGUMBRE |
|7       |  FAMI_TIENECOMPUTADOR, FAMI_SITUACIONECONOMICA|
|8       |  FAMI_TIENELAVADORA, FAMI_ESTRATOVIVIENDA |
|9       |  FAMI_TIENEHORNOMICROOGAS, FAMI_PERSONASHOGAR |

|Antepenúltimo dígito | Variables explicativa 2|
|---------|---------|
|0        | ESTU_DEDICACIONLECTURADIARIA |
|1        | ESTU_DEDICACIONINTERNET |
|2        | ESTU_HORASSEMANATRABAJA |
|3        | ESTU_TIPOREMUNERACION|
|4        | COLE_GENERO|
|5        | COLE_NATURALEZA|
|6        | COLE_CARACTER|s
|7        | COLE_AREA_UBICACION|s
|8        | COLE_JORNADA|
|9        | ESTU_INSE_INDIVIDUAL|

INSE: ÍNDICE DE NIVEL SOCIOECONÓMICO.

#### Resultados esperado.

De acuerdo a la combinación que le correspondió,
muestre mediante gráficas y tablas las variables
que influencian más en el resultado de las
pruebas Saber 11.

Determine la distribución de las variables que
le correpondió por municipio y muestre los resultados
de manera gráfica.

Muestre la relación del desempeño fiscal por
municipio y con el promedio y la mediana del
resultado global de la prueba Saber 11.

#### Fecha de entrega.

Se entregará un formato de archivo ".html"
con los resultados sin el código.

Se entregará un archivo ".Rmd" que contenga el código
utilizado.

Nota: No se entregarán las bases de datos, porque son
las mismas que están publicadas en la página del curso.

Fecha de entrega: viernes, 9 de agosto de 2019 antes de las 23:59 hora 
de Colombia.


## Trabajos en grupo

### Primer trabajo en grupo.

En grupos de máximo cinco (5) personas realizar
el siguiente trabajo.

#### Objetivo.

Realizar una análisis exploratorio y descriptivo
de los datos recolectados para medir niveles de
precisión de las coordenadas entregadas por los
GPS de los aplicativos de los celulares.

#### Archivos crudos de toma de datos.

En [este archivo](./basesdedatos/archivos.zip) se encuentra los
archivos comprimidos de los datos recolectados
por los estudiantes de distintos puntos del campus
de la Universidad.

#### Actividades.

  - Leer cada uno de los archivos y realizar una depuración
    y unificación de las bases de datos, para que quede
    consolidado una sola base de datos para realizar el
    análisis.

  - Una vez depurada y unificada la base de datos,
    proceder a realizar un análisis exploratorio y descriptivo.

  - Realizar una análisis descriptivo y exploratorio de
    datos que responda las siguientes preguntas:
    1. ¿Qué tipo de depuraciones se realizaron a la base de datos?
        Es decir, ¿Qué tipos de errores y problemas encontraron
        en las bases de datos crudas?  
    1. ¿Qué tan preciso es la medición de las coordenadas
        mediante GPS de celular en términos generales?
        Responder tanto con números como con gráfica.
    2. ¿La precisión está relacionada a la hora? Mostrar
        mediante análisis numérico y gráfico.
    3. ¿La precisión está relacionada con el día?
        ¿O el día de la semana? Mostrar
            mediante análisis numérico y gráfico.
    4. ¿La precisión está relacionada con el tipo de aplicación? Mostrar
        mediante análisis numérico y gráfico.
    5. ¿Se torna más preciso en la medida que se avanza
        en las tomas?  Mostrar
            mediante análisis numérico y gráfico.
    6. ¿La precisión tiene que ver con la ubicación dentro del
       campus de la Universidad? Mostrar
           mediante análisis numérico y gráfico.
    7. ¿La precisión tiene que ver con el estudiante que
       tomó los datos? Mostrar
           mediante análisis numérico y gráfico.          

#### Fecha de entrega.


Jueves, 11 de julio de 2019 antes de las 23:59 hora de Colombia
al correo **krcabrer@unal.edu.co** y no olvidar escribir en
asunto **[EDAED]**.

Se deben enviar tres archivos:

1. Archivo con la base de datos consolidada.
2. Archivo ".Rmd" con los comando utilizados para el análisis.
3. Archivo de resultados del análisis y los resultados
    numéricos y gráficos que respalden el análisis
    en formato ".html" sin código.









<!---

## Trabajos en grupo.

### Primer trabajo en grupo.

#### Primera actividad.

##### Objetivo:

Familiarizarse con el uso la App Science Journal.

- Grupos de máximo 5 personas.
- Descargar la [App Science Journal](https://play.google.com/store/apps/details?id=com.google.android.apps.forscience.whistlepunk&hl=en).
- Para cada miembro del grupo realizar.
  * Seleccionar 80 a 100 metros planos en el campus de la Universidad.
  * Seleccionar de la App las tarjetas X, Y y Z.
  * Caminar los 80 a 100 metros, contando los pasos.
  * Enviar el archivo ".csv" a su propio correo electrónico.
  * Revisar que el archivo tenga como mínimo las siguientes columnas:
    + Timestamp.
    + AccX.
    + AccY.
    + AccZ.

#### Segunda actividad.    

##### Objetivo:

- Con los datos obtenidos de cada miembro del grupo, realizar la siguiente
  tabla:

| Nombre completo  | Número de periodos | Distancia | Número de pasos | Estatura
|:----------|--------------:|------------:|----------------:|----:|
| Kenneth Cabrera | 308 | 217.32 | 310 | 169 |

- Comparar el número de períodos obtenido por cada integrante con
el número de pasos.

- Calcular la longitud promedia del paso uno con el número de períodos
y otro con el número de pasos.

- Realizar un gráfico a mano alzada de los cinco integrantes en
  donde en el eje _x_,
  se la longitud del paso de cada uno y el eje _y_ sea la estatura.

- Trace una recta a mano alzada o con una regla que considere que muestra la tendencia y estime
  la pendiente.

- Pida el dato de la pendiente de la recta a 5 grupos diferentes y
  analice los resultados obtenidos.

- Realice conclusiones y recomendaciones.

##### Fecha de entrega:

Jueves, 14 de febrero de 2019 al finalizar la clase.

### Segundo trabajo en grupo.

#### Objetivo.

Realizar un análisis exploratorio de datos sobre los resultados
de las pruebas Saber 11.

#### Alternativas.

  1. Involucrar resultados de varios años (mínimo 4), para determinar comportamientos
     en el tiempo.
  2. Involucrar características socio demográficas o
     de desempeño fiscal (mínimo 4) de los municipios de Colombia.


Cada grupo elige una alternativa y utilizado como base esta alternativa
mostrar un análisis exploratorio de datos que permita:

  - Mostrar las variables relacionadas con el desempeño de los resultados
     de las pruebas Saber 11.
  - Comparar el comportamiento de los resultados en matemáticas con
     los de lectura crítica.
  - Comparar el caso urbano con el rural.

#### Informe de análisis exploratorio.

  - Integrantes del grupo.
  - Alternativa seleccionada.
  - Introducción con los Enlaces a las bases de datos utilizadas en
    el análisis exploratorio.
  - Mostrar resultados del análisis exploratorio.
  - Conclusiones.
  - Recomendaciones.

#### Documentos de entrega.

  1. Enlace de los archivos utilizados en el análisis exploratorio.
  2. Archivo en formato ".html" con los resultados del análisis (sin el código).
  3. Archivo en formato ".Rmd" con los códigos correspondientes.

#### Fecha de entrega.

Lunes, 18 de marzo de 2019 antes de las 23:59 hora de Colombia,
al correo **krcabrer@unal.edu.co** y en asunto escribir **[EDAED]**.



<!---

### Primer trabajo en grupo.

#### Objetivo.


#### Fecha de entrega.


#### Objetivo.

 Realizar un análisis exploratorio de la edad y
 el número de materias matriculadas de los encuestados
 de la asignatura Estadística Descriptiva y Análisis exploratorio de datos.

 Realizar una exploración para saber cuál variable estaría
 más relacionada con el PAPA.

#### Actividades.


- Calcular la edad de cada encuestado (hasta dos décimas de año).
  Al día que se hizo la encuesta (6 de febrero de 2018).
- Considerar estos ejemplos sencillos para
  construir [gráficas en R](https://www.harding.edu/fmccown/r/).  
- Mostrar y analizar la distribución de la edad.
- Mostrar y analizar la distribución del número de materias matriculadas.
  (Utilizar diagrama de barras `barplot()`).
- Relacionar la edad con el género, semestre, carrera,
   y PAPA.
- Relacionar el número de materias matriculadas por el género, semestre, carrera,
   y PAPA.  
- Redactar conclusiones y recomendaciones.

#### Documentos a entregar.

- Informe en formato ".html" sin código.
- Archivo en formato ".Rmd" con el código.
- El informe debe contener como mínimo:
   + Nombre e identificación del estudiante.
   + Breve introducción.
   + Análisis univariado de la variable edad.
   + Gráficas y análisis de las relaciones entre las variables pedidas.
   + Conclusiones.
   + Recomendaciones.
   + Bibliografía (Si se hizo uso de información adicional).



#### Fecha de entrega

Jueves, 1 de marzo de 2018, antes de las 23:59 hora de Colombia al correo
**krcabrer@unal.edu.co** y no olvidar la sigla **[EDAED]** en asunto.


### Segundo trabajo individual.


## Trabajos en grupo

### Primer trabajo en grupo.

#### Objetivo.


Contestar las siguientes preguntas de la base de datos
de contrataciones:

   1. Caracterice los contratos cuyo sujeto de control
     es "Universidad De Antioquia" y que el tipo de
     contrato sea "Contrato".
   2. De los contratos que tienen el evento de "12-Liquidación"
     y tipo de contrato sea "Contrato",
     cuantos y cuales tienen un valor den contrato distinto de cero y
     halle la suma de los valores de esos contratos total y
     por proyecto.
   3. Muestre una gráfica que muestre la distribución
      del plazo estimado para contratos de tipo "Contrato" y
      que sea del evento "1-Principal".
   4. Muestre una tabla resumen por código de proyecto y
      que muestre si el valor del proyecto se mantiene constante
      por código de proyecto y por sector.     


Realizar cuatro preguntas adicionales a la base de datos de las contrataciones
de diciembre de 2017 del departamento de Antioquia y mostrar
el resultado mediante gráficas o tablas o ambas de acuerdo
contexto respectivo.

#### Consideraciones.

 - El trabajo parte de la
   [base de datos original](./basesdedatos/Contratacion_Diciembre_2017.csv).

 - En el texto del trabajo debe aparecer todas las restricciones y
   consideraciones para las cuales se realizó la respuesta
   a la respectiva pregunta.

 - El número de integrantes del grupo será como máximo de cinco (5)   
   personas, estén presentes o no.

#### Documentos a entregar.

 + Documento en formato ".html" sin código en donde se plantean y
   se contestan las cuatro preguntas sobre la base de datos con
   tablas resumidas y/o gráficas.
 + Documento en formato ".Rmd" en donde se realizan los cálculos
   y la programación para obtener las gráficas y/o las tablas
   con el código en R a partir de la
   [base de datos original](./basesdedatos/Contratacion_Diciembre_2017.csv).

#### Fecha de entrega.

Lunes 2 de abril de 2018 antes de las 23:59 hora de Colombia al correo
**krcabrer@unal.edu.co** y no olvidar escribir en asunto **[EDAED]**.

El día 15 se marzo se toma una foto con el nombre de
los integrantes del grupo de máximo cinco (5) personas estén
las personas presentes o no.



### Segundo trabajo en grupo.

#### Objetivo.

Realizar un análisis descriptivo y exploratorio de
la [base de datos del SISBEN 2017 para Medellín](https://www.datos.gov.co/Salud-y-Protecci-n-Social/Base-de-Datos-Sisben-2017-Municipio-de-Medell-n/cnr8-armb)
por persona publicado en Datos Libres.

En anáisis exploratorio está dirigido a mostrar si existen diferencias
de perfil demográfico por comuna y por barrio en Medellín, de
las personas inscritas en SISBEN en el año 2017.


#### Recursos.

 - [Transformar a formato R.](./guiones/01_sisben_lectura.html)
 - [Inicio de análisis exploratorio](./guiones/02_sisben_explora1.html)
 - [Encuesta de calidad de vida DANE](http://microdatos.dane.gov.co/index.php/catalog/544/get_microdata)

 - [Dicionario de datos.](https://www.datos.gov.co/api/views/cnr8-armb/files/65bade0f-6c72-4a14-be2a-c2b501677de3?download=true&filename=Diccionario_SISBEN_2017Dic_Anonimizada_.xlsx)
 - [Codificación de parentesco](./basesdedatos/parentesco.txt)

#### Consideraciones.

- De acuerdo al tipo de variable convertir al tipo adecuado siguiendo
  el diccionario de datos.
- Realizar una descripción por variable (las pertinentes a personas).

- Realizar una descrpción por variable por hogar).

- Realizar un análisis descriptivo por variable por comuna.

- Mostrar gráficas de las variables más relevantes para identificar
  el perfil respectivo.

#### Fecha de entrega.

Jueves, 19 de abril de 2018 antes de las 23:59 hora de Colombia al correo
**krcabrer@unal.edu.co** y no olvidar escribir en asunto **[EDAED]**.



## Contenido
{: .no_toc}

* ToC
{: toc}



## Primer trabajo individual

### Actividades.

En la página de la alcaldía de Medellín sobre
[proyección de la población para Medellín](https://www.datos.gov.co/Estad-sticas-Nacionales/Proyecciones-De-Poblaci-n-Medell-n-2016-2020/imj6-7tfq/data)
realizar las siguientes actividades:

1. Seleccionar una de las 16 comunas de Medellín.
2. Construir una base de datos en Excel con la población
   total estimada para el año 2017 por todos los grupos de edad.
3. Realizar un documento en formato **.html** a partir
   de un archivo **.Rmd** que muestre un diagrama de barras con el número
   de personas por rangos de edad.

### Documentos para entregar

1. Archivo en formato **.csv** con la base de datos utilizada
   de acuerdo a la comuna seleccionada.
2. Archivo en formato **.Rmd** que construye el archivo **html**.
3. Archivo en formato **.html** con los resultados que
   muestre:
   - el código utilizado,
   - la gráfica de barras con la distribución de la población por rangos de edad
   - y un comentario sobre la forma que se distribuye la población
   total en cada rango de edad.

### Consideraciones

 - El documento debe tener como autor el nombre del estudiante y
   su identificación.    

### Fecha de entrega

Martes 22 de agosto de 2017 antes de las 23:59
[hora oficial de Colombia](http://horalegal.inm.gov.co/)
al correo **krcabrer@unal.edu.co** y no olvidar en asunto **[EDAED]**.


## Segundo trabajo individual.

### Objetivo.

Construir una gráfica que corrija o mejore una gráfica
publicada en un  medio impreso en Colombia de los últimos 10 años.

### Actividades.

1. Buscar en una publicación colombiana una gráfica informativa
que muestre problemas o que se pueda proponer una mejor
representación.
2. Construir una base de datos que represente los datos graficados
   en la publicación.
3. Construir una nueva gráfica que mejore la publicada.
4. Realizar un informe en donde se muestre la gráfica original y
   la propuesta e indicar porqué la nueva gráfica es una mejora
   con respecto a la anterior.

### Documentos para entregar.

1. Archivo en formato **.xls** o **.xlsx** con la base de datos.
2. Archivo en formato **.Rmd** que construye el archivo **html**.
3. Archivo en formato **.html** con el informe y que **no** incluya
   el código.

### Fecha de entrega.   

Viernes 15 de septiembre de 2017 antes de las 23:59
[hora oficial de Colombia](http://horalegal.inm.gov.co/)
al correo **krcabrer@unal.edu.co** y no olvidar en asunto **[EDAED]**.


## Primer trabajo grupal.

### Objetivo.

Realizar una descripción y un análisis exploratorio de datos de la encuesta
realizada en clase para determinar relaciones entre el uso
del tiempo y el desempeño académico y también entre el uso
del tiempo y el puntaje en obtenido en conocimientos
culturales.

### Actividades.

1. Crear grupo de máximo cinco (5) estudiantes, preferiblemente
   que se incluyan tanto estudiantes de Ingeniería de Sistemas como
   de Estadística.
2. Realizar una análisis descriptivo y exploratorio guiados
   por el objetivo anteriormente expuesto.
3. Constuir un trabajo (sin código) que muestre el análisis
   realizado y las tablas y gráficas obtenidas de acuerdo al
   objetivo del trabajo.

### Consideraciones

El trabajo escrito deberá contener como mínimo:

1. Listado de los integrantes del grupo, nombre e identificación.
2. Breve introducción (no más de dos párrafos) sobre el trabajo
   elaborado.
3. Desarrollo del trabajo. Gráficas exploratorias y análisis de
    los resultados obtenidos.
4. Conclusiones y recomendaciones.
5. Bibliografia y cibergrafía.     

### Documentos para entregar.

1. Archivo en formato **.xls** o **.xlsx** con la base de datos.
2. Archivo en formato **.Rmd** que construye el archivo **html**.
3. Archivo en formato del informe final del trabajo en formato
    **.html** con el informe y que **no** incluya el código.

### Fecha de entrega

Viernes, 29 de septiembre de 2017 antes de las 23:59 hora de Colombia,
al correo **krcabrer@unal.edu.co** y no olvidar incluir en el texto
del correo los nombres e identificaciones de los miembros del grupo tal
como aparecen en el trabajo y en asunto **[EDAED]**.

## Segundo trabajo grupal.

### Objetivo.

Realizar un análisis exploratorio en donde se
contesten diez (10) preguntas hechas a una base
de datos sobre las atenciones en [salud en Medellín
durante el año 2016](https://www.datos.gov.co/Salud-y-Protecci-n-Social/Atenciones-en-Consulta-Externa-Municipio-de-Medell/huya-zzzg).

### Consideraciones.

En grupos de máximo cinco (5) personas que construyan
diez (10) preguntas que le permitan al secretario
de salud tomar decisiones en cuanto políticas
de salud en Medellín.

### Documentos para entregar.

 - Archivo en formato ".html" en donde
   estén tanto las preguntas como las respuestas
   ya sean esta en tablas o en gráficas sin el
   código de R.
 - Archivo o archivos en formato ".Rmd" en donde esté
   el código utilizado para procesar la información.   

### Fecha de entrega.

   Martes, 24 de octubre de 2107 antes de las 23:59 hora
   de Colombia, al correo **krcabrer@unal.edu.co**
   y no olvidar en el correo mencionar los miembros
   del grupo y en asunto escribir **[EDAED]**.

-->
