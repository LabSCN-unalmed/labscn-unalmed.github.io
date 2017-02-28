---
layout: clase
title: 'Manejo del histograma de los números digitales de las bandas LANDSAT 8'
curso: 'cartografia-digital'
clase: 'Imágenes 1'
custom_js: 'mathjax'
---


Introducción {#introduccion}
------------

Utilizando la [banda Quality Assessment](http://landsat.usgs.gov/L8QualityAssessmentBand.php){:target="blank"} incluída en LANDSAT 8

| Bit QA | Descripción                   |
|:------:|:------------------------------|
|   0    | Designated Fill               |
|   1    | Dropped Frame                 |
|   2    | Terrain Occlusion             |
|   3    | Reserved (not currently used) |
|  4-5   | Water                         |
|  6-7   | Reserved                      |
|  8-9   | Reserved                      |
| 10-11  | Snow/Ice                      |
| 12-13  | Cirrus                        |
| 14-15  | Cloud                         |
{: .table .table-striped}

![](/cartografia-digital/images/L8QualityAssessmentBand.jpg)

Las condiciones de un solo bit presentan las siguientes posibilidades:

* 0 = No, la condición no existe
* 1 = Si, la condición existe

Las condiciones de 2 bits, representan niveles de confianza de que una condición existe:

* 00 = "No determinado" = No está determinado el estado de la condición
* 01 = "No" = El nivel de confianza es bajo, entre 0% - 33%
* 10 = "Quizás" = El nivel de confianza es medio, entre 34% - 66%
* 11 = "Si" = El nivel de confiaza es alto, entre 67% - 100%

Se consultan los valores de la banda QA para la escena seleccionada:

~~~
r.report map=${SCENE}_BQA
~~~

~~~
+-----------------------------------------------------------------------------+
|                         RASTER MAP CATEGORY REPORT                          |
|LOCATION: LANDSAT8                                   Fri Nov  6 13:38:20 2015|
|-----------------------------------------------------------------------------|
|          north: 755715    east: 536415                                      |
|REGION    south: 522585    west: 308685                                      |
|          res:       30    res:      30                                      |
|-----------------------------------------------------------------------------|
|MASK: none                                                                   |
|-----------------------------------------------------------------------------|
|MAP: (untitled) (LC80090562013197LGN00_BQA in PERMANENT)                     |
|-----------------------------------------------------------------------------|
|                            Category Information                             |
|    #|description                                                            |
|-----------------------------------------------------------------------------|
|    1|                                                                       |
|20480|                                                                       |
|20512|                                                                       |
|23552|                                                                       |
|28672|                                                                       |
|28704|                                                                       |
|36864|                                                                       |
|36896|                                                                       |
|39936|                                                                       |
|45056|                                                                       |
|53248|                                                                       |
|53280|                                                                       |
|61440|                                                                       |
+-----------------------------------------------------------------------------+
~~~
{: .output}

De acuerdo con los valores obtenidos, se convierten estos números de decimales a binarios (utilizando el modo programador de la calculadora)

| Decimal | Binario |
|:-------:|:---------------:|
|    1| 0000 0000 0000 0001 |
|20480| 0101 0000 0000 0000 |
|20512| 0101 0000 0010 0000 |
|23552| 0101 1100 0000 0000 |
|28672| 0111 0000 0000 0000 |
|28704| 0111 0000 0010 0000 |
|36864| 1001 0000 0000 0000 |
|36896| 1001 0000 0010 0000 |
|39936| 1001 1100 0000 0000 |
|45056| 1011 0000 0000 0000 |
|53248| 1101 0000 0000 0000 |
|53280| 1101 0000 0010 0000 |
|61440| 1111 0000 0000 0000 |
{: .table .table-striped}

Crear una máscara para eliminar el relleno externo a la imágen

~~~
r.mapcalc "MASK = if(${SCENE}_BQA > 1)"
~~~

Primer paso
-----------

Transformar las bandas de 16-bit a 8-bit moviendo los bits hacia la derecha:

~~~
# Definir el nombre de la escena a trabajar
SCENE=LC80090562013197LGN00

# Definir el número de la banda a trabajar
B=2

# Definir la región de cálculo
g.region rast=${SCENE}_B${B}

# Crear un nuevo raster con la información de los primeros 8 bits de la banda original
r.mapcalc "banda${B} = ${SCENE}_B${B} >> 8"

# Repetir el último comando
# Para la banda 3
B=3
r.mapcalc "banda${B} = ${SCENE}_B${B} >> 8"

# Para la banda 4
B=4
r.mapcalc "banda${B} = ${SCENE}_B${B} >> 8"
~~~

Segundo paso
------------

Consultar las estadísticas extendedidas del DN de una banda previamente transformada a 8-bits:

~~~
B=2
r.univar -e map=banda${B}
~~~

~~~
total null and non-null cells: 58989661
total null cells: 18473479

Of the non-null cells:
----------------------
n: 40516182
minimum: 22
maximum: 255
range: 233
mean: 48.5554
mean of absolute values: 48.5554
standard deviation: 31.5795
variance: 997.267
variation coefficient: 65.0382 %
sum: 1967277823
1st quartile: 31
median (even number of cells): 33
3rd quartile: 48
90th percentile: 103
[Raster MASK present]
~~~
{: .output}

Tercer paso
-----------
Calcular un histograma de esta banda:

![](/cartografia-digital/images/banda2_hist.png){: .img-responsive}

Realzar los valores de mayor frecuencia en el histograma:

$$ DN_{r} = \frac{(DN_{i} - DN_{min})(2^8 - 1)}{DN_{max} - DN_{min}} $$

Donde $$DN_{min}$$ y $$DN_{max}$$ son los valores mínimo y máximo de DN para el rango que se desea realzar del histograma, $$DN_{i}$$ es el valor de DN de un pixel dado, y $$DN_{r}$$ es el valor de DN del nuevo pixel realzado.

Para este ejemplo, vamos a realzar los valores comprendidos entre el mínimo y el tercer cuartil de los valores de DN:

**Nota:** Los $$DN_{i}$$ que estén por debajo de $$DN_{min}$$ y por encima de $$DN_{max}$$ se van a considerar nulos
{: .alert .alert-info}

~~~
B=2
DNmin=22
DNmax=48
r.mapcalc "banda${B}stretch = if( banda${B} >= ${DNmin} && banda${B} <= ${DNmax}, (banda${B} - ${DNmin}) * (2^8 - 1) / (${DNmax} - ${DNmin}), null() )"
~~~

Calcular el histograma de la banda realzada:

![](/cartografia-digital/images/banda2stretch_hist.png){: .img-responsive}

**Advertencia:** Repetir el tercer y cuarto paso para las bandas 3 y 4. Teniendo en cuenta que los valores mínimo y máximo de DN cambian para cada banda.
{: .alert .alert-warning}

~~~
B=3
r.univar -e map=banda${B}
DNmin=23
DNmax=45
r.mapcalc "banda${B}stretch = if( banda${B} >= ${DNmin} && banda${B} <= ${DNmax}, (banda${B} - ${DNmin}) * (2^8 - 1) / (${DNmax} - ${DNmin}), null() )"
~~~

~~~
B=4
r.univar -e map=banda${B}
DNmin=21
DNmax=43
r.mapcalc "banda${B}stretch = if( banda${B} >= ${DNmin} && banda${B} <= ${DNmax}, (banda${B} - ${DNmin}) * (2^8 - 1) / (${DNmax} - ${DNmin}), null() )"
~~~

Cuarto paso
-----------

De la introducción se observa que las 3 últimas categorías de la banda QA tienen un nivel de confianza alto para nubes, además que debemos eliminar los pixeles del relleno que no forman parte de la imágen (categoría 1) por lo que procedemos a crear una nueva máscara para excluir los pixeles que tengan estos valores:

~~~
r.mapcalc "MASK = if(${SCENE}_BQA > 1 && ${SCENE}_BQA < 50000)"
~~~

Al consultar nuevamente por las categorías de la banda QA, se observa que ya no aparecen las categorías correspondientes a nubes como tampoco el relleno externo a la imágen, y ahora aparecen como *no data*.

~~~
r.report map=${SCENE}_BQA
~~~

~~~
+-----------------------------------------------------------------------------+
|                         RASTER MAP CATEGORY REPORT                          |
|LOCATION: LANDSAT8                                   Fri Nov  6 14:17:08 2015|
|-----------------------------------------------------------------------------|
|          north: 755715    east: 536415                                      |
|REGION    south: 522585    west: 308685                                      |
|          res:       30    res:      30                                      |
|-----------------------------------------------------------------------------|
|MASK: MASK in caesarivs                                                      |
|-----------------------------------------------------------------------------|
|MAP: (untitled) (LC80090562013197LGN00_BQA in PERMANENT)                     |
|-----------------------------------------------------------------------------|
|                            Category Information                             |
|    #|description                                                            |
|-----------------------------------------------------------------------------|
|20480|                                                                       |
|20512|                                                                       |
|23552|                                                                       |
|28672|                                                                       |
|28704|                                                                       |
|36864|                                                                       |
|36896|                                                                       |
|39936|                                                                       |
|45056|                                                                       |
|    *|no data                                                                |
+-----------------------------------------------------------------------------+
~~~
{: .output}

Quinto paso
-----------

Establecer las tablas de colores para cada banda y combinarlas para obtener una representación del color natural utilizando la banda 4 en el canal rojo, la banda 3 en el canal verde, y la banda 2 en el canal azul.

Para esto, se utiliza la herramienta `i.landsat.rgb`:

~~~
i.landsat.rgb r=banda4stretch g=banda3stretch b=banda2stretch
~~~

![](/cartografia-digital/images/L8_VA_color_natural432.png){: .img-responsive}

*[DN]: Digital Number
