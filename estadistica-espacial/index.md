---
layout: curso
title: 'Estadística Espacial'
curso: 'estadistica-espacial'
order: 00
---

## Temas principales

1. Introducción a datos espaciales.
2. Manejo de datos espaciales en R.
3. Procedimientos en datos geoestadísticos.
4. Procedimientos en datos de patrones de puntos.
5. Procedimientos en datos areales.
6. Procedimientos en datos raster (grid).

## Evaluación:

| Item                   | Porcentaje |
|:-----------------------|:----------:|
| Seguimiento - Talleres |        20% |
| Seguimiento - Trabajos |        40% |
| Proyecto final         |        40% |
{: .table .table-hover}

## Enlaces principales

* [Lenguaje Estadístico R.](http://cran.r-project.org/bin/windows/base/){:target="_blank"}
* [Interfaz para el R RStudio.](http://www.rstudio.com/products/rstudio/download/){:target="_blank"}

## Procedimiento en R para instalar *todos* los paquetes asociados a manejos de datos espaciales.

{% highlight r linenos=table %}
install.packages("ctv")
require("ctv")
install.views("Spatial")
{% endhighlight %}
