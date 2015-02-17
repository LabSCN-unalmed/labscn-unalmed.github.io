---
layout: clase
title: 'Desplegar los mapas construidos con titulo y leyenda'
curso: 'cartografia-digital'
clase: 5
---

Para desplegar un mapa en un marco con título y leyenda se utiliza el comando `d.rast.leg`.

~~~
d.rast.leg map=porce1_RR_33_reclass position=70 title="Relieve Relativo en porcecito"
~~~

Con este comando se le coloca la leyenda y el titulo a un mapa.

Adicionalmente, la opción `position` sirve para indicar el porcentaje de la pantalla a utilizar para desplegar el mapa y la restante para desplegar la leyenda.

Dedicar un 60% a un 70% para el mapa.

![Mapa desplegado con título y leyenda](/cartografia-digital/images/porce1_RR_33_reclass_leg.png){: .img-responsive .img-rounded}
