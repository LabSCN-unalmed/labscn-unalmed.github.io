---
layout: clase
title: 'El uso del color como herramienta para analizar y visualizar la estructura de datos altitudinales en un DEM'
curso: 'cartografia-digital'
clase: 3
---

Fundamentos teóricos
--------------------

Los colores se pueden describir con base en la combinación de unos colores primarios.

En GRASS se emplea la combinación RGB (Red, Green, Blue) para describir cualquier tonalidad.

Cada uno de estos colores base presenta 255 valores diferentes.

Un color por lo tanto se obtiene como una combinación de valores para *rojo*, *verde*, y *azul*.

Evaluar distintas combinaciones empleando el programa “gcolor2”: Aplicaciones &rarr; Gráficos &rarr; Gcolor2

![Selector de color gcolor2](/cartografia-digital/images/gcolor2.png){: .img-responsive}

*¿Qué pasa si mantenemos constante el valor de R y G y se disminuye gradualmente el valor de B?*

| R | G |  B  |    Color   |
|:-:|:-:|:---:|:-----------|
| 0 | 0 | 255 |Azul intenso|
| 0 | 0 | 190 |Azul marino |
| 0 | 0 | 128 |Azul rey    |
| 0 | 0 |  65 |Azul oscuro |
| 0 | 0 |   0 |Negro       |
{: .table .table-hover}

En la combinación `"0:0:255"` se tiene un color azul intenso. A medida que se disminuye el valor de B, el color azul se va tornando mas oscuro. La combinación final `"0:0:0"` corresponde al color negro.

Las combinación `"0:0:255"` ubica el punto de los colores en el centro de la franja del circulo de colores correspondiente a los azules. La combinación `"0:255:0"` ubica el punto en el centro de la franja correspondiente a los “verdes” y la combinación `"255.0:0"` ubica el punto en el centro de la franja correspondiente a los rojos.

La combinación de dos colores manteniendo el otro valor en cero (0) hace variar la posición del punto del color a lo largo de la circunferencia externa de los colores.

Cuando se emplean valores entre 0 y 255 para R, G y B se obtienen diveros colores, predominando el color con mayor valor sobre los demás:

`49:100:200`: El valor mayor corresponde al azul.

`49:200:100`: El valor mayor corresponde al verde.

Cuando los tres valores son iguales pero diferentes de `"0:0:0"` (negro) y `"255:255:255"` (blanco) se obtienen colores en tonalidades de gris desde un gris muy oscuro, como en la combinación `"100:100:100"`, hasta tonalidades de un gris muy claro como en la combinación `"200:200:200"`

#### Un ejercicio:

Construir dos tablas de colores personales para emplear en el despliegue de los mapas a construir:

- Una primera tabla con colores de verde que vayan desde el verde claro con algo de amarillo y termine con un color verde algo oscuro.
- Una segunda tabla que combine colores pastel contrastados (verdes y morados, por ejemplo).

### Recomendaciones en el manejo del color de los mapas

El uso de una paleta de colores especifica tiene una gran influencia sobre la visualización de los mapas.

Los colores muy oscuros aplicados a una zona muy extensa no permiten visualizar la diversidad mórfica de un territorio. Sin embargo, un color oscuro aplicado a un rasgo muy sutil donde la zona circundante se encuentra en un color muy claro permite resaltar dicho rasgo.

Un uso adecuado de colores contrastantes permite visualizar adecuadamente la estructura del relieve.

Los colores disponibles en GRASS
--------------------------------

Para conocer los nombres disponibles mas inmediatos:

~~~
d.colorlist
~~~

Asignación de color por tablas predefinidas
-------------------------------------------

Existe en GRASS un conjunto de tablas preestablecidas que se pueden aplicar a un mapa dado.

El comando `r.colors` permite crear o modificar la tabla de colores asociada a un mapa raster. En este comando, el parámetro “color” permite seleccionar una tabla especifica de unas 30 tablas disponibles.

Vamos a utilizar algunas tabla de colores preestablecidas.

### La tabla de colores “aspect”

~~~
r.colors map=porcecito1 color=aspect
~~~

![La tabla de colores "aspect"](/cartografia-digital/images/porcecito_aspect.png){: .img-responsive}

*¿Qué rasgos de la región resaltan con esta tabla de colores?*

### La tabla de colores “bcyr”

~~~
r.colors map=porcecito1 color=bcyr
~~~

![La tabla de colores "bcyr"](/cartografia-digital/images/porcecito_bcyr.png){: .img-responsive}

### La tabla de colores “elevation”

~~~
r.colors map=porcecito1 color=elevation
~~~

![La tabla de colores "elevation"](/cartografia-digital/images/porcecito_elevation.png){: .img-responsive}

### La tabla de colores “rainbow”

~~~
r.colors map=porcecito1 color=rainbow
~~~

![La tabla de colores "rainbow"](/cartografia-digital/images/porcecito_rainbow.png){: .img-responsive}

Asignación de color creando una tabla personalizada
---------------------------------------------------

Ahora vamos a avanzar un paso más; no vamos a depender de las paletas de colores preestablecidas por GRASS sino que construimos la tableta a  nuestro gusto y también vamos a decidir a cuales rangos de la altitud la aplicamos.

Para llevarlo a cabo necesitamos conocer:

- Cual es la altitud máxima y la altitud mínima del mapa.
- Como queremos desplegar el color en el mapa.

Para conocer los valores máximo y minimo de altitud utilizamos un comando especifico.

La segunda inquietud es mas compleja porque existen diversas maneras de hacerlo:

- Variación gradual del color.
- Variación discreta del color.
- Colores a partir de otro mapa raster.

### Conocer los estadísticos básicos del mapa

Existe el comando `r.univar` que permite conocer los estadísticos básicos de cualquier tipo de mapa raster. Como tenemos un mapa de altitudes, con el comando podemos conocer:

- El N° total de píxeles.
- El N° de píxeles nulos (aquellos píxeles que carecen de valor).
- El N° de píxeles no-nulos.
- El valor mínimo de los píxeles.
- El valor máximo.
- El rango de variación de los píxeles.
- El valor promedio.
- Otros parámetros.

~~~
r.univar porcecito1
~~~

### Crear una tabla de colores en gedit con variación gradual del color y asignarle una identificación

#### ¿Qué significa “con variación gradual del color”?

Si a la altitud 1000 msnm le asignamos el color *rojo* y a la altitud 2000 msnm le asignamos el color *amarillo*, la variación gradual del color significa que a los píxeles en el rango 1000-2000 les asigna colores intermedios entre rojo y amarillo dependiendo de la cercanía altitudinal los dos extremos conocidos. Por lo tanto muchos píxeles tendrán colores en la tonalidad del *naranja* que es el color correspondiente a la recombinación variable de *rojo* y *amarillo*.

Pasos a seguir:

1. Abrimos el gedit.
2. Elaboramos una tabla de colores con variación gradual, indicando en cada línea la altura y el color.
3. Guardamos el archivo con el nombre `TC_porce1`. Si el archivo escrito queda en el espacio de trabajo del GRASS, entonces cargamos la tabla de colores con el comando `r.colors`.

#### Primera versión

`TC_porce1`

~~~
958  blue
975  cyan
1100 green
1300 yellow
2000 red
2500 brown
2873 aqua
~~~

~~~
r.colors map=porcecito1 rules=TC_porce1
~~~

![Primera versión](/cartografia-digital/images/TC_porce1.png){: .img-responsive}

Lo mas seguro es que la primera definición de la tabla de colores no nos satisface.

Mirando el mapa y teniendo el archivo abierto en gedit al lado, le hacemos las modificaciones que se requieran y luego volvemos a repetirlo. Hacemos esta operación varias veces hasta conseguir un mapa que nos agrade.

#### Segunda versión

`TC_porce2`

~~~
958  cyan
1000 blue
1300 green
1600 yellow
2000 red
2300 brown
2500 black
2873 aqua
~~~

~~~
r.colors map=porcecito1 rules=TC_porce2
~~~

![Segunda versión](/cartografia-digital/images/TC_porce2.png){: .img-responsive}

#### Tercera versión

`TC_porce3`

~~~
958  cyan
1000 blue
1300 green
1800 yellow
2000 red
2200 brown
2400 black
2873 aqua
~~~

~~~
r.colors map=porcecito1 rules=TC_porce3
~~~

![Tercera versión](/cartografia-digital/images/TC_porce3.png){: .img-responsive}

**Un primer descreste:** Con el comando `nviz` visualizar lo hecho. La diferencia entre una observación 2D del relieve y una observación 3D del mismo.

![Visualización del relieve en 3D utilizando nviz](/cartografia-digital/images/porcecito3D.png){: .img-responsive}

**NOTA:** Hemos utilizado la idea de variación gradual del color pero nos restringimos a los colores que por nombre identifica el GRASS.

#### Cuarta versión:

Utilizando nombres y la nomenclatura RGB.

`TC_porce4`

~~~
958  blue
980  cyan
1100 orange
1200  14  92   4 # verde muy oscuro
2000 156 235 173 # verde muy claro
2100 145  11  21 # rojo muy oscuro
2500 247 151 158 # rojo muy claro
2750 160  61  12 # café oscuro
2873 aqua
~~~

~~~
r.colors map=porcecito1 rules=TC_porce4
~~~

![Cuarta versión](/cartografia-digital/images/TC_porce4.png){: .img-responsive}

### Crear tabla de colores en gedit con variación discreta del color

En este caso, se trata de definir rangos altitudinales discretos (un comienzo y un final y a los píxeles en el rango se les asigna un mismo color).

`TC_porce5`

~~~
958  237 210 164 # cafe claro
1049 237 210 164
1050 172 133  67 # cafe más oscuro
1799 172 133  67
1800 green
2349 green
2350 blue
2499 blue
~~~

~~~
r.colors map=porcecito1 rules=TC_porce5
~~~

![Variación discreta de color por altitud](/cartografia-digital/images/TC_porce5.png){: .img-responsive}

En la tabla antes creada (`TC_porce5`) no se cubre todo el rango altitudinal del archivo `porcecito1`. Al aplicar el comando `r.colors` sale una advertencia señalando este hecho.

Luego en el mapa desplegado quedarán en blanco los píxeles para el rango altitudinal que no se involucró.

### Utilizar porcentajes de la altitud para distribuir los colores

En este caso iniciamos con un porcentaje del 0% en la altitud mas baja y asignamos el verde. Luego le decimos que al 25% de la altitud llegue con un color verde oscuro (0 160 0) y así se sigue hasta completar el 100%.

#### Primera versión

`TC_porce6`

~~~
0%     0 230   0 # verde
25%    0 160   0 # verde oscuro
55%  120 100  30 # café oscuro
75%  120 130  40 # café-verde
100% 255 255 100 # amarillo claro
~~~

~~~
r.colors map=porcecito1 rules=TC_porce6
~~~

![Primera versión](/cartografia-digital/images/TC_porce6.png){: .img-responsive}

#### Segunda versión

`TC_porce6a`

~~~
0%    99 158 245 # azul claro
20%    8  52 116 # azul mucho mas oscuro
40%  235 231  47 # amarillo
60%   14  92   4 # verde muy oscuro
80%  247 151 158 # rojo muy claro
100% 145  11  21 # rojo muy oscuro
~~~

~~~
r.colors map=porcecito1 rules=TC_porce6a
~~~

![Segunda versión](/cartografia-digital/images/TC_porce6a.png){: .img-responsive}

#### Versión Final

Después de varias modificaciones terminamos con esta combinación:

`TC_porce7`

~~~
0%    99 158 245 # azul claro
3%     8  52 116 # azul mucho mas oscuro
15%  235 231  47 # amarillo
30%   14  92   4 # verde muy oscuro
75%  247 151 158 # rojo muy claro
90%  145  11  21 # rojo muy oscuro
100% black
~~~

~~~
r.colors map=porcecito1 rules=TC_porce7
~~~

![Versión Final](/cartografia-digital/images/TC_porce7.png){: .img-responsive}

### Crear una nueva carpeta para guardar las tablas de colores creadas

Durante las sesiones en GRASS creamos numerosas y diversas tablas de colores. Por omisión, el sistema las guarda en la carpeta personal (usuario). Es recomendable crear una nueva carpeta (directorio) dentro de la carpeta personal de usuario para guardar allí todas las tablas de colores creadas. Al hacer esto, es necesario indicar al comando que toma el “script” que éste se encuentra en una carpeta diferente a la personal.

Si no señalamos donde se encuentra el script, al aplicar el comando sale el error:

~~~
r.colors map=porcecito1 rules=TC_porce7
~~~

`ERROR: No se puede cargar el archivo de reglas <TC_porce7>`

El archivo sí existe pero se encuentra en otro directorio. Debemos indicar en qué carpeta se encuentra el archivo.

~~~
r.colors map=porcecito1 rules=TablasColores/TC_porce7
~~~

Asignar a un mapa la tabla de colores de otro mapa
--------------------------------------------------

La tabla de colores de un mapa dado que nos parece acertada se puede asignar a otro mapa. Los resultados obtenidos no necesariamente son similares en calidad a lo desplegado en el mapa inicial.

Un ejemplo:

- Hacer copia del mapa `ituango` que está en el mapset `PERMANENT` en el mapset `CursoGrass`.
- Colocar la región de despliegue al mapa ituango.
- Desplegar la copia creada para ver sus colores.
- Cambiar la tabla de colores del mapa ituango copiándola del mapa `porcecito1`.

La secuencia de ordenes en GRASS es la siguiente:

~~~
g.list rast
g.copy rast=ituango,ituan
g.region rast=ituan
d.rast ituan
r.colors map=ituan raster=porcecito1
~~~

![Antes](/cartografia-digital/images/ituan.png){: .img-responsive}

![Después](/cartografia-digital/images/ituan_porce1.png){: .img-responsive}

*¿Por qué aparecen zonas en el mapa `ituan` que no presentan color? ¿Cómo explicarlo?*

### Eliminar la tabla de colores traída de porcecito y aplicada a ituan

Se puede eliminar la tabla traída de otro mapa y desplegar la tabla inicial de colores que tenía el mapa.

~~~
r.colors -r ituan
~~~

Actividad extracurso
--------------------

1. Pasar los mapas `ituango` y `riogrande_sup` de integer a double precision. (Los mapas en double precision, son los que se van a seguir empleando en las próximas sesiones).
2. Crear una copia del mapa ituango y asignarles a cada uno tablas de colores diferentes, con los mismos rangos altitudinales y colores diferentes. Evaluar la calidad de la visualización.
3. Calcular la extensión en km<sup>2</sup> y número píxeles en el mapa ituango para los terrenos localizados por encima de los 3.000 msnm y por debajo de los 500 msnm, de la manera más aproximada posible.
