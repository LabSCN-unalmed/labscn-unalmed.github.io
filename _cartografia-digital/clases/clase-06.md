---
layout: clase
title: 'Uso del toolkit r.stream.*'
curso: 'cartografia-digital'
clase: 6
custom_js: 'mathjax'
---

GRASS cuenta con una serie de [complementos](https://grass.osgeo.org/grass74/manuals/addons/){:target="blank"} que no hacen parte oficial del SIG pero pueden ser instalados haciendo uso del módulo `g.extension` al cual podemos acceder desde el menú *Settings -> Addons extensions -> Install extension from addons*.

![](/cartografia-digital/images/clase-06/clase-06_01.png){: .img-responsive}

Estos se encuentran organizados en las categorías de herramientas que dispone GRASS.

![](/cartografia-digital/images/clase-06/clase-06_02.png){: .img-responsive}

Para efectos del actual curso, los complementos que serán utilizados ya se encuentran instalados, esto lo podemos comprobar con el `g.extension` por el menú *Settings -> Addons extensions -> Manage installed extensions*.

![](/cartografia-digital/images/clase-06/clase-06_03.png){: .img-responsive}

Y encontraremos los complementos que ya se encuentran instalados, donde podremos reinstalarlos o eliminarlos.

![](/cartografia-digital/images/clase-06/clase-06_04.png){: .img-responsive}

<!--
███████ ██   ██ ████████ ██████   █████   ██████ ████████
██       ██ ██     ██    ██   ██ ██   ██ ██         ██
█████     ███      ██    ██████  ███████ ██         ██
██       ██ ██     ██    ██   ██ ██   ██ ██         ██
███████ ██   ██    ██    ██   ██ ██   ██  ██████    ██
-->

## Extraer la red de drenaje

Existe una herramienta complementaria a `r.watershed`, que permite extraer la red de drenaje tanto en formato raster como vectorial. Se trata del `r.stream.extract`, la cual podemos ejecutar desde el menú *Raster -> Hydrologic modeling -> Watershed analysis*.

![](/cartografia-digital/images/clase-06/clase-06_05.png){: .img-responsive}

Para extraer las corrientes será necesario utilizar un umbral $$k$$ de forma similar al utilizado al [extraer la red de drenaje a partir del mapa de acumulación](clase-05#extraer-red-drenaje).

En este caso el umbral se especificará como el área mínima necesaria para formar una corriente, especificado en número de pixeles, por lo que debemos primero hacer la conversión teniendo en cuenta el área del pixel.

$$
\begin{align}
k &=& \frac{A m^2}{30^2 m^2}\\
\end{align}
$$

Si definimos para la zona de Ituango un área mínima de $$1 km^2$$ para que nazca una corriente, podemos estimar el umbral $$k$$ de la siguiente manera:

$$
\begin{align}
k &=& \frac{1.000.000 m^2}{30^2 m^2}\\
k &=& 1111,\bar{1}\\
\end{align}
$$

El cual vamos a definir como parámetro requerido en la herramienta:

![](/cartografia-digital/images/clase-06/clase-06_06.png){: .img-responsive}

En los mapas de entrada de la pestaña *Input maps* vamos a indicar el mapa de acumulación que calculamos con el `r.watershed`, y dado que no contamos con un raster de las depresiones reales del terreno, este parámetro lo dejaremos en blanco.

![](/cartografia-digital/images/clase-06/clase-06_07.png){: .img-responsive}

En la pestaña *Output maps* vamos a indicar los nombres que queremos asignarle a los mapas resultantes de la extracción. Esta herramienta entrega las corrientes en formato raster y vectorial, y además entrega un mapa de dirección similar al obtenido con el `r.watershed` pero que necesitaremos más adelante para ordenar la red de drenaje.

![](/cartografia-digital/images/clase-06/clase-06_08.png){: .img-responsive}

En la pestaña *Optional* vamos a encontrar una opción de eliminar segmentos de corriente cortos, de acuerdo al número de pixeles.

En este ejemplo, vamos a omitir las corrientes iniciales de menos de $$150m$$.

$$
\begin{align}
150m \times 30m \approx 5
\end{align}
$$

**Nota:** Dado que los pixeles pueden estar ubicados en dirección diagonal, la distancia entre uno y otro puede exceder los $$30m$$ y es por esto que el resultado es aproximado.
{: .alert .alert-info}

![](/cartografia-digital/images/clase-06/clase-06_09.png){: .img-responsive}

De esta forma se producirán 2 mapas raster y uno vectorial:

1. **Mapa raster de corrientes:** donde los pixeles que pertenecen a corriente tendrán valores categóricos que identifican cada segmento de corriente, y los demás pixeles serán nulos.
2. **Mapa raster de dirección:** similar al mapa de dirección de drenaje estimado mediante el `r.watershed`, con algunos ajustes para que coincida con las corrientes ya adelgazadas.
3. **Mapa vector de corrientes:** con líneas y puntos para cada segmento. Los puntos están ubicados al inicio de cada segmento.

![](/cartografia-digital/images/clase-06/clase-06_10.png){: .img-responsive}

Al ejecutar la herramienta se agregarán automáticamente las capas de los nuevos mapas.

Para obtener una visualización más agradable de las corrientes dejaremos únicamente la capa vectorial sobre el DEM. Y al abrir sus propiedades podremos mejorar el aspecto.

![](/cartografia-digital/images/clase-06/clase-06_11.png){: .img-responsive}

Lo primero es dirigirnos a la pestaña *Selection* para indicar que sólo queremos desplegar las líneas.

![](/cartografia-digital/images/clase-06/clase-06_12.png){: .img-responsive}

Y por último en la pestaña *Colors* vamos a elegir un tono *azul agua* para las líneas de corriente.

![](/cartografia-digital/images/clase-06/clase-06_13.png){: .img-responsive}

Y este es el resultado:

![](/cartografia-digital/images/clase-06/ituango_streams.png){: .img-responsive}

<!--
 ██████  ██████  ██████  ███████ ██████
██    ██ ██   ██ ██   ██ ██      ██   ██
██    ██ ██████  ██   ██ █████   ██████
██    ██ ██   ██ ██   ██ ██      ██   ██
 ██████  ██   ██ ██████  ███████ ██   ██
-->

## Ordenar la red de drenaje

Haciendo uso de la herramienta `r.stream.order` y de los mapas obtenidos con el `r.stream.extract`, podemos ordenar la red de drenaje de acuerdo a diferentes sistemas jerárquicos de corrientes.

![](/cartografia-digital/images/clase-06/stream_orders.png){: .img-responsive #stream_orders}

Se puede descargar el complemento, teniendo una conexión activa a internet por medio del menú de complementos:

![](/cartografia-digital/images/clase-06/clase-06_14.png){: .img-responsive}

Como se mencionó anteriormente, el comando se encuentra preinstalado en la máquina virtual para efectos del curso.

En el **Administrador de capas** se encuentra una pestaña *Modules* en la parte inferior, allí vamos a ir hasta donde se encuentran los *Addons* y de la lista elegimos el `r.stream.order`.

![](/cartografia-digital/images/clase-06/clase-06_15.png){: .img-responsive}

La clasificación u ordenamiento de la red de drenaje se realiza utilizando:

* El mapa raster de corrientes.
* El mapa raster de dirección de drenajes.
* El mapa raster de elevacion.
* El mapa raster de acumulación.

![](/cartografia-digital/images/clase-06/clase-06_16.png){: .img-responsive}

Se creará un mapa raster por cada sistema de ordenamiento de la red de drenaje, y adicionalmente, un nuevo mapa vectorial con atributos adicionales a los generados por el `r.stream.extract`.

![](/cartografia-digital/images/clase-06/clase-06_17.png){: .img-responsive}

En la pestaña *Optional* es recomendable indicar que se utilice el mapa de acumulación para trazar los modelos Horton y Hack.

![](/cartografia-digital/images/clase-06/clase-06_18.png){: .img-responsive}

Y tendremos un nuevo mapa vectorial que debemos escudriñar un poco antes de visualizar.

![](/cartografia-digital/images/clase-06/clase-06_19.png){: .img-responsive}

## Consultar el mapa vectorial de corrientes

Los comandos `r.stream.extract` y `r.stream.order` generan mapas vectoriales de corrientes con una gran cantidad de atributos.

Vamos a consultar la tabla de atributos asociada a cada mapa vectorial.


### Mapa vectorial obtenido con `r.stream.extract`

Podemos ver la tabla de atributos de las corrientes por medio de la opción **Show attribute data** haciendo uso del menú contextual de la capa:

![](/cartografia-digital/images/clase-06/clase-06_20.png){: .img-responsive}

O por medio del botón **Show attribute data for selected vector map** ![Show attribute data for selected vector map](/cartografia-digital/images/clase-06/table.png) ubicado en la barra de herramientas del administrador de capas.

![](/cartografia-digital/images/clase-06/clase-06_21.png){: .img-responsive}

¿Cuál es la diferencia entre los segmentos de tipo `start` e `intermediate` en el mapa vectorial que se obtiene con el `r.stream.extract`?
{: .alert .alert-warning}

¿Cómo se podría elaborar un mapa de isoconcentraciones de nacimientos de corrientes en una región utilizando el mapa vectorial obtenido con `r.stream.extract`?
{: .alert .alert-warning}

¿Cómo elaborar una tabla con la distribución altitudinal de los nacimientos de las corrientes de agua en una región (porcecito o ituango)?
{: .alert .alert-warning}

### Mapa vectorial obtenido con `r.stream.order`

Abrimos la tabla de atributos de este mapa y observamos que contiene muchos más atributos que el anterior, por lo tanto, para obtener un listado de los atributos (columnas) de cada segmento (filas) vamos a la pestaña **Manage tables** ubicada en la parte inferior donde podremos agregar, renombrar e incluso elimar una o todas las columnas.

![](/cartografia-digital/images/clase-06/clase-06_22.png){: .img-responsive}

Con este nuevo mapa vectorial podremos enriquecer la visualización haciendo uso de estos nuevos atributos, haciendo uso de las propiedades de la capa.

![](/cartografia-digital/images/clase-06/clase-06_23.png){: .img-responsive}

De igual manera que el mapa sin ordenar, elegimos desplegar únicamente las líneas en la pestaña *Selection*.

![](/cartografia-digital/images/clase-06/clase-06_24.png){: .img-responsive}

Elegimos un tono de azul en la pestaña *Colors*.

![](/cartografia-digital/images/clase-06/clase-06_25.png){: .img-responsive}

Y en la pestaña *Lines* podremos elegir un sistema de ordenamiento para utilizar como grosor, probemos con el orden de **Horton**:

![](/cartografia-digital/images/clase-06/clase-06_26.png){: .img-responsive}

El mapa se asemeja a lo que vimos en el [ejemplo de sistemas de ordenamiento](#stream_orders):

![](/cartografia-digital/images/clase-06/ituango_horton.png){: .img-responsive}

De igual forma podemos darle grosor a las líneas de acuerdo al orden de **Strahler**:

![](/cartografia-digital/images/clase-06/clase-06_27.png){: .img-responsive}

De manera que el grosor de la línea guarde cierta referencia con la cantidad de agua que lleva.

![](/cartografia-digital/images/clase-06/ituango_strahler.png){: .img-responsive}

### Asignación de colores a los mapas vectoriales {#colores-vector}

De manera similar a como se asignan colores a los mapas raster, a los mapas vectoriales también se les pueden asignar colores de acuerdo a sus atributos numéricos.

Haciendo uso del menú contextual de la capa vectorial accedemos al módulo `v.colors` por medio de la opción **Set color table**:

![](/cartografia-digital/images/clase-06/clase-06_28.png){: .img-responsive}

Indicamos que el origen de los valores es la tabla de atributos mediante el parámetro **Source values** (`use=attr`).

![](/cartografia-digital/images/clase-06/clase-06_29.png){: .img-responsive}

En la pestaña **Define** se debe indicar una columna que contenga datos numéricos, como por ejemplo la que indica el orden de **Horton**, y de manera similar al `r.colors` podemos utilizar una de las tablas de colores predefinidas o indicar las reglas manualmente. Para este caso utilizaremos la tabla `water`.

![](/cartografia-digital/images/clase-06/clase-06_30.png){: .img-responsive}

Al aplicar la tabla, los cambios no se verán reflejados automáticamente en el mapa.

![](/cartografia-digital/images/clase-06/clase-06_31.png){: .img-responsive}

Para visualizar los nuevos colores es necesario hacer uso del botón **Render map** ![Render map](/cartografia-digital/images/clase-06/layer-redraw.png) ubicado en la barra de herramientas del **Visualizador de Mapas**.

![](/cartografia-digital/images/clase-06/ituango_strahler_horton.png){: .img-responsive}

De esta manera podemos visualizar simultáneamente tanto el orden de **Strahler** como el orden de **Horton** de cada segmento de corriente.

¿Cuáles podrían ser aplicaciones potenciales del atributo `sinusoid` en la base de datos del mapa vectorial obtenido con `r.stream.order`?
{: .alert .alert-warning}

Si algún fenómeno ambiental específico depende significativamente de la energía de la corriente, ¿Cómo se podrían delimitar o diferenciar aquellos segmentos de corriente que puedan presentar mayor energía? De igual manera, ¿Cómo diferenciar las de menor energía?
{: .alert .alert-warning}

Si el valor de `accum` puede constituir una variable sustituta del caudal de la corriente, consultar visualmente valores de accum para corrientes con diferente orden de Strahler en sus puntos de desembocadura.
{: .alert .alert-warning}

## Estadísticos de un atributo numérico de la base de datos {#estadisticos-atributo-numerico-base-datos}

Por medio del **Administrador de Tablas de Atributos** podemos hacer consultas de estadísticas sencillas de columnas numéricas.

![](/cartografia-digital/images/clase-06/clase-06_32.png){: .img-responsive}

Por ejemplo si queremos ver las estadísticas de la longitud de los segmentos.

![](/cartografia-digital/images/clase-06/clase-06_33.png){: .img-responsive}

Si queremos hacer una consulta estadística más avanzada, debemos recurrir a la herramienta `v.db.univar` a la cual accedemos por medio del menú *Vector -> Reports and statistics -> Univariate statistics for attribute columns*.

![](/cartografia-digital/images/clase-06/clase-06_34.png){: .img-responsive}

Indicando el mapa y la columna (numérica) que queremos consultar.

![](/cartografia-digital/images/clase-06/clase-06_35.png){: .img-responsive}

Estas serían las estadísticas de la gradiente de los segmentos.

![](/cartografia-digital/images/clase-06/clase-06_36.png){: .img-responsive}

~~~
v.db.univar map=ituango_streams_ordered@estudiante column=gradient
Reading column values...
Number of values: 755
Minimum: 0
Maximum: 0.486626
Range: 0.486626
Mean: 0.167942974834437
Arithmetic mean of absolute values: 0.167942974834437
Variance: 0.0106091179039186
Standard deviation: 0.103000572347529
Coefficient of variation: 0.613306823039608
Sum: 126.796946
~~~

En la pestaña **Optional** podemos filtrar a cuales segmentos les queremos consultar la gradiente.

![](/cartografia-digital/images/clase-06/clase-06_37.png){: .img-responsive}

Por ejemplo estas son las estadísticas de la gradiente de los segmentos _**Strahler = 1**_.

![](/cartografia-digital/images/clase-06/clase-06_38.png){: .img-responsive}

~~~
v.db.univar map=ituango_streams_ordered@estudiante column=gradient where=strahler = 1
Reading column values...
Number of values: 397
Minimum: 0
Maximum: 0.486626
Range: 0.486626
Mean: 0.236643143576826
Arithmetic mean of absolute values: 0.236643143576826
Variance: 0.0064542126375034
Standard deviation: 0.0803381144756547
Coefficient of variation: 0.339490564828357
Sum: 93.947328
~~~

¿Cómo se comparan estos estadísticos para los diferentes ordenes de **Strahler**?
{: .alert .alert-warning}

Con base en los reportes obtenidos de **Strahler** y **Horton**, ¿Cuales serían las diferencias entre ambos sistemas de clasificación?
{: .alert .alert-warning}

¿Se identifica la diferencia?

Si no lo consigue, despliegue las categorias de horton una a una sobre el mapa raster.
{: .alert .alert-success}

<!--
██████   █████  ███████ ██ ███    ██ ███████
██   ██ ██   ██ ██      ██ ████   ██ ██
██████  ███████ ███████ ██ ██ ██  ██ ███████
██   ██ ██   ██      ██ ██ ██  ██ ██      ██
██████  ██   ██ ███████ ██ ██   ████ ███████
-->
