---
layout: clase
title: 'El uso del color para visualización de capas ráster'
curso: 'cartografia-digital'
clase: 2
---

Mediante el administrador de capas de GRASS se pueden asignar colores mediante tablas predefinidas o de manera personalizada a capas de mapas raster.

Para esto se utiliza el menú contextual de la capa en cuestión, el cual tiene (entre otras) las siguientes 2 opciones:

![](/cartografia-digital/images/clase-02/clase-02_01.png){: .img-responsive}

## Asignación de color por tablas predefinidas {#asignacion-color-tablas-predefinidas}

Por medio de la opción ![](/cartografia-digital/images/circle_1.png) se pueden asignar tablas de colores que existen preestablecidas en GRASS.

Esta opción abre el módulo `r.colors` que permite manejar los colores de capas ráster:

![](/cartografia-digital/images/clase-02/clase-02_02.png){: .img-responsive}

Como se observa, la capa seleccionada en el administrador de capas corresponde con el mapa raster del diálogo del módulo.

![](/cartografia-digital/images/clase-02/clase-02_03.png){: .img-responsive}

Por medio de la pestaña _**Define**_{: .text-info} podemos desplegar un listado de las tablas de colores con una pequeña muestra de los colores que la componen.

![](/cartografia-digital/images/clase-02/clase-02_04.png){: .img-responsive}

Si necesitásemos eliminar la tabla de colores y dejar la capa ráster con los colores por omisión de GRASS, utilizaríamos la opción de la pestaña _**Remove**_{: .text-info}.

![](/cartografia-digital/images/clase-02/clase-02_05.png){: .img-responsive}


### La tabla de colores "srtm"

Para establecer la tabla de colores **srtm** al mapa `porcecito`, la seleccionamos en la pestaña _**Define**_{: .text-info}.

![](/cartografia-digital/images/clase-02/clase-02_06.png){: .img-responsive}

Y ejecutamos el módulo `r.colors`.

![](/cartografia-digital/images/clase-02/clase-02_07.png){: .img-responsive}

![La tabla de colores "srtm"](/cartografia-digital/images/clase-02/porcecito_srtm.png){: .img-responsive}

### La tabla de colores "aspect"

![La tabla de colores "aspect"](/cartografia-digital/images/clase-02/porcecito_aspect.png){: .img-responsive}

*¿Qué rasgos de la región resaltan con esta tabla de colores?*

### La tabla de colores "bcyr"

![La tabla de colores "bcyr"](/cartografia-digital/images/clase-02/porcecito_bcyr.png){: .img-responsive}

### La tabla de colores "elevation"

![La tabla de colores "elevation"](/cartografia-digital/images/clase-02/porcecito_elevation.png){: .img-responsive}

### La tabla de colores "rainbow"

![La tabla de colores "rainbow"](/cartografia-digital/images/clase-02/porcecito_rainbow.png){: .img-responsive}

## Asignación de color creando una tabla personalizada {#asignacion-color-creando-tabla-personalizada}

Ahora vamos a avanzar un paso más; no vamos a depender de las paletas de colores preestablecidas por GRASS sino que construimos la tabla a  nuestro gusto y también vamos a decidir a cuales rangos de la altitud la aplicamos.

Para llevarlo a cabo necesitamos conocer:

- Cual es la altitud máxima y la altitud mínima del mapa.
- Como queremos desplegar el color en el mapa.

Para conocer los valores máximo y minimo de altitud utilizamos un módulo de estadísticos de capa raster.

La segunda inquietud es mas compleja porque existen diversas maneras de hacerlo:

- Variación gradual del color.
- Variación discreta del color.
- Colores a partir de otro mapa raster.

### Conocer los estadísticos básicos del mapa {#consultar-estadisticos-basicos-mapa}

Por medio del menú contextual de la capa se puede seleccionar la opción de estadística univariada raster.

![](/cartografia-digital/images/clase-02/clase-02_08.png){: .img-responsive}

Esta opción invoca el módulo `r.univar` que permite conocer los estadísticos básicos de cualquier tipo de mapa raster.

![](/cartografia-digital/images/clase-02/clase-02_09.png){: .img-responsive}

Como tenemos un mapa de altitudes, con el comando podemos conocer:

- El N° total de píxeles.
- El N° de píxeles nulos (aquellos píxeles que carecen de valor).
- El N° de píxeles no-nulos.
- El valor mínimo de los píxeles.
- El valor máximo.
- El rango de variación de los píxeles.
- El valor promedio.
- Otros parámetros.

~~~
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: 958
maximum: 2873
range: 1915
mean: 1794.74
mean of absolute values: 1794.74
standard deviation: 413.958
variance: 171362
variation coefficient: 23.0651 %
sum: 2550048192
~~~

### Crear una tabla de colores con variación gradual del color {#crear-tabla-colores-variacion-gradual-color}

Utilizando la opción ![](/cartografia-digital/images/circle_2.png) del menú contextual de la capa obtenemos una venta como esta:

![](/cartografia-digital/images/clase-02/clase-02_10.png){: .img-responsive}

#### ¿Qué significa "con variación gradual del color"?

Si a la altitud 1000 msnm le asignamos el color *rojo* y a la altitud 2000 msnm le asignamos el color *amarillo*, la variación gradual del color significa que a los píxeles en el rango 1000-2000 les asigna colores intermedios entre rojo y amarillo dependiendo de la cercanía altitudinal los dos extremos conocidos. Por lo tanto muchos píxeles tendrán colores en la tonalidad del *naranja* que es el color correspondiente a la recombinación variable de *rojo* y *amarillo*.

A continuación se plantean algunas tablas personalizadas a ingresar en el módulo de colores interactivos.

#### Primera versión

Se ingresan los valores del raster (en este caso altitud) en el cuadro de texto, y se elige el color por medio del diálogo de selección de colores.

![](/cartografia-digital/images/clase-02/clase-02_11.png){: .img-responsive}

A continuación se indican los colores con su código RGB (Red - Green - Blue)

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|   958 |   0 |   0 | 255 |
|   975 |   0 | 255 | 255 |
|  1100 |   0 | 255 |   0 |
|  1300 | 255 | 255 |   0 |
|  2000 | 255 |   0 |   0 |
|  2500 | 191 | 127 |  63 |
|  2873 |   0 | 191 | 191 |
{: .table .table-striped}

![](/cartografia-digital/images/clase-02/clase-02_12.png){: .img-responsive}

![Primera versión](/cartografia-digital/images/clase-02/TC_porce1.png){: .img-responsive}

Lo mas seguro es que la primera definición de la tabla de colores no nos satisface.

Mirando el mapa y teniendo el módulo de colores abierto, le hacemos las modificaciones que se requieran y luego volvemos a repetirlo. Hacemos esta operación varias veces hasta conseguir un mapa que nos agrade.

#### Segunda versión

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|   958 |   0 | 255 | 255 |
|  1000 |   0 |   0 | 255 |
|  1300 |   0 | 255 |   0 |
|  1600 | 255 | 255 |   0 |
|  2000 | 255 |   0 |   0 |
|  2300 | 191 | 127 |  63 |
|  2500 |   0 |   0 |   0 |
|  2873 |   0 | 191 | 191 |
{: .table .table-striped}

![Segunda versión](/cartografia-digital/images/clase-02/TC_porce2.png){: .img-responsive}

#### Tercera versión

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|   958 |   0 | 255 | 255 |
|  1000 |   0 |   0 | 255 |
|  1300 |   0 | 255 |   0 |
|  1800 | 255 | 255 |   0 |
|  2000 | 255 |   0 |   0 |
|  2200 | 191 | 127 |  63 |
|  2400 |   0 |   0 |   0 |
|  2873 |   0 | 191 | 191 |
{: .table .table-striped}

![Tercera versión](/cartografia-digital/images/clase-02/TC_porce3.png){: .img-responsive}

**Un primer descreste:** Utilizar la _Vista 3D_ del visualizador de mapas para diferenciar entre una observación 2D y 3D del relieve.
{: .alert .alert-info}

![Visualización del relieve en 3D](/cartografia-digital/images/clase-02/porcecito3D.png){: .img-responsive}

#### Cuarta versión:

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|   958 |   0 |   0 | 255 |
|   980 |   0 | 255 | 255 |
|  1100 | 255 | 127 |   0 |
|  1200 |  14 |  92 |   4 |
|  2000 | 156 | 235 | 173 |
|  2100 | 145 |  11 |  21 |
|  2500 | 247 | 151 | 158 |
|  2750 | 160 |  61 |  12 |
|  2873 |   0 | 191 | 191 |
{: .table .table-striped}

![Cuarta versión](/cartografia-digital/images/clase-02/TC_porce4.png){: .img-responsive}

### Crear tabla de colores con variación discreta del color {#crear-tabla-colores-variacion-discreta-color}

En este caso, se trata de definir rangos altitudinales discretos (un comienzo y un final y a los píxeles en el rango se les asigna un mismo color).

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|   958 | 237 | 210 | 164 |
|  1049 | 237 | 210 | 164 |
|  1050 | 172 | 133 |  67 |
|  1799 | 172 | 133 |  67 |
|  1800 |   0 | 255 |   0 |
|  2349 |   0 | 255 |   0 |
|  2350 |   0 |   0 | 255 |
|  2499 |   0 |   0 | 255 |
{: .table .table-striped}

![Variación discreta de color por altitud](/cartografia-digital/images/clase-02/TC_porce5.png){: .img-responsive}

En la tabla antes creada no se cubre todo el rango altitudinal del archivo `porcecito`.

Luego en el mapa desplegado quedarán en blanco los píxeles para el rango altitudinal que no se involucró.

### Utilizar porcentajes de la altitud para distribuir los colores

En este caso iniciamos con un porcentaje del 0% en la altitud mas baja y asignamos el verde. Luego le decimos que al 25% de la altitud llegue con un color verde oscuro (0 160 0) y así se sigue hasta completar el 100%.

#### Primera versión

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|    0% |   0 | 230 |   0 |
|   25% |   0 | 160 |   0 |
|   55% | 120 | 100 |  30 |
|   75% | 120 | 130 |  40 |
|  100% | 255 | 255 | 100 |
{: .table .table-striped}

![Primera versión](/cartografia-digital/images/clase-02/TC_porce6.png){: .img-responsive}

#### Segunda versión

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|    0% |  99 | 158 | 245 |
|   20% |   8 |  52 | 116 |
|   40% | 235 | 231 |  47 |
|   60% |  14 |  92 |   4 |
|   80% | 247 | 151 | 158 |
|  100% | 145 |  11 |  21 |
{: .table .table-striped}

![Segunda versión](/cartografia-digital/images/clase-02/TC_porce7.png){: .img-responsive}

#### Versión Final

Después de varias modificaciones terminamos con esta combinación:

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|    0% |  99 | 158 | 245 |
|    3% |   8 |  52 | 116 |
|   15% | 235 | 231 |  47 |
|   30% |  14 |  92 |   4 |
|   75% | 247 | 151 | 158 |
|   90% | 145 |  11 |  21 |
|  100% |   0 |   0 |   0 |
{: .table .table-striped}

![Versión Final](/cartografia-digital/images/clase-02/TC_porce8.png){: .img-responsive}
