---
layout: clase
title: 'El uso del color para visualización de capas ráster'
curso: 'cartografia-digital'
clase: 2
---

<!-- Fundamentos teóricos {#fundamentos-teoricos}
--------------------

Los colores se pueden describir con base en la combinación de unos colores primarios.

En GRASS se emplea la combinación RGB (Red, Green, Blue) para describir cualquier tonalidad.

Cada uno de estos colores base presenta 255 valores diferentes.

Un color por lo tanto se obtiene como una combinación de valores para *rojo*, *verde*, y *azul*.

Evaluar distintas combinaciones empleando el programa **gcolor2**: Aplicaciones &rarr; Gráficos &rarr; Gcolor2

![Selector de color gcolor2](/cartografia-digital/images/gcolor2.png){: .img-responsive}

*¿Qué pasa si mantenemos constante el valor de R y G y se disminuye gradualmente el valor de B?*

| R | G |  B  |    Color   |
|:-:|:-:|:---:|:-----------|
| 0 | 0 | 255 |Azul intenso|
| 0 | 0 | 190 |Azul marino |
| 0 | 0 | 128 |Azul rey    |
| 0 | 0 |  65 |Azul oscuro |
| 0 | 0 |   0 |Negro       |
{: .table .table-striped}

En la combinación `0:0:255` se tiene un color azul intenso. A medida que se disminuye el valor de B, el color azul se va tornando mas oscuro. La combinación final `0:0:0` corresponde al color negro.

Las combinación `0:0:255` ubica el punto de los colores en el centro de la franja del circulo de colores correspondiente a los azules. La combinación `0:255:0` ubica el punto en el centro de la franja correspondiente a los "verdes" y la combinación `255.0:0` ubica el punto en el centro de la franja correspondiente a los rojos.

La combinación de dos colores manteniendo el otro valor en cero (0) hace variar la posición del punto del color a lo largo de la circunferencia externa de los colores.

Cuando se emplean valores entre 0 y 255 para R, G y B se obtienen diveros colores, predominando el color con mayor valor sobre los demás:

`49:100:200`: El valor mayor corresponde al azul.

`49:200:100`: El valor mayor corresponde al verde.

Cuando los tres valores son iguales pero diferentes de `0:0:0` (negro) y `255:255:255` (blanco) se obtienen colores en tonalidades de gris desde un gris muy oscuro, como en la combinación `100:100:100`, hasta tonalidades de un gris muy claro como en la combinación `200:200:200`

#### Un ejercicio:

Construir dos tablas de colores personales para emplear en el despliegue de los mapas a construir:

- Una primera tabla con colores de verde que vayan desde el verde claro con algo de amarillo y termine con un color verde algo oscuro.
- Una segunda tabla que combine colores pastel contrastados (verdes y morados, por ejemplo).

### Recomendaciones en el manejo del color de los mapas

El uso de una paleta de colores especifica tiene una gran influencia sobre la visualización de los mapas.

Los colores muy oscuros aplicados a una zona muy extensa no permiten visualizar la diversidad mórfica de un territorio. Sin embargo, un color oscuro aplicado a un rasgo muy sutil donde la zona circundante se encuentra en un color muy claro permite resaltar dicho rasgo.

Un uso adecuado de colores contrastantes permite visualizar adecuadamente la estructura del relieve.

Los colores disponibles en GRASS
--------------------------------

Para conocer los nombres disponibles mas inmediatos:

~~~
d.colorlist
~~~

~~~
red,orange,yellow,green,blue,indigo,violet,white,black,gray,brown,magenta,aqua,grey,cyan,purple
~~~
{: .output} -->

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

<!-- ~~~
r.colors map=porcecito color=aspect
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'aspect'
~~~
{: .output} -->

![La tabla de colores "aspect"](/cartografia-digital/images/clase-02/porcecito_aspect.png){: .img-responsive}

*¿Qué rasgos de la región resaltan con esta tabla de colores?*

### La tabla de colores "bcyr"

<!-- ~~~
r.colors map=porcecito color=bcyr
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'bcyr'
~~~
{: .output} -->

![La tabla de colores "bcyr"](/cartografia-digital/images/clase-02/porcecito_bcyr.png){: .img-responsive}

### La tabla de colores "elevation"

<!-- ~~~
r.colors map=porcecito color=elevation
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'elevation'
~~~
{: .output} -->

![La tabla de colores "elevation"](/cartografia-digital/images/clase-02/porcecito_elevation.png){: .img-responsive}

### La tabla de colores "rainbow"

<!-- ~~~
r.colors map=porcecito color=rainbow
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'rainbow'
~~~
{: .output} -->

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
{: .output}

### Crear una tabla de colores con variación gradual del color {#crear-tabla-colores-variacion-gradual-color}

Utilizando la opción ![](/cartografia-digital/images/circle_2.png) del menú contextual de la capa obtenemos una venta como esta:

![](/cartografia-digital/images/clase-02/clase-02_10.png){: .img-responsive}

#### ¿Qué significa "con variación gradual del color"?

Si a la altitud 1000 msnm le asignamos el color *rojo* y a la altitud 2000 msnm le asignamos el color *amarillo*, la variación gradual del color significa que a los píxeles en el rango 1000-2000 les asigna colores intermedios entre rojo y amarillo dependiendo de la cercanía altitudinal los dos extremos conocidos. Por lo tanto muchos píxeles tendrán colores en la tonalidad del *naranja* que es el color correspondiente a la recombinación variable de *rojo* y *amarillo*.

A continuación se plantean algunas tablas personalizadas a ingresar en el módulo de colores interactivos.

#### Primera versión

Se ingresan los valores del raster (en este caso altitud) en el cuadro de texto, y se elige el color por medio del diálogo de selección de colores.

![](/cartografia-digital/images/clase-02/clase-02_11.png){: .img-responsive}

A continuación se indican los colores con su código RGB (Red:Green:Blue)

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

<!-- ~~~
r.colors map=porcecito rules=TC_porce1
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce1'
~~~
{: .output} -->

![Primera versión](/cartografia-digital/images/clase-02/TC_porce1.png){: .img-responsive}

Lo mas seguro es que la primera definición de la tabla de colores no nos satisface.

Mirando el mapa y teniendo el módulo de colores abierto, le hacemos las modificaciones que se requieran y luego volvemos a repetirlo. Hacemos esta operación varias veces hasta conseguir un mapa que nos agrade.

#### Segunda versión

<!-- `TC_porce2` -->

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

<!-- ~~~
r.colors map=porcecito rules=TC_porce2
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce2'
~~~
{: .output} -->

![Segunda versión](/cartografia-digital/images/clase-02/TC_porce2.png){: .img-responsive}

#### Tercera versión

<!-- `TC_porce3` -->

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

<!-- ~~~
r.colors map=porcecito rules=TC_porce3
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce3'
~~~
{: .output} -->

![Tercera versión](/cartografia-digital/images/clase-02/TC_porce3.png){: .img-responsive}

**Un primer descreste:** Utilizar la _Vista 3D_ del visualizador de mapas para diferenciar entre una observación 2D y 3D del relieve.
{: .alert .alert-info}

![Visualización del relieve en 3D](/cartografia-digital/images/clase-02/porcecito3D.png){: .img-responsive}

#### Cuarta versión:

Utilizando nombres y la nomenclatura RGB.

<!-- `TC_porce4` -->

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

<!-- ~~~
r.colors map=porcecito rules=TC_porce4
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce4'
~~~
{: .output} -->

![Cuarta versión](/cartografia-digital/images/clase-02/TC_porce4.png){: .img-responsive}

### Crear tabla de colores con variación discreta del color {#crear-tabla-colores-variacion-discreta-color}

En este caso, se trata de definir rangos altitudinales discretos (un comienzo y un final y a los píxeles en el rango se les asigna un mismo color).

<!-- `TC_porce5` -->

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

<!-- ~~~
r.colors map=porcecito rules=TC_porce5
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce5'
~~~
{: .output} -->

![Variación discreta de color por altitud](/cartografia-digital/images/clase-02/TC_porce5.png){: .img-responsive}

En la tabla antes creada (`TC_porce5`) no se cubre todo el rango altitudinal del archivo `porcecito`.

Luego en el mapa desplegado quedarán en blanco los píxeles para el rango altitudinal que no se involucró.

### Utilizar porcentajes de la altitud para distribuir los colores

En este caso iniciamos con un porcentaje del 0% en la altitud mas baja y asignamos el verde. Luego le decimos que al 25% de la altitud llegue con un color verde oscuro (0 160 0) y así se sigue hasta completar el 100%.

#### Primera versión

<!-- `TC_porce6` -->

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|    0% |   0 | 230 |   0 |
|   25% |   0 | 160 |   0 |
|   55% | 120 | 100 |  30 |
|   75% | 120 | 130 |  40 |
|  100% | 255 | 255 | 100 |
{: .table .table-striped}

<!-- ~~~
r.colors map=porcecito rules=TC_porce6
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce6'
~~~
{: .output} -->

![Primera versión](/cartografia-digital/images/clase-02/TC_porce6.png){: .img-responsive}

#### Segunda versión

<!-- `TC_porce6a` -->

|Altitud|  R  |  G  |  B  |
|:-----:|:---:|:---:|:---:|
|    0% |  99 | 158 | 245 |
|   20% |   8 |  52 | 116 |
|   40% | 235 | 231 |  47 |
|   60% |  14 |  92 |   4 |
|   80% | 247 | 151 | 158 |
|  100% | 145 |  11 |  21 |
{: .table .table-striped}

<!-- ~~~
r.colors map=porcecito rules=TC_porce6a
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce6a'
~~~
{: .output} -->

![Segunda versión](/cartografia-digital/images/clase-02/TC_porce6a.png){: .img-responsive}

#### Versión Final

Después de varias modificaciones terminamos con esta combinación:

<!-- `TC_porce7` -->

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

<!-- ~~~
r.colors map=porcecito rules=TC_porce7
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TC_porce7'
~~~
{: .output} -->

![Versión Final](/cartografia-digital/images/clase-02/TC_porce7.png){: .img-responsive}

<!--
TODO: ¿Se justifica emplear la opción del gedit para crear tablas de colores y aplicarlas a un mapa?

### Crear una nueva carpeta para guardar las tablas de colores creadas

Durante las sesiones en GRASS creamos numerosas y diversas tablas de colores. Por omisión, el sistema las guarda en la carpeta personal (usuario). Es recomendable crear una nueva carpeta (directorio) dentro de la carpeta personal de usuario para guardar allí todas las tablas de colores creadas. Al hacer esto, es necesario indicar al comando que toma el "script" que éste se encuentra en una carpeta diferente a la personal.

Si no señalamos donde se encuentra el script, al aplicar el comando sale el error:

~~~
r.colors map=porcecito rules=TC_porce7
~~~

~~~
ERROR: No se puede cargar el archivo de reglas <TC_porce7>
~~~
{: .output}

El archivo sí existe pero se encuentra en otro directorio. Debemos indicar en qué carpeta se encuentra el archivo.

~~~
r.colors map=porcecito rules=TablasColores/TC_porce7
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'TablasColores/TC_porce7'
~~~
{: .output}

## Asignar a un mapa la tabla de colores de otro mapa

La tabla de colores de un mapa dado que nos parece acertada se puede asignar a otro mapa. Los resultados obtenidos no necesariamente son similares en calidad a lo desplegado en el mapa inicial.

Un ejemplo:

- Hacer copia del mapa `ituango` que está en el mapset `PERMANENT` en el mapset `CursoGrass`.
- Colocar la región de despliegue al mapa ituango.
- Desplegar la copia creada para ver sus colores.
- Cambiar la tabla de colores del mapa ituango copiándola del mapa `porcecito`.

La secuencia de ordenes en GRASS es la siguiente:

~~~
g.list -p type=raster
g.copy raster=ituango,ituan
g.region raster=ituan
r.colors map=ituan raster=porcecito
~~~

### Antes

![Antes](/cartografia-digital/images/clase-02/ituan.png){: .img-responsive}

### Después {#despues}

![Después](/cartografia-digital/images/clase-02/ituan_porce1.png){: .img-responsive}

*¿Por qué aparecen zonas en el mapa `ituan` que no presentan color? ¿Cómo explicarlo?*

### Eliminar la tabla de colores traída de porcecito y aplicada a ituango {#eliminar-tabla-colores-traida-porcecito-aplicada-ituango}

Se puede eliminar la tabla traída de otro mapa y desplegar la tabla inicial de colores que tenía el mapa.

~~~
r.colors -r map=ituan
~~~

## Tarea 3
{: .text-danger}

Problema: Se tiene el mapa topográfico de `ituango` y se requiere que se coloree de tal manera que se reflejen las características topográficos lo más cercano al aspecto natural del mismo y a su vez se resalte la red de drenaje.

Consideremos que la región presenta clima húmedo en todos sus pisos, por lo tanto utilizar simbolismos de color pertinentes a cada una de las zonas de vida de diferentes franjas altitudinales. Tratar de que los colores seleccionados constituyan una representación de la condición natural.

Enviar los siguiente elementos:

- Guión con extensión `.sh` y con la documentación pertinente para resolver el problema.
- Enviar el archivo de tipo `TC` con la tabla de colores utilizada.
- Enviar un archivo `png` con el resultado del mapa coloreado.
- Enviar un archivo `pdf` con una corta discusión de los resultados obtenidos y la justificación de los colores utilizados y su interpretación.

Actividad extracurso
--------------------

1. Pasar los mapas `ituango` y `riogrande_sup` de integer a double precision. (Los mapas en double precision, son los que se van a seguir empleando en las próximas sesiones).
2. Crear una copia del mapa ituango y asignarles a cada uno tablas de colores diferentes, con los mismos rangos altitudinales y colores diferentes. Evaluar la calidad de la visualización.
3. Calcular la extensión en km<sup>2</sup> y número píxeles en el mapa ituango para los terrenos localizados por encima de los 3.000 msnm y por debajo de los 500 msnm, de la manera más aproximada posible.
-->
