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
fecha más antigua el 30 de Junio de 2018.

#### Actividades.

1. Buscar en una publicación colombiana, no más antigua que
junio 30 de 2018,  una gráfica informativa
que muestre problemas o que se pueda proponer una mejor
representación.
2. Construir una base de datos que represente los datos graficados
   en la publicación.
3. Construir una nueva gráfica que mejore la publicada.
4. Realizar un informe en donde se muestre la gráfica original y
   la propuesta e indicar por qué la nueva gráfica es una mejora
   con respecto a la anterior.

#### Documentos para entregar.

1. Archivo en formato **.xls** o **.xlsx** con la base de datos.
2. Archivo en formato **.Rmd** que construye el archivo **html**.
3. Archivo en formato **.html** con el informe y que **no** incluya
   el código.

#### Fecha de entrega.   

Martes, 12 de febrero de 2019 antes de las 23:59
[hora oficial de Colombia](http://horalegal.inm.gov.co/)
al correo **krcabrer@unal.edu.co** y no olvidar en asunto **[EDAED]**.


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
