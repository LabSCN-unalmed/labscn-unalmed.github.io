---
layout: clase
title: 'Análisis del relieve relativo y mapas sombreados de relieve'
curso: 'cartografia-digital'
custom_js: 'mathjax'
---
<!-- clase: 3 -->

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

<!-- TODO

## Procedimiento en GRASS

Para la elaboración del mapa de relieve relativo de la zona representada en el modelo de elevación digital de `porcecito` se realizan las siguientes actividades:

- Consultar el N° de filas, columnas y píxeles que tiene el mapa de entrada `porcecito`.
- Definir las dimensiones de la ventana móvil a utilizar para la zona de vecindad.
- Calcular el rango de altitud en la zona de vecindad (`altura máxima - altura mínima`).
- Este mapa es el mapa de relieve relativo o relieve local de la región de porcecito.

### Consultar el contenido del mapa porcecito

Vamos a consultar cual es la información del mapa (metadatos).

~~~
r.info map=porcecito
~~~

~~~
 +----------------------------------------------------------------------------+
 | Layer:    porcecito                     Date: Mon Mar 26 14:56:39 2012    |
 | Mapset:   CursoGrass                     Login of Creator: admin-lsc       |
 | Location: CursoGrass                                                       |
 | DataBase: /home/usuario/Grass                                              |
 | Title:     ( porcecito )                                                   |
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

Resaltamos de la información del mapa:

- 1242 filas.
- 1144 columnas.
- 1’420.848 píxeles.
- 30.5 metros de resolución por píxel.
- La altitud mínima es de 958 msnm.
- La altitud máxima es de 2873 msnm.
- El tipo de datos del mapa es `CELL`.

La información recibida indica que el tipo de dato es `CELL` que en otros términos quiere decir que los valores de altitud del mapa `porcecito` se encuentran en números enteros. Para trabajar adecuadamente necesitamos transformar estos datos a números decimales para realizar operaciones.

#### Transformar los datos de números enteros a números decimales sin alterar los valores del archivo

Se utiliza el comando `r.mapcalc`, que permite realizar operaciones matemáticas sobre los valores de los mapas raster

~~~
r.mapcalc "porcecito = double(porcecito@PERMANENT)"
~~~

Utilizamos la función `double()`, que convierte los valores numéricos al tipo "double precision", que es un tipo de datos decimal.

Consultar nuevamente la información del mapa:

~~~
r.info map=porcecito
~~~

~~~
 +----------------------------------------------------------------------------+
 | Layer:    porcecito                     Date: Tue Ago  4 11:39:42 2015    |
 | Mapset:   CursoGrass                     Login of Creator: usuario         |
 | Location: CursoGrass                                                       |
 | DataBase: /home/usuario/Grass                                              |
 | Title:     ( porcecito )                                                  |
 | Timestamp: none                                                            |
 |----------------------------------------------------------------------------|
 |                                                                            |
 |   Type of Map:  raster               Number of Categories: 255             |
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

Observar que los datos del archivo se transformaron de `CELL` a `DCELL`.


### Cálculo de las dimensiones de la zona de vecindad {#calculo-dimensiones-zona-vecindad}

Un píxel en el mapa de entrada (`porcecito`) tiene unas dimensiones de 30 x 30 metros y una extensión de 900 m<sup>2</sup>.

Definamos para empezar como zona de vecindad una zona de 1.0 km<sup>2</sup> con centro en el píxel donde se realiza la operación. Con esta definición se establece una disyunción para los píxeles del mapa de entrada: para cualquier píxel del mapa de entrada se le puede interrogar así: **¿Pertenece o no pertenece a la vecindad?**

#### ¿Cuáles son las dimensiones de la ventana móvil para una zona de vecindad de 1.0 km<sup>2</sup>?

- Área de un píxel = 900 m<sup>2</sup>
- 1.0 km<sup>2</sup> = 1000000 m<sup>2</sup>
- N° de píxeles en 1.0 km<sup>2</sup> = 1111 píxeles aprox.
- Raíz cuadrada (N° de píxeles en 1.0 km<sup>2</sup>) = 33.333333
- Lado de la zona de vecindad / Lado del pixel (1000 m / 30 m = 33.33333)

La zona de vecindad corresponde a un cuadrado cuyo lado es equivalente a la longitud que se obtiene de sumar el lado de 33 píxeles.

### El mapa de relieve relativo

**Advertencia:** Es importante definir la región de cálculo antes de calcular el mapa de relieve relativo, de lo contrario el mapa resultante podría quedar con errores.
{: .alert .alert-warning}

Se obtiene el mapa de relieve relativo calculando el rango de altitud en la zona de vecindad.

~~~
r.neighbors input=porcecito output=porce1_RR_33 method=range size=33
~~~

**Nota:** Al calcular el mapa de relieve relativo, este "hereda" la tabla de colores del mapa de entrada `porcecito`, es necesario asignarle una tabla nueva al mapa recién crado para visualizarlo correctamente.
{: .alert .alert-info}

![Mapa de relieve relativo](/cartografia-digital/images/porce1_RR_33.png){: .img-responsive}

### Visualización 3D del mapa construido {#visualizacion-3D-mapa-construido}

![Visualización 3D del mapa de Relieve Relativo](/cartografia-digital/images/porce1_RR_33_3D.png){: .img-responsive}

_**¿Qué se observa en la imagen anterior?**_<br>
_**¿Se puede visualizar la estructura del relieve?**_<br>
_**¿En qué parte del relieve se presentan los desniveles altitudinales más pronunciados?**_
{: .text-danger .text-center}

#### Explorar esta otra opción y contestar los interrogantes precedentes

1. Visualizar el mapa `porcecito` en 3D.
2. Ir a la pestaña "Datos" del controlador de Vista 3D en la ventana de administración de capas.
3. En la sección "Atributos de superficie", seleccionar el nuevo mapa `porce1_RR_33` como "Reglas de color".

![Visualización 3D del mapa porcecito con los colores del mapa de Relieve Relativo](/cartografia-digital/images/porce1_RR_33_3D2.png){: .img-responsive}

### El contenido del mapa de relieve relativo

~~~
r.info map=porce1_RR_33
~~~

~~~
 +----------------------------------------------------------------------------+
 | Layer:    porce1_RR_33                   Date: Tue Ago  4 11:42:54 2015    |
 | Mapset:   CursoGrass                     Login of Creator: usuario         |
 | Location: CursoGrass                                                       |
 | DataBase: /home/usuario/Grass                                              |
 | Title:    33x33 neighborhood: range of porcecito ( porce1_RR_33 )         |
 | Timestamp: none                                                            |
 |----------------------------------------------------------------------------|
 |                                                                            |
 |   Type of Map:  raster               Number of Categories: 783             |
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
 |    r.neighbors input="porcecito" output="porce1_RR_33" method="range" \   |
 |    size=33                                                                 |
 |                                                                            |
 +----------------------------------------------------------------------------+
~~~
{: .output}

Este comando nos permite saber que el valor mínimo de RR es 45 metros y el valor máximo de RR es 783 metros.

~~~
r.report -h map=porce1_RR_33 units=p,c,k nsteps=20
~~~

**Nota:** Al ejecutar este comando aparecen ciertas advertencias debido a errores de traducción del GRASS, en este caso pueden ser ignoradas.
{: .alert .alert-info}

~~~
 100%
+-----------------------------------------------------------------------------+
|               Category Information                |   %  |   cell|  square  |
|          #|description                            | cover|  count|kilometers|
|-----------------------------------------------------------------------------|
|    45-81.9|from  to . . . . . . . . . . . . . . . |  2.01|  28556|  26.66108|
| 81.9-118.8|from  to . . . . . . . . . . . . . . . |  8.68| 123314| 115.13113|
|118.8-155.7|from  to . . . . . . . . . . . . . . . | 12.94| 183796| 171.59966|
|155.7-192.6|from  to . . . . . . . . . . . . . . . | 12.74| 181073| 169.05735|
|192.6-229.5|from  to . . . . . . . . . . . . . . . | 12.26| 174259| 162.69552|
|229.5-266.4|from  to . . . . . . . . . . . . . . . | 11.48| 163078| 152.25647|
|266.4-303.3|from  to . . . . . . . . . . . . . . . | 10.18| 144617| 135.02050|
|303.3-340.2|from  to . . . . . . . . . . . . . . . |  8.64| 122812| 114.66244|
|340.2-377.1|from  to . . . . . . . . . . . . . . . |  7.03|  99815|  93.19147|
|  377.1-414|from  to . . . . . . . . . . . . . . . |  5.31|  75509|  70.49837|
|  414-450.9|from  to . . . . . . . . . . . . . . . |  3.97|  56381|  52.63967|
|450.9-487.8|from  to . . . . . . . . . . . . . . . |  2.46|  34884|  32.56917|
|487.8-524.7|from  to . . . . . . . . . . . . . . . |  1.26|  17952|  16.76074|
|524.7-561.6|from  to . . . . . . . . . . . . . . . |  0.52|   7445|   6.95096|
|561.6-598.5|from  to . . . . . . . . . . . . . . . |  0.23|   3312|   3.09222|
|598.5-635.4|from  to . . . . . . . . . . . . . . . |  0.12|   1703|   1.58999|
|635.4-672.3|from  to . . . . . . . . . . . . . . . |  0.09|   1217|   1.13624|
|672.3-709.2|from  to . . . . . . . . . . . . . . . |  0.05|    679|   0.63394|
|709.2-746.1|from  to . . . . . . . . . . . . . . . |  0.03|    412|   0.38466|
|  746.1-783|from  to . . . . . . . . . . . . . . . |  0.00|     34|   0.03174|
|-----------------------------------------------------------------------------|
|TOTAL                                              |100.00|1420848|1326.56333|
+-----------------------------------------------------------------------------+
~~~
{: .output}

Con el comando `r.report` se obtiene información sobre la distribución de los valores de relieve relativo en la zona del mapa de `porce1_RR_33`.

La tabla obtenida puede ser llevada a LibreOffice para ser incluída en un informe posterior, para ello se utiliza el parámetro `output` para guardar el contenido en un archivo `.csv`:

~~~
r.report -h map=porce1_RR_33 units=p,c,k nsteps=20 output=reporte_porce1_RR_33.csv
~~~

El archivo debe ser editado en gedit antes de poderse abrir con LibreOffice:

~~~
gedit reporte_porce1_RR_33.csv
~~~

Se eliminan las líneas que contienen guiones y se incluyen barras (`|`) para completar la primer columna en la primer y última fila, de manera que el contenido queda así:

~~~
|           |   Category Information                |   %  |   cell|  square  |
|          #|description                            | cover|  count|kilometers|
|    45-81.9|from  to . . . . . . . . . . . . . . . |  2.01|  28556|  26.66108|
| 81.9-118.8|from  to . . . . . . . . . . . . . . . |  8.68| 123314| 115.13113|
|118.8-155.7|from  to . . . . . . . . . . . . . . . | 12.94| 183796| 171.59966|
|155.7-192.6|from  to . . . . . . . . . . . . . . . | 12.74| 181073| 169.05735|
|192.6-229.5|from  to . . . . . . . . . . . . . . . | 12.26| 174259| 162.69552|
|229.5-266.4|from  to . . . . . . . . . . . . . . . | 11.48| 163078| 152.25647|
|266.4-303.3|from  to . . . . . . . . . . . . . . . | 10.18| 144617| 135.02050|
|303.3-340.2|from  to . . . . . . . . . . . . . . . |  8.64| 122812| 114.66244|
|340.2-377.1|from  to . . . . . . . . . . . . . . . |  7.03|  99815|  93.19147|
|  377.1-414|from  to . . . . . . . . . . . . . . . |  5.31|  75509|  70.49837|
|  414-450.9|from  to . . . . . . . . . . . . . . . |  3.97|  56381|  52.63967|
|450.9-487.8|from  to . . . . . . . . . . . . . . . |  2.46|  34884|  32.56917|
|487.8-524.7|from  to . . . . . . . . . . . . . . . |  1.26|  17952|  16.76074|
|524.7-561.6|from  to . . . . . . . . . . . . . . . |  0.52|   7445|   6.95096|
|561.6-598.5|from  to . . . . . . . . . . . . . . . |  0.23|   3312|   3.09222|
|598.5-635.4|from  to . . . . . . . . . . . . . . . |  0.12|   1703|   1.58999|
|635.4-672.3|from  to . . . . . . . . . . . . . . . |  0.09|   1217|   1.13624|
|672.3-709.2|from  to . . . . . . . . . . . . . . . |  0.05|    679|   0.63394|
|709.2-746.1|from  to . . . . . . . . . . . . . . . |  0.03|    412|   0.38466|
|  746.1-783|from  to . . . . . . . . . . . . . . . |  0.00|     34|   0.03174|
|TOTAL      |                                       |100.00|1420848|1326.56333|
~~~
{: .output}

Una vez realizadas estas modificaciones, el archivo `reporte_porce1_RR_33.csv` puede abrirse en LibreOffice, en donde se debe especificar que el separador es "Otro" y corresponde a la barra vertical `|`. Allí se le puede dar formato a la tabla y presentarse de una manera similar a la siguiente:

| Relieve Relativo | Porcentaje | No. Píxeles | Área (km<sup>2</sup>) |
|:----------------:|:----------:|:-----------:|:---------------------:|
|     45   -  81.9 |       2.01 |       28556 |              26.66108 |
|     81.9 - 118.8 |       8.68 |      123314 |             115.13113 |
|    118.8 - 155.7 |      12.94 |      183796 |             171.59966 |
|    155.7 - 192.6 |      12.74 |      181073 |             169.05735 |
|    192.6 - 229.5 |      12.26 |      174259 |             162.69552 |
|    229.5 - 266.4 |      11.48 |      163078 |             152.25647 |
|    266.4 - 303.3 |      10.18 |      144617 |             135.02050 |
|    303.3 - 340.2 |       8.64 |      122812 |             114.66244 |
|    340.2 - 377.1 |       7.03 |       99815 |              93.19147 |
|    377.1 - 414   |       5.31 |       75509 |              70.49837 |
|    414   - 450.9 |       3.97 |       56381 |              52.63967 |
|    450.9 - 487.8 |       2.46 |       34884 |              32.56917 |
|    487.8 - 524.7 |       1.26 |       17952 |              16.76074 |
|    524.7 - 561.6 |       0.52 |        7445 |               6.95096 |
|    561.6 - 598.5 |       0.23 |        3312 |               3.09222 |
|    598.5 - 635.4 |       0.12 |        1703 |               1.58999 |
|    635.4 - 672.3 |       0.09 |        1217 |               1.13624 |
|    672.3 - 709.2 |       0.05 |         679 |               0.63394 |
|    709.2 - 746.1 |       0.03 |         412 |               0.38466 |
|    746.1 - 783   |       0.00 |          34 |               0.03174 |
|==================|============|=============|=======================|
|        **TOTAL** | **100.00** | **1420848** |        **1326.56333** |
{: .table .table-hover}

**Nota:** Los datos del mapa deben ser del tipo `DCELL` para poder ser resumidos en rangos por el parámetro `nsteps` del comando `r.report`.
{: .alert .alert-info}

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

La comparación de las dos tablas permite establecer los siguientes rangos para reclasificar el mapa de relieve relativo.

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

### Reclasificación del mapa de relieve relativo {#reclasificacion-mapa-relieve-relativo}

El comando `r.reclass` crea un nuevo mapa (mapa reclasificado), cuyos valores de categorías están basados en una reclasificación de las categorías de una capa de mapa raster existente.

Para aplicar el comando `r.reclass` se requiere elaborar un script en gedit para aplicar, el cual contiene las reglas de la reclasificación a utilizar.

El script tiene el siguiente contenido:

`RCLS_porce1_RR`

~~~
 45 thru  82 = 1 Relieves planos y de colinas bajas.
 82 thru 150 = 2 Colinas intermedias.
150 thru 300 = 3 Colinas altas.
300 thru 350 = 4 Transicion entre relieve colinado y relieve de diseccion profunda.
350 thru 450 = 5 Diseccion profunda baja.
450 thru 600 = 6 Diseccion profunda intermedia.
600 thru 785 = 7 Diseccion profunda pronunciada.
~~~

- Se inicia con la altitud mínima.
- Se utilizan los rangos descritos en la tabla anterior.
- A cada rango de reclasificación de la altitud se le asigna un numero entero consecutivo (1, 2, 3, ...).
- Luego se hace una descripción corta (3 a 5 palabras) indicando lo que representa cada rango.
- Finalmente se guarda el "script" asignándole un nombre o etiqueta para su identificación. Por omisión, el programa GRASS guarda el script en la carpeta personal del usuario, de donde la tomará al momento de invocarla.
- Para identificar el script como unas reglas de reclasificación de un mapa especifico, se puede utilizar la convención: `RCLS_'Nombre del mapa a reclasificar'`. Por ejemplo: `RCLS_porce1_RR`

Reclasificar un mapa involucra la acción de construir un nuevo mapa (mapa de salida) a partir de un mapa de entrada.

- El mapa de entrada contiene los valores de una variable para cada uno de los píxeles.
- El mapa `porce1_RR_33` contiene el valor de RR para cada uno de los píxeles.

El mapa de salida asigna un numero entero similar para todos los píxeles cuyo valor se encuentra dentro de un rango dado. Por ejemplo, en el script creado se ha estipulado que a los píxeles con valor de RR entre 45 - 82 les asigne el número 1, a los píxeles entre 82 - 150 les asigne el número 2, y así sucesivamente.

De este modo obtenemos un mapa reclasificado del relieve relativo que contiene siete (7) categorías.

La orden para elaborar un mapa reclasificado del relieve relativo es la siguiente:

~~~
r.reclass input=porce1_RR_33 output=porce1_RR_33_reclass rules=RCLS_porce1_RR
~~~

### Consultar el contenido del mapa reclasificado

~~~
r.report -h map=porce1_RR_33_reclass units=p,c,k
~~~

~~~
 100%
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

Desplegar en 2D y en 3D el mapa reclasificado de relieve relativo

![2D](/cartografia-digital/images/porce1_RR_33_reclass.png){: .img-responsive}

![3D](/cartografia-digital/images/porce1_RR_33_reclass3D.png){: .img-responsive}

Al desplegar el mapa `porce1_RR_33_reclass` el programa GRASS asigna unos colores a cada categoría.

*¿Cómo asignar a voluntad del usuario una tabla de colores al mapa reclasificado de relieve relativo?*

### Simplificar un mapa reclasificado

Puede ocurrir que el mapa reclasificado en estudio contiene un numero elevado de categorías y sería interesante para algún propósito disminuir el numero de categorías para un análisis mas adecuado de lo que se estudia.

Por ejemplo: el mapa `porce1_RR_33_reclass` posee siete (7) categorías pero nos interesa únicamente diferenciar entre colinas, relieve de transición y relieve de disección profunda. Es decir crear un mapa reclasificado de relieve relativo con tres categorías.

En este caso, se trata de simplificar un mapa reclasificado existente: Elaborar un mapa reclasificado mas simple a partir de otro mapa
reclasificado.

Se elabora en gedit la nueva tabla de reclasificación y se guarda con un nombre.

`RCLS_porce1_RR_simplif`

~~~
1 2 3 = 1
  4   = 2
5 6 7 = 3
~~~

Se aplica el comando de reclasificación.

~~~
r.reclass input=porce1_RR_33_reclass output=porce1_RR_33_reclass_simplif rules=RCLS_porce1_RR-simplif
~~~

<!--- d.rast porce1_RR_33_reclass_simplif -->

<!-- ![2D](/cartografia-digital/images/porce1_RR_33_reclass_simplif.png){: .img-responsive}

En vista 3D se obtiene: -->

<!--- ~~~
nviz porcecito color=porce1_RR_33_reclass_simplif
~~~ -->

<!-- ![3D](/cartografia-digital/images/porce1_RR_33_reclass_simplif3D.png){: .img-responsive} -->

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
