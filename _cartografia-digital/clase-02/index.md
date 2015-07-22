---
layout: clase
title: 'Sesión introductoria a GRASS GIS'
curso: 'cartografia-digital'
clase: 2
---

Iniciando desde GRASS
---------------------

*[GRASS GIS]: Geographic Resources Analysis Support System

Al abrir GRASS GIS, se inicia una terminal de comandos y aparece la siguiente ventana de inicio:

![Ventana de inicio de GRASS](./images/grass_start.png){: .img-responsive}

#### ![](./images/circle_1.png) Seleccionar el directorio de datos SIG

Los datos de GRASS se almacenan en un directorio al cual se le conoce como una base de datos SIG (GISDBASE). Dentro de esta base de datos SIG, se encuentran organizados los proyectos como subdirectorios llamados LOCATIONs.

#### ![](./images/circle_2.png) Seleccionar la locación del proyecto (LOCATION)

Un LOCATION se define por su sistema de coordenadas, proyección y límites geográficos. Los subdirectorios y archivos que definen un LOCATION son creados automáticamente cuando GRASS se inicia la primera vez con un nuevo LOCATION. Es importante comprender que cada proyección permanece en su propio LOCATION.

#### ![](./images/circle_3.png) Seleccionar el directorio de mapas (MAPSET)

Cada LOCATION puede tener múltiples MAPSET. Cada MAPSET es un subdirectorio de un LOCATION. Se pueden crear nuevos MAPSET desde la ventana de inicio de GRASS.

#### ![](./images/circle_4.png) Asistente de localizaciones

El asistente de localizaciones permite crear fácilmente un nuevo LOCATION, a partir de un archivo georeferenciado, o definiendo los parámetros manualmente, o a partir del código de proyección EPSG.

#### ![](./images/circle_5.png) Iniciar GRASS

Una vez se hayan seleccionado el LOCATION y el MAPSET, se puede iniciar GRASS.

Para el caso del presente curso será necesario crear un MAPSET con el nombre del estudiante e iniciar GRASS en el LOCATION CursoGrass y el MAPSET recién creado.

Al iniciar GRASS se abrirán 2 ventanas adicionales a la terminal de comandos: una ventana de administración de capas y una ventana para la visualización de mapas.

Adicionalmente se recomienda abrir el gedit para registrar los comandos utilizados en la terminal, a manera de guión o script.

Durante el desarrollo de los ejercicios del curso, se utilizará la terminal para realizar todo el trabajo de procesamiento, y la interfaz gráfica se utilizará para la visualización.

Este es el aspecto del entorno de trabajo:

![Entorno de trabajo del GIS GRASS](./images/grass_workspace.png){: .img-responsive}

La terminal de comandos en GRASS
--------------------------------

![La terminal de comandos de GRASS](./images/grass_terminal.png){: .img-responsive} **¡Sacar la imágen de la terminal aislada!**

Observar como ahora en la terminal aparece el siguiente prompt de GRASS:

~~~
GRASS 6.4.3 (CursoGrass):~ >
~~~

La terminal de comandos en GRASS funciona con el mismo intérprete que la terminal de GNU/Linux, por lo que todos los comandos de GNU/Linux (como por ejemplo los vistos en la clase anterior) funcionan dentro de GRASS, y además, los comandos propios de GRASS conservan una [sintaxis muy similar a la de los comandos GNU/Linux](../clase-01/#sintxis-bsica-de-los-comandos-en-la-terminal-de-gnulinux):

~~~
> x.comando -opciones parametro1=mapa1 parametro2=mapa2
~~~

De manera que `x` indica el tipo de comando que será utilizado.

### La taxonomía de comandos en GRASS

Los comandos en GRASS se organizan de acuerdo con la función que realizan:

g.*
: Comandos **generales**, con ellos se realizan operaciones generales a los archivos.

r.*
: Comandos de procesamiento 2D en archivos de tipo **raster**.

v.*
: Comandos de procesamiento de archivos de tipo **vectorial**.

i.*
: Comandos de procesamiento de **imágenes**.

db.*
: Comandos para el manejo de **bases de datos**.

### ¿Cuáles serían los comandos mas básicos estando en GRASS?

- Conocer que archivos raster hay en el sistema para trabajar.

~~~
g.list type=rast
~~~

~~~
~~~
{: .output}

- Copiar un archivo que se encuentra en el mapset `PERMANENT` para tenerlo disponible en el mapset donde se encuentra el usuario.

~~~
g.copy rast=porcecito@PERMANENT,porcecito
~~~

~~~
~~~
{: .output}

- Cambiarle el nombre a un archivo raster (un mapa).

~~~
g.rename rast=porcecito,porcecito_copia
~~~

~~~
~~~
{: .output}

- Borrar un mapa (archivo) del mapset activo.

~~~
g.remove rast=porcecito_copia
~~~

~~~
~~~
{: .output}

- Ajustar la región a un mapa raster.

~~~
g.region rast=porcecito
~~~

~~~
~~~
{: .output}

La interfaz gráfica de GRASS
----------------------------

Tomado del [manual de GRASS](http://grass.osgeo.org/grass64/manuals/wxGUI.html).

La interfaz gráfica está compuesta por 2 ventanas:

* El **Administrador de Capas**
* El **Visualizador de Mapas**

### Administrador de Capas

El administrador de capas constituye una herramienta para crear y administrar monitores (Displays). Contiene una barra de herramientas para manejar las capas desplegadas, y un marco de capas en donde se organizan las capas a desplegar, utilizando pestañas para cada monitor.

![Administrador de Capas](./images/grass_layer_manager.png){: .img-responsive} **¡Sacar la imágen del layer manager aislada!**

#### Barra de herramientas del administrador de capas

![Abrir nuevo monitor](./images/monitor-create.png) Abrir nuevo monitor
: Abre una ventana de visualización de mapas adicional y crea una pestaña en la ventana de administración de capas.

![Crear un nuevo espacio de trabajo](./images/create.png) Crear un nuevo espacio de trabajo
: Quita todas las capas del árbol de capas.

![Abrir espacio de trabajo](./images/open.png) Abrir espacio de trabajo
: Abre un archivo de espacio de trabajo, que contiene un conjunto de capas con sus respectivas opciones.

![Guardar espacio de trabajo](./images/save.png) Guardar espacio de trabajo
: Guarda el conjunto actual de capas y sus respectivas opciones en un archivo.

![Cargar mapas al espacio de trabajo](./images/layer-open.png) Cargar mapas al espacio de trabajo
: Carga mapas raster o vectoriales seleccionados.

![Agregar capa de mapa raster](./images/layer-raster-add.png) Agregar capa de mapa raster
: Agrega

![](./images/layer-raster-more.png)
:

![](./images/.png)
:

![](./images/.png)
:

![](./images/.png)
:

![](./images/.png)
:

### La región de trabajo

Teniendo la región predeterminada que se define para el location **CursoGrass**, utilizando la opción `-d`, desplegar los tres mapas que se tienen en el mapset `PERMANENT`:

~~~
g.region -d
d.rast porcecito
d.rast -o ituango
d.rast -o riogrande_sup
~~~

![Despliegue de varios mapas simultáneamente](/cartografia-digital/images/cursograss.png){: .img-responsive}

La opción `-o` se utiliza para desplegar mapas superpuestos en el monitor activo.

Los tres mapas o archivos se pueden desplegar en el monitor y pueden salir porque la región con que se define el location "CursoGrass" abarca una región mas amplia.

Ahora vamos a modificar la región de trabajo para que todo el espacio del monitor de visualización esté ocupado por uno de los mapas que se seleccione.

~~~
g.region rast=porcecito
d.rast porcecito
~~~

![Porcecito](/cartografia-digital/images/porcecito.png){: .img-responsive}

~~~
g.region rast=ituango
d.rast ituango
~~~

![Ituango](/cartografia-digital/images/ituango.png){: .img-responsive}

### Consulta del historial de los comandos usados

El historial no se conserva cuando se trabaja con la interfaz gráfica. Desde la terminal se puede consultar con el siguiente comando:

~~~
history
~~~

Y si se quiere almacenar en un archivo de texto para su posterior consulta:

~~~
history > clase1.txt
~~~

**Advertencia:** El nombre del archivo destino no debe contener espacios.
{: .alert .alert-warning}

### Consultar la documentación de los comandos

Se puede consultar la documentación de los comandos para saber qué parámetros requieren y cuales son opcionales, así como sus funciones.

~~~
g.copy help
d.rast help
r.in.gdal help
~~~

De igual manera se puede abrir una documentación más completa en el
navegador web con el comando `g.manual`:

~~~
g.manual -i &
~~~

Esto abre el índice (parámetro `-i`) de la documentación, el ampersand "&" se utiliza para poder continuar escribiendo comandos sin que se cierre el navegador.

También se pueden abrir directamente los manuales de comandos específicos:

~~~
g.manual g.copy &
g.manual d.rast &
g.manual r.in.gdal &
~~~

Iniciamos trabajo
-----------------

- Abrir la maquina virtual.
- Iniciar el GIS GRASS.
- Ubicarse en el mapset *CursoGrass*
- ¿Existen mapas en este lugar de almacenamiento? ¿SI? ¿NO?
- Evitar la realización de operaciones con los archivos almacenados en el mapset `PERMANENT`.

### Crear una copia de un archivo que se encuentra en el mapset PERMANENT

Se crean dos mapas (solamente como procedimiento de aprendizaje).

Un primer mapa lo vamos a denominar `porcecito1` y el otro como `porcecito_temp`.

~~~
g.copy rast=porcecito,porcecito1
g.copy rast=porcecito,porcecito_temp
~~~

### Borrar un mapa del mapset activo

~~~
g.remove porcecito_temp
~~~

Comprobar si se removió el archivo no deseado. ¿Cómo hacerlo?

### Cambiarle el nombre a un archivo raster (un mapa)

El archivo que se encuentra en el mapset `CursoGrass` se llama `porcecito1` pero quisiera ponerle otro nombre cualquiera. Por ejemplo añadirle ese "1" para diferenciarlo del mapa que se encuentra en el mapset `PERMANENT`. Son dos mapas ubicados en dos sitios diferentes. También podría denominarlo `porcecito_copia`.

Si se le asigna el mismo nombre que se tiene en `PERMANENT`, el sistema envía una advertencia subrayando este hecho: similitud de nombres.

~~~
g.rename rast=porcecito1,porcecito
~~~

Cambiemos el nombre y luego lo recuperamos.

~~~
g.rename rast=porcecito1,porcecito_copia
~~~

Comprobar:

~~~
g.list rast
~~~

Volvamos al nombre inicial para economizar tiempo de escritura.

~~~
g.rename rast=porcecito_copia,porcecito1
~~~

El uso de ayudas
----------------

De manera intuitiva ya sabemos que escribimos la orden `d.mon x0` se despliega el monitor identificado con el nombre `x0`. Existen 8 monitores disponibles, desde el `x0` hasta el `x7`.

### El contenido de un comando

Si escribimos la siguiente orden, vamos a recibir información resumida acerca de lo que se puede hacer con este comando.

~~~
d.mon help
~~~

Colocando al final de cada comando de GRASS la palabra "help", obtenemos información acerca de lo que puede realizar cada comando.

La ayuda incluye:

**Descripción:** En pocas palabras dice lo que se puede hacer con el comando.

**Palabras claves:** Palabras indicadoras de la operación que realiza el comando.

**Uso:** Indica la manera como se debe escribir la orden para que el computador la comprenda y la pueda llevar a cabo. El uso es por lo tanto la sintaxis del comando: La manera como deben ir las letras, las palabras, los signos y los espacios para que el mensaje pueda entenderse por el sistema GRASS.

**Opciones:** El SIG GRASS emplea el signo ‘-’ acompañado de letras como opciones para el usuario si desea que se despliegue el resultado de una acción o que no se despliegue.

**Parámetros:** Hace referencia a una acción o a un objeto (archivo) que se desea hacer o desplegar respectivamente.

### Explorar las potencialidades del comando d.mon

Vamos a explorar algunas de las acciones que se pueden realizar con el comando `d.mon`.

- Mostrar todas las opciones que se pueden realizar: crear archivos PNG, desplegar monitores, etc.

~~~
d.mon -l
~~~

- Indicar cuales acciones están activas y cuales están inactivas.

~~~
d.mon -L
~~~

- Imprimir el nombre del monitor seleccionado actualmente.

~~~
d.mon -p
~~~

**NOTA:** Es necesario estudiar todas las opciones que brindan los diferentes comandos que se utilizan en una sesión de trabajo para utilizar eficientemente el SIG GRASS.

Ampliar una zona de interés en un mapa
--------------------------------------

Desplegamos un mapa.

~~~
d.rast porcecito1
~~~

Entramos al modo de ampliación con el siguiente comando:

~~~
d.zoom
~~~

Sale una leyenda que indica como realizar una ampliación de una parte del mapa. El botón de la izquierda para señalar la primera esquina, el boton del medio para quitar el efecto de ampliación, y el botón de la derecha para salir del modo de ampliación.

~~~
Buttons:
Left:   1. corner
Middle: Unzoom
Right:  Quit
~~~

Una vez se señala la primera esquina haciendo click izquierdo en el monitor, se despliegan en la terminal de comandos las coordenadas planas del punto, y una leyenda que indica las nuevas opciones:

El botón de la izquierda para cambiar la posición de la primera esquina, el botón del medio para señalar la segunda esquina y completar así la ampliación, y el botón de la derecha para salir del modo de ampliación.

~~~
Buttons:
Left:   1. corner (reset)
Middle: 2. corner
Right:  Quit
~~~

Luego con el botón del centro del ratón se indica la esquina diagonal opuesta para delimitar el rectángulo que se desea ampliar. Una vez hecho se despliegan las coordenadas planas de este segundo punto.

Finalmente se despliegan en la terminal las coordenadas de las lineas que delimitan el rectangulo.

Finalmente se hace click con el botón derecho en cualquier lugar del monitor para salir del modo de ampliación.

Cuando se hacen estas acciones se termina teniendo únicamente la zona de interés en el monitor desplegado.

Puede ocurrir que nuestro interés no sea en la totalidad de un mapa sino únicamente en una porción de él. Por lo tanto se ahorra procesamiento y almacenamiento si las actividades posteriores se llevan a cabo en este "pedazo" o porción. Por lo tanto, es recomendable tener el "pedazo" como una región de trabajo o un nuevo mapa.

### Primera opción: Modificando la región

En este caso se construye una nueva región de despliegue en lugar de crear un nuevo mapa.

Primero se ajusta la región al mapa mayor y se despliega.

~~~
g.region rast=porcecito
d.rast porcecito
~~~

Con el comando `d.zoom` se selecciona la zona de interés.

~~~
d.zoom
~~~

Una vez que se tiene la zona de interés desplegada en el monitor, 'asegurar' y 'guardar' la región desplegada.

~~~
g.region save=porcecito_pedazo
g.list region
~~~

Ahora con la 'región' asegurada y guardada se llama y se despliega el mapa `porcecito`.

~~~
g.region region=porcecito_pedazo
d.rast porcecito
~~~

![Despliegue de una subzona del mapa Porcecito](/cartografia-digital/images/porcecito_zoom.png){: .img-responsive}

### Segunda opción: Construir un nuevo mapa

Empleamos un comando muy importante (se estudiará en detalle mas adelante): `r.mapcalc`

Sintaxis básica:

`r.mapcalc 'mapa_a_crear=mapa_inicial'`

~~~
r.mapcalc 'porcecito_pdzo=porcecito1'
~~~

Ahora tenemos en el mapset `CursoGrass` dos mapas diferentes. ¿Cómo confirmarlo?

Exploración de la información en el DEM
---------------------------------------

Un comando de uso intensivo en GRASS es `d.rast`. Se emplea para desplegar mapas en un monitor que se encuentre disponible para el despliegue.

Desplegar solamente los valores de altitud ubicados dentro de un rango.

~~~
d.rast map=porcecito val=1000-1500
~~~

`ADVERTENCIA: Ignorando lista de valores: el mapa es entero (por favor usar 'cat=')`

~~~
d.rast map=porcecito cat=1000-1500
~~~

![1000-1500](/cartografia-digital/images/porcecito_1000_1500.png){: .img-responsive}

~~~
d.rast map=porcecito cat=2000-2300
~~~

![2000-2300](/cartografia-digital/images/porcecito_2000_2300.png){: .img-responsive}

En este punto de la sesión de trabajo surge un interrogante: No se pueden desplegar valores (vallist), pero si se pueden desplegar categorías (catlist).

*¿Cuál es la diferencia entre "values" y "categories" en un archivo raster?*

Para desplegar el segundo rango borra el primer rango. ¿Qué hacer para tener los dos o más rangos que se desean desplegar?

~~~
d.rast map=porcecito catlist=1000-1500
d.rast map=porcecito catlist=2000-2300 -o
~~~

![Despliegue simultáneo de dos rangos altitudinales](/cartografia-digital/images/porcecito_1000_2300.png){: .img-responsive}

Este ejercicio tiene una limitación importante: Desconocemos en este punto cual es el valor de altitud máxima y el valor de altitud mínima para seleccionar rangos de manera adecuada.

Comandos de consulta del mapa
-----------------------------

### Conocer el valor de un píxel y sus respectivas coordenadas

Se trata de un comando interactivo: Se escribe la orden en la terminal de comandos y aparecen unas indicaciones para que se vaya al mapa desplegado en el monitor y con los botones del ratón se realice una selección y la respuesta se obtiene en la terminal de comandos.

~~~
d.what.rast porcecito
~~~

Con la ayuda de los colores del mapa trate de identificar los valores mayores y menores de altitud en el mapa desplegado.

Utilizar el botón derecho del ratón para salir de la situación interactiva y retornar a la terminal de comandos para continuar.

### Identificar las coordenadas de un punto

El siguiente comando permite identificar las coordenadas planas de un punto.

~~~
d.where
~~~

La opción `-1` se utiliza para identificar un sólo punto y salir del comando.

~~~
d.where -1
~~~

Si se agrega la opción `-l` también permite identificar las coordenadas geográficas en formato "Grados:Minutos:Segundos".

~~~
d.where -1l
~~~

Agregándole la opción `-d` muestra las coordenadas geográficas en formato decimal.

~~~
d.where -1ld
~~~

### Visualizar los valores de los píxeles de un zona determinada: Observar visualmente la estructura raster del archivo

Desplegar el mapa de interés, por ejemplo, `porcecito`.

~~~
d.rast porcecito
~~~

Hacer zoom en una zona muy pequeña.

~~~
d.zoom
~~~

Repetir la acción de zoom hasta que se logren percibir los píxeles (un aspecto de retícula grande en el monitor)

Una vez el reticulado es lo suficientemente grande, escribir el siguiente comando para ver en la retícula los valores de cada píxel:

~~~
d.rast.num porcecito
~~~

![Retícula con valores de altitud en cada píxel](/cartografia-digital/images/porcecito_small.png){: .img-responsive}

### Reporte de la información contenida en el mapa

El comando `r.report` permite obtener información estadística básica del mapa ráster que se consulta.

El comando `r.report` require que el usuario entre alguna información para poder realizar la tarea. Le decimos que las unidades de las estadisticas vayan en numero de píxeles `c`, en porcentaje `p` y en kilometros cuadrados `k`, y que realice la segmentacion de las altitudes en 10 rangos de altitud.

~~~
r.report -h map=porcecito units=c,p,k nsteps=10
~~~

Observar que pasa cuando los valores del mapa se encuentra en enteros.

No divide en 10 rangos como se le había programado, sino que entrega la información para píxeles que van variando metro a metro, es decir, como enteros.

Al final dice que el archivo contiene 1420848 píxeles que corresponde al 100% y que la extensión del mapa es de 1326.56 km<sup>2</sup>.

El tipo de dato del mapa o archivo vuelve a presentarnos un problema: sabemos que los valores de altitud están en enteros.

Para continuar y superar el problema de la naturaleza de los datos consultemos la información que contiene el archivo.

#### Los metadatos del archivo porcecito

Vamos a consultar cual es la información del mapa (metadatos).

~~~
r.info porcecito1
~~~

La información recibida indica que el tipo de dato es `CELL` que en otros términos quiere decir que los valores de altitud del mapa `porcecito` se encuentran en números enteros. Para trabajar adecuadamente necesitamos transformar estos datos a números decimales para realizar operaciones con el comando `r.report` y otras operaciones posteriores.

#### Transformar los datos de números enteros a números decimales sin alterar los valores del archivo

Pasar el mapa de integer a double precision:

~~~
r.mapcalc 'porcecito1=porcecito*1.0'
~~~

Consultar nuevamente la información del mapa

~~~
r.info porcecito1
~~~

Observar que los datos del archivo se transformaron de `CELL` a `DCELL`.

#### Volver a consultar la información contenida en el mapa porcecito

Reporte con el mapa ya en double precision:

~~~
r.report -h map=porcecito1 units=c,p,k nsteps=10
~~~

*¿Qué información importante obtenemos con el comando `r.report`?*

- Seleccionar a voluntad del usuario el número de rangos altitudinales para obtener los estadísticos del archivo.
- Conocemos los valores mínimo y máximo de la altitud para el archivo en estudio.
- Utilizando el N° de píxeles, el porcentaje y la extensión podemos tener una idea adecuada de la distribución altitudinal en la región que representa el mapa.

Representación gráfica de la distribución altitudinal
-----------------------------------------------------

Una representación gráfica de los valores de altitud en el mapa `porcecito`.

~~~
d.histogram map=porcecito1 nsteps=10
~~~

![Distribución altitudinal en porcecito](/cartografia-digital/images/porcecito_hist.png){: .img-responsive}

Para obtener la imagen en formato PNG, se puede utilizar el comando `d.out.file`.

~~~
d.out.file porcecito_histogram
~~~

Este comando genera el archivo `porcecito_histogram.png` en el directorio actual, con los contenidos del monitor activo.

Presentación de la tabla que se obtiene con r.report
----------------------------------------------------

Guardamos la salida del comando a un archivo de texto utilizando el parámetro "`output`" e indicando el nombre del archivo con la extensión ".csv" para poderlo importar a una hoja de cálculo, y la abrimos en gedit para arreglarla:

~~~
r.report -h map=porcecito1 units=c,p,k nsteps=10 output=porcecito.csv
gedit porcecito.csv
~~~

Borramos las líneas con guiones y organizamos bien las columnas para que sólo queden separadas por el símbolo `|`:

### porcecito.csv

~~~
|           |   Category Information                |   cell|   %  |    square|
|          #|description                            |  count| cover|kilometers|
| 958-1149.5|from  to . . . . . . . . . . . . . . . | 116302|  8.19| 108.58443|
|1149.5-1341|from  to . . . . . . . . . . . . . . . | 138526|  9.75| 129.33369|
|1341-1532.5|from  to . . . . . . . . . . . . . . . | 148585| 10.46| 138.72519|
|1532.5-1724|from  to . . . . . . . . . . . . . . . | 199335| 14.03| 186.10752|
|1724-1915.5|from  to . . . . . . . . . . . . . . . | 219269| 15.43| 204.71874|
|1915.5-2107|from  to . . . . . . . . . . . . . . . | 234964| 16.54| 219.37225|
|2107-2298.5|from  to . . . . . . . . . . . . . . . | 192389| 13.54| 179.62245|
|2298.5-2490|from  to . . . . . . . . . . . . . . . | 131903|  9.28| 123.15018|
|2490-2681.5|from  to . . . . . . . . . . . . . . . |  36297|  2.55|  33.88840|
|2681.5-2873|from  to . . . . . . . . . . . . . . . |   3278|  0.23|   3.06048|
|TOTAL      |                                       |1420848|100.00|1326.56333|
~~~

Abrimos la carpeta personal y abrimos el archivo csv que creamos.

![Importación de texto separado por comas en LibreOffice](/cartografia-digital/images/csv_import.png){: .img-responsive}

En el diálogo que se abre, configuramos las opciones como se ve en la imagen: en las opciones de separador seleccionamos "Separado por" y "Otros" y escribimos el símbolo `|`, seleccionamos las columnas primera y tercera y seleccionamos "Ocultar" en "Tipo de columna".

Organizamos los encabezados y le damos un poco de formato a la tabla, de manera que nos queda algo como en la siguiente tabla:

| Rango altitudinal | No. Píxeles | Porcentaje | Área (km2) |
|:-----------------:|:-----------:|:----------:|:----------:|
|    958   - 1149.5 |      116302 |       8.19 |  108.58443 |
|   1149.5 - 1341   |      138526 |       9.75 |  129.33369 |
|   1341   - 1532.5 |      148585 |      10.46 |  138.72519 |
|   1532.5 - 1724   |      199335 |      14.03 |  186.10752 |
|   1724   - 1915.5 |      219269 |      15.43 |  204.71874 |
|   1915.5 - 2107   |      234964 |      16.54 |  219.37225 |
|   2107   - 2298.5 |      192389 |      13.54 |  179.62245 |
|   2298.5 - 2490   |      131903 |       9.28 |  123.15018 |
|   2490   - 2681.5 |       36297 |       2.55 |   33.88840 |
|   2681.5 - 2873   |        3278 |       0.23 |    3.06048 |
|===================|=============|============|============|
|             TOTAL |     1420848 |     100.00 | 1326.56333 |
{: .table .table-hover}
