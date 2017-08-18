---
layout: clase
title: 'Análisis del relieve relativo y mapas sombreados de relieve'
curso: 'cartografia-digital'
custom_js: 'mathjax'
clase: 3
---

<!-- ## Fundamentos teóricos {#fundamentos-teoricos} -->

## El concepto de relieve relativo

<!--
- Tipos de relieve relativo (montañoso, colinado, plano).
- ¿Cómo construiría usted un mapa de relieve relativo a partir de un DEM?
- Relación entre tipo de relieve relativo y tamaño de la ventana móvil.
- Álgebra de mapas: operaciones básicas (suma, resta, multiplicación, división).

### El concepto de análisis de vecindad {#concepto-analisis-vecindad}

- El análisis de vecindad a partir de un mapa raster.
- La ventana móvil como dimensión de la vecindad.
- La relación entre ventana móvil y mapa.
- Efecto de borde.
- Operaciones de vecindad. ¿Cuáles son las posibles operaciones?

### Diferencias entre un mapa de una variable determinada y un mapa reclasificado de dicha variable

- La naturaleza del valor del píxel.
- Reducción en la cantidad y calidad de la información.
- Simplificación del mapa original.
- Se pueden obtener múltiples mapas reclasificados a partir del mapa original.

## Desarrollo

### Relieve relativo o relieve local -->

El relieve relativo o relieve local se define como la diferencia vertical en elevación entre los puntos mas altos y los puntos mas bajos dentro de una región dada o a lo largo de un perfil o linea en el terreno.

Los puntos mas altos en el relieve de una región se ubican en las divisorias de agua.

Los puntos mas bajos en el relieve se ubican en las vaguadas y en los canales de las corrientes de agua.

El relieve relativo de una zona se obtiene con mas precisión si la diferencia de altitud es aquella que se obtiene de la diferencia entre altittudes de divisoria y altitudes de canales fluviales.

Los valores de relieve relativo en una región dada permiten establecer diferencias entre tipos de relieve: relieve plano, relieve ondulado, relieve colinado y relieve montañoso. Adicionalmente, permite diferenciar entre relieve montañosos bajo, medio y alto ; situación similar se puede establecer para los relieves colinados.

El relieve relativo de una región es una resultante del balance entre los ritmos de levantamiento tectónico y las tasas de incisión fluvial de las redes de drenaje.

El relieve relativo se puede emplear como un índice de referencia de la velocidad relativa de los movimientos tectónicos verticales en un cinturón cordillerano.

La relación entre relieve relativo y la extensión de la zona de referencia.

El valor de relieve relativo depende de las dimensiones de la zona de referencia. Por ejemplo, el valor de relieve relativo para un punto ubicado en el centro de la ciudad de Medellín depende de la zona de referencia para calcularlo: en un circulo de 100 metros de radio se obtiene un valor. Si aumentamos el valor del radio a 1000 metros, a 5.0 km, a 10 km, a 50 km, etc, ¿Cuáles serán los valores de relieve relativo que se obtienen?

## Análisis de vecindad {#analisis-vecindad}

Recordar la estructura de un archivo o mapa raster.

¿Cuántas filas y cuantas columnas tiene el mapa `porcecito`?
<br><br>
¿Cuántos píxeles contiene el mapa `porcecito`?
{: .alert .alert-warning}

La ventana móvil permite definir el tamaño o dimensiones de la vecindad donde se realiza el análisis. Es decir, permite definir los píxeles vecinos alrededor de un píxel en los cuales se realiza el análisis de vecindad. Para el análisis de vecindad se selecciona una especie de subretícula de forma cuadrada que contiene un numero impar de píxeles. Seleccionar un cuadrado con un numero impar de píxeles por lado garantiza la existencia de un píxel central único.

Por ejemplo: Supongamos que un terreno tiene tipos de relieve diversos (plano, colinado y montañoso) con una densidad de drenaje moderadamente alta.

Si se selecciona una ventana móvil de 100 x 100 metros como zona de vecindad, es decir, 0.01 km<sup>2</sup>, podría suceder que la zona no incluya simultáneamente píxeles en posición de divisoria de aguas y píxeles ubicados en los canales de corrientes de agua. Por lo tanto, mientras la ventana móvil sea muy pequeña, es posible que no se tenga un valor representativo del relieve local.

Existe un valor óptimo de tamaño de ventana móvil para obtener una representación pertinente del relieve relativo de una región.

El análisis de vecindad en un mapa raster consiste en realizar una operación especifica con los píxeles que abarca la ventana móvil y el resultado llevarlo al píxel equivalente de un nuevo mapa de salida.

Los pasos del análisis de vecindad se pueden esquematizar así:

- Se define las dimensiones de la ventana móvil.
- Se recorre el mapa de entrada con la ventana móvil por cada uno de sus píxeles.
- En cada píxel del mapa de entrada, la ventana móvil identifica los píxeles vecinos.
- Con los píxeles vecinos realiza una operación matemática (promedio, mediana, moda, valor máximo, valor mínimo, etc).
- El valor obtenido lo lleva al píxel equivalente de un mapa de salida.
- En este sentido, el mapa de entrada y el mapa de salida tienen el mismo numero de filas, columnas y píxeles.
- El análisis de vecindad consiste en recorrer, uno a uno, todos los píxeles del mapa de entrada y los resultados de la operación trasladarlos a los respectivos píxeles del mapa de salida.

El análisis de vecindad, como se esquematiza en los pasos anteriores indica que se presentan problemas de borde. Cuando el centro de la ventana móvil se ubica en los píxeles de borde, las operaciones a realizar no incorporan la totalidad de píxeles de vecindad porque muchos de ellos quedan por fuera del mapa de entrada.

## Ejemplo ilustrado

Para ilustrar mejor el proceso de un análisis de vecindad, tomemos el siguiente pedazo del DEM de `porcecito` de 10 filas y 10 columnas para un total de 100 pixeles:

![](/cartografia-digital/images/clase-03/clase-03_01.png){: .img-responsive}

Se define una ventana móvil de 3 pixeles, la cual se desplazará por cada pixel del mapa inicial.

![](/cartografia-digital/images/clase-03/clase-03_02.png){: .img-responsive}

Para el primer pixel del mapa la ventana móvil se ubica con su centro en el pixel y realiza el cálculo del nuevo valor del pixel central teniendo en cuenta el velor del pixel y los de sus 3 vecinos.

![](/cartografia-digital/images/clase-03/clase-03_03.png){: .img-responsive}

Para el caso del relieve relativo el cálculo es el del rango, es decir, la diferencia entre el valor mínimo y el valor máximo dentro de la zona de vecindad:

$$
\begin{align}
H_{max} &=& 1929\\
H_{min} &=& 1911\\
H_{max} - H_{min} &=& 18\\
\end{align}
$$

Este valor se ubica en una nueva capa en el pixel ubicado en el centro de la ventana móvil.

![](/cartografia-digital/images/clase-03/clase-03_04.png){: .img-responsive}

Se pasa al siguiente pixel y se repite el cálculo:

![](/cartografia-digital/images/clase-03/clase-03_05.png){: .img-responsive}

$$
\begin{align}
H_{max} &=& 1929\\
H_{min} &=& 1900\\
H_{max} - H_{min} &=& 29\\
\end{align}
$$

![](/cartografia-digital/images/clase-03/clase-03_06.png){: .img-responsive}

En estos casos se presenta el denominado _**efecto de borde**_, que consiste en que la ventana móvil tiene menos pixeles para realizar el cálculo que en otros pixeles.
{: .alert .alert-warning}

Por ejemplo en este pixel no se presenta efecto de borde:

![](/cartografia-digital/images/clase-03/clase-03_07.png){: .img-responsive}

$$
\begin{align}
H_{max} &=& 1929\\
H_{min} &=& 1899\\
H_{max} - H_{min} &=& 30\\
\end{align}
$$

![](/cartografia-digital/images/clase-03/clase-03_08.png){: .img-responsive}

El _**efecto de borde**_ depende del tamaño de la ventana móvil.
{: .alert .alert-info}

El resultado final luego de recorrer los 100 pixeles es el siguiente:

![](/cartografia-digital/images/clase-03/clase-03_09.png){: .img-responsive}


## Procedimiento en GRASS

Para la elaboración del mapa de relieve relativo de la zona representada en el modelo de elevación digital de `porcecito` se realizan las siguientes actividades:

- Consultar el N° de filas, columnas y píxeles que tiene el mapa de entrada `porcecito`.
- Definir las dimensiones de la ventana móvil a utilizar para la zona de vecindad.
- Calcular el rango de altitud en la zona de vecindad (`altura máxima - altura mínima`).
- Este mapa es el mapa de relieve relativo o relieve local de la región de porcecito.

### Consultar el contenido del mapa porcecito

Vamos a consultar la información del mapa por medio del menú contextual de la capa, seleccionando la opción de metadatos.

![](/cartografia-digital/images/clase-03/clase-03_10.png){: .img-responsive}

Esta opción invoca el módulo `r.info` que permite conocer los metadatos de una capa ráster.

![](/cartografia-digital/images/clase-03/clase-03_11.png){: .img-responsive}

Resaltamos la información del mapa:

- 1242 filas.
- 1144 columnas.
- 1’420.848 píxeles.
- 30.5 metros de resolución por píxel.
- La altitud mínima es de 958 msnm.
- La altitud máxima es de 2873 msnm.
- El tipo de datos del mapa es `CELL`.

<!-- ~~~
r.info map=porcecito
~~~ -->

~~~
+----------------------------------------------------------------------------+
| Map:      porcecito@PERMANENT            Date: Mon Mar 26 14:56:39 2012    |
| Mapset:   PERMANENT                      Login of Creator: admin-lsc       |
| Location: CursoGrass                                                       |
| DataBase: /home/estudiante/Grass                                           |
| Title:    porcecito                                                        |
| Timestamp: none                                                            |
|----------------------------------------------------------------------------|
|                                                                            |
|   Type of Map:  raster               Number of Categories: 2873            |
|   Data Type:    CELL                                                       |
|   Rows:         1242                                                       |
|   Columns:      1144                                                       |
|   Total Cells:  1420848                                                    |
|        Projection: Transverse Mercator                                     |
|            N: 1231633.33333336    S: 1193683.33333335   Res: 30.55555556   |
|            E: 889777.77777778    W: 854822.22222223   Res: 30.55555556     |
|   Range of data:    min = 958  max = 2873                                  |
|                                                                            |
|   Data Description:                                                        |
|    generated by r.in.gdal                                                  |
|                                                                            |
|   Comments:                                                                |
|    r.in.gdal -o -e input="porcecito.tiff" output="porcecito"               |
|                                                                            |
+----------------------------------------------------------------------------+
~~~
{: .output}

La información recibida indica que el tipo de dato es `CELL` que en otros términos quiere decir que los valores del mapa `porcecito` se encuentran en **números enteros**. Para trabajar adecuadamente necesitamos transformar estos datos a **números reales** para realizar operaciones. El tipo de datos `CELL` se utiliza para representar mapas **categóricos** o **discretos**, para mapas **continuos** se debe utilizar el tipo de datos `FCELL` ó `DCELL`.

La diferencia entre `FCELL` y `DCELL` radica en la precision decimal de uno y otro. Ambos tipos de datos representan números reales o de coma flotante (float), `DCELL` tiene mayor precisión decimal o _double precision_ mientras que `FCELL` corresponde a la precisión estándar.
{: .alert .alert-info}

### Transformar el tipo de datos de una capa raster de entero a real

Esto se hace por medio de la calculadora raster `r.mapcalc`, la cual invocamos por medio del botón **Calculadora de mapas raster** ![](/cartografia-digital/images/clase-03/raster-calculator.png).

![](/cartografia-digital/images/clase-03/clase-03_12.png){: .img-responsive}

* Indicamos el nombre del nuevo mapa que resultará de la operación.
* Insertamos la función `double()` que convierte los datos de entrada al tipo **double precision**.
* Insertamos el mapa raster existente en la fórmula.

![](/cartografia-digital/images/clase-03/clase-03_13.png){: .img-responsive}

Al ejecutar la operación la consola nos informará de ello y la nueva capa será agregada al administrador de capas.

Nótese que utilizamos el mismo nombre para el mapa resultante, pero dado que estamos trabajando en un **MAPSET** diferente al PERMANENT, se creará una copia del mapa original en el directorio de mapas actual.

![](/cartografia-digital/images/clase-03/clase-03_14.png){: .img-responsive}

Podemos diferenciarlos pues GRASS pone el nombre del MAPSET después del nombre de la capa por medio de un `@`.

Consultamos nuevamente la información del nuevo mapa:

![](/cartografia-digital/images/clase-03/clase-03_15.png){: .img-responsive}

Y así comprobamos que los datos del archivo se transformaron de `CELL` a `DCELL`.

~~~
+----------------------------------------------------------------------------+
| Map:      porcecito@estudiante           Date: Thu Aug 17 14:35:46 2017    |
| Mapset:   estudiante                     Login of Creator: estudiante      |
| Location: CursoGrass                                                       |
| DataBase: /home/estudiante/Grass                                           |
| Title:    porcecito                                                        |
| Timestamp: none                                                            |
|----------------------------------------------------------------------------|
|                                                                            |
|   Type of Map:  raster               Number of Categories: 0               |
|   Data Type:    DCELL                                                      |
|   Rows:         1242                                                       |
|   Columns:      1144                                                       |
|   Total Cells:  1420848                                                    |
|        Projection: Transverse Mercator                                     |
|            N: 1231633.33333336    S: 1193683.33333335   Res: 30.55555556   |
|            E: 889777.77777778    W: 854822.22222223   Res: 30.55555556     |
|   Range of data:    min = 958  max = 2873                                  |
|                                                                            |
|   Data Description:                                                        |
|    generated by r.mapcalc                                                  |
|                                                                            |
|   Comments:                                                                |
|    double(porcecito@PERMANENT)                                             |
|                                                                            |
+----------------------------------------------------------------------------+
~~~
{: .output}

### Cálculo de las dimensiones de la ventana móvil {#calculo-dimensiones-ventana-movil}

Definamos para empezar como ventana móvil una zona de 1km x 1km, el cálculo de la cantidad de pixeles de la zona de vecindad sería de la siguiente manera:

- Resolución del pixel = 30m x 30m
- Ventana móvil = 1000m x 1000m
- N° de píxeles en 1km = 1000m / 30m = 33.333333
- Redondeando al número entero impar más cercano = 33

El tamaño de la ventana móvil es de **33 x 33** pixeles.
{: .alert .alert-success}

### El mapa de relieve relativo

Es importante definir la región de cálculo antes de calcular el mapa de relieve relativo, de lo contrario el mapa resultante podría quedar con errores.
{: .alert .alert-warning}

Se define la región de acuerdo al mapa.

![](/cartografia-digital/images/clase-03/clase-03_16.png){: .img-responsive}

Se obtiene el mapa de relieve relativo calculando el rango de altitud en la zona de vecindad por medio del módulo `r.neighbors` el cual abrimos por medio del menú _Raster -> Neighborhood analysis -> Moving window_.

![](/cartografia-digital/images/clase-03/clase-03_17.png){: .img-responsive}

Se abre la ventana de la herramienta de análisis de vecindad en la cual especificamos que el mapa de entrada es la copia de `porcecito` que se transformó anteriormente, y asignamos un nombre a la capa que obtendremos, por nemotecnia se sugiere utilizar `porcecito_RR_33`, que indica la capa a partir de la cual se calcula el RR (relieve relativo) y el tamaño de la ventana móvil utilizada.

![](/cartografia-digital/images/clase-03/clase-03_18.png){: .img-responsive}

En la pestaña _Neighborhood_ seleccionamos la operación _range_ y especificamos el tamaño de la ventana móvil que [calculamos anteriormente](#calculo-dimensiones-ventana-movil).

![](/cartografia-digital/images/clase-03/clase-03_19.png){: .img-responsive}

La herramienta de análisis de vecindad permite realizar varias operaciones simultáneas y procudir varias capas, para esto se debe tener en cuenta el orden de las operaciones como lo indica la herramienta en la parte inferior, e indicar los nombres de las capas de salida en el mismo orden.
{: .alert .alert-info}

![](/cartografia-digital/images/clase-03/clase-03_20.png){: .img-responsive}

El cálculo toma un momento y el mapa resultante es agregada al árbol de capas.

![](/cartografia-digital/images/clase-03/clase-03_21.png){: .img-responsive}

Al calcular el mapa de relieve relativo, este "hereda" la tabla de colores del mapa de entrada, en ocasiones el mapa resultante aparece en blanco pues los valores del nuevo mapa quedan por fuera de los valores definidos en la tabla de colores del mapa inicial, por lo que se hace necesario asignarle una tabla nueva al mapa recién crado para visualizarlo correctamente.
{: .alert .alert-warning}

![Mapa de relieve relativo](/cartografia-digital/images/clase-03/porcecito_RR_33.png){: .img-responsive}

### Visualización 3D del mapa construido {#visualizacion-3D-mapa-construido}

![Visualización 3D del mapa de Relieve Relativo](/cartografia-digital/images/clase-03/porcecito_RR_33_3D.png){: .img-responsive}

_**¿Qué se observa en la imagen anterior?**_<br>
_**¿Se puede visualizar la estructura del relieve?**_<br>
_**¿En qué parte del relieve se presentan los desniveles altitudinales más pronunciados?**_
{: .text-danger .text-center}

Explorar esta otra opción y contestar los interrogantes precedentes:

1. Visualizar el mapa `porcecito` en 3D.
2. Ir a la pestaña "Datos" del controlador de Vista 3D en la ventana de administración de capas.
3. En la sección "Atributos de superficie", seleccionar el nuevo mapa `porcecito_RR_33` como "Color".

![Visualización 3D del mapa porcecito con los colores del mapa de Relieve Relativo](/cartografia-digital/images/clase-03/porcecito_RR_33_3D2.png){: .img-responsive}

### El contenido del mapa de relieve relativo

Consultando los metadatos y los estadísticos del mapa de relieve relativo obtenemos:

~~~
+----------------------------------------------------------------------------+
| Map:      porcecito_RR_33@estudiante     Date: Thu Aug 17 16:49:30 2017    |
| Mapset:   estudiante                     Login of Creator: estudiante      |
| Location: CursoGrass                                                       |
| DataBase: /home/estudiante/Grass                                           |
| Title:    33x33 neighborhood: range of porcecito@estudiante                |
| Timestamp: none                                                            |
|----------------------------------------------------------------------------|
|                                                                            |
|   Type of Map:  raster               Number of Categories: 0               |
|   Data Type:    DCELL                                                      |
|   Rows:         1242                                                       |
|   Columns:      1144                                                       |
|   Total Cells:  1420848                                                    |
|        Projection: Transverse Mercator                                     |
|            N: 1231633.33333336    S: 1193683.33333335   Res: 30.55555556   |
|            E: 889777.77777778    W: 854822.22222223   Res: 30.55555556     |
|   Range of data:    min = 45  max = 783                                    |
|                                                                            |
|   Data Description:                                                        |
|    generated by r.neighbors                                                |
|                                                                            |
|   Comments:                                                                |
|    r.neighbors input="porcecito@estudiante" output="porcecito_RR_33" me\   |
|    thod="range" size=33                                                    |
|                                                                            |
+----------------------------------------------------------------------------+
~~~
{: .output}

De esta manera sabemos que el valor mínimo de RR es 45 metros y el valor máximo de RR es 783 metros.

~~~
total null and non-null cells: 1420848
total null cells: 0
Of the non-null cells:
----------------------
n: 1420848
minimum: 45
maximum: 783
range: 738
mean: 248.461
mean of absolute values: 248.461
standard deviation: 110.038
variance: 12108.4
variation coefficient: 44.2881 %
sum: 353024652
~~~
{: .output}

También podemos obtener un reporte de áreas para rangos de relieve relativo, para esto utilizamos la herramienta `r.report` la cual abrimos por medio del menú _Raster -> Reports and statistics -> Sum area by raster map and category_.

![](/cartografia-digital/images/clase-03/clase-03_22.png){: .img-responsive}

En la que seleccionamos el mapa de relieve relativo (si no estaba ya seleccionado en el árbol de capas).

![](/cartografia-digital/images/clase-03/clase-03_23.png){: .img-responsive}

En la pestaña _Statistics_ seleccionamos las unidades en las cuales queremos obtener el reporte.

![](/cartografia-digital/images/clase-03/clase-03_24.png){: .img-responsive}

En la pestaña _Formatting_ indicamos que no queremos ver el encabezado y tenemos la opción de ordenar las estadísticas en forma ascendente o descendente del conteo de pixels.

![](/cartografia-digital/images/clase-03/clase-03_25.png){: .img-responsive}

En la pestaña _Floating point_ especificamos el número de rangos de relieve relativo que queremos obtener.

![](/cartografia-digital/images/clase-03/clase-03_26.png){: .img-responsive}

Y al ejecutar obtenemos el reporte.

![](/cartografia-digital/images/clase-03/clase-03_27.png){: .img-responsive}

De esta forma obtenemos información sobre la distribución de los valores de relieve relativo.

~~~
+-----------------------------------------------------------------------------+
|               Category Information                |  square  |   cell|   %  |
|          #|description                            |kilometers|  count| cover|
|-----------------------------------------------------------------------------|
|   45-118.8|from  to . . . . . . . . . . . . . . . | 141.79221| 151870| 10.69|
|118.8-192.6|from  to . . . . . . . . . . . . . . . | 340.65701| 364869| 25.68|
|192.6-266.4|from  to . . . . . . . . . . . . . . . | 314.95198| 337337| 23.74|
|266.4-340.2|from  to . . . . . . . . . . . . . . . | 249.68294| 267429| 18.82|
|  340.2-414|from  to . . . . . . . . . . . . . . . | 163.68985| 175324| 12.34|
|  414-487.8|from  to . . . . . . . . . . . . . . . |  85.20883|  91265|  6.42|
|487.8-561.6|from  to . . . . . . . . . . . . . . . |  23.71171|  25397|  1.79|
|561.6-635.4|from  to . . . . . . . . . . . . . . . |   4.68221|   5015|  0.35|
|635.4-709.2|from  to . . . . . . . . . . . . . . . |   1.77019|   1896|  0.13|
|  709.2-783|from  to . . . . . . . . . . . . . . . |   0.41640|    446|  0.03|
|-----------------------------------------------------------------------------|
|TOTAL                                              |1326.56333|1420848|100.00|
+-----------------------------------------------------------------------------+
~~~
{: .output}

### Reclasificación del mapa de relieve relativo {#reclasificacion-mapa-relieve-relativo}

En un trabajo acerca del relieve de Antioquia hemos empleado la clasificación que se observa en la siguiente tabla  para la definición de tipos de relieve de acuerdo al valor del Relieve Relativo.

| Valor de RR | Descripción morfológica                                               |
|:-----------:|:----------------------------------------------------------------------|
|    0 -   10 | Zonas de relieve muy suave                                            |
|   10 -   75 | Colinas bajas                                                         |
|   75 -  150 | Colinas intermedias                                                   |
|  150 -  300 | Colinas altas                                                         |
|  300 -  350 | Transición entre relieves colinados y relieves con disección profunda |
|  350 -  450 | Disección profunda baja                                               |
|  450 -  600 | Disección profunda intermedia                                         |
|  600 - 1200 | Disección profunda pronunciada                                        |
{: .table .table-hover}

La comparación de esta tabla con el reporte obtenido del mapa de relieve relativo permite establecer los siguientes rangos para su reclasificación.

| Valor de RR | Descripción morfológica                                           |
|:-----------:|:------------------------------------------------------------------|
|   45 -   82 | Relieves planos y de colinas bajas                                |
|   82 -  150 | Colinas intermedias                                               |
|  150 -  300 | Colinas altas                                                     |
|  300 -  350 | Transición entre relieve colinado y relieve de disección profunda |
|  350 -  450 | Disección profunda baja                                           |
|  450 -  600 | Disección profunda intermedia                                     |
|  600 - 1200 | Disección profunda pronunciada                                  |
{: .table .table-hover}

Lo que haremos en GRASS será crear un nuevo mapa discreto que agrupe los valores de relieve relativo en valores categóricos de acuerdo a las reglas que especifiquemos. Para esto utilizamos la herramienta `r.reclass` la cual abrimos desde el menú _Raster -> Change category values and labels -> Reclassify_.

![](/cartografia-digital/images/clase-03/clase-03_28.png){: .img-responsive}

En ella indicamos como entrada el mapa que vamos a reclasificar, como salida el nombre que tendrá el mapa reclasificado, y para especificar las reglas de reclasificación tenemos 2 opciones:

- Indicar un archivo de texto con las reglas de reclasificación.
- Ingresar las reglas directamente en el espacio destinado para las reglas.

![](/cartografia-digital/images/clase-03/clase-03_29.png){: .img-responsive}

Las reglas de reclasificación son las siguientes:

~~~
 45 thru  82 = 1 Relieves planos y de colinas bajas
 82 thru 150 = 2 Colinas intermedias
150 thru 300 = 3 Colinas altas
300 thru 350 = 4 Transicion entre relieve colinado y relieve de diseccion profunda
350 thru 450 = 5 Diseccion profunda baja
450 thru 600 = 6 Diseccion profunda intermedia
600 thru 785 = 7 Diseccion profunda pronunciada
~~~

- Se inicia con el valor mínimo redondeando hacia abajo.
- Se utilizan los rangos descritos en la tabla anterior.
- Se le asigna un numero entero consecutivo (1, 2, 3, ...) a cada rango.
- Se hace una descripción corta (3 a 5 palabras) indicando lo que representa cada rango.

Sólo se pueden utilizar valores enteros para definir los rangos, los valores decimales son aproximados a un valor entero.
{: .alert .alert-warning}

El mapa de salida tiene el mismo número entero para todos los píxeles cuyo valor se encuentra dentro de un rango dado. Por ejemplo, en el script creado se ha estipulado que a los píxeles con valor de RR entre 45 - 82 les asigne el número 1, a los píxeles entre 82 - 150 les asigne el número 2, y así sucesivamente.

![](/cartografia-digital/images/clase-03/clase-03_30.png){: .img-responsive}

De este modo obtenemos un mapa reclasificado del relieve relativo que contiene 7 categorías.

### Consultar el contenido del mapa reclasificado

Realizamos un reporte de la distribución espacial de las categorías del nuevo mapa.

~~~
+-----------------------------------------------------------------------------+
|               Category Information                |   %  |   cell|  square  |
|#|description                                      | cover|  count|kilometers|
|-----------------------------------------------------------------------------|
|1|Relieves planos y de colinas bajas.. . . . . . . |  2.01|  28556|  26.66108|
|2|Colinas intermedias. . . . . . . . . . . . . . . | 19.44| 276185| 257.85791|
|3|Colinas altas. . . . . . . . . . . . . . . . . . | 47.80| 679174| 634.10535|
|4|Transicion entre relieve colinado y relieve de . | 11.49| 163250| 152.41705|
| |diseccion profunda.                              |      |       |          |
|5|Diseccion profunda baja. . . . . . . . . . . . . | 14.42| 204826| 191.23415|
|6|Diseccion profunda intermedia. . . . . . . . . . |  4.57|  64903|  60.59617|
|7|Diseccion profunda pronunciada.. . . . . . . . . |  0.28|   3954|   3.69162|
|-----------------------------------------------------------------------------|
|TOTAL                                              |100.00|1420848|1326.56333|
+-----------------------------------------------------------------------------+
~~~
{: .output}

Con el informe obtenido podemos responder preguntas, tales como:

- ¿Cuál es el tipo de relieve dominante en la zona de estudio y que extensión ocupa?
- ¿Qué importancia en área tiene en la zona de estudio los relieves mas suaves?

Desplegando en 2D y en 3D el mapa reclasificado de relieve relativo:

![2D](/cartografia-digital/images/clase-03/porcecito_RR_33_rcls.png){: .img-responsive}

![3D](/cartografia-digital/images/clase-03/porcecito_RR_33_rcls3D.png){: .img-responsive}

### Simplificar un mapa reclasificado

Puede ocurrir que el mapa reclasificado en estudio contiene un numero elevado de categorías y sería interesante para algún propósito disminuir el numero de categorías para un análisis mas adecuado de lo que se estudia.

Por ejemplo: el mapa `porcecito_RR_33_rcls` posee 7 categorías pero nos interesa únicamente diferenciar entre colinas, relieve de transición y relieve de disección profunda. Es decir crear un mapa reclasificado de relieve relativo con tres categorías.

En este caso, se trata de simplificar un mapa reclasificado existente: Elaborar un mapa reclasificado mas simple a partir de otro mapa
reclasificado.

Se elabora una nueva tabla de reclasificación.

~~~
1 2 3 = 1 Relieve colinado
  4   = 2 Relieve de transición
5 6 7 = 3 Relieve disectado
~~~

Se utiliza la herramienta de reclasificación.

![](/cartografia-digital/images/clase-03/clase-03_31.png){: .img-responsive}

Y se obtiene el mapa simplificado.

![2D](/cartografia-digital/images/clase-03/porcecito_RR_33_rcls_simple.png){: .img-responsive}

En vista 3D se obtiene:

![3D](/cartografia-digital/images/clase-03/porcecito_RR_33_rcls_simple3D.png){: .img-responsive}

Y el reporte de las categorías quedaría así:

~~~
+-----------------------------------------------------------------------------+
|               Category Information                |  square  |   cell|   %  |
|#|description                                      |kilometers|  count| cover|
|-----------------------------------------------------------------------------|
|1|Relieve colinado . . . . . . . . . . . . . . . . | 918.62434| 983915| 69.25|
|2|Relieve de transición  . . . . . . . . . . . . . | 152.41705| 163250| 11.49|
|3|Relieve disectado. . . . . . . . . . . . . . . . | 255.52194| 273683| 19.26|
|-----------------------------------------------------------------------------|
|TOTAL                                              |1326.56333|1420848|100.00|
+-----------------------------------------------------------------------------+
~~~
{: .output}

## Construcción de mapas sombreados de relieve {#construccion-mapas-sombreados}

Los mapas sombreados permiten visualizar rasgos lineales en el relieve (lineamientos), estos se obtienen a partir del DEM y una posición hipotética del sol (fuente de luz) tanto en altura (ángulo con respecto al horitzonte) como en azimut (ángulo con respecto al norte). Al mapa resultante se le asigna de forma predeterminada una tabla de colores en tonos de gris.

Modificando los valores de altitud y de azimuth se obtienen sombreados diferentes.

Los lineamientos de un relieve resaltan mas en unas combinaciones especificas de altitud y azimuth mientras en otras combinaciones se difuminan.

Un lineamiento resalta cuando la luz incidente proviene de una trayectoria transversal y cuando la altitud de la luz es baja.

Para calcular el mapa sombreado de relieve se utiliza la herramienta `r.relief` la cual se abre desde el menú _Raster -> Terrain analysis -> Compute shaded relief_.

![](/cartografia-digital/images/clase-03/clase-03_32.png){: .img-responsive}

Acá se indica como mapa de entrada el DEM que es el mapa que contiene los valores de elevación y se asigna un nombre al mapa que se generará.

![](/cartografia-digital/images/clase-03/clase-03_33.png){: .img-responsive}

En la pestaña _Sun position_ se indican los ángulos del sol con respecto a la horizontal (altitud) y con respecto al norte (azimut).

![](/cartografia-digital/images/clase-03/clase-03_34.png){: .img-responsive}

El resultado inicial es el siguiente.

![Mapa sombreado con altitud 45° y azimuth 45°](/cartografia-digital/images/clase-03/porcecito_shade_45_45.png){: .img-responsive}

Para modificar el mapa y sobreescribirlo con unos nuevos valores de altitud y azimut se debe activar la opción de sobreescribir `--o` en la pestaña _Optional_.

![](/cartografia-digital/images/clase-03/clase-03_35.png){: .img-responsive}

Probamos con unos nuevos valores de altitud y azimut.

![](/cartografia-digital/images/clase-03/clase-03_36.png){: .img-responsive}

Y obtenemos el siguiente mapa:

![Mapa sombreado con altitud 30° y azimuth 135°](/cartografia-digital/images/clase-03/porcecito_shade_30_135.png){: .img-responsive}

_**¿Qué se puede concluir de la imagen anterior?**_<br>
_**¿Si representa adecuadamente el relieve del mapa?**_
{: .text-danger .text-center}

Probemos con esta otra combinación de altitud y azimut.

![](/cartografia-digital/images/clase-03/clase-03_37.png){: .img-responsive}

_**¿Mejoró?**_
{: .text-danger .text-center}

![Mapa sombreado con altitud 30° y azimuth 135°](/cartografia-digital/images/clase-03/porcecito_shade_30_0.png){: .img-responsive}

<!-- Agregar contenido sobre visualización HIS del mapa de relieve sombreado -->






<!--
████████  ██████  ██████   ██████
   ██    ██    ██ ██   ██ ██    ██
   ██    ██    ██ ██   ██ ██    ██
   ██    ██    ██ ██   ██ ██    ██
   ██     ██████  ██████   ██████

<!-- ## Tarea 4
{: .text-danger}

Elaborar el mapa de relieve relativo del archivo "ituango".
Utilizando la referencia para clasificar el relieve relativo que se presenta en esta clase,
entregar los siguientes productos:

1. Un mapa 2D de los valores de relieve relativo con variación gradual del color,
   empleando tres colores, un color para el valor mas bajo de RR,
   un segundo color para el valor de mediana del relieve relativo
   y un tercer color para el valor máximo de relieve relativo.
   El objetivo es seleccionar tres colores que permitan una
   visualización óptima del relieve relativo en el archivo.

2. Reclasificar el mapa de relieve relativo y emplear la variación
   gradual del color para diferenciar y contrastar
   los relieves de montaña y los relieves de colinas en el archivo.

3. Entregar una tabla (utilizar LibreOfficeCalc) indicando
   la extensión y el porcentaje de cada uno de los tipos
   de relieve identificados en el archivo "ituango".

4. Un guión en donde se muestre el procedimiento documentado para obtener
   la información requerida para desarrollar los puntos anteriores. -->

## Para reflexionar

* El tamaño de la ventana móvil en distintos contextos de relieve.
* El uso de ventanas móviles pequeñas o muy grandes.
* Distribución espacial de los valores de relieve relativo en una cuenca: Posibles significados.
* Aplicaciones potenciales de los mapas de relieve relativo.
* Diseño de nuevos mapas haciendo uso de otras operaciones disponibles en la herramienta de análisis de vecindad.
