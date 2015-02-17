---
layout: clase
title: 'Modelo vectorial'
curso: 'cartografia-digital'
clase: 11
---

- Punto (point)
- Centroide (centroid)
- Linea (line)
- Limite o borde (boundary)
- Area (Limite + centroide)
- Cara (Area 3D)
- Kernel (Centroide 3D)
- Volumen (Cara + kernel)

En un linea poligonal ("quebrada") los extremos son **nodos** y los puntos de cambio de dirección son vértices. Cada segmento de la linea quebrada son **segmentos**.

En un polígono hay un **nodo**, que corresponde al punto inicial. Los otros extremos del polígono son **vértices**; las lineas del polígono son **limite**. Asociado a un polígono existe un **centroide**.

Área, cara, kernel y volumen son específicos del GRASS.

**Área**: Es un límite mas un centroide.

**Cara**: Es un área en 3D. Un punto 3d tiene tres coordenadas.

**Kernel**: Es el equivalente de un centroide en una figura 3D.

**Volumen**: Es cara mas kernel.

Una **polilínea** está compuesta por segmentos de linea y en ella se definen nodos y vértices.

El **centroide** es un tipo de punto y está ubicado en el centro de un polígono. En GRASS el centroide siempre está dentro del polígono.

El **límite o borde** para una linea (polilínea) cuyo punto de inicio y su punto final coinciden (es una linea cerrada). Si es un segmento que separa dos áreas se habla de limite porque es una linea que comparten dos áreas diferentes.

Importar archivos ESRI Shapefile a GRASS en formato vectorial
-------------------------------------------------------------

Se tiene el mapa de las zonas de vida del departamento de Antioquia en formato ESRI Shapefile, que se va a tomar del directorio `02ZonasVida`, ubicado en la carpeta personal.

- Se abre el directorio `02ZonasVida` y se da click derecho en un lugar vacío y se abre un terminal, de manera que el prompt aparece así:

~~~
usuario@equipo:~/02ZonasVida$
~~~

- Se consultan los contenidos del directorio con el comando `ls` (listar).

~~~
ls -l
~~~

- El comando a utilizar para realizar la importación es el `v.in.ogr`. Se abre GRASS en el location *CursoGrass*, y una vez adentro se consultan los formatos admitidos para importar en formato vectorial.

~~~
v.in.ogr -f
~~~

- Se comprueba que GRASS admite el formato ESRI Shapefile como lectura y escritura (rw).

- Procedemos a consultar las capas disponibles en el archivo `zvidantioq.shp`

~~~
v.in.ogr -l dsn=zvidantioq.shp
~~~

### Importar a GRASS el archivo de “zonas de vida”

La primera importación indica un error por diferencias en la proyección.

~~~
v.in.ogr dsn=zvidantioq.shp output=zvidantioq
~~~

En la segunda orden se supera el problema incorporando la opción `-o` para ignorar la comprobación de la proyección, tal como lo sugiere GRASS.

Se añade también la opción `-e` para extender la región de acuerdo al nuevo mapa a importar.

~~~
v.in.ogr -oe dsn=zvidantioq.shp output=zvidantioq
~~~

Información general del mapa vectorial
--------------------------------------

Se utiliza el comando `v.info` para obtener información general de un mapa vectorial.

~~~
v.info map=zvidantioq
~~~

Utilizando la opción `-c` se obtiene información de las columnas del mapa vectorial.

~~~
v.info -c map=zvidantioq
~~~

Para ver la tabla de atributos asociada al mapa vectorial se utiliza el comando `v.db.select`.

~~~
v.db.select map=zvidantioq | less
~~~

Se utiliza el redireccionador o *pipe* `|` para visualizar la salida del comando de una manera más cómoda con el programa `less`, debido a que esta salida proporciona gran cantidad de información.

Para salir de esta visualización se presiona la tecla `Q`.

Así podemos ver los atributos de los 16 elementos que contiene el mapa.

Despliegue del mapa vectorial
-----------------------------

Se utiliza el comando `d.vect` para desplegar el mapa vectorial, este comando posee gran cantidad de opciones y parámetros que le otorgan mucha versatilidad al despliegue de mapas vectoriales. Se recomienda documentarse ampliamente sobre el comando para aprovecharlo, a continuación veremos algunos parámetros útiles para el despliegue de información relevante.

Dado que los mapas vectoriales, al contrario de los mapas raster, pueden ser desplegados por capas, se debe emplear el comando `d.erase` antes de volver a desplegar el mapa con otros parámetros, pues se sobrepondrían a lo que ya esté desplegado de él, a menos que se deseen desplegar atributos diferentes simultáneamente.

- Desplegar el mapa completo, en áreas.

~~~
d.vect zvidantioq
~~~

![](/cartografia-digital/images/zvidantioq.png){: .img-responsive .img-rounded}

- Desplegar sólo los bordes.

~~~
d.vect zvidantioq type=boundary
~~~

![](/cartografia-digital/images/zvidantioq_boundary.png){: .img-responsive .img-rounded}

- Desplegar los límites sobre el mapa ráster.

~~~
d.rast ituango
d.vect zvidantioq type=boundary
~~~

![](/cartografia-digital/images/zvidantioq_boundary_ituan.png){: .img-responsive .img-rounded}

- Desplegar los centroides de las áreas sobre el mapa ráster.

~~~
d.rast ituango
d.vect zvidantioq type=centroid
~~~

![](/cartografia-digital/images/zvidantioq_centroid_ituan.png){: .img-responsive .img-rounded}

- Despliegue de las identificaciones de las zonas.

~~~
d.vect zvidantioq type=boundary
d.vect zvidantioq display=attr type=centroid attrcol=COZO lcolor=blue
~~~

![](/cartografia-digital/images/zvidantioq_boundary_COZO.png){: .img-responsive .img-rounded}

- Colorear las zonas de manera aleatoria utilizando la opción `-c`.

~~~
d.vect -c zvidantioq display=shape,attr attrcol=COZO
~~~

![](/cartografia-digital/images/zvidantioq_boundary_COZO_color.png){: .img-responsive .img-rounded}

Utilizando el parámetro `where` se puede seleccionar el despliegue de un sólo polígono identificándolo con la columna COZO. Este parámetro es muy importante para desplegar unos polígonos seleccionados por el usuario.

Con `where` podemos hacer preguntas como desplegar los polígonos con un valor mayor de cierto umbral, o cierta categoría en particular.

- Desplegar sólo una categoría del mapa vectorial.

~~~
d.vect -c zvidantioq where="COZO='bh-T'" display=shape,attr attrcol=COZO lcolor=black
~~~

![](/cartografia-digital/images/zvidantioq_boundary_COZO_bhT.png){: .img-responsive .img-rounded}

- Modificar la región para ajustarla al mapa vectorial de las zonas de vida de Antioquia.

~~~
g.region vect=zvidantioq
d.vect zvidantioq
~~~

![](/cartografia-digital/images/zvidantioq_full.png){: .img-responsive .img-rounded}

- Desplegar todo el mapa de zonas de vida para Antioquia. La opción `-c` asigna colores al azar a los polígonos.

~~~
d.vect -c zvidantioq display=shape,attr attrcol=COZO
~~~

![](/cartografia-digital/images/zvidantioq_color.png){: .img-responsive .img-rounded}

- Mostrar el mapa de sólo una zona que no se identificaba anteriormente.

~~~
d.vect -c zvidantioq where="COZO='bmh-MB'" display=shape,attr attrcol=COZO lcolor=black
~~~

![](/cartografia-digital/images/zvidantioq_boundary_COZO_bmhMB.png){: .img-responsive .img-rounded}

- Seleccionar la zona de ituango y desplegar las zonas de vida.

~~~
g.region rast=ituango
d.rast ituango
d.vect zvidantioq type=boundary
d.vect zvidantioq display=attr type=centroid attrcol=COZO lcolor=black lsize=16
~~~

![](/cartografia-digital/images/ituan_zvidantioq.png){: .img-responsive .img-rounded}

Estadísticos de una variable numérica de la base de datos
---------------------------------------------------------

Para consultar los estadísticos de una variable numérica se utiliza el comando `v.db.univar`.

~~~
v.db.univar zvidantioq column=SUM_AREA
~~~

Controlador de base de datos activa en el momento
-------------------------------------------------

El comando `db.connect` gestiona la conexión a la base de datos. Para ver la conexión actual a la base de datos se utiliza la opción `-p`.

~~~
db.connect -p
~~~

El `driver` es el controlador de la base de datos. La elaboración de mapas vectoriales generan bases de datos que se almacenan en el driver activo. Por lo tanto, se debe tener claro cual es el driver activo al momento de elaborar mapas vectoriales.

### Cambiar conexión a otro manejador de base de datos

Para cambiar el driver hay que tener en cuenta que las tablas de atributos de los mapas generados o creados con el driver actual no serán accesibles con el nuevo driver.

~~~
db.connect driver=sqlite database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
db.connect -p
~~~

Las tablas de atributos deben ser migradas del driver anterior `dbf` al nuevo driver `SQLite`, para lo cual debemos primero copiarlas mediante el comando `db.copy` y después conectarlas al mapa vectorial con el comando `v.db.connect`.

~~~
db.copy from_table=zvidantioq to_table=zvidantioq \
        from_driver=dbf to_driver=sqlite \
        from_database='$GISDBASE/$LOCATION_NAME/$MAPSET/dbf' to_database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
v.db.connect -o map=zvidantioq table=zvidantioq
~~~

La opción `-o` se utiliza para sobreescribir la conexión del driver anterior.

Para ver las tablas asociadas al controlador activo se puede ejecutar el siguiente comando.

~~~
db.tables -p
~~~
