---
layout: clase
title: 'Manejo de proyecciones y creación de locations'
curso: 'cartografia-digital'
---
<!-- clase: 10 -->

Las proyecciones
----------------

Dado que la superficie de la tierra no es plana, ¿Cuál sería la manera de representarla en un plano?

¿Cómo representar en un plano la superficie terrestre, que es una superficie no-plana?

Algo que es curvo proyectarla sobre un plano.

Una superficie curva se puede proyectar a un plano tangente a un punto particular de la superfice curva y proyectar toda ella al plano tangente.

Se puede proyectar la **superficie terrestre (ST)** a un cilindro que puede ser vertical u horizontal.

![](/cartografia-digital/images/01datum.gif){: .img-responsive}

![](/cartografia-digital/images/02globe_merid.gif){: .img-responsive}

![](/cartografia-digital/images/03globe_parallel.gif){: .img-responsive}

![](/cartografia-digital/images/04globe_graticule.gif){: .img-responsive}

![](/cartografia-digital/images/05geographic2.gif){: .img-responsive}

![](/cartografia-digital/images/06plane.gif){: .img-responsive}

![](/cartografia-digital/images/07orthographic1.gif){: .img-responsive}

![](/cartografia-digital/images/08orthographic2.gif){: .img-responsive}

![](/cartografia-digital/images/09cone.gif){: .img-responsive}

![](/cartografia-digital/images/10cylinder.gif){: .img-responsive}

![](/cartografia-digital/images/11cylinders.gif){: .img-responsive}

### UTM: Universal transversal de mercator

Divide la ST en parches (Colombia queda en la zona 18). Si se coloca un cilindro horizontal pegado a un meridiano y a la superficie cilíndrica se proyecta el territorio colombiano.

Para Colombia hay cuatro puntos de tangencia central.

UTM es una proyección con un cilindro horizontal adherido a un meridiano. En Colombia se tienen cuatro puntos.

¿Qué tipo de geoide estamos utilizando para realizar la proyección?

Un elipsoide lo define un semieje menor y otro mayor.

|   Elipsoide   |  Año | Semieje a | Semieje b | Achatamiento | Uso local        |
|:--------------|:----:|:---------:|:---------:|:------------:|:-----------------|
| WGS 84        | 1984 | 6378137.0 | 6356752.3 | 1/298.257    | Universal        |
| GRS 80        | 1980 | 6378137.0 | 6356752.3 | 1/298.257    | U.S.A.           |
| WGS 72        | 1972 | 6378135.0 | 6356750.5 | 1/298.26     | U.S.A.           |
| Krasousky     | 1940 | 6378245.0 | 6356863.0 | 1/298.30     | Rusia            |
| Internacional | 1924 | 6378388.0 | 6356911.9 | 1/297.0      | Colombia, Europa |
| Clarke 80     | 1880 | 6378249.0 | 6356514.9 | 1/293.46     | Norteamérica     |
| Clarke 66     | 1866 | 6378206.4 | 6356514.8 | 1/294.98     | África           |
| Bessel        | 1841 | 6377397.2 | 6356079.0 | 1/299.15     | Japón y Asia     |
{: .table .table-hover}

**Un datum:** Se compone de una proyección y el modelo de elipsoide para La Tierra, y el punto donde se hace el origen de coordenadas.

Para Colombia se utiliza una proyección Transversal de Mercator y el modelo Internacional.

A partir del 2002-2003, el IGAC propone el GLS80 que es el mismo WGS84.

Creación de locations en GRASS {#creacion-locations-grass}
------------------------------

Abrir el directorio "01CreacionLocations" ubicado en la carpeta personal, y se da click derecho en un lugar vacío y se abre un terminal, de manera que el prompt aparece así:

~~~
usuario@equipo:~/01CreacionLocations $
~~~

Se utiliza el comando `gdalinfo`, para obtener información de archivos georeferenciados, como el tipo de elipsoide utilizado, la proyección utilizada, las coordenadas del origen y de las esquinas, el tamaño en número de píxeles, y la resolución de cada píxel.

~~~
gdalinfo SRTM_ff03_n006w076.tif
~~~

En este caso, este archivo no se encuentra proyectado, se trata de una imagen SRTM que incluye el valle de aburrá.

~~~
gdalinfo L71009055_05520040206_B10.TIF
~~~

Este otro archivo si se encuentra proyectado, pertenece a la zona 18N de la proyección UTM. Este archivo es una de las bandas de una imagen LANDSAT que incluye el valle de aburrá.

Para hacer un nuevo location se debe tener una nueva información.

Se abre el GRASS desde la terminal actual:

~~~
grass
~~~

Y se emplea el comando `r.in.gdal` para importar un archivo georeferenciado, el comando tiene un parámetro que permite crear un location nuevo a partir de este archivo.

Se crean 2 nuevos location a partir de los archivos georeferenciados, cada uno con su propia proyección.

~~~
r.in.gdal input=SRTM_ff03_n006w076.tif output=srtmMed location=SRTMmed
r.in.gdal input=L71009055_05520040206_B10.TIF output=b1 location=LANDSATMed
~~~

### Cambiar la proyección de archivos georeferenciados {#cambiar-proyeccion-archivos-georeferenciados}

Para utilizar estos 2 nuevos mapas en el location `CursoGrass`, es necesario re-proyectarlos desde su proyección original por medio del comando `r.proj`, pero primero es importante definir la región actual de acuerdo a las dimensiones del mapa a re-proyectar, consultando las coordenadas del mapa con la opción `-g` y sin especificar un `output`.

~~~
r.proj -g input=srtmMed location=SRTMmed mapset=PERMANENT
~~~

Una vez calculadas las dimensiones, se ajusta la región con el `g.region` utilizando los parámetros de proyección de salida proporcionados por el `r.proj`.

~~~
g.region -p n=1265659.49833505 s=1155250.61187744 w=787437.29344709 e=898483.54085667 rows=1201 cols=1201
~~~

Se ajusta la resolución redondeándola.

~~~
g.region -ap res=90
~~~

Finalmente se realiza la re-proyección eliminando la opción `-g` y agregando el parámetro `output`.

~~~
r.proj input=srtmMed location=SRTMmed mapset=PERMANENT output=srtmMed
~~~

Se repite el proceso para la imagen LANDSAT.

~~~
r.proj -g input=b1 location=LANDSATMed mapset=PERMANENT
g.region -p n=1397172.39560327 s=1185695.48942899 w=733546.33266639 e=976568.05249097 rows=7061 cols=8081
g.region -ap res=30
r.proj input=b1 location=LANDSATMed mapset=PERMANENT output=b1
~~~

Desplegamos los mapas importados.

~~~
g.region rast=srtmMed
d.rast srtmMed
~~~

![](/cartografia-digital/images/srtmMed.png){: .img-responsive}

~~~
g.region rast=b1
d.rast b1
~~~
![](/cartografia-digital/images/b1.png){: .img-responsive}
