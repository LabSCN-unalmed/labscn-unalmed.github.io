---
layout: clase
title: 'Parámetros morfométricos del relieve'
curso: 'cartografia-digital'
clase: 7
---

Un parámetro importante en la descripción cuantitativa del relieve es la pendiente. Con base en un mapa raster de altitudes (DSM o DTM) se puede calcular un mapa raster de pendiente; en este caso, se asigna un valor de pendiente a cada píxel.

La pendiente y otros parámetros útiles se pueden calcular empleando el comando `r.param.scale` (Extrae parámetros del terreno a partir de un DEM).

Parámetros que se pueden calcular con el comando `r.param.scale` {#parametros-pueden-calcular-comando-rparamscale}
--------------------------------------------------------------

**elev**: Las elevaciones vienen con el mapa DEM, este parámetro se utiliza para repetir el muestreo a diferente escala.

**slope**: Calcula la magnitud de la gradiente máxima (el angulo de mayor inclinación de la vertiente, en un punto o píxel. La pendiente en un archivo raster se calcula como la mayor gradiente que se obtiene interpolando el píxel i con los ocho (8) píxeles adyacentes cuando se utiliza un kernel de 3 x 3 píxeles.

**aspect**: Corresponde a la dirección o azimuth de la gradiente máxima. Se proyecta el vector de la gradiente máxima en el plano horizontal y el valor del azimuth de esta proyección constituye el valor del "aspect".

- El valor del aspect varia de 0° a +180° cuando se va del Oeste al Norte y al Este.
- El valor del aspect varia de 0° a -180° cuando se va del Oeste al Sur y al Este.

Con el comando `r.slope.aspect` también se puede calcular el aspect. Para este caso, el aspect presenta valor 0° al Este, 90° al Norte, 180° al Oeste, 270° al sur y 360° al este.

**profc**: Curvatura del perfil (curvatura que intersecta con el plano definido por el eje Z y la dirección de la gradiente máxima). Corresponde a la curvatura vertical del perfil en el sentido de la pendiente. El "profc" corresponde a la linea de interceptación entre:

1. Un plano vertical que contiene a los vectores "slope" y "aspect".
2. La superficie curva del píxel.
    - Los valores positivos de profc hacen referencia a una curvatura convexa.
    - Los valores negativos de profc hacen referencia a una curvatura cóncava.
    - Los valores de cero (0) para profc hacen referencia a una superficie planar.

**planc**: Curvatura plana (curvatura horizontal, que intersecta con el plano XY). Corresponde a la curvatura horizontal. La curvatura planc es la linea de interceptación entre:

1. Un plano horizontal que pasa por el píxel i
2. La superficie curva del píxel.
3. El signo de esta curvatura tiene significados contrarios a los de profc, es decir:
    - Los valores positivos de planc hacen referencia a una curvatura cóncava.
    - Los valores negativos de planc hacen referencia a una curvatura convexa.
    - Los valores de cero (0) para planc hacen referencia a una superficie planar.

Para Wood, J.D. (1996); las curvaturas del perfil (profc) y la curvatura horizontal (planc) "son útiles en tanto ellas separan la curvatura en dos componentes ortogonales donde los efectos de del proceso gravitacional se maximizan en un caso (profc) o se minimizan en el otro (planc)".

**longc**: Curvatura longitudinal (curvatura de perfil que intersecta con el plano definido por la superficie normal y la dirección de la gradiente máxima).

**crosc**: Curvatura transversal (curvatura tangencial que intersecta con el plano definido por la superficie normal y una tangente al contorno - perpendicular a la dirección de la gradiente máxima).

**maxic**: Curvatura máxima (en cualquier dirección).

**minic**: Curvatura mínima (en dirección perpendicular a la dirección de la curvatura máxima).

**feature**: Características morfométricas:

- Peak: Punto en una convexidad local en todas las direcciones.
- Ridge: Punto en una convexidad local ortogonal a una línea sin convexidad o concavidad.
- Pass: Punto en una convexidad local ortogonal a una concavidad local.
- Plane: Puntos que se encuentran en una superficie sin convexidad o concavidad.
- Channel: Punto en una concavidad local ortogonal a una línea sin convexidad o concavidad.
- Pit: Punto en una concavidad local en todas las direcciones.

![Los 6 tipos de características morfométricas](/cartografia-digital/images/morphometric.png){: .img-responsive}

Elaboración de un mapa de pendientes {#elaboracion-mapa-pendientes}
------------------------------------

#### Conceptos importantes:

La pendiente es la variación de la altitud con respecto a la distancia.

1. ¿Qué es una vertiente?
2. ¿Cuáles son los limites de las vertientes?
3. Relación de la vertiente con otros atributos de estructura y dinámica del relieve.
  - Con la litología.
  - Con la erosión.
  - Con los movimientos en masa (caídas, volcamientos, deslizamientos, flujos).
4. Relación de la pendiente de la vertiente con las intervenciones y su aprovechamiento:
  - Viviendas y edificaciones.
  - Construcción de redes viales.
5. Relación de la pendiente de la vertiente con la distribución de la cobertura vegetal natural y cultivada.
  - ¿Existe alguna relación?
  - ¿Se trata de una relación directa o de una relación indirecta?

### ¿Cómo elaborar el mapa de pendientes de una región con significados importantes respecto a la dinámica e intervención del relieve? {#como-elaborar-mapa-pendientes-region-significados-importantes-respecto-dinamica-intervencion-relieve}

Se trata de seleccionar unos rangos de pendiente que guarden relación con fenómenos naturales, fenómenos inducidos por la intervención o con ciertos factores limitantes o favorables a una intervención antrópica pertinente técnica y ambientalmente.

Por ejemplo, supongamos que se va intervenir en una región amplia con diversas actividades agropecuarias, forestales y de conservación; para hacerlo será necesario igualmente desarrollar algunas obras de infraestructura tales como vías, viviendad y otras construcciones. *¿Qué servicio puede brindar la elaboración de un mapa de pendientes a este programa?*

Las tierras con pendientes muy suaves (< 1°-2°) podrían ser susceptibles a inundación permanente o temporal si se ubican en áreas adyacentes a corrientes de agua (en las llanuras aluviales de los ríos). Estos mismos terrenos podrían albergar un recurso suelo óptimo para actividad agropecuaria.

Un reconocimiento general de la región de interés podría indicar que las manifestaciones de deslizamientos activos y deslizamientos pasados ocurren en vertientes con un umbral mínimo de pendiente. A modo de ejemplo, que se pueda firmar: los deslizamientos se presentan en vertientes con valores de pendiente por encima de los 25°.

Que exista una norma ambiental que afirme por ejemplo: queda prohibido construir viviendas en vertientes con pendientes por encima de los 21°.

Que los ganaderos y las instituciones de este sector consideren inadecuado establecer sistemas de rotación de potreros en vertientes con pendientes por encima de los 13°.

Que los ingenieros afirmen que resulta demasiado costos construir la red vial en vertientes con inclinaciones superiores a 30°.

Con toda esta información se pueden establecer unos posibles rangos, cuya validez es solamente para la región del proyecto:

| Pendiente | Descripción                                                                                        |
|:---------:|:---------------------------------------------------------------------------------------------------|
|  0° -  1° | Terrenos susceptibles a inundación                                                                 |
|  1° -  2° | Terrenos susceptibles a inundación temporal (drenan fácilmente una vez desciende el nivel del río) |
|  2° - 13° | ???                                                                                                |
| 13° - 21° | ???                                                                                                |
| 21° - 25° | ???                                                                                                |
| 25° - 30° | ???                                                                                                |
|       >30 | ???                                                                                                |
{: .table .table-hover}

*¿Qué se puede afirmar acerca de los últimos cinco (5) rangos de pendiente en la tabla anterior?*

Procedimiento en GRASS para elaborar el mapa de pendientes
----------------------------------------------------------

Construir el mapa de pendientes.

~~~
r.param.scale input=porcecito1 output=porce1_slope3 param=slope
~~~

Empleamos el kernel por omisión que utiliza el comando (3 x 3). Este hecho lo consignamos en el nombre del mapa construido.

Visualizar el mapa de pendientes en 2 y 3 dimensiones:

![2D](/cartografia-digital/images/porce1_slope3.png){: .img-responsive}

![3D](/cartografia-digital/images/porce1_slope3_3D.png){: .img-responsive}

**Nota:** [Recordar el procedimiento para la correcta visualización en 3D de un mapa que no contenga valores de altitud.]({{ site.baseurl }}/cartografia-digital/clase-04.html#el-mapa-de-relieve-relativo)
{: .alert .alert-info}

Contestar los siguientes interrogantes:

- *¿En qué parte del relieve se ubican las pendientes mas fuertes y que valores despliegan?*
- *¿En qué parte del relieve se ubican las pendientes mas suaves y que valores despliegan?*
- *¿Cuáles son las pendientes predominantes en la región de porcecito?*

Estadísticos básicos del mapa de pendientes:

~~~
r.univar map=porce1_slope3
~~~

### Construir el histograma de las gradientes del mapa porcecito

Utilizar la herramienta de histograma ![Herramienta de histograma](/cartografia-digital/images/clase-02/layer-raster-histogram.png) del visualizador de mapas para ver un histograma continuo de los valores:

![Histograma del mapa de pendientes](/cartografia-digital/images/porce1_slope3_hist1.png){: .img-responsive}

De acuerdo con el histograma de la imagen anterior:

- Hay unas pendientes suaves entre 0° - 3° que representan un porcentaje muy bajo de la zona.
- Las pendientes entre 3° - 11° son importantes.
- Hay un máximo de pendientes entre 11° - 22° con centro en 16°.
- Otro rango importante son las pendientes entre 22° - 30°.
- Las pendientes por encima de 30° constituyen un porcentaje bajo.

Para ver un histograma con rangos discretos de pendiente, modificar el parámetro "número de tramos" ubicado en la parte final de la pestaña "Opcional" en las opciones avanzadas de la herramienta de histograma.

![Histograma del mapa de pendientes con rangos discretos](/cartografia-digital/images/porce1_slope3_hist2.png){: .img-responsive}

### Reclasificar el mapa de pendientes

1. Se elabora en gedit un script de reclasificación de la pendiente y se guarda por omisión en la carpeta personal con el nombre: `RCLS_porce1_slope3`.
2. Se aplica el comando de reclasificación `r.reclass`. Si la reclasificación inicial no cumple las expectativas se modifica varias veces hasta obtener un resultado deseable.
3. Se construye una tabla de colores para el mapa reclasificado de la pendiente.
4. Se despliega el mapa.
5. Se pueden seguir cambiando los limites de la reclasificación o los colores de los rangos.

**NOTA:** Emplear una tabla de variación gradual del color para los rangos.

El script `RCLS_porce1_slope3` es el siguiente:

#### Con seis categorías. Mapa1

`RCLS_porce1_slope3`

~~~
 0 thru  3 = 1 Pendientes muy suaves
 3 thru  7 = 2 Pendientes suaves
 7 thru 15 = 3 Pendientes moderadas
15 thru 25 = 4 Pendientes moderadamente inclinadas
25 thru 35 = 5 Pendientes muy inclinadas
35 thru 72 = 6 Pendientes escarpadas
~~~

~~~
r.reclass input=porce1_slope3 output=porce1_slope3_reclass rules=RCLS_porce1_slope3
~~~

![2D](/cartografia-digital/images/RCLS_porce1_slope3.png){: .img-responsive}

![3D](/cartografia-digital/images/RCLS_porce1_slope3_3D.png){: .img-responsive}

La reclasificación de la pendiente en seis (6) rangos con los límites antes anotados genera un mapa de "sal y pimienta".

Vamos a hacer una reclasificación más simple solo con tres categorías y le asignamos una nueva identidad bajo el siguiente nombre: `RCLS_porce1_slope3_2`.

#### Con tres categorías: Mapa2

`RCLS_porce1_slope3_2`

~~~
 0 thru  7 = 1 Pendientes muy suaves y suaves
 7 thru 25 = 2 Pendientes suaves y moderadas
25 thru 72 = 3 Pendientes inclinadas y escarpadas
~~~

La aplicamos y observamos el nuevo resultado.

~~~
r.reclass input=porce1_slope3 output=porce1_slope3_reclass rules=RCLS_porce1_slope3_2 --o
~~~

![2D](/cartografia-digital/images/RCLS_porce1_slope3_2.png){: .img-responsive}

![3D](/cartografia-digital/images/RCLS_porce1_slope3_2_3D.png){: .img-responsive}

El mapa con tres categorías se torna mas claro que el mapa con seis categorías. Es frecuente que el excesivo detalle en la reclasificación de mapas no permite ver los patrones mas frecuentes porque pasan desapercibidos debido a una excesiva reclasificación.

#### Con tres categorías pero modificando sus límites: Mapa3

`RCLS_porce1_slope3_3`

~~~
 0 thru 10 = 1 Pendientes muy suaves y suaves
10 thru 29 = 2 Pendientes suaves y moderadas
29 thru 72 = 3 Pendientes inclinadas y escarpadas
~~~

~~~
r.reclass input=porce1_slope3 output=porce1_slope3_reclass rules=RCLS_porce1_slope3_3 --o
~~~

![2D](/cartografia-digital/images/RCLS_porce1_slope3_3.png){: .img-responsive}

![3D](/cartografia-digital/images/RCLS_porce1_slope3_3_3D.png){: .img-responsive}

*¿Cuáles son las diferencias mas importantes entre los tres mapas?*

*¿Qué características del terreno resaltan en un mapa que aparecen poco evidentes claras en otro?*

#### Asignar una tabla de colores personalizada a los mapas reclasificados de la pendiente

Se seleccionan colores que generen contraste importante.

Se hace el respectivo script en gedit y se guarda como: `TC_porce1_slope3`.

`TC_porce1_slope3`

~~~
1 green
2 226 178 252 # violeta muy claro
3 102  39   8 # cafe mucho mas oscuro
~~~

Se ejecuta la siguiente secuencia de comandos:

~~~
r.colors map=porce1_slope3_reclass rules=TC_porce1_slope3
~~~

![2D](/cartografia-digital/images/TC_porce1_slope3.png){: .img-responsive}

![3D](/cartografia-digital/images/TC_porce1_slope3_3D.png){: .img-responsive}

### Consultar la información que contiene el mapa reclasificado de la pendiente {#consultar-informacion-contiene-mapa-reclasificado-pendiente}

Con este comando obtenemos la información de las tres categorías de pendientes en porcentaje `p`, N° de píxeles `c` y en área en km<sup>2</sup> `k`.

~~~
r.report -h map=porce1_slope3_reclass units=p,c,k
~~~

Añadiendo la opción `-n` no incluye en los estadisticos del mapa los píxeles sin información (nulos o 'no data').

~~~
r.report -hn map=porce1_slope3_reclass units=p,c,k
~~~

### Actividad extra-curso

1. Colocarle variación gradual del color al mapa de pendientes de porcecito.
2. Emplear tabla gradacional de los colores que empleó para asignar colores al mapa reclasificado de pendientes.
3. ¿Qué diferencias importantes observa entre los dos mapas cuando lo observa en 2D y en 3D?
4. Realice una amplación de ambos mapas para observar con mas detalle algunos sectores de los mapas y facilitar el análisis comparativo.

Clasificación de las vertientes según su curvatura {#clasificacion-vertientes-segun-curvatura}
--------------------------------------------------

![Fotografía de vertientes con diversas curvaturas](/cartografia-digital/images/fotovert.png){: .img-responsive}

#### Conceptos importantes:

Digamos que un atributo necesario pero no suficiente de una vertiente es el de poseer extensión.

Las vertientes son superficies modeladas por procesos de remoción.

- A las vertientes como superficies se les puede calcular perfiles.
- Los perfiles son lineas.
- Los perfiles se obtienen de graficar “distancia vs altitud”.
- Los perfiles de los terrenos son lineas muy irregulares que resultan de unas combinaciones complejas de tres tipos de segmentos básicos: convexo (X), cóncavo (V) y rectilíneo (R).
- La gradiente es la variación de la altitud con respecto a la distancia.
- La variación de la gradiente con respecto a la distancia define el carácter convexo, cóncavo o rectilíneo de un segmento del perfil.

Recordar del mapa de pendientes que se estableció que la pendiente es la variación de la altitud con respecto a la distancia.

Ahora, la curvatura es la variación de la pendiente con respecto a la distancia.

Un incremento sostenido de la pendiente con respecto a la distancia genera una curvatura convexa.

Una disminución sostenida de la pendiente con respecto a la distancia genera una curvatura cóncava.

Para definir la forma de una superficie se emplean dos perfiles ortogonales: uno en el sentido de la dirección de la superficie y otro en el sentido de la inclinación máxima de la superficie.

#### Clasificación de las vertientes según Ruhe, R.V. (1975)

- Perfil en el sentido de la inclinación de la vertiente.
- Perfil en el sentido de la dirección de la vertiente.

![Esquema de vertientes](/cartografia-digital/images/vertientes.png){: .img-responsive}

De acuerdo con la clasificación de Ruhe (1975) se puede inferir fácilmente:

* El flujo superficial y subsuperficial de agua sigue trayectorias diferentes según el tipo de vertiente. En unos casos los flujos son divergentes, en otros casos los flujos son convergentes, y en otros casos el flujo es paralelo, es decir, ni divergente, ni convergente.
* El flujo de agua en una vertiente tiene implicaciones importantes en:
  - El desarrollo fisiológico de la vegetación.
  - La respuesta diferencial frente a períodos húmedos o secos prolongados.
  - El desarrollo de los perfiles de suelo.
  - La estabilidad de las vertientes.
  - La evolución de los perfiles de meteorización de las rocas.

### Cálculo de la curvatura vertical {#calculo-curvatura-vertical}

Utilizamos el parámetro `profc` del comando `r.param.scale`.

~~~
r.param.scale input=porcecito1 output=porce1_profc7 size=7 param=profc
~~~

Recordemos el significado de los valores positivos (curvatura convexa) y negativos (curvatura cóncava) para la curvatura vertical de acuerdo a lo definido para este parámetro al inicio de la clase:

1. Los valores positivos de curvatura hacen referencia a perfiles convexos; mientras mayor sea el valor de la curvatura (más positivo), más cerrada es la convexidad.
2. Los valores negativos de curvatura hacen referencia a perfiles cóncavos; mientras menor sea el valor de la curvatura (más negativo), más cerrada es la concavidad.
3. Los valores cercanos a 0 hacen referencia a curvaturas muy abiertas que se aproximan a un plano; convexidades muy abiertas para valores positivos y concavidades muy abiertas para valores negativos.

El mapa de curvatura vertical (`profc`) debe reclasificarse al menos en 3 categorías principales:

- Las curvaturas convexas.
- Las curvaturas planares.
- Las curvaturas cóncavas.

También se pueden emplear más rangos si se desean diferenciar las curvaturas convexas y cóncavas, entre aquellas que son muy abiertas y aquellas que son muy cerradas.

Lo primero que debemos hacer para poder llevar a cabo esta reclasificación, es consultar la información estadística del mapa obtenido.

Utilizando la opción `-e` del comando `r.univar`, podremos ver las estadísticas extendidas del mapa, que incluyen los cuartiles y el valor correspondiente al 90% de los datos, a menos que se especifique un percentil distinto con el parámetro `percentile`.

~~~
r.univar -e map=porce1_profc7
~~~

~~~
 100%
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: -0.0178222
maximum: 0.0191938
range: 0.037016
mean: -0.000110906
mean of absolute values: 0.00123232
standard deviation: 0.00165841
variance: 2.75032e-06
variation coefficient: -1495.32 %
sum: -157.581161423555
1st quartile: -0.00107066
median (even number of cells): -0.000179785
3rd quartile: 0.000739808
90th percentile: 0.00191188
~~~
{: .output}

De acuerdo con los datos obtenidos, observamos que los valores de curvatura son extremadamente bajos, de tal modo que el valor promedio (`mean`) es del órden de una diezmilésima. Para poder reclasificar este mapa, necesitamos que los valores de curvatura sean del órden de decenas a centenas, puesto que al especificar los rangos de reclasificación sólo se pueden utilizar valores enteros. Por lo tanto, multiplicamos todo el mapa por 100.000.

~~~
r.mapcalc "porce1_profc7 = porce1_profc7 * 100000"
~~~

Y volvemos a calcular los estadísticos para definir las reglas de reclasificación.

~~~
r.univar -e map=porce1_profc7
~~~

~~~
 100%
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: -1782.22
maximum: 1919.38
range: 3701.6
mean: -11.0906
mean of absolute values: 123.232
standard deviation: 165.841
variance: 27503.2
variation coefficient: -1495.32 %
sum: -15758116.1423568
1st quartile: -107.066
median (even number of cells): -17.9785
3rd quartile: 73.9808
90th percentile: 191.188
~~~
{: .output}

Observar que en los nuevos valores de curvatura, el promedio (`mean`) ya se encuentra en el órden de las decenas y podemos especificar los rangos de reclasificación.

**La clasificación de las curvaturas de perfil `profc` y plana `planc` presuponen como condición necesaria un conocimiento del relieve de la región representado en el mapa. Es el conocimiento de campo el que nos permite estimar o seleccionar adecuadamente el peso de los distintos tipos de curvatura. En este sentido, el computador brinda la opción de seleccionar cualquier rango y por lo tanto, obtener un número elevado de mapas distintos. Es la experiencia de campo la que permite tener un criterio adecuado para seleccionar los pesos de los diferentes tipos de curvatura.**
{: .alert .alert-success}

Para la región de Porcecito en el departamento de Antioquia, vamos a considerar que las curvaturas de perfil cóncavas tienen pesos del órden del 40%, las curvaturas planares un peso del 20% y las curvaturas convexas un peso del 40%. Esta información es la que proviene de la experiencia de campo para incorporar al análisis computacional.

Utilizando el parámetro `percentile` del comando `r.univar` podemos calcular los valores correspondientes a los percentiles 40% y 60% del mapa de curvatura vertical que dividen el rango de valores en 40% - 20% - 40%.

~~~
r.univar -e map=porce1_profc7 percentile=40,60
~~~

~~~
 100%
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: -1782.22
maximum: 1919.38
range: 3701.6
mean: -11.0906
mean of absolute values: 123.232
standard deviation: 165.841
variance: 27503.2
variation coefficient: -1495.32 %
sum: -15758116.1423568
1st quartile: -107.066
median (even number of cells): -17.9785
3rd quartile: 73.9808
40th percentile: -50.568
60th percentile: 12.5423
~~~
{: .output}

Las reglas de reclasificación se indican a continuación, redondeando los valores calculados a un valor entero.

`RCLS_porce1_profc7`

~~~
-1783 thru  -50 = -1 Concavo
  -50 thru   13 =  0 Planar
   13 thru 1920 =  1 Convexo
~~~

~~~
r.reclass input=porce1_profc7 output=porce1_profc7_reclass rules=RCLS_porce1_profc7
r.report -h map=porce1_profc7_reclass units=p,c,k
~~~

~~~
+-----------------------------------------------------------------------------+
|               Category Information                |   %  |   cell|  square  |
| #|description                                     | cover|  count|kilometers|
|-----------------------------------------------------------------------------|
|-1|Concavo. . . . . . . . . . . . . . . . . . . . .| 40.02| 568604| 530.87256|
| 0|Planar . . . . . . . . . . . . . . . . . . . . .| 19.97| 283730| 264.90224|
| 1|Convexo. . . . . . . . . . . . . . . . . . . . .| 40.01| 568514| 530.78853|
|-----------------------------------------------------------------------------|
|TOTAL                                              |100.00|1420848|1326.56333|
+-----------------------------------------------------------------------------+
~~~
{: .output}

El mapa reclasificado obtenido es el siguiente:

![2D](/cartografia-digital/images/porce1_profc7.png){: .img-responsive}

![3D](/cartografia-digital/images/porce1_profc7_3D.png){: .img-responsive}

El mapa de la curvatura vertical muestra claramente la diferencia entre concavidades pertenecientes a valles y convexidades perteneciente a divisorias de agua ubicadas en cimas de colinas.

### Cálculo de la curvatura horizontal {#calculo-curvatura-horizontal}

Utilizamos el parámetro `planc` del comando `r.param.scale`.

~~~
r.param.scale input=porcecito1 output=porce1_planc7 size=7 param=planc
~~~

Recordemos el significado de los valores positivos (curvatura cóncava) y negativos (curvatura convexa) para la curvatura horizontal de acuerdo a lo definido para este parámetro al inicio de la clase:

1. Los valores positivos de curvatura hacen referencia a planos cóncavos; mientras mayor sea el valor de la curvatura (más positivo), más cerrada es la concavidad.
2. Los valores negativos de curvatura hacen referencia a planos convexos; mientras menor sea el valor de la curvatura (más negativo), más cerrada es la convexidad.
3. Los valores cercanos a 0 hacen referencia a curvaturas muy abiertas que se aproximan a un plano; concavidades muy abiertas para valores positivos y convexidades muy abiertas para valores negativos.

**Nótese que los signos positivo y negativo tienen significado opuesto en las curvaturas horizontal y vertical.**
{: .alert .alert-info}

Vamos a emplear las mismas 3 categorías de curvatura para el caso de la curvatura plana:

- Las curvaturas convexas.
- Las curvaturas planares.
- Las curvaturas cóncavas.

Consultamos la información estadística del mapa obtenido.

~~~
r.univar -e map=porce1_planc7
~~~

~~~
 100%
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: -19.1997
maximum: 12.8723
range: 32.0721
mean: -0.000104493
mean of absolute values: 0.0100631
standard deviation: 0.0324386
variance: 0.00105227
variation coefficient: -31043.8 %
sum: -148.469019921131
1st quartile: -0.00585386
median (even number of cells): -0.000155282
3rd quartile: 0.00541435
90th percentile: 0.0133014
~~~
{: .output}

Multiplicamos por 100.000 porque el valor promedio (`mean`) es muy cercano a cero.

~~~
r.mapcalc "porce1_planc7 = porce1_planc7 * 100000"
~~~

Y calculamos nuevamente los estadísticos para definir las reglas de reclasificación utilizando los mismos pesos.

~~~
r.univar -e map=porce1_planc7 percentile=40,60
~~~

~~~
 100%
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: -1.91997e+06
maximum: 1.28723e+06
range: 3.20721e+06
mean: -10.4493
mean of absolute values: 1006.31
standard deviation: 3243.86
variance: 1.05227e+07
variation coefficient: -31043.8 %
sum: -14846901.9921136
1st quartile: -585.386
median (even number of cells): -15.5282
40th percentile: -212.271
60th percentile: 166.853
~~~
{: .output}

Las reglas de reclasificación se indican a continuación.

`RCLS_porce1_planc7`

~~~
-1919980 thru    -212 = -1 Convexo
    -212 thru     167 =  0 Planar
     167 thru 1287240 =  1 Concavo
~~~

Se reclasifica el mapa de acuerdo a las reglas definidas, y se obtiene un reporte de la distribución de las categorías.

~~~
r.reclass input=porce1_planc7 output=porce1_planc7_reclass rules=RCLS_porce1_planc7
r.report -h map=porce1_planc7_reclass units=p,c,k
~~~

~~~
+-----------------------------------------------------------------------------+
|               Category Information                |   %  |   cell|  square  |
| #|description                                     | cover|  count|kilometers|
|-----------------------------------------------------------------------------|
|-1|Convexo. . . . . . . . . . . . . . . . . . . . .| 39.99| 568178| 530.47483|
| 0|Planar . . . . . . . . . . . . . . . . . . . . .| 19.99| 284064| 265.21407|
| 1|Concavo. . . . . . . . . . . . . . . . . . . . .| 40.02| 568606| 530.87443|
|-----------------------------------------------------------------------------|
|TOTAL                                              |100.00|1420848|1326.56333|
+-----------------------------------------------------------------------------+
~~~
{: .output}

El mapa reclasificado obtenido es el siguiente:

![2D](/cartografia-digital/images/porce1_planc7.png){: .img-responsive}

![3D](/cartografia-digital/images/porce1_planc7_3D.png){: .img-responsive}

Desplegamos primero todo el mapa y luego una parte para observar con mas detalle.

Observar que haciendo zoom en sectores del mapa se pueden observar rasgos específicos del relieve, por ejemplo, el abanico de Popalito.

Desplegamos primero todo el mapa y luego una parte para observar con mas detalle.

### Combinación de los mapas de curvaturas vertical y horizontal {#combinacion-mapas-curvaturas-vertical-horizontal}

El mapa reclasificado de curvatura vertical (perfil) tiene 3 valores:

| Valor | Tipo de curvatura |
|------:|:------------------|
|    -1 | Concavo (V)       |
|     0 | Planar (R)        |
|     1 | Convexo (X)       |
{: .table .table-striped}

El mapa reclasificado de curvatura horizontal (plana) tiene 3 valores:

| Valor | Tipo de curvatura |
|------:|:------------------|
|    -1 | Convexo (X)       |
|     0 | Planar (R)        |
|     1 | Concavo (V)       |
{: .table .table-striped}

Es factible combinar estos dos mapas para obtener un mapa resultante en el cual se puedan obtener simultáneamente las curvaturas vertical y planar para cada pixel. Como cada mapa tiene 3 categorías diferentes, el mapa resultante tendrá 9 categorías (3x3). Debemos sí, garantizar que cada categoría del mapa resultante tenga un valor único. La matriz a obtener deberá ser de la siguiente manera:

|       | **X** | **R** | **V** |
| **V** |  VX   |  VR   |  VV   |
| **R** |  RX   |  RR   |  RV   |
| **X** |  XX   |  XR   |  XV   |
{: .table .table-striped}

En las filas están las categorías de curvatura vertical y en las columnas las categorías de la curvatura horizontal.

Si sumamos los valores de los 2 mapas reclasificados, obtendríamos:

|        | **-1** | **0** | **1** |
| **-1** |   -2   |  -1   |   0   |
|  **0** |   -1   |   0   |   1   |
|  **1** |    0   |   1   |   2   |
{: .table .table-striped}

La suma simple de los 2 mapas no permite diferenciar los segmentos RX de VR porque ambos tienen el mismo valor de -1; de igual manera sucede con los segmentos XX - RR - VV, los cuales tienen el mismo valor de 0; y también para los segmentos XR y RV, que tienen el mismo valor de 1.

Para evitar la repetición de valores, multiplicamos el mapa de curvatura horizontal por el escalar `3`:

|        | **-3** | **0** | **3** |
| **-1** |   -4   |  -1   |   2   |
|  **0** |   -3   |   0   |   3   |
|  **1** |   -2   |   1   |   4   |
{: .table .table-striped}

En este segundo caso cada combinación quedará con un valor diferente:

| Valor | Tipo de vertiente |
|------:|:------------------|
|    -4 | VX                |
|    -3 | RX                |
|    -2 | XX                |
|    -1 | VR                |
|     0 | RR                |
|     1 | XR                |
|     2 | VV                |
|     3 | RV                |
|     4 | XV                |
{: .table .table-striped}

Para combinar los mapas empleando el álgebra de mapas, utilizamos el comando `r.mapcalc`:

~~~
r.mapcalc "porce1_tipo_vert = porce1_profc7_reclass + porce1_planc7_reclass * 3"
~~~

Visualizar la distribución de los tipos de vertientes en el mapa `porce1_tipo_vert`:

~~~
r.report -h map=porce1_tipo_vert units=p,c,k
~~~

~~~
 100%
+-----------------------------------------------------------------------------+
|               Category Information                |   %  |   cell|  square  |
| #|description                                     | cover|  count|kilometers|
|-----------------------------------------------------------------------------|
|-4| . . . . . . . . . . . . . . . . . . . . . . . .| 11.06| 157132| 146.70503|
|-3| . . . . . . . . . . . . . . . . . . . . . . . .|  6.93|  98421|  91.88998|
|-2| . . . . . . . . . . . . . . . . . . . . . . . .| 22.00| 312625| 291.87982|
|-1| . . . . . . . . . . . . . . . . . . . . . . . .|  8.03| 114071| 106.50147|
| 0| . . . . . . . . . . . . . . . . . . . . . . . .|  4.98|  70699|  66.00755|
| 1| . . . . . . . . . . . . . . . . . . . . . . . .|  6.99|  99294|  92.70505|
| 2| . . . . . . . . . . . . . . . . . . . . . . . .| 20.93| 297401| 277.66606|
| 3| . . . . . . . . . . . . . . . . . . . . . . . .|  8.07| 114610| 107.00471|
| 4| . . . . . . . . . . . . . . . . . . . . . . . .| 11.02| 156595| 146.20367|
|-----------------------------------------------------------------------------|
|TOTAL                                              |100.00|1420848|1326.56333|
+-----------------------------------------------------------------------------+
~~~
{: .output}

Para asignarle etiquetas a las categorías del nuevo mapa, primero debemos crear un archivo de categorías:

`CAT_porce1_tipo_vert`

~~~
-4|VX
-3|RX
-2|XX
-1|VR
0|RR
1|XR
2|VV
3|RV
4|XV
~~~

Y lo aplicamos utilizando el comando `r.category`.

~~~
r.category map=porce1_tipo_vert rules=CAT_porce1_tipo_vert separator=pipe
~~~

Consultamos la distribución nuevamente:

~~~
r.report -h map=porce1_tipo_vert units=p,c,k
~~~

~~~
 100%
+-----------------------------------------------------------------------------+
|               Category Information                |   %  |   cell|  square  |
| #|description                                     | cover|  count|kilometers|
|-----------------------------------------------------------------------------|
|-4|VX . . . . . . . . . . . . . . . . . . . . . . .| 11.06| 157132| 146.70503|
|-3|RX . . . . . . . . . . . . . . . . . . . . . . .|  6.93|  98421|  91.88998|
|-2|XX . . . . . . . . . . . . . . . . . . . . . . .| 22.00| 312625| 291.87982|
|-1|VR . . . . . . . . . . . . . . . . . . . . . . .|  8.03| 114071| 106.50147|
| 0|RR . . . . . . . . . . . . . . . . . . . . . . .|  4.98|  70699|  66.00755|
| 1|XR . . . . . . . . . . . . . . . . . . . . . . .|  6.99|  99294|  92.70505|
| 2|VV . . . . . . . . . . . . . . . . . . . . . . .| 20.93| 297401| 277.66606|
| 3|RV . . . . . . . . . . . . . . . . . . . . . . .|  8.07| 114610| 107.00471|
| 4|XV . . . . . . . . . . . . . . . . . . . . . . .| 11.02| 156595| 146.20367|
|-----------------------------------------------------------------------------|
|TOTAL                                              |100.00|1420848|1326.56333|
+-----------------------------------------------------------------------------+
~~~
{: .output}

## Tarea 5
{: .text-danger}

Para esta tarea es necesario descargar el siguiente archivo [vergel.zip](/cartografia-digital/vergel.zip) y guardarlo en la carpeta personal de la máquina virtual y descomprimirlo utilizando el siguiente comando desde la terminal:

~~~
unzip ~/vergel.zip -d ~/Grass
~~~

Iniciar GRASS nuevamente e ingresar al mapset `vergel` de la localización `Vergel`.

Utilizando el álgebra de mapas diferenciar en el mapa `vergel1`, con colores diferentes, las pendientes suaves (menores de 3 grados) localizadas en los fondos de los valles y en las cimas de las colinas.

Entregables:

* El guión con los comandos utilizados, debidamente documentado (archivo de texto con extensión `.sh`).
* El mapa obtenido en formato `.png`.
* Los archivos auxiliares utilizados (tablas de color, tablas de reclasificación, tablas de categorías).

## Tarea 6
{: .text-danger}

En el mapa `ituango` definir 3 cultivos distintos para 3 rangos altitudinales diferentes, los cuales se pueden implementar en pendientes con un umbral mínimo y un umbral máximo. En cada rango altitudinal, las pendientes por encima del umbral máximo se dedicarán a conservación natural, y por debajo del umbral mínimo se dedicarán a ganadería. Elaborar este mapa y entregar:

* El guión con los comandos utilizados, debidamente documentado (archivo de texto con extensión `.sh`).
* Un mapa coloreado con los diferentes usos del suelo (en formato `.png`).
* Los archivos auxiliares utilizados (tablas de color, tablas de reclasificación, tablas de categorías).
* Un documento en formato `.pdf` que contenga:
  - La justificación de los rangos utilizados en la elaboración de los mapas.
  - Una tabla con las extensiones de cada uso y el porcentaje ocupado respecto al mapa `ituango`.
  - Conclusiones y recomendaciones.
