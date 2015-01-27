---
layout: page
title: 'Modelo vectorial'
course: 'Cartografía Digital'
comments: true
categories: 'cartografia-digital'
side: 'cartografia-digital'
clase: '11'
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

{% highlight text linenos=table %}
usuario@equipo:~/02ZonasVida$
{% endhighlight %}

- Se consultan los contenidos del directorio con el comando `ls` (listar).

{% highlight bash linenos=table %}
ls -l
{% endhighlight %}

- El comando a utilizar para realizar la importación es el `v.in.ogr`. Se abre GRASS en el location *CursoGrass*, y una vez adentro se consultan los formatos admitidos para importar en formato vectorial.

{% highlight bash linenos=table %}
v.in.ogr -f
{% endhighlight %}

- Se comprueba que GRASS admite el formato ESRI Shapefile como lectura y escritura (rw).

- Procedemos a consultar las capas disponibles en el archivo `zvidantioq.shp`

{% highlight bash linenos=table %}
v.in.ogr -l dsn=zvidantioq.shp
{% endhighlight %}

### Importar a GRASS el archivo de “zonas de vida”

La primera importación indica un error por diferencias en la proyección.

{% highlight bash linenos=table %}
v.in.ogr dsn=zvidantioq.shp output=zvidantioq
{% endhighlight %}

En la segunda orden se supera el problema incorporando la opción `-o` para ignorar la comprobación de la proyección, tal como lo sugiere GRASS.

Se añade también la opción `-e` para extender la región de acuerdo al nuevo mapa a importar.

{% highlight bash linenos=table %}
v.in.ogr -oe dsn=zvidantioq.shp output=zvidantioq
{% endhighlight %}

Información general del mapa vectorial
--------------------------------------

Se utiliza el comando `v.info` para obtener información general de un mapa vectorial.

{% highlight bash linenos=table %}
v.info map=zvidantioq
{% endhighlight %}

Utilizando la opción `-c` se obtiene información de las columnas del mapa vectorial.

{% highlight bash linenos=table %}
v.info -c map=zvidantioq
{% endhighlight %}

Para ver la tabla de atributos asociada al mapa vectorial se utiliza el comando `v.db.select`.

{% highlight bash linenos=table %}
v.db.select map=zvidantioq | less
{% endhighlight %}

Se utiliza el redireccionador o *pipe* `|` para visualizar la salida del comando de una manera más cómoda con el programa `less`, debido a que esta salida proporciona gran cantidad de información.

Para salir de esta visualización se presiona la tecla `Q`.

Así podemos ver los atributos de los 16 elementos que contiene el mapa.

Despliegue del mapa vectorial
-----------------------------

Se utiliza el comando `d.vect` para desplegar el mapa vectorial, este comando posee gran cantidad de opciones y parámetros que le otorgan mucha versatilidad al despliegue de mapas vectoriales. Se recomienda documentarse ampliamente sobre el comando para aprovecharlo, a continuación veremos algunos parámetros útiles para el despliegue de información relevante.

Dado que los mapas vectoriales, al contrario de los mapas raster, pueden ser desplegados por capas, se debe emplear el comando `d.erase` antes de volver a desplegar el mapa con otros parámetros, pues se sobrepondrían a lo que ya esté desplegado de él, a menos que se deseen desplegar atributos diferentes simultáneamente.

- Desplegar el mapa completo, en áreas.

{% highlight bash linenos=table %}
d.vect zvidantioq
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq.png){: .img-responsive}

- Desplegar sólo los bordes.

{% highlight bash linenos=table %}
d.vect zvidantioq type=boundary
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_boundary.png){: .img-responsive}

- Desplegar los límites sobre el mapa ráster.

{% highlight bash linenos=table %}
d.rast ituango
d.vect zvidantioq type=boundary
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_boundary_ituan.png){: .img-responsive}

- Desplegar los centroides de las áreas sobre el mapa ráster.

{% highlight bash linenos=table %}
d.rast ituango
d.vect zvidantioq type=centroid
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_centroid_ituan.png){: .img-responsive}

- Despliegue de las identificaciones de las zonas.

{% highlight bash linenos=table %}
d.vect zvidantioq type=boundary
d.vect zvidantioq display=attr type=centroid attrcol=COZO lcolor=blue
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_boundary_COZO.png){: .img-responsive}

- Colorear las zonas de manera aleatoria utilizando la opción `-c`.

{% highlight bash linenos=table %}
d.vect -c zvidantioq display=shape,attr attrcol=COZO
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_boundary_COZO_color.png){: .img-responsive}

Utilizando el parámetro `where` se puede seleccionar el despliegue de un sólo polígono identificándolo con la columna COZO. Este parámetro es muy importante para desplegar unos polígonos seleccionados por el usuario.

Con `where` podemos hacer preguntas como desplegar los polígonos con un valor mayor de cierto umbral, o cierta categoría en particular.

- Desplegar sólo una categoría del mapa vectorial.

{% highlight bash linenos=table %}
d.vect -c zvidantioq where="COZO='bh-T'" display=shape,attr attrcol=COZO lcolor=black
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_boundary_COZO_bhT.png){: .img-responsive}

- Modificar la región para ajustarla al mapa vectorial de las zonas de vida de Antioquia.

{% highlight bash linenos=table %}
g.region vect=zvidantioq
d.vect zvidantioq
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_full.png){: .img-responsive}

- Desplegar todo el mapa de zonas de vida para Antioquia. La opción `-c` asigna colores al azar a los polígonos.

{% highlight bash linenos=table %}
d.vect -c zvidantioq display=shape,attr attrcol=COZO
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_color.png){: .img-responsive}

- Mostrar el mapa de sólo una zona que no se identificaba anteriormente.

{% highlight bash linenos=table %}
d.vect -c zvidantioq where="COZO='bmh-MB'" display=shape,attr attrcol=COZO lcolor=black
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/zvidantioq_boundary_COZO_bmhMB.png){: .img-responsive}

- Seleccionar la zona de ituango y desplegar las zonas de vida.

{% highlight bash linenos=table %}
g.region rast=ituango
d.rast ituango
d.vect zvidantioq type=boundary
d.vect zvidantioq display=attr type=centroid attrcol=COZO lcolor=black lsize=16
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/ituan_zvidantioq.png){: .img-responsive}

Estadísticos de una variable numérica de la base de datos
---------------------------------------------------------

Para consultar los estadísticos de una variable numérica se utiliza el comando `v.db.univar`.

{% highlight bash linenos=table %}
v.db.univar zvidantioq column=SUM_AREA
{% endhighlight %}

Controlador de base de datos activa en el momento
-------------------------------------------------

El comando `db.connect` gestiona la conexión a la base de datos. Para ver la conexión actual a la base de datos se utiliza la opción `-p`.

{% highlight bash linenos=table %}
db.connect -p
{% endhighlight %}

El `driver` es el controlador de la base de datos. La elaboración de mapas vectoriales generan bases de datos que se almacenan en el driver activo. Por lo tanto, se debe tener claro cual es el driver activo al momento de elaborar mapas vectoriales.

### Cambiar conexión a otro manejador de base de datos

Para cambiar el driver hay que tener en cuenta que las tablas de atributos de los mapas generados o creados con el driver actual no serán accesibles con el nuevo driver.

{% highlight bash linenos=table %}
db.connect driver=sqlite database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
db.connect -p
{% endhighlight %}

Las tablas de atributos deben ser migradas del driver anterior `dbf` al nuevo driver `SQLite`, para lo cual debemos primero copiarlas mediante el comando `db.copy` y después conectarlas al mapa vectorial con el comando `v.db.connect`.

{% highlight bash linenos=table %}
db.copy from_table=zvidantioq to_table=zvidantioq \
        from_driver=dbf to_driver=sqlite \
        from_database='$GISDBASE/$LOCATION_NAME/$MAPSET/dbf' to_database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
v.db.connect -o map=zvidantioq table=zvidantioq
{% endhighlight %}

La opción `-o` se utiliza para sobreescribir la conexión del driver anterior.

Para ver las tablas asociadas al controlador activo se puede ejecutar el siguiente comando.

{% highlight bash linenos=table %}
db.tables -p
{% endhighlight %}
