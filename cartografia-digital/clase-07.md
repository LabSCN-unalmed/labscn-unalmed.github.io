---
layout: clase
title: 'Parámetros morfométricos del relieve'
curso: 'cartografia-digital'
clase: 7
---

Un parámetro importante en la descripción cuantitativa del relieve es la pendiente. Con base en un mapa raster de altitudes (DSM o DTM) se puede calcular un mapa raster de pendiente; en este caso, se asigna un valor de pendiente a cada píxel.

La pendiente y otros parámetros útiles se pueden calcular empleando el comando `r.param.scale` (Extrae parámetros del terreno a partir de un DEM).

Parámetros que se pueden calcular con el comando r.param.scale
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

![Los 6 tipos de características morfométricas](/cartografia-digital/images/morphometric.png){: .img-responsive .img-rounded}

Elaboración de un mapa de pendientes
------------------------------------

Conceptos importantes:

1. ¿Qué es una vertiente?
2. ¿Cuáles son los limites de las vertientes?
3. ¿Qué significa la pendiente de una vertiente?
4. Relación de la vertiente con otros atributos de estructura y dinámica del relieve.
    - Con la litología.
    - Con la erosión.
    - Con los movimientos en masa (caídas, volcamientos, deslizamientos, flujos).
5. Relación de la pendiente de la vertiente con las intervenciones y su aprovechamiento:
    - Viviendas y edificaciones.
    - Construcción de redes viales.
6. Relación de la pendiente de la vertiente con la distribución de la cobertura vegetal natural y cultivada.
    - ¿Existe alguna relación?
    - ¿Se trata de una relación directa o de una relación indirecta?

### ¿Cómo elaborar el mapa de pendientes de una región con significados importantes respecto a la dinámica e intervención del relieve?

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

~~~
d.rast porce1_slope3
~~~

![2D](/cartografia-digital/images/porce1_slope3.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_slope3
~~~

![3D](/cartografia-digital/images/porce1_slope3_3D.png){: .img-responsive .img-rounded}

*¿En qué parte del relieve se ubican las pendientes mas fuertes y que valores despliegan?*

*¿En qué parte del relieve se ubican las pendientes mas suaves y que valores despliegan?*

*¿Cuáles son las pendientes predominantes en la región de porcecito?*

Estadísticos básicos del mapa de pendientes:

~~~
r.univar porce1_slope3
~~~

### Construir el histograma de las gradientes del mapa porcecito

Para ver un histograma continuo de los valores:

~~~
d.histogram porce1_slope3
~~~

![Histograma del mapa de pendientes](/cartografia-digital/images/porce1_slope3_hist1.png){: .img-responsive .img-rounded}

De acuerdo con el histograma de la imagen anterior:

- Hay unas pendientes suaves entre 0° - 3° que representan un porcentaje muy bajo de la zona.
- Las pendientes entre 3° - 11° son importantes.
- Hay un máximo de pendientes entre 11° - 22° con centro en 16°.
- Otro rango importante son las pendientes entre 22° - 30°.
- Las pendientes por encima de 30° constituyen un porcentaje bajo.

Para ver un histograma con rangos discretos de pendiente:

~~~
d.histogram porce1_slope3 nsteps=20
~~~

![Histograma del mapa de pendientes con rangos discretos](/cartografia-digital/images/porce1_slope3_hist2.png){: .img-responsive .img-rounded}

### Reclasificar el mapa de pendientes

1. Se elabora en gedit un script de reclasificación de la pendiente y se guarda por omisión en la carpeta personal con el nombre: `RCLS_porce1_slope3`.
2. Se aplica el comando de reclasificación `r.reclass`. Si la reclasificación inicial no cumple las expectativas se modifica varias veces hasta obtener un resultado deseable.
3. Se construye una tabla de colores para el mapa reclasificado de la pendiente.
4. Se despliega el mapa.
5. Se pueden seguir cambiando los limites de la reclasificación o los colores de los rangos.

**NOTA:** Emplear una tabla de variación gradual del color para los rangos.

El script `RCLS_porce1_slope3` es el siguiente:

#### Con seis categorías. Mapa1

~~~ RCLS_porce1_slope3
 0 thru  3 = 1 Pendientes muy suaves 
 3 thru  7 = 2 Pendientes suaves 
 7 thru 15 = 3 Pendientes moderadas 
15 thru 25 = 4 Pendientes moderadamente inclinadas 
25 thru 35 = 5 Pendientes muy inclinadas 
~~~

~~~
r.reclass input=porce1_slope3 output=porce1_slope3_reclass rules=RCLS_porce1_slope3
d.rast porce1_slope3_reclass
~~~

![2D](/cartografia-digital/images/RCLS_porce1_slope3.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_slope3_reclass
~~~

![3D](/cartografia-digital/images/RCLS_porce1_slope3_3D.png){: .img-responsive .img-rounded}

La reclasificación de la pendiente en seis (6) rangos con los límites antes anotados genera un mapa de "sal y pimienta".

Vamos a hacer una reclasificación más simple solo con tres categorías y le asignamos una nueva identidad bajo el siguiente nombre: `RCLS_porce1_slope3_2`.

#### Con tres categorías: Mapa2

~~~ RCLS_porce1_slope3_2
 0 thru  7 = 1 Pendientes muy suaves y suaves
 7 thru 25 = 2 Pendientes suaves y moderadas
25 thru 72 = 3 Pendientes inclinadas y escarpadas
~~~

La aplicamos y observamos el nuevo resultado.

~~~
r.reclass input=porce1_slope3 output=porce1_slope3_reclass rules=RCLS_porce1_slope3_2 --o
d.rast porce1_slope3_reclass
~~~

![2D](/cartografia-digital/images/RCLS_porce1_slope3_2.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_slope3_reclass
~~~

![3D](/cartografia-digital/images/RCLS_porce1_slope3_2_3D.png){: .img-responsive .img-rounded}

El mapa con tres categorías se torna mas claro que el mapa con seis categorías. Es frecuente que el excesivo detalle en la reclasificación de mapas no permite ver los patrones mas frecuentes porque pasan desapercibidos debido a una excesiva reclasificación.

#### Con tres categorías pero modificando sus límites: Mapa3

~~~ RCLS_porce1_slope3_3
 0 thru 10 = 1 Pendientes muy suaves y suaves
10 thru 29 = 2 Pendientes suaves y moderadas
29 thru 72 = 3 Pendientes inclinadas y escarpadas
~~~

~~~
r.reclass input=porce1_slope3 output=porce1_slope3_reclass rules=RCLS_porce1_slope3_3 --o
d.rast porce1_slope3_reclass
~~~

![2D](/cartografia-digital/images/RCLS_porce1_slope3_3.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_slope3_reclass
~~~

![3D](/cartografia-digital/images/RCLS_porce1_slope3_3_3D.png){: .img-responsive .img-rounded}

*¿Cuáles son las diferencias mas importantes entre los tres mapas?*

*¿Qué características del terreno resaltan en un mapa que aparecen poco evidentes claras en otro?*

#### Asignar una tabla de colores personalizada a los mapas reclasificados de la pendiente

Se seleccionan colores que generen contraste importante.

Se hace el respectivo script en gedit y se guarda como: `TC_porce1_slope3`.

~~~ TC_porce1_slope3
1 green
2 226 178 252 # violeta muy claro
3 102  39   8 # cafe mucho mas oscuro
~~~

Se ejecuta la siguiente secuencia de comandos:

~~~
r.colors map=porce1_slope3_reclass rules=TC_porce1_slope3
d.rast porce1_slope3_reclass
~~~

![2D](/cartografia-digital/images/TC_porce1_slope3.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_slope3_reclass
~~~

![3D](/cartografia-digital/images/TC_porce1_slope3_3D.png){: .img-responsive .img-rounded}

### Consultar la información que contiene el mapa reclasificado de la pendiente

Con este comando obtenemos la información de las tres categorías de pendientes en porcentaje `p`, N° de píxeles `c` y en área en km<sup>2</sup> `k`.

~~~
r.report -h map=porce1_slope3_reclass units=p,c,k
~~~

Añadiendo la opción `-n` no incluye en los estadisticos del mapa los píxeles sin información (nulos o 'no data').

~~~
r.report -hn map=porce1_slope3_reclass units=p,c,k
~~~

### Actividad extra-curso

1. Colocarle variación gradual del color al mapa de pendientes de porce1.
2. Emplear tabla gradacional de los colores que empleó para asignar colores al mapa reclasificado de pendientes.
3. ¿Qué diferencias importantes observa entre los dos mapas cuando lo observa en 2D y en 3D con nviz?
4. Amplíe con `d.zoom` ambos mapas para observar con mas detalle algunos sectores de los mapas y facilitar el análisis comparativo.

Clasificación de las vertientes según su curvatura
--------------------------------------------------

![Fotografía de vertientes con diversas curvaturas](/cartografia-digital/images/fotovert.png){: .img-responsive .img-rounded}

##### Conceptos importantes:

Recordar de la clase anterior los interrogantes:

*¿Qué es una vertiente?*

*¿Cuáles son los limites de las vertientes?*

Digamos que un atributo necesario pero no suficiente de una vertiente es el de poseer extensión.

Las vertientes son superficies modeladas por procesos de remoción.

- A las vertientes como superficies se les puede calcular perfiles.
- Los perfiles son lineas.
- Los perfiles se obtienen de graficar “distancia vs altitud”.
- Los perfiles de los terrenos son lineas muy irregulares que resultan de unas combinaciones complejas de tres tipos de segmentos básicos: convexo, cóncavo y rectilíneo.
- La gradiente es la variación de la altitud con la distancia.
- La variación de la gradiente con la distancia define el carácter convexo, cóncavo o rectilíneo de un segmento del perfil.

Para definir la forma de una superficie se emplean dos perfiles ortogonales: uno en el sentido de la dirección de la superficie y otro en el sentido de la inclinación máxima de la superficie.

##### Clasificación de las vertientes según Ruhe, R.V. (1975)

- Perfiles en el sentido de la dirección de la vertiente.
- Perfil en el sentido de la inclinación de la vertiente.

![Esquema de vertientes](/cartografia-digital/images/vertientes.png){: .img-responsive .img-rounded}

- ¿Qué significa la pendiente de una vertiente?
- Relación de la vertiente con otros atributos de estructura y dinámica del relieve.
    - Con la litología.
    - Con la erosión.
    - Con los movimientos en masa (caídas, volcamientos, deslizamientos, flujos).
- Relación de la pendiente de la vertiente con las intervenciones y su aprovechamiento:
    - Viviendas y edificaciones.
    - Construcción de redes viales.
- Relación de la pendiente de la vertiente con la distribución de la cobertura vegetal natural y cultivada.
    - ¿Existe alguna relación?
    - ¿Se trata de una relación directa o de una relación indirecta?

### Cálculo de la curvatura horizontal

Utilizamos el parámetro `planc` del comando `r.param.scale`.

~~~
r.param.scale input=porcecito1 output=porce1_planc7 size=7 param=planc
~~~

Consultamos la información estadística del mapa generado.

~~~
r.univar porce1_planc7
~~~

Multiplicamos por 100.000 porque el valor promedio es muy cercano a cero

~~~
r.mapcalc 'porce1_planc7 = porce1_planc7 * 100000'
~~~

Y calculamos nuevamente los estadísticos para definir las reglas de reclasificación.

~~~
r.univar porce1_planc7
~~~

Las reglas de reclasifcacion y los porcentajes obtenidos se indican a continuación.

~~~  RCLS_porce1_planc7
-1920000 thru     -25 = -1 Convexo
     -25 thru      25 =  0 Planar
      25 thru 1290000 =  1 Concavo
~~~

Se reclasifica el mapa de acuerdo a las reglas definidas, y se obtiene un reporte de la distribución de las categorías.

~~~
r.reclass input=porce1_planc7 output=porce1_planc7_reclass rules=RCLS_porce1_planc7
r.report -h map=porce1_planc7_reclass units=p,c,k
~~~

Los porcentajes para cóncavos y convexos difieren radicalmente para los valores de curvatura planar. Esto en sí mismo no es un error, ya que los valores obtenidos en esta reclasificación dependen de los valores limites asignados. Pero, ¿Son representativos del relieve de Porcecito?

Vamos a tratar que la parte planar tenga un valor cercano al 20%

Por lo tanto modifcamos los límites de la reclasificación, hasta obtener un porcentaje de un 20% para las partes planares.

Después de varios chequeos, nos quedamos con la siguiente tabla de reclasificación:

~~~ RCLS_porce1_planc7_2
-1920000 thru    -225 = -1 Convexo
    -225 thru     225 =  0 Planar
     225 thru 1290000 =  1 Concavo
~~~

~~~
r.reclass input=porce1_planc7 output=porce1_planc7_reclass rules=RCLS_porce1_planc7_2 --o
r.report -h map=porce1_planc7_reclass units=p,c,k
d.rast porce1_planc7_reclass
~~~

![2D](/cartografia-digital/images/porce1_planc7.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_planc7_reclass
~~~

![3D](/cartografia-digital/images/porce1_planc7_3D.png){: .img-responsive .img-rounded}

Desplegamos primero todo el mapa y luego una parte para observar con mas detalle.

Observar que haciendo zoom en sectores del mapa se pueden observar rasgos específicos del relieve, por ejemplo, el abanico de Popalito.

Desplegamos primero todo el mapa y luego una parte para observar con mas detalle.

~~~
d.zoom
nviz porcecito1 color=porce1_planc7_reclass
~~~

Desplegado con `nviz` se le coloca un bloque, una escala, la flecha del norte, la leyenda y el título.

Luego guardamos el mapa con la terminación `.ppm` (es muy pesada) en el Escritorio.

Luego convertimos a un formato mas ligero como el PNG.

~~~
cd Escritorio/
convert popalito_planc.ppm popalito_planc.png
~~~

Retornamos a la carpeta personal.

~~~
cd
~~~

Copiamos la figura con terminación `.png` y la pegamos en el informe que se realiza.

Combinar mapa de pendientes y mapa de curvatura vertical
--------------------------------------------------------

Este procedimiento se puede utilizar para diferenciar pendientes de cima de colina y pendientes de fondo de valle.

Ya tenemos un mapa de pendientes y lo reclasificamos en 3 categorías (`porce1_slope3_reclass`).

También tenemos un mapa de curvaturas horizontales (`porce1_planc7`) y se reclasificó; de manera similar, crearemos un mapa de curvaturas verticales, lo reclasificaremos y lo combinaremos con el mapa reclasificado de pendientes.

### Cálculo de la curvatura vertical

Utilizamos el parámetro `profc` del comando `r.param.scale`.

~~~
r.param.scale input=porcecito1 output=porce1_profc7 size=7 param=profc
~~~

Consultamos la información estadística del mapa generado.

~~~
r.univar porce1_profc7
~~~

Multiplicamos por 100.000 porque el valor promedio es muy cercano a cero

~~~
r.mapcalc 'porce1_profc7 = porce1_profc7 * 100000'
~~~

Y volvemos a calcular los estadísticos para definir las reglas de reclasificación.

~~~
r.univar porce1_profc7
~~~

Las reglas de reclasifcacion y los porcentajes obtenidos se indican a continuación, buscamos obtener aproximadamente un valor del 20% en la parte planar, al igual que lo hicimos con la curvatura horizontal:

~~~ RCLS_porce1_profc7
-1783 thru  -50 = -1 Concavo
  -50 thru   10 =  0 Planar
   10 thru 1920 =  1 Convexo
~~~

~~~
r.reclass input=porce1_profc7 output=porce1_profc7_reclass rules=RCLS_porce1_profc7
r.report -h map=porce1_profc7_reclass units=p,c,k
d.rast porce1_profc7_reclass
~~~

![2D](/cartografia-digital/images/porce1_profc7.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_profc7_reclass
~~~

![3D](/cartografia-digital/images/porce1_profc7_3D.png){: .img-responsive .img-rounded}

El mapa de la curvatura vertical muestra claramente la diferencia entre concavidades pertenecientes a valles y convexidades perteneciente a divisorias de agua ubicadas en cimas de colinas.

### Procedimiento para combinar los mapas

Se utiliza el comando `r.mapcalc` para combinar los dos mapas.

~~~
r.mapcalc 'porce1_slope_profc=porce1_slope3_reclass*3+porce1_profc7_reclass'
r.report -h map=porce1_slope_profc units=p,c,k
~~~

Se aplica la siguiente tabla de colores:

~~~ TC_porce1_slope_profc
 2 blue
 3 166 251 155 # verde muy claro
 4 245 169 131 # cafe claro
 5 cyan
 6  36 233   9 # verde
 7 241 130  75 # cafe brillante
 8 aqua
 9  25 161   7 # verde oscuro
10 189  73  15 # cafe
~~~

~~~
r.colors map=porce1_slope_profc rules=TC_porce1_slope_profc
d.rast porce1_slope_profc
~~~

![2D](/cartografia-digital/images/porce1_slope_profc.png){: .img-responsive .img-rounded}

~~~
nviz porcecito1 color=porce1_slope_profc
~~~

![3D](/cartografia-digital/images/porce1_slope_profc_3D.png){: .img-responsive .img-rounded}

De manera similar, se pueden combinar los mapas de curvaturas vertical y horizontal.
