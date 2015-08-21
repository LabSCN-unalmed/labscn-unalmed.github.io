---
layout: clase
title: 'Análisis del relieve relativo con base en un análisis de vecindad'
curso: 'cartografia-digital'
clase: 4
---

Fundamentos teóricos
--------------------

### El concepto de relieve relativo

- Tipos de relieve relativo (montañoso, colinado, plano).
- ¿Cómo construiría usted un mapa de relieve relativo a partir de un DEM?
- Relación entre tipo de relieve relativo y tamaño del kernel.
- Álgebra de mapas: operaciones básicas (suma, resta, multiplicación, división).

### El concepto de análisis de vecindad

- El análisis de vecindad a partir de un mapa raster.
- Kernel como dimensión de la vecindad.
- La relación entre kernel y mapa.
- Efecto de borde.
- Operaciones de vecindad. ¿Cuáles son las posibles operaciones?

### Diferencias entre un mapa de una variable determinada y un mapa reclasificado de dicha variable

- La naturaleza del valor del píxel.
- Reducción en la cantidad y calidad de la información.
- Simplificación del mapa original.
- Se pueden obtener múltiples mapas reclasificados a partir del mapa original.

Desarrollo
----------

### Relieve relativo o relieve local

El relieve relativo o relieve local se define como la diferencia vertical en elevación entre los puntos mas altos y los puntos mas bajos dentro de una región dada o a lo largo de un perfil o linea en el terreno.

Los puntos mas altos en el relieve de una región se ubican en las divisorias de agua.

Los puntos mas bajos en el relieve se ubican en las vaguadas y en los canales de las corrientes de agua.

El relieve relativo de una zona se obtiene con mas precisión si la diferencia de altitud es aquella que se obtiene de la diferencia entre altittudes de divisoria y altitudes de canales fluviales.

Los valores de relieve relativo en una región dada permiten establecer diferencias entre tipos de relieve: relieve plano, relieve ondulado, relieve colinado y relieve montañoso. Adicionalmente, permite diferenciar entre relieve montañosos bajo, medio y alto ; situación similar se puede establecer para los relieves colinados.

El relieve relativo de una región es una resultante del balance entre los ritmos de levantamiento tectónico y las tasas de incisión fluvial de las redes de drenaje.

El relieve relativo se puede emplear como un índice de referencia de la velocidad relativa de los movimientos tectónicos verticales en un cinturón cordillerano.

La relación entre relieve relativo y la extensión de la zona de referencia.

El valor de relieve relativo depende de las dimensiones de la zona de referencia. Por ejemplo, el valor de relieve relativo para un punto ubicado en el centro de la ciudad de Medellín depende de la zona de referencia para calcularlo: en un circulo de 100 metros de radio se obtiene un valor. Si aumentamos el valor del radio a 1000 metros, a 5.0 km, a 10 km, a 50 km, etc, ¿Cuáles serán los valores de relieve relativo que se obtienen?

### Análisis de vecindad

Recordar la estructura de un archivo o mapa raster.

¿Cuántas filas y cuantas columnas tiene el mapa `porcecito1`?

¿Cuántos píxeles contiene el mapa `porcecito1`?

### El kernel o ventana móvil

Permite definir el tamaño o dimensiones de la vecindad donde se realiza el análisis. Permite definir los píxeles vecinos alrededor de un píxel en los cuales se realiza el análisis de vecindad. Para el análisis de vecindad se selecciona una especie de subretícula de forma cuadrada que contiene un numero impar de píxeles. Seleccionar un cuadrado con un numero impar de píxeles por lado garantiza la existencia de un píxel central único.

Por ejemplo: Supongamos que un terreno tiene tipos de relieve diversos (plano, colinado y montañoso) con una densidad de drenaje moderadamente alta.

Si se selecciona un kernel de 100 x 100 metros como zona de vecindad, es decir, 0.01 km<sup>2</sup> podría suceder que la zona no incluya simultáneamente píxeles en posición de divisoria de aguas y píxeles ubicados en los canales de corrientes de agua. Por lo tanto, mientras el kernel sea muy pequeño, es posible que no se tenga un valor representativo del relieve local.

Existe un valor óptimo de tamaño de kernel para obtener una representación pertinente del relieve relativo de una región.

El análisis de vecindad en un mapa raster consiste en realizar una operación especifica con los píxeles que abarca el kernel y el resultado llevarlo al píxel equivalente de un nuevo mapa de salida.

Los pasos del análisis de vecindad se pueden esquematizar así:

- Se define las dimensiones del kernel.
- Se recorre el mapa de entrada con el kernel por cada uno de sus píxeles.
- En cada píxel del mapa de entrada, el kernel identifica los píxeles vecinos.
- Con los píxeles vecinos realiza una operación matemática (promedio, mediana, moda, valor máximo, valor mínimo, etc).
- El valor obtenido lo lleva al píxel equivalente de un mapa de salida.
- En este sentido, el mapa de entrada y el mapa de salida tienen el mismo numero de filas, columnas y píxeles.
- El análisis de vecindad consiste en recorrer, uno a uno, todos los píxeles del mapa de entrada y los resultados de la operación trasladarlos a los respectivos píxeles del mapa de salida.

El análisis de vecindad, como se esquematiza en los pasos anteriores indica que se presentan problemas de borde. Cuando el centro del kernel se ubica en los píxeles de borde, las operaciones a realizar no incorporan la totalidad de píxeles de vecindad porque muchos de ellos quedan por fuera del mapa de entrada.

Parte Operativa
---------------

Para la elaboración del mapa de relieve relativo de la zona representada en el modelo de elevación digital de `porcecito1` se realizan las siguientes actividades:

- Consultar el N° de filas, columnas y píxeles que tiene el mapa de entrada `porcecito1`.
- Definir las dimensiones del kernel a utilizar como ventana para la zona de vecindad.
- Calcular el rango de altitud en la zona de vecindad (`altura máxima - altura mínima`).
- Este mapa es el mapa de relieve relativo o relieve local de la región de porcecito.

### Consultar el contenido del mapa porcecito1

~~~
r.info porcecito1
~~~

Resaltamos de la información del mapa: Tiene 1242 filas y 1144 columnas; contiene 1’420.848 píxeles. La resolución espacial del mapa es la de un píxel cuadrad de 30.5 metros. La altitud mínima es de 958 msnm y la altitud máxima es de 2873 msnm.

### Cálculo de las dimensiones de la zona de vecindad

Un píxel en el mapa de entrada (`porcecito1`) tiene unas dimensiones de 30 x 30 metros y una extensión de 900 m<sup>2</sup>.

Definamos para empezar como zona de vecindad una zona de 1.0 km<sup>2</sup> con centro en el píxel donde se realiza la operación. Con esta definición se establece una disyunción para los píxeles del mapa de entrada: para cualquier píxel del mapa de entrada se le puede interrogar así: **¿Pertenece o no pertenece a la vecindad?**

#### ¿Cuáles son las dimensiones del kernel para una zona de vecindad de 1.0 km<sup>2</sup>?

- Área de un píxel = 900 m<sup>2</sup>
- 1.0 km<sup>2</sup> = 1000000 m<sup>2</sup>
- N° de píxeles en 1.0 km<sup>2</sup> = 1111 píxeles aprox.
- Raíz cuadrada (N° de píxeles en 1.0 km<sup>2</sup>) = 33.333333
- Lado de la zona de vecindad / Lado del pixel (1000 m / 30 m = 33.33333)

La zona de vecindad corresponde a un cuadrado cuyo lado es equivalente a la longitud que se obtiene de sumar el lado de 33 píxeles.

### El mapa de relieve relativo

Se obtiene el mapa de relieve relativo calculando el rango de altitud en la zona de vecindad.

~~~
r.neighbors input=porcecito1 output=porce1_RR_33 method=range size=33
~~~

<!--- d.rast porce1_RR_33 -->

![Mapa de relieve relativo](/cartografia-digital/images/porce1_RR_33.png){: .img-responsive}

#### Visualización 3D del mapa construido

<!---
~~~
nviz porce1_RR_33
~~~
-->

![Visualización 3D del mapa de Relieve Relativo](/cartografia-digital/images/porce1_RR_33_3D.png){: .img-responsive}

*¿Qué se observa en la imagen anterior?*

*¿Se puede visualizar la estructura del relieve?*

*¿En qué parte del relieve se presentan los desniveles altitudinales más pronunciados?*

#### Explorar esta otra opción y contestar los interrogantes precedentes

<!---
~~~
nviz porcecito1 color=porce1_RR_33
~~~
-->

![Visualización 3D del mapa porcecito1 con los colores del mapa de Relieve Relativo](/cartografia-digital/images/porce1_RR_33_3D2.png){: .img-responsive}

En esta última orden le decimos al sistema que despliegue en tres dimensiones el mapa `porcecito1` pero que le coloque los colores del mapa `porce1_RR_33`.

### Reclasificación del mapa de relieve relativo

En el mapa de relieve relativo (`porce1_RR_33`):

- Consultar la información del mapa a reclasificar.
- Justificar los valores limites para los intervalos de la reclasificación.
- Realizar la reclasificación.
- Evaluar la reclasificación.

#### El contenido del mapa de relieve relativo

~~~
r.info porce1_RR_33
~~~

Este comando nos permite saber que el valor mínimo de RR es 45 metros y el valor máximo de RR es 783 metros.

~~~
r.report -h map=porce1_RR_33 units=p,c,k nsteps=20
~~~

Con el comando `r.report` se obtiene información sobre la distribución de los valores de relieve relativo en la zona del mapa de `porce1_RR_33`. Si los valores de la tabla, que se despliega en la terminal de comandos, se guardan en un archivo `.csv` utilizando el parámetro `output`, y se organiza en gedit, luego se puede abrir con LibreOffice Calc, en donde se ajusta un poco la presentación.

De allí se copia y se pega en el procesador de texto, para obtener la siguiente tabla.

| Relieve Relativo | Porcentaje | No. Píxeles | Área (km<sup>2</sup>) |
|:----------------:|:----------:|:-----------:|:---------------------:|
|     45   -  81.9 |       2.01 |       28556 |              26.66108 |
|     81.9 - 118.8 |       8.68 |      123314 |             115.13113 |
|    118.8 - 155.7 |      12.94 |      183796 |             171.59966 |
|    155.7 - 192.6 |      12.74 |      181073 |             169.05735 |
|    192.6 - 229.5 |      12.26 |      174259 |             162.69552 |
|    229.5 - 266.4 |      11.48 |      163078 |             152.25647 |
|    266.4 - 303.3 |      10.18 |      144617 |             135.02050 |
|    303.3 - 340.2 |       8.64 |      122812 |             114.66244 |
|    340.2 - 377.1 |       7.03 |       99815 |              93.19147 |
|    377.1 - 414   |       5.31 |       75509 |              70.49837 |
|    414   - 450.9 |       3.97 |       56381 |              52.63967 |
|    450.9 - 487.8 |       2.46 |       34884 |              32.56917 |
|    487.8 - 524.7 |       1.26 |       17952 |              16.76074 |
|    524.7 - 561.6 |       0.52 |        7445 |               6.95096 |
|    561.6 - 598.5 |       0.23 |        3312 |               3.09222 |
|    598.5 - 635.4 |       0.12 |        1703 |               1.58999 |
|    635.4 - 672.3 |       0.09 |        1217 |               1.13624 |
|    672.3 - 709.2 |       0.05 |         679 |               0.63394 |
|    709.2 - 746.1 |       0.03 |         412 |               0.38466 |
|    746.1 - 783   |       0.00 |          34 |               0.03174 |
|==================|============|=============|=======================|
|        **TOTAL** | **100.00** | **1420848** |        **1326.56333** |
{: .table .table-hover}

En un trabajo acerca del relieve de Antioquia hemos empleado la clasificación que se observa en la siguiente tabla  para la definición de tipos de relieve de acuerdo al valor del Relieve Relativo.

| Valor de RR | Descripción morfológica                                               |
|:-----------:|:----------------------------------------------------------------------|
|    0 -   10 | Zonas de relieve muy suave                                            |
|   10 -   75 | Colinas bajas                                                         |
|   75 -  150 | Colinas intermedias                                                   |
|  150 -  300 | Colinas altas                                                         |
|  300 -  350 | Transición entre relieves colinados y relieves con disección profunda |
|  350 -  450 | Disección profunda baja                                               |
|  450 -  600 | Disección profunda intermedia                                         |
|  600 - 1200 | Disección profunda pronunciada                                        |
{: .table .table-hover}

La comparación de las dos tablas permite establecer los siguientes rangos para reclasificar el mapa de relieve relativo.

| Valor de RR | Descripción morfológica                                           |
|:-----------:|:------------------------------------------------------------------|
|   45 -   82 | Relieves planos y de colinas bajas                                |
|   82 -  150 | Colinas intermedias                                               |
|  150 -  300 | Colinas altas                                                     |
|  300 -  350 | Transición entre relieve colinado y relieve de disección profunda |
|  350 -  450 | Disección profunda baja                                           |
|  450 -  600 | Disección profunda intermedia                                     |
|  600 - 1200 | Disección profunda pronunciada                                  |
{: .table .table-hover}

#### Reclasificación del mapa de relieve relativo

El comando `r.reclass` crea un nuevo mapa (mapa reclasificado), cuyos valores de categorías están basados en una reclasificación de las categorías de una capa de mapa raster existente.

Para aplicar el comando `r.reclass` se requiere elaborar un script en gedit para aplicar, el cual contiene las reglas de la reclasificación a utilizar.

El script tiene el siguiente contenido:

~~~ RCLS_porce1_RR
 45 thru  82 = 1 Relieves planos y de colinas bajas.
 82 thru 150 = 2 Colinas intermedias.
150 thru 300 = 3 Colinas altas.
300 thru 350 = 4 Transicion entre relieve colinado y relieve de diseccion profunda.
350 thru 450 = 5 Diseccion profunda baja.
450 thru 600 = 6 Diseccion profunda intermedia.
600 thru 785 = 7 Diseccion profunda pronunciada.
~~~

- Se inicia con la altitud mínima.
- Se utilizan los rangos descritos en la tabla anterior.
- A cada rango de reclasificación de la altitud se le asigna un numero entero consecutivo (1, 2, 3, ...).
- Luego se hace una descripción corta (3 a 5 palabras) indicando lo que representa cada rango.
- Finalmente se guarda el "script" asignándole un nombre o etiqueta para su identificación. Por omisión, el programa GRASS guarda el script en la carpeta personal del usuario, de donde la tomará al momento de invocarla.
- Para identificar el script como unas reglas de reclasificación de un mapa especifico, se puede utilizar la convención: `RCLS_'Nombre del mapa a reclasificar'`. Por ejemplo: `RCLS_porce1_RR`

Reclasificar un mapa involucra la acción de construir un nuevo mapa (mapa de salida) a partir de un mapa de entrada.

- El mapa de entrada contiene los valores de una variable para cada uno de los píxeles.
- El mapa `porce1_RR_33` contiene el valor de RR para cada uno de los píxeles.

El mapa de salida asigna un numero entero similar para todos los píxeles cuyo valor se encuentra dentro de un rango dado. Por ejemplo, en el script creado se ha estipulado que a los píxeles con valor de RR entre 45 - 82 les asigne el número 1, a los píxeles entre 82 - 150 les asigne el número 2, y así sucesivamente.

De este modo obtenemos un mapa reclasificado del relieve relativo que contiene siete (7) categorías.

La orden para elaborar un mapa reclasificado del relieve relativo es la siguiente:

~~~
r.reclass input=porce1_RR_33 output=porce1_RR_33_reclass rules=RCLS_porce1_RR
~~~

#### Consultar el contenido del mapa reclasificado

~~~
r.report -h map=porce1_RR_33_reclass units=p,c,k
~~~

Con el informe obtenido podemos responder preguntas, tales como:

- ¿Cuál es el tipo de relieve dominante en la zona de estudio y que extensión ocupa?
- ¿Qué importancia en área tiene en la zona de estudio los relieves mas suaves?

Desplegar en 2D y en 3D el mapa reclasificado de relieve relativo

<!---
~~~
d.rast porce1_RR_33_reclass
~~~
-->

![2D](/cartografia-digital/images/porce1_RR_33_reclass.png){: .img-responsive}

<!---
~~~
nviz porcecito1 color=porce1_RR_33_reclass
~~~
-->

![3D](/cartografia-digital/images/porce1_RR_33_reclass3D.png){: .img-responsive}

Al desplegar el mapa `porce1_RR_33_reclass` el programa GRASS asigna unos colores a cada categoría.

*¿Cómo asignar a voluntad del usuario una tabla de colores al mapa reclasificado de relieve relativo?*

#### Simplificar un mapa reclasificado

Puede ocurrir que el mapa reclasificado en estudio contiene un numero elevado de categorías y sería interesante para algún propósito disminuir el numero de categorías para un análisis mas adecuado de lo que se estudia.

Por ejemplo: el mapa `porce1_RR_33_reclass` posee siete (7) categorías pero nos interesa únicamente diferenciar entre colinas, relieve de transición y relieve de disección profunda. Es decir crear un mapa reclasificado de relieve relativo con tres categorías.

En este caso, se trata de simplificar un mapa reclasificado existente: Elaborar un mapa reclasificado mas simple a partir de otro mapa
reclasificado.

Se elabora en gedit la nueva tabla de reclasificación y se guarda con un nombre.

~~~ RCLS_porce1_RR_simplif
1 2 3 = 1
  4   = 2
5 6 7 = 3
~~~

Se aplica el comando de reclasificación.

~~~
r.reclass input=porce1_RR_33_reclass output=porce1_RR_33_reclass_simplif rules=RCLS_porce1_RR-simplif
~~~

<!--- d.rast porce1_RR_33_reclass_simplif -->

![2D](/cartografia-digital/images/porce1_RR_33_reclass_simplif.png){: .img-responsive}

En vista 3D se obtiene:

<!--- ~~~
nviz porcecito1 color=porce1_RR_33_reclass_simplif
~~~ -->

![3D](/cartografia-digital/images/porce1_RR_33_reclass_simplif3D.png){: .img-responsive}

## Tarea 4
{: .text-danger}

Elaborar el mapa de relieve relativo del archivo “ituango”. 
Utilizando la referencia para clasificar el relieve relativo que se presenta en esta clase, 
entregar los siguientes productos:

1. Un mapa 2D de los valores de relieve relativo con variación gradual del color, 
   empleando tres colores, un color para el valor mas bajo de RR, 
   un segundo color para el valor de mediana del relieve relativo 
   y un tercer color para el valor máximo de relieve relativo. 
   El objetivo es seleccionar tres colores que permitan una visualización óptima del relieve relativo en el archivo.

2. Reclasificar el mapa de relieve relativo y emplear la variación 
   gradual del color para diferenciar y contrastar
   los relieves de montaña y los relieves de colinas en el archivo.

3. Entregar una tabla (utilizar LibreOfficeCalc) indicando
   la extensión y el porcentaje de cada uno de los tipos
   de relieve identificados en el archivo “ituango”.
  
4. Un guión en donde se muestre el procedimiento documentado para obtener
 la información requeridad para desarrollar los puntos anteriores. 


