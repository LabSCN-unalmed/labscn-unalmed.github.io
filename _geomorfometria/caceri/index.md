---
layout: clase
title: 'Análisis de la red de drenaje de una cuenca'
curso: 'geomorfometria'
clase: 1
---

## Introducción

La información será extraída a partir del DEM obtenido de [ALOS PALSAR](https://www.asf.alaska.edu/sar-data/palsar/){: target="blank"}.



## Procedimiento en GRASS GIS

### Procesamiento inicial

Definir la región.

~~~
g.region -p n=885000 s=830000 w=475000 e=525000
~~~

~~~
projection: 1 (UTM)
zone:       18
datum:      wgs84
ellipsoid:  wgs84
north:      885000
south:      830000
west:       475000
east:       525000
nsres:      12.5
ewres:      12.5
rows:       4400
cols:       4000
cells:      17600000
~~~
{: .output}

Guardar la región con un nombre dentro del espacio de trabajo para poder acceder a ella rápidamente.

~~~
g.region save=caceri
~~~

Debido a que la zona de estudio no está contenida completamente dentro de un sólo archivo sino que corresponde al intercepto de 3 archivos, se debe realizar un mosaico de ellos.

~~~
r.patch input=AP_08170_FBD_F0140_RT1,AP_07747_FBD_F0140_RT1,AP_23180_FBD_F0130_RT1 output=caceri_raw
~~~

El DEM crudo se debe corregir hidrológicamente. Inicialmente se verifica si existen pixeles nulos en el mapa.

~~~
r.univar map=caceri_raw
~~~

~~~
total null and non-null cells: 17600000
total null cells: 0

Of the non-null cells:
----------------------
n: 17600000
minimum: 6
maximum: 910
range: 904
mean: 106.426
mean of absolute values: 106.426
standard deviation: 94.3355
variance: 8899.19
variation coefficient: 88.6395 %
sum: 1873097796
~~~
{: .output}

Al no tener pixeles nulos, se utiliza el módulo [`r.hydrodem`](https://grass.osgeo.org/grass70/manuals/addons/r.hydrodem.html){: target="blank"} para obtener un DEM hidrológicamente corregido, de encontrar pixeles nulos, estos se deben interpolar con el módulo [`r.fillnulls`](https://grass.osgeo.org/grass70/manuals/r.fillnulls.html){: target="blank"}.

~~~
r.hydrodem input=caceri_raw output=caceri_dem
~~~

~~~
Load elevation map
 100%
Remove one cell extremas
 100%
Set edge points
 100%
A* Buscar...
 100%
Processing 162721 sinks
 100%
Write conditioned DEM
 100%
~~~
{: .output}

Para visualizar la distribución espacial de altitudes se debe asignar una tabla de colores que varíe gradualmente para percibir los patrones de esta variable en la zona de estudio.

~~~
r.colors map=caceri_raw,caceri_dem color=srtm
~~~

![DEM with 5km grid and legend](images/caceri_dem.png){: .img-responsive}

### Extracción de la red de drenaje

A partir de este mapa de elevación, se obtienen los siguientes mapas:

~~~
r.watershed -s elevation=caceri_dem threshold=3200 \
               accumulation=caceri_accum \
               drainage=caceri_drain \
               stream=caceri_streams
~~~

Acumulación (accumulation)
: Mapa accum

![Accum](images/caceri_accum.png){: .img-responsive}

Drenaje (drainage)
: Mapa drain

![Drain](images/caceri_drain.png){: .img-responsive}

Corrientes (streams)
: Mapa streams

![Streams](images/caceri_streams.png){: .img-responsive}

Se define un punto en el pixel de desembocadura del río Cacerí al río Nechí.

Utilizando las coordenadas del centro del pixel se crea un mapa vectorial de puntos que contiene esta desembocadura.

~~~
echo "519981.25|878256.25" | v.in.ascii input=- output=caceri_outlet
~~~

Se delimita la cuenca calculando su divisioria de aguas, a partir de la desembocadura (representada por un punto vectorial), y el mapa de la dirección de drenaje.

~~~
r.stream.basins direction=caceri_drain points=caceri_outlet basins=caceri_basin
~~~

Se crea un polígono vectorial transformando el mapa ráster de la cuenca.

~~~
r.to.vect -v input=caceri_basin output=caceri_basin type=area
~~~

Se ajusta la región al rectángulo externo que contenga exactamente la cuenca usando su mapa en formato ráster.

~~~
g.region zoom=caceri_basin
~~~

![DEM with basin and outlet](images/caceri_dem_basin_outlet.png){: .img-responsive}


### Jerarquía de las corrientes

Se utiliza el ráster de la cuenca como máscara para restringir los cálculos posteriores a los pixeles que pertenecen a la cuenca.

~~~
r.mask raster=caceri_basin
~~~

Se procesan las corrientes en formato ráster, para obtener un mapa vectorial de líneas ordenadas jerárquicamente.

~~~
r.stream.order stream_rast=caceri_streams direction=caceri_drain elevation=caceri_dem accumulation=caceri_accum stream_vect=caceri_streams
~~~

Se elimina la máscara

~~~
r.mask -r
~~~

#### Strahler

Diferenciando por el grosor de la línea

![Strahler](images/caceri_dem_basin_outlet_strahler.png){: .img-responsive}

Diferenciando por color

![Strahler](images/caceri_dem_basin_outlet_strahler.png){: .img-responsive}

#### Horton

Diferenciando por el grosor de la línea

![Horton](images/caceri_dem_basin_outlet_horton.png){: .img-responsive}

Diferenciando por color

![Horton](images/caceri_dem_basin_outlet_horton.png){: .img-responsive}


### Distancia y desnivel altitudinal con respecto a la desembocadura

Se convierte el punto de la desembocadura a formato ráster para calcular las distancias y diferencias de elevación de toda la cuenca con respecto a ese punto.

~~~
v.to.rast input=caceri_outlet output=caceri_outlet use=cat
~~~

Se calcula la distancia hasta la desembocadura "aguas abajo" y la diferencia altitudinal con respecto a la desembocadura.

~~~
r.stream.distance -o stream_rast=caceri_outlet direction=caceri_drain elevation=caceri_dem method=downstream distance=caceri_distance difference=caceri_elev_diff
~~~

Los pixeles que se encuentran 1 metro por debajo de la altitud de la desembocadura quedan nulos (sin valor), por lo cual se utiliza la máscara de la cuenca para asignarles el valor -1. Es importante destacar que los puntos que se encuentran más de 1 metro por debajo de la altitud de la desembocadura no presentan este problema.

~~~
r.mapcalc expression="caceri_elev = if(caceri_basin && isnull(caceri_elev_diff), -1, caceri_elev_diff)"
~~~

### Construcción de puntos a lo largo de las corrientes según el orden de Horton

Inicialmente se debe conocer cuál es el orden máximo de Horton, para esto se realiza una consulta a los atributos del mapa de corrientes.

~~~
v.db.select map=caceri_streams columns="MAX(horton)"
~~~

~~~
MAX(horton)
6
~~~
{: .output}

Dado que el producto de `r.stream.order` contiene una población de segmentos independientes, se deben construir polilíneas para cada orden de Horton y así obtener una red de corrientes que van desde el nacimiento hasta la desembocadura, bien sea la corriente principal o sus tributarios.

Primero se deben separar los segmentos de cada orden de Horton.

~~~
v.extract input=caceri_streams type=line where="horton=1" output=caceri_h1
v.extract input=caceri_streams type=line where="horton=2" output=caceri_h2
v.extract input=caceri_streams type=line where="horton=3" output=caceri_h3
v.extract input=caceri_streams type=line where="horton=4" output=caceri_h4
v.extract input=caceri_streams type=line where="horton=5" output=caceri_h5
v.extract input=caceri_streams type=line where="horton=6" output=caceri_h6
~~~

Se construyen las polilíneas de los segmentos de cada orden de Horton.

~~~
v.build.polylines input=caceri_h1 output=caceri_h1_poly cats=first type=line
v.build.polylines input=caceri_h2 output=caceri_h2_poly cats=first type=line
v.build.polylines input=caceri_h3 output=caceri_h3_poly cats=first type=line
v.build.polylines input=caceri_h4 output=caceri_h4_poly cats=first type=line
v.build.polylines input=caceri_h5 output=caceri_h5_poly cats=first type=line
v.build.polylines input=caceri_h6 output=caceri_h6_poly cats=first type=line
~~~

Las polilíneas contienen vértices en cada pixel, se obtiene un mapa de puntos en cada vértice que contiene el identificador del punto, el identificador de la línea (para diferenciar entre 2 corrientes del mismo orden), y la distancia del punto a lo largo de la polilínea.

~~~
v.to.points input=caceri_h1_poly type=line output=caceri_h1_pts use=vertex
v.to.points input=caceri_h2_poly type=line output=caceri_h2_pts use=vertex
v.to.points input=caceri_h3_poly type=line output=caceri_h3_pts use=vertex
v.to.points input=caceri_h4_poly type=line output=caceri_h4_pts use=vertex
v.to.points input=caceri_h5_poly type=line output=caceri_h5_pts use=vertex
v.to.points input=caceri_h6_poly type=line output=caceri_h6_pts use=vertex
~~~

Esta información queda como una capa secundaria en los atributos del mapa de puntos (layer=2), por lo que se debe trabajar sobre esta capa inicialmente.

A los puntos se les cargan las coordenadas (x, y), la altitud (z), el número de pixeles que drenan hacia cada punto (accum), la distancia y el desnivel altitudinal con respecto a la desembocadura de la cuenca (dist y elev), los órdenes de Strahler y Horton.

Primero se deben crear las columnas respectivas en la tabla de atributos, especificando el tipo de datos de cada variable (columna).

~~~
v.db.addcolumn map=caceri_h1_pts layer=2 \
               columns="x double, \
                        y double, \
                        z int, \
                        accum double, \
                        dist double, \
                        elev double, \
                        strahler int, \
                        horton int"

v.db.addcolumn map=caceri_h2_pts layer=2 \
               columns="x double, \
                        y double, \
                        z int, \
                        accum double, \
                        dist double, \
                        elev double, \
                        strahler int, \
                        horton int"

v.db.addcolumn map=caceri_h3_pts layer=2 \
               columns="x double, \
                        y double, \
                        z int, \
                        accum double, \
                        dist double, \
                        elev double, \
                        strahler int, \
                        horton int"

v.db.addcolumn map=caceri_h4_pts layer=2 \
               columns="x double, \
                        y double, \
                        z int, \
                        accum double, \
                        dist double, \
                        elev double, \
                        strahler int, \
                        horton int"

v.db.addcolumn map=caceri_h5_pts layer=2 \
               columns="x double, \
                        y double, \
                        z int, \
                        accum double, \
                        dist double, \
                        elev double, \
                        strahler int, \
                        horton int"

v.db.addcolumn map=caceri_h6_pts layer=2 \
               columns="x double, \
                        y double, \
                        z int, \
                        accum double, \
                        dist double, \
                        elev double, \
                        strahler int, \
                        horton int"
~~~

Ahora se procede a leer las coordenadas de los puntos a la tabla de atributos.

~~~
v.to.db map=caceri_h1_pts layer=2 option=coor columns=x,y
v.to.db map=caceri_h2_pts layer=2 option=coor columns=x,y
v.to.db map=caceri_h3_pts layer=2 option=coor columns=x,y
v.to.db map=caceri_h4_pts layer=2 option=coor columns=x,y
v.to.db map=caceri_h5_pts layer=2 option=coor columns=x,y
v.to.db map=caceri_h6_pts layer=2 option=coor columns=x,y
~~~

La altitud se lee a partir de los valores del DEM.

~~~
v.what.rast map=caceri_h1_pts layer=2 raster=caceri_dem column=z
v.what.rast map=caceri_h2_pts layer=2 raster=caceri_dem column=z
v.what.rast map=caceri_h3_pts layer=2 raster=caceri_dem column=z
v.what.rast map=caceri_h4_pts layer=2 raster=caceri_dem column=z
v.what.rast map=caceri_h5_pts layer=2 raster=caceri_dem column=z
v.what.rast map=caceri_h6_pts layer=2 raster=caceri_dem column=z
~~~

De la misma forma se leen los valores de los raster de _**accumulation**_, distancia y elevación con respecto a la desembocadura de la cuenca.

~~~
v.what.rast map=caceri_h1_pts layer=2 raster=caceri_accum column=accum
v.what.rast map=caceri_h2_pts layer=2 raster=caceri_accum column=accum
v.what.rast map=caceri_h3_pts layer=2 raster=caceri_accum column=accum
v.what.rast map=caceri_h4_pts layer=2 raster=caceri_accum column=accum
v.what.rast map=caceri_h5_pts layer=2 raster=caceri_accum column=accum
v.what.rast map=caceri_h6_pts layer=2 raster=caceri_accum column=accum

v.what.rast map=caceri_h1_pts layer=2 raster=caceri_distance column=dist
v.what.rast map=caceri_h2_pts layer=2 raster=caceri_distance column=dist
v.what.rast map=caceri_h3_pts layer=2 raster=caceri_distance column=dist
v.what.rast map=caceri_h4_pts layer=2 raster=caceri_distance column=dist
v.what.rast map=caceri_h5_pts layer=2 raster=caceri_distance column=dist
v.what.rast map=caceri_h6_pts layer=2 raster=caceri_distance column=dist

v.what.rast map=caceri_h1_pts layer=2 raster=caceri_elev column=elev
v.what.rast map=caceri_h2_pts layer=2 raster=caceri_elev column=elev
v.what.rast map=caceri_h3_pts layer=2 raster=caceri_elev column=elev
v.what.rast map=caceri_h4_pts layer=2 raster=caceri_elev column=elev
v.what.rast map=caceri_h5_pts layer=2 raster=caceri_elev column=elev
v.what.rast map=caceri_h6_pts layer=2 raster=caceri_elev column=elev
~~~

El orden de Strahler se lee a partir del mapa vectorial de segmentos de corriente.

~~~
v.what.vect map=caceri_h1_pts layer=2 column=strahler \
            query_map=caceri_h1 query_column=strahler dmax=10

v.what.vect map=caceri_h2_pts layer=2 column=strahler \
            query_map=caceri_h2 query_column=strahler dmax=10

v.what.vect map=caceri_h3_pts layer=2 column=strahler \
            query_map=caceri_h3 query_column=strahler dmax=10

v.what.vect map=caceri_h4_pts layer=2 column=strahler \
            query_map=caceri_h4 query_column=strahler dmax=10

v.what.vect map=caceri_h5_pts layer=2 column=strahler \
            query_map=caceri_h5 query_column=strahler dmax=10

v.what.vect map=caceri_h6_pts layer=2 column=strahler \
            query_map=caceri_h6 query_column=strahler dmax=10
~~~

El orden de Horton se establece de forma manual.

~~~
v.db.update map=caceri_h1_pts layer=2 column=horton value=1
v.db.update map=caceri_h2_pts layer=2 column=horton value=2
v.db.update map=caceri_h3_pts layer=2 column=horton value=3
v.db.update map=caceri_h4_pts layer=2 column=horton value=4
v.db.update map=caceri_h5_pts layer=2 column=horton value=5
v.db.update map=caceri_h6_pts layer=2 column=horton value=6
~~~

Para ensamblar los puntos de toda la cuenca, uniendo los puntos de los diferentes órdenes de Horton, es necesario que la información que se construyó se encuentre en la capa principal (layer=1). Para esto se crea para cada orden de Horton, un nuevo mapa a partir de la tabla secundaria (que contiene la información final).

~~~
v.in.db table=caceri_h1_pts_2 x=x y=y z=z key=cat output=caceri_h1_pts_f
v.in.db table=caceri_h2_pts_2 x=x y=y z=z key=cat output=caceri_h2_pts_f
v.in.db table=caceri_h3_pts_2 x=x y=y z=z key=cat output=caceri_h3_pts_f
v.in.db table=caceri_h4_pts_2 x=x y=y z=z key=cat output=caceri_h4_pts_f
v.in.db table=caceri_h5_pts_2 x=x y=y z=z key=cat output=caceri_h5_pts_f
v.in.db table=caceri_h6_pts_2 x=x y=y z=z key=cat output=caceri_h6_pts_f
~~~

Los puntos de cada orden de Horton se reunen en un sólo mapa. (Se utiliza la opción `e` para conservar las tablas de atributos de la capa principal).

~~~
v.patch -e input=caceri_h1_pts_f,caceri_h2_pts_f,caceri_h3_pts_f,caceri_h4_pts_f,caceri_h5_pts_f,caceri_h6_pts_f output=caceri_pts
~~~

Opcionalmente se eliminan los mapas intermedios para una mejor organización del espacio de trabajo.

~~~
g.remove -f type=vector pattern=caceri_h*
~~~

## Procedimiento en el lenguaje estadístico R

Utilizando RStudio...

*[DEM]: Digital Elevation Model
