---
layout: default
title: 'Construir mapas sombreados para visualizar rasgos lineales en el relieve (lineamientos)'
clase: '06'
---

Los mapas sombreados se despliegan en tonos de gris.

Modificando los valores de altitud y de azimuth se obtienen sombreados diferentes.

Los lineamientos de un relieve resaltan mas en unas combinaciones especificas de altitud y azimuth mientras en otras combinaciones se difuminan.

Un lineamiento resalta cuando la luz incidente proviene de una trayectoria transversal y cuando la altitud de la luz es baja.

{% highlight bash linenos=table %}
r.shaded.relief map=porcecito1 shadedmap=porce1_shaded altitude=45 azimuth=45
{% endhighlight %}

![Mapa sombreado con altitud 45° y azimuth 45°]({{ site.baseurl }}/images/porce1_shaded45_45.png)

Para cambiar los parámetros de altitud y azimuth y construir un nuevo
mapa con el nombre del mapa precedente, utilizar la opción `--o` para
sobreescribir el mapa ya existente.

{% highlight bash linenos=table %}
r.shaded.relief map=porcecito1 shadedmap=porce1_shaded altitude=30 azimuth=135 --o
{% endhighlight %}

![Mapa sombreado con altitud 30° y azimuth 135°]({{ site.baseurl }}/images/porce1_shaded30_135.png)
