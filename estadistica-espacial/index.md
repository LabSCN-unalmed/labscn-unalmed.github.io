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

## Bibliografía

### Textos principales

1. LLoyd, Christopher D. Local Models for Spatial Analysis.
 Second Edition. CRC Press. 2011.
2. Bivand, Roger S, Pebesma Edzer y Gómez-Rubio Virgilio.
Applied Spatial Data Analysis with R. Second Edition. Springer New York.
2013

### Textos complementarios

1. Cressie, Noel A. C. Statistics for Spatial Data.
John Wiley & Sons, Inc. 1991.
2. Gaetan Carlo y Guyon Xavier. Spatial Statistics and Modeling.
Springer Science+Business Media. 2010.
3. Gelfand Alan E., Diggle J. Peter, Fuentes Monserrat y Guttorp Peter.
Handbook of Spatial Statistics. Chapman & Hall/CRC Press. Handbooks of
Modern Statistical Methods. 2010.
4. Cressie Noel y Wikle Christopher K. Statistics for Spation-temporal Data.
John Wiley & Sons, Inc. 2011

## Evaluación

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

~~~
install.packages("ctv")
require("ctv")
install.views("Spatial")
~~~
