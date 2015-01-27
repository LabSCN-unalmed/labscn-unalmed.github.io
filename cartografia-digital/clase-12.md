---
layout: page
title: 'Manejo de los distintos tipos de formato vectorial'
clase: '12'
---

Abrir el directorio `03AntioquiaVector` ubicado en la carpeta personal, y desde allí abrir un terminal. En este directorio se encuentran 3 mapas vectoriales del departamento de Antioquia, uno con los municipios, otro con las carreteras, y otro con puntos de localización.

Verificar que la conexión a la base de datos se encuentre con el controlador SQLite.

{% highlight bash linenos=table %}
db.connect -p
{% endhighlight %}

Importar el mapa de municipios de Antioquia
-------------------------------------------

Se utiliza el procedimiento descrito en la [clase anterior](./clase-11.html).

- Se consultan las capas disponibles en el archivo `muniantioq.shp`.

{% highlight bash linenos=table %}
v.in.ogr -l dsn=muniantioq.shp
{% endhighlight %}

- Se importa el mapa con el nombre `muniantioq`.

{% highlight bash linenos=table %}
v.in.ogr -oe dsn=muniantioq.shp output=muniantioq
{% endhighlight %}

- Consultar la información general del mapa.

{% highlight bash linenos=table %}
v.info map=muniantioq
{% endhighlight %}

- Consultar las columnas disponibles en la tabla de atributos del mapa.

{% highlight bash linenos=table %}
v.info -c map=muniantioq
{% endhighlight %}

- Observar en consola la tabla de atributos del mapa.

{% highlight bash linenos=table %}
v.db.select map=muniantioq | less
{% endhighlight %}

- Se despliegan sólo los límites de este mapa en la región predeterminada sobre los mapas raster, para visualizar los límites municipales.

{% highlight bash linenos=table %}
g.region -dp
d.rast ituango
d.rast -o porcecito
d.rast -o riogrande_sup
d.vect muniantioq type=boundary
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/muniantioq_rast.png){: .img-responsive}

Para consultar la información de los polígonos utilizar el comando `d.what.vect`.

{% highlight bash linenos=table %}
d.what.vect map=muniantioq
{% endhighlight %}

Importar el mapa de carreteras de Antioquia
-------------------------------------------

Debido a que este mapa se encuentra en otra proyección, no puede ser importado directamente como el mapa de los municipios de Antioquia, se debe utilizar una aproximación similar a la descrita en la [Clase 10](./clase-10.html).

- Se consultan las capas disponibles en el archivo `antioquia_highway.shp`.

{% highlight bash linenos=table %}
v.in.ogr -l dsn=antioquia_highway.shp
{% endhighlight %}

- Se importa el mapa a un location nuevo, para posteriormente reproyectarlo.

{% highlight bash linenos=table %}
v.in.ogr dsn=antioquia_highway.shp output=carreteras location=AntioquiaCarr
{% endhighlight %}

- Utilizando el comando `v.proj`, se proyecta el mapa al location actual.

{% highlight bash linenos=table %}
v.proj input=carreteras location=AntioquiaCarr mapset=PERMANENT output=carreteras
{% endhighlight %}

- Consultar la información general del mapa.

{% highlight bash linenos=table %}
v.info map=carreteras
{% endhighlight %}

- Consultar las columnas disponibles en la tabla de atributos del mapa.

{% highlight bash linenos=table %}
v.info -c map=carreteras
{% endhighlight %}

- Observar en consola la tabla de atributos del mapa.

{% highlight bash linenos=table %}
v.db.select map=carreteras | less
{% endhighlight %}

- Se despliegan los mapas raster en la región predeterminada, los límites de los municipios y las carreteras en color rojo.

{% highlight bash linenos=table %}
d.rast ituango
d.rast -o porcecito
d.rast -o riogrande-sup
d.vect muniantioq type=boundary
d.vect carreteras col=red
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/carreteras_rast.png){: .img-responsive}

- Se despliegan sólo las carreteras *primarias*.

{% highlight bash linenos=table %}
d.rast ituango
d.rast -o porcecito
d.rast -o riogrande_sup
d.vect muniantioq type=boundary
d.vect carreteras where="TYPE='primary'" col=red
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/carreteras_rast_primary.png){: .img-responsive}

Importar mapa de puntos de localización de Antioquia
----------------------------------------------------

Este mapa también se encuentra en una proyección diferente, por lo que se importa de la misma manera que se importó el mapa de carreteras en la sección anterior.

{% highlight bash linenos=table %}
v.in.ogr -l dsn=antioquia_location.shp
v.in.ogr dsn=antioquia_location.shp output=puntos location=AntioquiaPuntos
v.proj input=puntos location=AntioquiaPuntos mapset=PERMANENT output=puntos
v.info map=puntos
v.info -c map=puntos
v.db.select map=puntos | less
{% endhighlight %}

- Se despliegan los puntos identificados como *town* en la región predeterminada, sobre los mapas raster y los mapas vectoriales anteriores.

{% highlight bash linenos=table %}
d.rast ituango
d.rast -o porcecito
d.rast -o riogrande_sup
d.vect muniantioq type=boundary
d.vect carreteras where="TYPE='primary'" col=red
d.vect puntos where="PLACE='town'" col=grey
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/puntos_rast "fig:".png){: .img-responsive}

- Se despliegan los puntos en porcecito, para identificar lugares.

{% highlight bash linenos=table %}
g.region rast=porcecito 
d.rast porcecito 
d.vect muniantioq
type=boundary 
d.vect carreteras col=red 
d.vect puntos col=grey
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/porcecito_puntos.png){: .img-responsive}

- Se despliegan los nombres de los puntos en el mapa.

{% highlight bash linenos=table %}
d.rast porcecito 
d.vect muniantioq type=boundary 
d.vect
carreteras col=red 
d.vect puntos display=attr,shape col=red
icon=“basic/diamond” attrcol=NAME lcolor=black
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/porcecito_puntos_labels.png){: .img-responsive}

- Se consulta la información de los puntos con el comando `d.what.vect`.

{% highlight bash linenos=table %}
d.what.vect map=puntos
{% endhighlight %}
