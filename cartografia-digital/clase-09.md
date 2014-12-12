---
layout: page
title: 'Uso del toolkit r.stream.*'
clase: '09'
---

El SIG GRASS cuenta con una serie de <a href="http://grasswiki.osgeo.org/wiki/AddOns/GRASS_6" target="_blank">complementos</a> que no hacen parte oficial del SIG pero pueden ser instalados haciendo uso del módulo `g.extension`:

{% highlight bash linenos=table %}
g.extension help
{% endhighlight %}

Para efectos del actual curso, los complementos que serán usados ya se encuentran instalados, la siguiente es la guia de comandos a utilizar.

{% highlight bash linenos=table %}
r.stream.extract help
g.manual r.stream.extract
d.rast porce
r.stream.extract elevation=porce threshold=555 stream_length=3 stream_rast=porce_streams stream_vect=porce_stream direction=porce_direction
d.erase
d.rast porce_streams
d.erase
d.vect porce_stream
d.vect porce_stream color=blue width=2
v.info -c map=porce_stream
v.db.select map=porce_stream | less
d.erase
d.vect porce_stream start=0, color=cyan width=1
d.vect porce_stream where="type_code=0" color=cyan width=1
d.vect porce_stream where="type_code=1" color=blue width=2
r.report porce_streams units=c,p nsteps=10
r.report porce_streams units=c,p nsteps=10 -n
r.stream.order stream=asro2_streams dir=asro2_direction table=asro2_topology_red strahler=asro2_strahler shreve=asro2_shreve horton=asro2_horton hack=asro2_hack topo=asro2_topo
r.stream.order stream=porce_streams dir=porce_direction table=porce_topology_red strahler=porce_strahler shreve=porce_shreve horton=porce_horton hack=porce_hack topo=porce_topo
{% endhighlight %}

Desplegar y comparar las clasificaciones de las corrientes.

{% highlight bash linenos=table %}
d.erase
d.vect porce_strahler color=blue width=2
d.rast porce_strahler
d.erase
d.rast porce_horton
d.mon x0
d.rast porce_horton
d.erase
d.rast porce_shreve
r.report porce_shreve units=c,p,k -n
r.report porce_strahler units=c,p,k -n
r.report porce_horton units=c,p,k -n
r.report porce_hack units=c,p,k -n
d.erase
d.rast porce_strahler
d.erase
d.rast porce_strahler catlist=6
d.rast porce_strahler catlist=5
d.rast porce_strahler catlist=6 --o
d.rast porce_strahler catlist=6 -o
d.rast porce_strahler catlist=5 -o
d.rast porce_strahler catlist=4 -o
d.rast porce_strahler catlist=3 -o
d.erase
g.manual r.stream.order &
g.manual r.stream.extract &
r.report asro2_shreve units=c,p,k -n
r.report porce_shreve units=c,p,k -n
d.mon x0
d.rast porce_shreve catlist=1-10
d.erase
d.rast porce_shreve catlist=1-10
d.rast porce_shreve catlist=10-50 -o
d.rast porce_shreve catlist=50-150 -o
d.rast porce_shreve catlist=150-339 -o
d.erase
d.rast porce_shreve
r.thin input=porce_shreve output=porce_shreve_thin iterations=500
r.to.vect -v input=porce_shreve_thin output=porce_shreve
v.info -c map=porce_shreve
v.db.select map=porce_shreve
d.erase
d.rast porce
d.vect map=porce_shreve cats=1 color=blue width=2
d.erase
d.rast porce
d.vect map=porce_shreve cats=1 color=black width=1
d.vect map=porce_shreve cats=2 color=blue width=1
d.vect map=porce_shreve cats=2 color=blue width=1
d.vect map=porce_shreve cats=3 color=cyan width=2
d.vect map=porce_shreve cats=4 color=purple width=2
d.vect map=porce_shreve cats=5-10 color=green width=2
d.vect map=porce_shreve cats=10-50 color=brown width=3
d.vect map=porce_shreve cats=51-100 color=blue width=4
d.vect map=porce_shreve cats=101-200 color=blue width=5
d.vect map=porce_shreve cats=201-320 color=blue width=6
d.vect map=porce_shreve cats=320-339 color=red width=7
db.select porce_topology_red | less
db.describe -c porce_topology_red
g.list vect
r.thin input=porce_strahler output=porce_strahler_thin iterations=500
r.to.vect -v input=porce_strahler_thin output=porce_strahler
d.erase
d.vect porce_strahler cats=1 color=black width=1
d.erase
d.rast porce
d.vect porce_strahler cats=1 color=black width=1
d.vect porce_strahler cats=1 color=cyan width=2
d.ease
d.erase
d.rast porce
d.vect porce_strahler cats=1 color=black width=1
d.vect porce_strahler cats=2 color=cyan width=2
d.vect porce_strahler cats=3 color=indigo width=3
d.vect porce_strahler cats=4 color=blue width=4
d.vect porce_strahler cats=5 color=blue width=6
r.report porce_strahler units=c,p,k -n
r.thin input=porce_horton output=porce_horton_thin iterations=500
r.to.vect -v input=porce_horton_thin output=porce_horton
r.report porce_horton units=c,p,k -n
{% endhighlight %}

Con base en los "r.report" de porce_strahler y porce_horton, ¿Cuales serían las diferencias entre ambos sistemas de clasificación?

{% highlight bash linenos=table %}
d.erase
d.rast porce
d.vect porce_horton cats=1 color=black width=1
d.vect porce_horton cats=2 color=cyan width=1
d.vect porce_horton cats=3 color=indigo width=3
d.vect porce_horton cats=4 color=blue width=4
d.vect porce_horton cats=5 color=brown width=5
{% endhighlight %}

¿Se identifica la diferencia?

Si no lo consigue, despliegue las categorias de horton una a una sobre el mapa raster pero de 5 a 1.

{% highlight bash linenos=table %}
d.erase
d.rast porce
d.vect porce_horton cats=5 color=brown width=5
d.vect porce_horton cats=4 color=blue width=4
d.vect porce_horton cats=3 color=cyan width=3
d.vect porce_horton cats=2 color=red width=2
d.vect porce_horton cats=1 color=black width=1
{% endhighlight %}

Añadir la tabla anterior al mapa de corrientes de strahler.

Consultar a que base de datos se encuentra conectado el mapa vectorial "porce_strahler".

{% highlight bash linenos=table %}
v.db.connect porce_strahler -p
db.connect driver=sqlite database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
db.connect -p
r.stream.extract elevation=antioquia threshold=555 stream_length=10 stream_rast=asro2_streams stream_vect=asro2_stream direction=asro2_direction --o
r.stream.extract elevation=porce threshold=555 stream_length=3 stream_rast=porce_streams stream_vect=porce_streams direction=porce_direction
r.stream.extract elevation=porce threshold=555 stream_length=3 stream_rast=porce_streams stream_vect=porce_stream direction=porce_direction --o
r.stream.order stream=asro2_streams dir=asro2_direction table=asro2_topology_red strahler=asro2_strahler shreve=asro2_shreve horton=asro2_horton hack=asro2_hack topo=asro2_topo --o
r.stream.order stream=porce_streams dir=porce_direction table=porce_topology_red strahler=porce_strahler shreve=porce_shreve horton=porce_horton hack=porce_hack topo=porce_topo --o
db.tables -p
{% endhighlight %}

Ahora las tabla y la tabla del mapa vectorial están en sqlite.

## Conectar una tabla a un archivo vectorial

Se asume la sugerencia que plantea el comando:

{% highlight bash linenos=table %}
v.db.connect map=porce_stream driver=sqlite database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db' table=porce_topology_red layer=2
{% endhighlight %}
Analizar el mapa vectorial “porce_stream” con la nueva tabla.

{% highlight bash linenos=table %}
v.info map=porce_stream layer=2
v.info -c map=porce_stream layer=2
v.info -c map=porce_stream layer=1
v.info -c map=porce_stream layer=2
v.info -c map=porce_stream layer=1
v.db.select map=porce_stream layer=2 | less
{% endhighlight %}

Utilizando el layer=2 se tiene una base de datos con 1301 filas y 15 columnas.

## Estadísticos de una variable numérica de la base de datos 

Estadísticos de una columna completa: Con el comando `v.db.univar` se pueden hacer cálculos de estadística univariada para una columna especifica de la base de datos conectada a un mapa vectorial.

Calculo de la longitud de los segmentos.

{% highlight bash linenos=table %}
v.db.univar table=porce_topology_red column=length
{% endhighlight %}

Cálculos de la dimensión fractal de los segmentos.

{% highlight bash linenos=table %}
v.db.univar table=porce_topology_red column=fractal
{% endhighlight %}
