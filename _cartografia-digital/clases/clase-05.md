---
layout: clase
title: 'Análisis de redes de drenaje'
curso: 'cartografia-digital'
clase: 5
custom_js: 'mathjax'
---

Para la extracción de redes de drenaje a partir de un DEM se deben obtener primero unos mapas intermedios, entre ellos el mapa de acumulación, el cual indica el área drenada (en número de pixeles) en cada pixel de la zona de estudio; y el mapa de dirección del drenaje, que indica la dirección en la cual se mueve el agua sobre el terreno.

El siguiente ejercicio lo realizaremos sobre el mapa `ituango`, por lo que lo primero que debemos hacer es ajustar la región de cálculo de acuerdo al mapa.

![](/cartografia-digital/images/clase-05/clase-05_01.png){: .img-responsive}

Ahora procedemos a utilizar la herramienta `r.watershed`, que se abre desde el menú *Raster -> Hydrologic modeling -> Watershed analysis*.

![](/cartografia-digital/images/clase-05/clase-05_02.png){: .img-responsive}

Con esta herramienta se pueden especificar varios mapas opcionales de entrada para hacer un análisis exhaustivo de las redes de drenaje de la zona de estudio. Pero para el caso de este curso, dado que sólo contamos con el modelo de elevación, y es el único insumo obligatorio, sólo indicaremos este mapa.

![](/cartografia-digital/images/clase-05/clase-05_03.png){: .img-responsive}

De igual manera, también se pueden obtener varios mapas utilizando esta herramienta, por el momento, nos vamos a concentrar en los mapas de acumulación y de dirección de drenaje en la pestaña *Outputs*.

![](/cartografia-digital/images/clase-05/clase-05_04.png){: .img-responsive}

En la pestaña *Optional* indicaremos que queremos utilizar el modelo de Dirección de Flujo Singular (SFD) que consiste en que un pixel sólo drena a uno y sólo uno de sus 8 vecinos. En el modelo predeterminado de Dirección de Flujo Múltiple (MFD) el flujo se reparte proporcionalmente en función de la topografía, este es más útil para trabajar escorrentías, mientras que el SFD es más apropiado para las redes de drenaje, las cuales tienen flujo concentrado.

![](/cartografia-digital/images/clase-05/clase-05_05.png){: .img-responsive}

Ejecutamos la herramienta:

![](/cartografia-digital/images/clase-05/clase-05_06.png){: .img-responsive}

<!--
 █████   ██████  ██████ ██    ██ ███    ███
██   ██ ██      ██      ██    ██ ████  ████
███████ ██      ██      ██    ██ ██ ████ ██
██   ██ ██      ██      ██    ██ ██  ██  ██
██   ██  ██████  ██████  ██████  ██      ██
-->

## El mapa de acumulación {#mapa-accum}

![Mapa accum](/cartografia-digital/images/clase-05/ituango_accum.png){: .img-responsive}

Este primer resultado nos muestra cómo se acumula el agua sobre el terreno. El valor de cada pixel es la cantidad de pixeles que drenan a través de ese pixel particular. Los pixeles con valores negativos hacen referencia a posibles subestimaciones del área acumulada debido a que en los pixeles de los bordes no se tiene certeza de la cantidad de pixeles que drenan desde o hacia afuera de la región de estudio.

### Análisis detallado del mapa de acumulación {#analisis-detallado-mapa-accum}

Consultamos la información estadística del mapa.

~~~
r.univar map=ituango_accum@estudiante
total null and non-null cells: 1806332
total null cells: 0
Of the non-null cells:
----------------------
n: 1806332
minimum: -645590
maximum: 634405
range: 1.28e+06
mean: 301.151
mean of absolute values: 554.777
standard deviation: 12255.9
variance: 1.50208e+08
variation coefficient: 4069.69 %
sum: 543979037
~~~

Observar los valores mínimo y máximo. *¿Qué le suguiere la información obtenida?*
{: .alert .alert-info}

### Elaboración del histograma {#elaboracion-histograma}

Utilizamos la herramienta de histograma ![Herramienta de histograma](/cartografia-digital/images/clase-01/layer-raster-histogram.png) del visualizador de mapas para ver un histograma continuo de los valores:

![](/cartografia-digital/images/clase-05/ituango_accum_hist.png){: .img-responsive}

Puesto que el histograma no nos brinda mucha información, probaremos con un escalado logarítmico, para ello abrimos las opciones del gráfico **Plot settings** ![Plot settings](/cartografia-digital/images/clase-01/settings.png) y habilitamos el escalado logarítmico en el eje X (valores del raster):

![](/cartografia-digital/images/clase-05/clase-05_07.png){: .img-responsive}

El nuevo histograma sólo muestra los valores positivos del mapa de acumulación, puesto que el logaritmo de un valor negativo se encuentra indeterminado:

![](/cartografia-digital/images/clase-05/ituango_accum_hist_log.png){: .img-responsive}

### Extraer la red de drenaje a partir del mapa de acumulación {#extraer-red-drenaje}

Primero elaboraremos un mapa de acumulación en escala logarítmica que nos permita leerlo más fácilmente como ya lo vimos con el histograma. Para esto debemos obtener el aplicar el logaritmo en base 10 al valor absoluto del mapa de acumulación utilizando la **Calculadora de mapas raster** ![](/cartografia-digital/images/clase-03/raster-calculator.png).

![](/cartografia-digital/images/clase-05/clase-05_08.png){: .img-responsive}

Y establecemos la tabla de colores del mapa resultante a una escala logarítmica absoluta de azules, así:

![](/cartografia-digital/images/clase-05/clase-05_09.png){: .img-responsive}

![](/cartografia-digital/images/clase-05/ituango_accum_log.png){: .img-responsive}

Una vez tenemos el mapa de acumulación en escala logarítmica, podemos seleccionar de manera más simple un umbral para identificar los pixeles que corresponden a corrientes de los que no.

Esto se logra creando un mapa binario donde los pixeles cuyos valores se encuentren por debajo del umbral tendrán un valor 0 indicando que NO correspondena corrientes, y los pixeles cuyos valores igualen o superen el umbral tendrán un valor de 1 indicando que corresponden a corriente.

Este umbral se puede transformar a un área en $$m^2$$ así:

$$
\begin{align}
10^k \times 30^2 m^2 &=& A m^2\\
\end{align}
$$

Donde $$10^k$$ corresponde al umbral logarítmico y $$30^2 m^2$$ corresponde al área de un pixel, y el resultado obtenido $$A$$ es el área mínima que debe acumularse en un pixel para que este sea considerado como corriente.

Al mapa resultante le aplicaremos la misma tabla de colores (blues) aplicada al mapa de acumulación logarítmico para una visualización más adecuada.
{: .alert .alert-success}

Probaremos varios umbrales $$k$$ para decidir cuál es el más apropiado:

#### $$k = 2$$

![](/cartografia-digital/images/clase-05/clase-05_10.png){: .img-responsive}

$$
\begin{align}
10^2 \times 30^2 m^2 &=& 90.000 m^2\\
\end{align}
$$

![](/cartografia-digital/images/clase-05/ituango_accum_log2.png){: .img-responsive}

#### $$k = 3$$

![](/cartografia-digital/images/clase-05/clase-05_11.png){: .img-responsive}

$$
\begin{align}
10^3 \times 30^2 m^2 &=& 900.000 m^2\\
\end{align}
$$

![](/cartografia-digital/images/clase-05/ituango_accum_log3.png){: .img-responsive}

#### $$k = 4$$

![](/cartografia-digital/images/clase-05/clase-05_12.png){: .img-responsive}

$$
\begin{align}
10^4 \times 30^2 m^2 &=& 9.000.000 m^2\\
\end{align}
$$

![](/cartografia-digital/images/clase-05/ituango_accum_log4.png){: .img-responsive}

### Transformar un mapa raster en un mapa vectorial

Lo primero que se debe hacer antes de la transformación es adelgazar el mapa raster, para lo cual debemos convertir los valores 0 en valores nulos utilizando la herramienta `r.null` que se abre desde el menú *Raster -> Develop raster map -> Manage NULL values*.

![](/cartografia-digital/images/clase-05/clase-05_13.png){: .img-responsive}

En esta herramienta seleccionamos el mapa raster a editar.

![](/cartografia-digital/images/clase-05/clase-05_14.png){: .img-responsive}

E indicamos que lo que queremos hacer es volver nulos los valores que actualmente se encuentran como 0 en la pestaña *Modify* (esta operación es reversible, puesto que también podemos utilizar esta herramienta para convertir los nulos en 0 u otro valor).

![](/cartografia-digital/images/clase-05/clase-05_15.png){: .img-responsive}

Esta herramienta no nos produce un nuevo mapa, sino que modifica los valores del mapa indicado, por lo que debemos tener cuidado con su uso para no modificar el mapa equivocado.

![](/cartografia-digital/images/clase-05/clase-05_16.png){: .img-responsive}

Una vez realizada esta operación, podremos adelgazar las líneas raster mediante la herramienta `r.thin` a la cual accedemos por el menú *Raster > Transform features > Thin*

![](/cartografia-digital/images/clase-05/clase-05_17.png){: .img-responsive}

Con esta herramienta debemos especificar un mapa de salida.

![](/cartografia-digital/images/clase-05/clase-05_18.png){: .img-responsive}

El cual va a contener el mapa adelgazado.

![](/cartografia-digital/images/clase-05/clase-05_19.png){: .img-responsive}

Una vez adelgazado el mapa raster, podemos convertirlo al formato vectorial utilizando la herramienta `r.to.vect` del menú *Raster > Conversion de tipos de mapas > Ráster a vectorial*.

![](/cartografia-digital/images/clase-05/clase-05_20.png){: .img-responsive}

En esta herramienta seleccionamos el raster adelgazado previamente e indicamos el nombre con el que va a quedar el nuevo mapa vectorial.

![](/cartografia-digital/images/clase-05/clase-05_21.png){: .img-responsive}

En este caso no hay problema con que el nombre sea el mismo del mapa raster puesto que al ser vectorial no se generan conflictos.

![](/cartografia-digital/images/clase-05/clase-05_22.png){: .img-responsive}

Teniendo el mapa raster de la región de porcecito y un mapa vectorial con la red de drenaje cuyos valores logarítmicos de acumulación son mayores o iguales que 3, podemos desplegar la red de drenaje en formato vectorial sobre la región en formato raster.

![](/cartografia-digital/images/clase-05/clase-05_23.png){: .img-responsive}

En la pestaña *Colors* observamos una opción para modificar el color de las características vectoriales que de manera predeterminada está en negro.

![](/cartografia-digital/images/clase-05/clase-05_24.png){: .img-responsive}

Al seleccionar esa opción se despliega el selector de colores donde podemos elegir un color azul, ya sea alguno de los predefinidos en la paleta o uno a gusto de cada estudiante.

![](/cartografia-digital/images/clase-05/clase-05_25.png){: .img-responsive}

![](/cartografia-digital/images/clase-05/clase-05_26.png){: .img-responsive}

Y por último en la pestaña *Lines*, podemos modificar el grosor de las líneas dándole un valor de 2.

![](/cartografia-digital/images/clase-05/clase-05_27.png){: .img-responsive}

El mapa resultante sería este:

![](/cartografia-digital/images/clase-05/ituango_accum_streams_vect.png){: .img-responsive}

### Significados del mapa de acumulación de drenaje {#significados-mapa-acum}

1. ¿Qué representan los valores de acumulación de 1?
2. ¿Qué representan y dónde se localizan los valores máximos de acumulación?
3. El valor de acumulación de cada pixel representa el número de pixeles que drenan hacia este pixel. Por lo tanto, este valor permitiría elaborar un mapa para comprender la disponibilidad de agua de cada pixel. El mapa de acumulación permitirá por lo tanto identificar cuáles terrenos se secan más fácilmente y en cuáles terrenos el agua persiste durante mayor tiempo. ¿Cómo identificar los terrenos que se secan más fácil y los terrenos donde la humedad en el suelo persiste durante una temporalidad mayor?

<!-- Elaboración de un mapa reclasificado del accum y qué significa esa reclasificación. -->

<!-- ### Combinación del mapa de acumulación y el mapa de pendientes {#combinacion-accum-slope}

¿Qué información adicional podemos obtener si se combinan las variables acumulación y pendiente?
{: .alert .alert-info}

Elaboración del índice topográfico (índice de humedad).

https://grass.osgeo.org/grass74/manuals/r.topidx.html

Interpretación y opciones del mapa.

Este mapa ofrece la posibilidad de diferentes lecturas; disponibilidad de agua, recarga de acuíferos, estabilidad de terrnos, y otras más.

¿Cuáles otras opciones y cómo interpretarlas? -->

<!--
██████  ██████   █████  ██ ███    ██
██   ██ ██   ██ ██   ██ ██ ████   ██
██   ██ ██████  ███████ ██ ██ ██  ██
██   ██ ██   ██ ██   ██ ██ ██  ██ ██
██████  ██   ██ ██   ██ ██ ██   ████
-->

## El mapa de dirección de drenaje {#mapa-drainage}

![Mapa accum](/cartografia-digital/images/clase-05/ituango_drain.png){: .img-responsive}

El mapa de dirección de drenaje indica la dirección en la que fluye el agua sobre el relieve. Contiene el "aspecto", es decir, el ángulo al que mira el terreno, de cada pixel medido en el sentido contrario a las manecillas del reloj desde el oriente. Al multiplicar los valores positivos por 45 se obtiene el ángulo en grados en el que viajará la escorrentía desde ese pixel. El valor de cero (0) indica que el pixel es un área de depresión. Los valores negativos indican que la escorrentía fluye hacia afuera de los límites de la región geográfica definida. El valor absoluto de esos pixeles negativos indica la dirección del flujo.

Si el valor de cada pixel indica la dirección de salida del flujo del agua, ¿Cómo interpretar las distribuciones de estos valores dentro de un mapa? ¿Cómo se distribuyen los valores de 1-8 dentro del mapa y cómo interpretar dichas distribuciones?

<!-- A partir de una red de drenaje densa (log2) clasificar la red de drenaje según su dirección. -->

<!--
██████  ██ ██   ██ ███████ ██      ███████ ███████
██   ██ ██  ██ ██  ██      ██      ██      ██
██████  ██   ███   █████   ██      █████   ███████
██      ██  ██ ██  ██      ██      ██           ██
██      ██ ██   ██ ███████ ███████ ███████ ███████
-->

<!-- ## Pixeles localizados en vertiente y pixeles localizados en canales de agua

¿Cuáles pueden ser las diferencias mayores entre pixeles que se localizan en las vertientes y pixeles que se localizan sobre las líneas de la red de drenaje?

¿Cómo estudiar estos dos conjuntos de pixeles?

¿Cómo diferenciar cada uno de estos dos grupos? La respuesta a esta pregunta se puede establecer si previamente podemos contestar otro interrogante: ¿Dónde nace una corriente? (manantial).

¿Cómo identificar los pixeles donde nacen las corrientes ubicadas en una región?

1. Definir un umbral mínimo de valor de acumulación para el inicio de todas las corrientes de una región. ¿Es una decisión pertinente?
2. Definir un procedimiento para valores de acumulación distintos de inicio de corriente.
3. Definir opciones para resolver este problema. -->
