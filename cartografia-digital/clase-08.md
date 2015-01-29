---
layout: clase
title: 'Análisis de redes de drenaje'
curso: 'cartografia-digital'
clase: '8'
---

Extraer la red de drenaje y analizar en detalle el mapa "accum"
---------------------------------------------------------------

Para la extracción de redes de drenaje a partir de un DEM utilizamos el comando `r.watershed`.

{% highlight bash linenos=table %}
r.watershed -a elevation=porcecito1 accumulation=porce1_accum drainage=porce1_drain basin=porce1_basin stream=porce1_stream threshold=200000
{% endhighlight %}

La opción `-a` se utiliza para obtener los valores absolutos de `accum`.

{% highlight bash linenos=table %}
d.rast porce1_accum
{% endhighlight %}

![Mapa accum]({{ site.baseurl }}/cartografia-digital/images/porce1_accum.png){: .img-responsive}

### Análisis detallado del mapa “accum”

Consultamos la información estadística extendida utilizando la opción `-e`.

{% highlight bash linenos=table %}
r.univar -e porce1_accum
{% endhighlight %}

Observar los valores mínimo y máximo pero igualmente los diferentes cuartiles.

*¿Qué le suguiere la información obtenida?*

### Elaboración del histograma

{% highlight bash linenos=table %}
d.histogram porce1_accum
{% endhighlight %}

![Rango continuo]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_hist1.png){: .img-responsive}

{% highlight bash linenos=table %}
d.histogram porce1_accum nsteps=20
{% endhighlight %}

![Rango discreto]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_hist2.png){: .img-responsive}

*¿Por qué los histogramas de la imagen anterior brindan tan poca información?*

### Transformación de los datos lineales del “accum” en valores logarítmicos

Utilizamos la calculadora de mapas ráster para obtener un mapa del logaritmo en base 10 del mapa accum:

{% highlight bash linenos=table %}
r.mapcalc 'porce1_accum_log=log(porce1_accum,10)'
{% endhighlight %}

Visualizamos nuevamente el histograma

{% highlight bash linenos=table %}
d.histogram porce1_accum_log
{% endhighlight %}

![Rango continuo]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_log_hist1.png){: .img-responsive}

{% highlight bash linenos=table %}
d.histogram porce1_accum_log nsteps=10
{% endhighlight %}

![Rango discreto]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_log_hist2.png){: .img-responsive}

### Extraer la red de drenaje a partir del mapa “accum”

Luego de llevar los valores de *accum* a valores logarítmicos, seleccionamos los valores del logaritmo por encima de un umbral.

Probamos varios umbrales para decidir cuál es el más apropiado:

{% highlight bash linenos=table %}
r.mapcalc 'porce1_accum_log2 = if(porce1_accum_log > 2)'
r.mapcalc 'porce1_accum_log3 = if(porce1_accum_log > 3)'
r.mapcalc 'porce1_accum_log4 = if(porce1_accum_log > 4)'
{% endhighlight %}

Desplegamos 4 monitores y comparamos los 4 mapas obtenidos

![porce1_accum_log2]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_log2.png){: .img-responsive}

![porce1_accum_log3]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_log3.png){: .img-responsive}

![porce1_accum_log4]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_log4.png){: .img-responsive}

Finalmente decidimos que los valores de *accum* más apropiados para trabajar la red de drenaje en esta zona son los valores logarítmicos mayores que 3, y sobre ese mapa continuaremos trabajando.

### Adelgazar un mapa raster

Este procedimiento se realiza con el fin de convertir un mapa raster en un mapa vectorial.

{% highlight bash linenos=table %}
r.thin input=porce1_accum_log3 output=porce1_accum_log3_thin
{% endhighlight %}

### Transformar el archivo raster adelgazado en un archivo vectorial

Una vez adelgazado el mapa raster, podemos convertirlo al formato vectorial.

{% highlight bash linenos=table %}
r.to.vect input=porce1_accum_log3_thin output=porce1_accum_log3
{% endhighlight %}

Teniendo el mapa raster de la región de porcecito y un mapa vectorial con la red de drenaje cuyos valores logarítmicos de accum son mayores que 4, podemos desplegar la red de drenaje en formato vectorial sobre la región en formato raster.

{% highlight bash linenos=table %}
d.rast porcecito1
d.vect porce1_accum_log3 color=blue width=2
{% endhighlight %}

![]({{ site.baseurl }}/cartografia-digital/images/porce1_accum_vect.png){: .img-responsive}
