---
layout: clase
title: 'Uso del toolkit r.stream.*'
curso: 'cartografia-digital'
clase: 6
---

El SIG GRASS cuenta con una serie de [complementos](http://grasswiki.osgeo.org/wiki/AddOns/GRASS_7){:target="blank"} que no hacen parte oficial del SIG pero pueden ser instalados haciendo uso del módulo `g.extension`:

> Configuraciones > Complementos de extensión > Instalar extensión desde los complementos

~~~
g.extension help
~~~

Para efectos del actual curso, los complementos que serán usados ya se encuentran instalados, la siguiente es la guia de comandos a utilizar.

> Configuraciones > Complementos de extensión > Administrar complementos de extensión instalados

## Extraer la red de drenaje

Existe un comando alterno al `r.watershed`, que permite extraer la red de drenaje tanto en formato raster como vector. Adicionalmente brinda la posibilidad de clasificación de la red de drenaje mediante un comando complementario descrito más adelante.

Consultar la documentación del comando `r.stream.extract`:

> Ráster > Modelado hidrológico > Extracción de red de arrollos

Por error de traducción del paquete se utilizó **arrollo** en lugar de **arroyo**.

~~~
r.stream.extract help
g.manual r.stream.extract
~~~

Extraer la red de drenaje en formatos raster y vector:

~~~
r.stream.extract elevation=porcecito1 threshold=555 stream_length=3 stream_raster=porcecito_streams stream_vector=porcecito_streams direction=porcecito_direction
~~~

Consultar la información del mapa raster de corrientes resultante:

> Ráster > Informes y estadísticas > Suma área por mapa ráster y categoría

~~~
r.report -n map=porcecito_streams units=c,p,k nsteps=10
~~~

## Ordenar la red de drenaje

Se utiliza el comando `r.stream.order` con los mapas obtenidos del `r.stream.extract` como insumos.

Se puede descargar el addon, teniendo una conexión activa a internet con el comando:

> Configuraciones > Complementos de extensión > Instalar extensión desde los complementos

~~~
g.extension r.stream.order
~~~

Como se mencionó anteriormente, el comando se encuentra preinstalado en la máquina virtual para efectos del curso.

La clasificación u ordenamiento de la red de drenaje se realiza utilizando:

* El mapa raster de corrientes.
* El mapa raster de dirección de drenajes.
* El mapa raster de elevacion.

Se utiliza la ventana de "Administrador de capas de GRASS GISS 7.4.0",
en la pensaña (inferior) "Consola" se escribe: "r.stream.order".

~~~
r.stream.order stream_rast=porcecito_streams direction=porcecito_direction elevation=porcecito1 accumulation=porce1_accum stream_vect=porce1_streams strahler=porcecito_strahler horton=porcecito_horton shreve=porcecito_shreve hack=porcecito_hack topo=porcecito_topo
~~~

Los mapas resultantes contienen los sistemas de ordenamiento de la red de drenaje. Adicionalmente, un nuevo mapa vectorial se genera con atributos adicionales a los generados por el `r.stream.extract`.

![](/cartografia-digital/images/clase-06/stream_orders.png){: .img-responsive}

Desplegar y comparar las clasificaciones de las corrientes y consultar la información de los mapas resultantes.


> Ráster > Informes y estadísticas > Suma área por mapa ráster y categoría

~~~
r.report -n map=porcecito_strahler units=c,p,k
r.report -n map=porcecito_horton units=c,p,k
r.report -n map=porcecito_shreve units=c,p,k
r.report -n map=porcecito_hack units=c,p,k
r.report -n map=porcecito_topo units=c,p,k
~~~

Con base en los reportes obtenidos de strahler y horton, ¿Cuales serían las diferencias entre ambos sistemas de clasificación?
{: .alert .alert-warning}

¿Se identifica la diferencia?

Si no lo consigue, despliegue las categorias de horton una a una sobre el mapa raster.
{: .alert .alert-success}

Conversión de los mapas raster ordenados a formato vectorial.

> Ráster > Transformar elementos > Adelgazar, afinar

~~~
r.thin input=porcecito_shreve output=porcecito_shreve_thin
~~~

> Ráster > Conversion de tipos de mapas > Ráster a vectorial

~~~
r.to.vect -v input=porcecito_shreve_thin output=porcecito_shreve type=line
~~~

> Vector > Informes y estadísticas > Metadatos básicos del vectorial

~~~
v.info -c map=porcecito_shreve
~~~

> Vector > Consultar mapa vectorial > Consultar datos de objetos espaciales vectoriales

~~~
v.db.select map=porcecito_shreve
~~~

Este mismo procedimiento se puede realizar para los demás sistemas de ordenamiento.

## Consultar el mapa vectorial de corrientes

Los comandos `r.stream.extract` y `r.stream.order` generan mapas vectoriales de corrientes con una gran cantidad de atributos.

Consultar la tabla de atributos asociada a cada mapa vectorial:

### Mapa vectorial obtenido con `r.stream.extract`


> Vector > Informes y estadísticas > Metadatos básicos del vectorial

~~~
v.info -c map=porcecito_streams
~~~

> Vector > Consultar mapa vectorial > Consultar datos de objetos espaciales vectoriales

~~~
v.db.select map=porcecito_streams | less
~~~

¿Cuál es la diferencia entre los segmentos de tipo `start` e `intermediate` en el mapa vectorial que se obtiene con el `r.stream.extract`?
{: .alert .alert-warning}

¿Cómo se podría elaborar un mapa de isoconcentraciones de nacimientos de corrientes en una región utilizando el mapa vectorial obtenido con `r.stream.extract`?
{: .alert .alert-warning}

¿Cómo elaborar una tabla con la distribución altitudinal de los nacimientos de las corrientes de agua en una región (porcecito o ituango)?
{: .alert .alert-warning}

### Mapa vectorial obtenido con `r.stream.order`

> Vector > Informes y estadísticas > Metadatos básicos del vectorial

~~~
v.info -c map=porce1_streams
~~~

> Vector > Consultar mapa vectorial > Consultar datos de objetos espaciales vectoriales

~~~
v.db.select map=porce1_streams | less
~~~

¿Cuáles podrían ser aplicaciones potenciales del atributo `sinusoid` en la base de datos del mapa vectorial obtenido con `r.stream.order`?
{: .alert .alert-warning}

Si algún fenómeno ambiental específico depende significativamente de la energía de la corriente, ¿Cómo se podrían delimitar o diferenciar aquellos segmentos de corriente que puedan presentar mayor energía? De igual manera, ¿Cómo diferenciar las de menor energía?

{: .alert .alert-warning}
Si el valor de `accum` puede constituir una variable sustituta del caudal de la corriente, consultar visualmente valores de accum para corrientes con diferente orden de Strahler en sus puntos de desembocadura.
{: .alert .alert-warning}

## Estadísticos de un atributo numérico de la base de datos {#estadisticos-atributo-numerico-base-datos}

Con el comando `v.db.univar` se pueden hacer cálculos de estadística univariada para un atributo especifico de la base de datos conectada a un mapa vectorial.

Calculo de la longitud de los segmentos.

> Vector > Informes y estadísticas > Estadísticas univariantes para columnas de atributo  

~~~
v.db.univar map=porce1_streams column=length
~~~
