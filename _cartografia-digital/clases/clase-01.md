---
layout: clase
title: 'Sesión introductoria a GRASS GIS'
curso: 'cartografia-digital'
clase: 1
---

<!--
title: 'Elementos introductorios'
## Software libre

"Software libre" es el software que respeta la libertad de los usuarios y la comunidad. A grandes rasgos, significa que los usuarios tienen la libertad de ejecutar, copiar, distribuir, estudiar, modificar y mejorar el software. Es decir, el "software libre" es una cuestión de libertad, no de precio. Para entender el concepto, piense en "libre" como en "libre expresión", no como en "barra libre".

Un programa es "software libre" si los usuarios tienen las cuatro libertades esenciales:

* Libertad de ejecutar el programa como se desea, con cualquier propósito.
* Libertad de estudiar como funciona el programa, y cambiarlo para que haga lo que se quiera. El acceso al código fuente es una condición necesaria para ello.
* Libertad de redistribuir copias para ayudar a los demás.
* Libertad de distribuir copias de sus versiones modificadas a los demás. Esto le permite ofrecer a toda la comunidad la oportunidad de beneficiarse de las modificaciones. El acceso al código fuente es una condición necesaria para ello.

Estos principios garantizan que la construcción del software sea realmente accesible a todas las personas y por lo tanto permite desarrollar nuevas tecnologías de manera colaborativa.

El Laboratorio de Sistemas Complejos Naturales apoya esta filosofía en el contexto de la misión de la Universidad Nacional de Colombia, no solamente para sus estudiantes sino para toda la comunidad a la que le debe el conocimiento.

## Introducción a GNU/Linux {#introduccion-gnu-linux}

En entornos GNU/Linux existen interfaces gráficas de usuario (GUI) donde se puede hacer click, arrastrar y, con suerte, se puede lograr mucho sin documentarse primero. Sin embargo, el entorno tradicional es una interfaz de línea de comandos (CLI) donde se escriben comandos que le dicen al computador qué hacer. Lo cual es más rápido y poderoso pero requiere aprender qué hacen los comandos. Esta interfaz de línea de comandos, la llamaremos 'la terminal'.

## Comandos esenciales {#comandos-esenciales}

La terminal es una herramienta muy sencilla pero sumamente poderosa, permite interactuar con el sistema por medio de comandos, en el siguiente ejercicio vamos a aprender los comandos más básicos para desenvolvernos dentro de la terminal.

### El prompt {#prompt}

Se conoce como prompt a una línea de texto que se muestra al comienzo de una terminal de comandos. El prompt indica que la terminal se encuentra disponible y a la espera de una órden (comando) que dará el usuario. En los sitemas GNU/Linux, el prompt luce así:

~~~
usuario@ubuntu:~ $
~~~

Además proporciona información adicional: El usuario `usuario` está en la máquina `ubuntu` y se encuentra en el directorio `~` (el símbolo `~` es una abreviación para la carpeta personal de usuario). El símbolo `$` implica que es un usario regular (sin privilegios de administrador), en el caso del superusuario (con privilegios de administrador) `root` el símbolo sería `#`.

### Sintáxis básica de los comandos en la terminal de GNU/Linux {#sintaxis-basica-comandos-terminal-gnu-linux}

En la terminal, los comandos conservan una estructura de cómo deben ser introducidos para ser interpretados correctamente. En términos genéricos, esta es la estructura para la mayoría de los comandos en GNU/Linux:

~~~
$ comando -opciones parametro1 parametro2 ...
~~~

**Nota:** Observar que los espacios delimitan el comando y los parámetros, es decir, un parámetro no debe contener espacios.
{: .alert .alert-info}

A continuación se enumeran una serie de comandos básicos para el uso en la terminal, con ejemplos ilustrativos de las operaciones que permiten realizar.

### pwd

El comando `pwd` (print working directory) imprime la ruta del directorio actual, es muy conveniente utilizarlo para conocer en qué parte del sistema de archivos se está ubicado:

~~~
pwd
~~~

~~~
/home/usuario
~~~
{: .output}

En la salida del comando `pwd`, vemos lo siguiente:

`/`
: La raíz del sistema de archivos.

`home`
: Directorio que contiene la carpeta personal de cada usuario.

`/`
: Acceso a un subdirectorio dentro de `/home`

`usuario`
: Directorio que contiene la carpeta personal del usuario actual, el nombre coincide con el nombre de usuario.

**Nota:** Con la combinación de `/` y nombres específicos de directorios, se puede acceder a otros subdirectorios del sistema de archivos.
{: .alert .alert-info}

### ls

El comando `ls` (list) imprime una lista del contenido del directorio actual:

~~~
ls
~~~

~~~
01CreacionLocations  04UsoVector  Downloads  Pictures  Shared
02ZonasVida          Desktop      Grass      Public    Templates
03AntioquiaVector    Documents    Music      R         Videos
~~~
{: .output}

El comando `ls` tiene varias opciones que permiten organizar la información brindada, por ejemplo, para ver una lista larga y detallada de los elementos, se utiliza la opción `-l` (long):

~~~
ls -l
~~~

~~~
total 56
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 01CreacionLocations
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 02ZonasVida
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 03AntioquiaVector
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 04UsoVector
drwxrwxr-x 2 usuario usuario 4096 jun 22 15:50 Desktop
drwxr-xr-x 2 usuario usuario 4096 jun 22 16:37 Documents
drwxr-xr-x 2 usuario usuario 4096 jul 29 10:34 Downloads
drwxrwxr-x 3 usuario usuario 4096 abr 24  2014 Grass
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Music
drwxr-xr-x 3 usuario usuario 4096 abr 25  2014 Pictures
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Public
drwxrwxr-x 3 usuario usuario 4096 abr 24  2014 R
lrwxrwxrwx 1 usuario usuario   17 ago  6  2014 Shared -> /media/sf_shared/
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Templates
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Videos
~~~
{: .output}

- La primer columna contiene información del tipo de elemento, es decir, diferencia entre directorio y archivo. Para los directorios la columna inicia con una `d`; para los archivos la columna inicia con un `-`.
- La tercer y cuarta columna contienen información del propietario del elemento.
- La quinta columna contiene información del tamaño del elemento.
- Las columnas sexta, séptima y octava contienen información de la fecha y hora de modificación del elemento.
- La novena y última columna contiene el nombre del elemento.

Opcionalmente, si se quiere ver la lista de un directorio diferente al actual, al comando `ls` se le puede indicar la ruta de dicho directorio como un parámetro, e incluso se pueden especificar las opciones:

~~~
ls -l 02ZonasVida
~~~

~~~
total 1424
-rwxrwxrwx 1 usuario usuario    3330 abr 21  2008 zvidantioq.dbf
-rwxrwxrwx 1 usuario usuario     284 ago 27  2001 zvidantioq.sbn
-rwxrwxrwx 1 usuario usuario     132 ago 27  2001 zvidantioq.sbx
-rwxrwxrwx 1 usuario usuario 1440196 ago 27  2001 zvidantioq.shp
-rwxrwxrwx 1 usuario usuario     228 ago 27  2001 zvidantioq.shx
~~~
{: .output}

### cd

El comando `cd` (change diretory) cambia de directorio, permitiendo ubicarse en una ruta diferente a la actual.

Para acceder al directorio `02ZonasVida`:

~~~
cd 02ZonasVida
~~~

Comprobar la ruta actual con el comando `pwd`. Además el prompt también indicará la ruta actual:

~~~
usuario@ubuntu:~/02ZonasVida $
~~~

Si se desea subir un nivel en el árbol de directorios (es decir, ubicarse en el directorio que contiene al directorio actual):

~~~
cd ..
~~~

Nuevamente comprobar la ruta actual con `pwd` y el prompt.

También se puede ingresar a un directorio varios niveles abajo en el árbol de directorios especificando la ruta:

~~~
cd Grass/CursoGrass/
~~~

Comprobar con `pwd` y observar el cambio en el prompt.

Para ir a la carpeta personal (`/home/usuario`) desde cualquier parte, sólo basta con el comando `cd` sin más parámetros:

~~~
cd
~~~

Nuevamente observar el cambio en el prompt y comprobar con `pwd`.

Y si se quiere volver al directorio anterior sin necesidad de ingresar la ruta completa:

~~~
cd -
~~~

~~~
/home/usuario/Grass/CursoGrass/
~~~
{: .output}

Una vez más, comprobar con `pwd` y observar el cambio en el prompt.

Este último ejemplo, funciona de manera similar al botón "Previous Channel" de los controles remotos de TV.

### mkdir

El comando `mkdir` (make directory) crea un directorio o carpeta.

Para crear el directorio `directorio` en la ubicación actual:

~~~
mkdir directorio
~~~

Este comando también cuenta con una opción bastante útil que permite crear un árbol de directorios de manera simultánea. Por ejemplo, suponiendo que se quiere crear el directorio `ejercicios` y dentro de éste, el subdirectorio `clase1` , se utiliza la opción `-p`:

~~~
mkdir -p ejercicios/clase1
~~~

En consecuencia, el directorio `clase1` está dentro del directorio `ejercicios`, y éste último quedará en el directorio `~` (carpeta personal de usuario) al igual que el directorio `directorio`.

### touch

El comando `touch` crea un archivo vacío. Si el archivo ya existe, el comando actualiza la hora de modificación.

Para crear el archivo `ejercicio1.txt` dentro del directorio actual:

~~~
touch ejercicio1.txt
~~~

Para crear el archivo `ejercicio2.txt` dentro del directorio `clase1` que a su vez se encuentra dentro del directorio `ejercicios`:

~~~
touch ejercicios/clase1/ejercicio2.txt
~~~

### cp

El comando `cp` (copy) permite copiar archivos y directorios, especificando primero el origen y después el destino.

Por ejemplo para copiar el archivo `ejercicio1.txt` al directorio `clase1` dentro de `ejercicios`:

~~~
cp ejercicio1.txt ejercicios/clase1
~~~

Comprobar el contenido de `clase1` utilizando `ls`.

Si se desea cambiar el nombre del destino sólo basta con indicarlo, por ejemplo para copiar `ejercicio1.txt` como `ejercicio3.txt` dentro de `clase1`:

~~~
cp ejercicio1.txt ejercicios/clase1/ejercicio3.txt
~~~

Para copiar directorios incluyendo sus archivos y directorios internos se emplea la opción `-r` (recursive), por ejemplo, para copiar el directorio `clase1` que se encuentra dentro de `ejercicios` como `clase2`

~~~
cp -r ejercicios/clase1 ejercicios/clase2
~~~

Comprobar el contenido de `clase1` y `clase2` utilizando `ls`.

### mv

El comando `mv` (move) permite mover archivos y directorios de una ubicación a otra, por ejemplo:

~~~
mv ejercicio1.txt ejercicios
~~~

De la misma manera que en `cp`, se especifica primero el origen, y luego el destino.

En el caso particular en el que la ubicación es la misma, el archivo o directorio es renombrado:

~~~
mv directorio respaldo
~~~

Comprobar con `ls`.

### rm

El comando `rm` (remove) permite eliminar archivos y directorios.

Para eliminar el archivo `ejercicio1.txt` del directorio `ejercicios`:

~~~
rm ejercicios/ejercicio1.txt
~~~

Comprobar con `ls`.

De manera similar a `cp`, se pueden borrar directorios incluyendo su contenido, utilizando la opción `-r` (recursive):

~~~
rm -r respaldo
~~~

**Advertencia:** Este comando elimina permanentemente los archivos o directorios especificados, utilizar con precaución.
{: .alert .alert-warning}

## Hola mundo {#hola-mundo}

A lo largo del curso se hará uso de archivos de texto con instrucciones que serán ejecutadas una tras otra en el orden en el que se encuentren en el achivo, a estos archivos los llamaremos guiones o "scripts".

Para la creación de estos archivos se puede utilizar el aplicativo gedit, disponible en el menú de aplicaciones de la máquina virtual.

El primer guión a crear en esta clase introductoria será un guión que imprima en pantalla la famosa frase "¡Hola mundo!", para ello, se deberá copiar el siguiente texto en el editor de texto gedit y guardarse con el nombre `holaMundo.sh`.

~~~
# Imprimir el saludo
cowsay "¡Hola mundo!"
~~~

Una vez creado el archivo, se puede ejecutar con el comando `bash`, de la siguiente manera:

~~~
bash holaMundo.sh
~~~

A partir de este punto, se pueden hacer modificaciones al guión, guardar los cambios y ejecutar de nuevo, facilitando la ejecución de los comandos.

**Consejo:** Introducir la opción `-f tux` al comando `cowsay` en el guión y ejecutar nuevamente.
{: .alert .alert-success}

~~~
cowsay -f tux "¡Hola mundo!"
~~~

### Comandos de visualización de archivos de texto {#comandos-visualizacion-archivos-texto}

El comando `cat` (concatenate) permite visualizar el contenido de un archivo de texto sin la necesidad de abrirlo en un editor.

Para ver el contenido del primer guión:

~~~
cat holaMundo.sh
~~~

En el caso de archivos de texto de gran tamaño, existen otros comandos como `head` y `tail`, que permiten visualizar las primeras o las últimas líneas del archivo; o comandos como `more` y `less`, que permiten visualizar los archivos por páginas.

## Ejercicio

Utilizar únicamente la terminal de comandos para el siguiente ejercicio

* Crear un directorio para guardar los guiones o "scripts". El nombre del directorio lo decide el estudiante.

* Crear un archivo dentro de este directorio, con el nombre que desee el estudiante, para en él escribir un nuevo guión similar al "Hola mundo".

* Comprobar los diferentes dibujos (cow files) que tiene el comando `cowsay` utilizando la opción `-l`.

~~~
cowsay -l
~~~

* Abrir el archivo creado en gedit y crear un guión similar al de "Hola mundo", utilizando la opción `-f` del comando `cowsay` para especificar un dibujo personalizado (del gusto del estudiante), y hacer que el saludo sea con el nombre del estudiante.

~~~
cowsay -f <cowfile> "<mensaje>"
~~~

* Ejecutar el script con el comando `bash`.


## Tarea 1
{: .text-danger}

Siguiendo una metodología similar al ejercicio anterior, realizar un guión que muestre la siguiente salida:

~~~
 ______________________________________
/ ¡Fogosa bienvenida al curso de GRASS \
\ GIS!                                 /
 --------------------------------------
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
~~~
{: .output} -->

## Iniciando GRASS

Al abrir GRASS GIS, se inicia una terminal de comandos y aparece la siguiente ventana de inicio:

![Ventana de inicio de GRASS](/cartografia-digital/images/clase-01/grass_start.png){: .img-responsive}

#### ![](/cartografia-digital/images/circle_1.png) Seleccionar la base de datos SIG

Los datos de GRASS se almacenan en un directorio al cual se le conoce como una base de datos SIG (GISDBASE). Dentro de esta base de datos SIG, se encuentran organizados los proyectos como subdirectorios llamados LOCATIONs.

#### ![](/cartografia-digital/images/circle_2.png) Seleccionar el proyecto (LOCATION)

Un LOCATION se define por su sistema de coordenadas, proyección y límites geográficos. Los subdirectorios y archivos que definen un LOCATION son creados automáticamente cuando GRASS se inicia la primera vez con un nuevo LOCATION. Es importante comprender que cada proyección permanece en su propio LOCATION.

#### ![](/cartografia-digital/images/circle_3.png) Seleccionar el directorio de mapas (MAPSET)

Cada LOCATION puede tener múltiples MAPSET. Cada MAPSET es un subdirectorio de un LOCATION. Se pueden crear nuevos MAPSET desde la ventana de inicio de GRASS.

#### ![](/cartografia-digital/images/circle_4.png) Asistente de localizaciones

El asistente de localizaciones permite crear fácilmente un nuevo LOCATION, a partir de un archivo georeferenciado, definiendo los parámetros manualmente, o a partir del código de proyección EPSG.

#### ![](/cartografia-digital/images/circle_5.png) Iniciar GRASS

Una vez se hayan seleccionado el LOCATION y el MAPSET, se puede iniciar GRASS.

Para el caso del presente curso será necesario crear un MAPSET con el nombre del estudiante e iniciar GRASS en el LOCATION CursoGrass y el MAPSET recién creado.

Al iniciar GRASS se abrirán 2 ventanas adicionales a la terminal de comandos: una ventana de administración de capas y una ventana para la visualización de mapas.

<!-- Adicionalmente se recomienda abrir el gedit para registrar los comandos utilizados en la terminal, a manera de guión o script.

Durante el desarrollo de los ejercicios del curso, se utilizará la terminal para realizar todo el trabajo de procesamiento, y la interfaz gráfica se utilizará para la visualización. -->

Este es el aspecto del entorno de trabajo:

![Entorno de trabajo del GIS GRASS](/cartografia-digital/images/clase-01/grass_workspace.png){: .img-responsive}

## La estructura de datos interna de GRASS GIS {#estructura-interna-grass}

![Estructura de datosinterna de GRASS GIS](/cartografia-digital/images/clase-01/help_loc_struct.png){: .img-responsive}

Un LOCATION es simplemente un conjunto de directorios que contienen los datos de un proyecto. Dentro de cada LOCATION existe siempre un MAPSET **PERMANENT** que contiene la información de la proyección y algunas definiciones adicionales. Usualmente se utiliza para almacenar la cartografía básica pues es un MAPSET que siempre está visible.

## El rol del MAPSET PERMANENT

Cuando se crea un LOCATION nuevo, GRASS GIS automáticamente crea un MAPSET especial llamado PERMANENT donde se almacenan los datos centrales del proyecto. Los datos en el MAPSET PERMANENT sólo pueden ser añadidos, modificados o borrados desde el MAPSET PERMANENT; sin embargo, pueden ser visualizados, analizados y copiados a otros MAPSETs. Es útil para proporcionar datos espaciales generales (i.e. el modelo de elevación), que son accesibles pero como sólo lectura. Para manipular o agregar datos al PERMANENT, se debe iniciar GRASS en él. Allí se encuentra el archivo **DEFAULT_WIND**. el cual contiene las coordenadas de los límites de la región del proyecto.

## La interfaz gráfica {#interfaz-grafica}

La interfaz gráfica está compuesta por 2 ventanas:

* El **Administrador de Capas**
* El **Visualizador de Mapas**

### Administrador de Capas

El administrador de capas constituye una herramienta para crear y administrar monitores (displays). Contiene una barra de herramientas para controlar las capas desplegadas, y un marco de capas en donde se organizan las capas a desplegar, utilizando pestañas para cada monitor.

![Administrador de Capas](/cartografia-digital/images/clase-01/grass_layer_manager.png){: .img-responsive}

### Visualizador de Mapas

La ventana de visualización de mapas incluye una barra de herramientas, un espacio en donde se despliegan los mapas, y una barra de estado con información de la región geográfica de los mapas desplegados.

![Visualizador de Mapas](/cartografia-digital/images/clase-01/grass_map_display.png){: .img-responsive}

Cada ventana de visualización de mapas tiene una lista de capas independiente en el administrador de capas.

En la parte superior de la ventana se encuentra una barra de herramientas con botones para manipular el mapa desplegado (ampliación, vista panorámica), consulta y análisis (medir distancia, creación de perfiles e histogramas, agregar elementos al mapa (escala, flecha de norte, leyenda y etiquetas de texto personalizadas), y para exportar o imprimir el monitor.

En la parte inferior de la ventana se encuentra la barra de estado, en ella se puede elegir si presentar las coordenadas bajo el cursor, la extensión de la región actual, la región de cálculo (incluyendo visualización gráfica), la geometría del mapa desplegado (número de fílas, columnas y resolución), y la escala. Marcar la opción de **renderizar** hace que la ventana se actualice automáticamente cada que se añade un mapa, se borra, o se cambia en la lista de capas.

El nivel de acercamiento o "zoom", no incide sobre la región de cálculo establecida.

## La taxonomía de los módulos o comandos {#taxonomia-comandos}

Los comandos en GRASS se organizan de acuerdo con la función que realizan:

g.*
: Comandos **generales**, con ellos se realizan operaciones generales a los archivos.

d.*
: Comandos de **despliegue**.

r.*
: Comandos de procesamiento 2D en archivos de tipo **raster**.

v.*
: Comandos de procesamiento de archivos de tipo **vectorial**.

i.*
: Comandos de procesamiento de **imágenes**.

db.*
: Comandos para el manejo de **bases de datos**.

t.*
: Comandos de manejo de series **temporales**.

## Despliegue de mapas

Utilizando el botón **Agregar capa de mapa raster** ![Agregar capa de mapa raster](/cartografia-digital/images/clase-01/layer-raster-add.png) vamos a agregar una nueva capa: el mapa `porcecito`.

<!-- TODO: Hablar del manual de la ventana del comando. -->

La siguiente es la ventana de selección del mapa a desplegar:

![](/cartografia-digital/images/clase-01/clase-01_01.png){: .img-responsive}

El administrador de capas ahora tendrá la capa del mapa `porcecito`, así:

![](/cartografia-digital/images/clase-01/clase-01_02.png){: .img-responsive}

Y este será desplegado en el visualizador de mapas, así:

![](/cartografia-digital/images/clase-01/clase-01_03.png){: .img-responsive}

Agregando una segunda capa, en este caso del mapa `ituango`:

![](/cartografia-digital/images/clase-01/clase-01_04.png){: .img-responsive}

El administrador de capas muestra las 2 capas agregadas:

![](/cartografia-digital/images/clase-01/clase-01_05.png){: .img-responsive}

Sin embargo, el visualizador de mapas sigue mostrando el mapa `porcecito`. Esto es debido a que ambas capas corresponden a regiones geográficas diferentes, por lo tanto, para visualizar el nuevo mapa `ituango`, en el visualizador de mapas se utiliza el botón **Acercar al mapa seleccionado** ![Acercar al mapa seleccionado](/cartografia-digital/images/clase-01/zoom-extent.png). Ahora si se muestra el mapa correspondiente.

![](/cartografia-digital/images/clase-01/clase-01_06.png){: .img-responsive}

Si se quieren visualizar ambos mapas, se deben seleccionar en el administrador de capas haciendo click sobre las capas mientras se presiona la tecla `Ctrl`:

![](/cartografia-digital/images/clase-01/clase-01_07.png){: .img-responsive}

Y nuevamente utilizando el botón **Acercar al mapa seleccionado** ![Acercar al mapa seleccionado](/cartografia-digital/images/clase-01/zoom-extent.png) en el visualizador de mapas, obtendremos:

![](/cartografia-digital/images/clase-01/clase-01_08.png){: .img-responsive}

Observemos que en el administrador de capas, cada una de las capas agregadas, tiene una casilla de verificación, la cual permite activar o desactivar la capa respectiva:

![](/cartografia-digital/images/clase-01/clase-01_09.png){: .img-responsive}

Y al desactivar una de las capas:

![](/cartografia-digital/images/clase-01/clase-01_10.png){: .img-responsive}

Esta dejará de desplegarse en el visualizador de mapas:

![](/cartografia-digital/images/clase-01/clase-01_11.png){: .img-responsive}

## Región de cálculo {#region-calculo}

<!--
TODO:
* Detallar más este numeral e incluir ejemplos visuales.
  + Cambios en la región de cálculo en función de los mapas desplegados.
* Mover sección después del despliegue de mapas.
-->

La **región de cálculo**{: .text-info} corresponde a la región sobre la cual se ejecutarán los comandos de procesamiento **raster**{: .text-warning}. Y es independiente de la extensión de las capas.

## Elementos básicos de un mapa {#elementos-basicos-mapa}

### Rejilla o cuadrícula con coordenadas {#grid}

El botón **Agregar cuadrícula o etiquetas vectoriales** ![Agregar cuadrícula o etiquetas vectoriales](/cartografia-digital/images/clase-01/layer-more.png) ubicado en la barra de herramientas del administrador de capas, permite agregar una cuadrícula:

![Agregar cuadrícula](/cartografia-digital/images/clase-01/layer-grid-add.png) Agregar cuadrícula
: La cuadrícula, de una dimensión seleccionada a voluntad del usuario, facilita la lectura de distancias planimétricas del mapa; igualmente indica las coordenadas del mapa en la proyección en que este se encuentre.

### Convenciones del mapa {#convenciones}

El botón **Agregar elementos** ![Agregar elementos](/cartografia-digital/images/clase-01/overlay-add.png) ubicado en la barra de herramientas del visualizador de mapas, permite agregar elementos básicos al mapa desplegado:

![Agregar leyenda de mapa raster](/cartografia-digital/images/clase-01/legend-add.png) Agregar leyenda de mapa raster
: Permite agregar una leyenda del mapa raster seleccionado.

![Agregar escala](/cartografia-digital/images/clase-01/scalebar-add.png) Agregar escala
: Permite agregar una barra de escala planimétrica del mapa. Entre sus opciones están la ubicación de la barra de escala (utilizando coordenadas o el mouse), el formato y colores de la barra, etc.

![Agregar flecha norte](/cartografia-digital/images/clase-01/north-arrow-add.png) Agregar flecha norte
: Permite agregar una flecha que indica el sentido del Norte. Entre sus opciones están la ubicación de la flecha norte (utilizando coordenadas o el mouse), el estilo y color de la flecha, etc.

![Agregar texto](/cartografia-digital/images/clase-01/text-add.png) Agregar texto
: Permite agregar una línea de texto. Entre sus opciones están la ubicación del texto (utilizando coordenadas o el mouse), el tamaño, el formato, el color, etc.

## Consultas de la información del mapa {#consultas-informacion-mapa}

El botón **Consulta de mapas** ![Consulta de mapas](/cartografia-digital/images/clase-01/info.png) de la barra de herramientas del visualizador de mapas, permite identificar la información a nivel de un pixel específico: Coordenadas, valor, y etiquetas en el caso de mapas clasificados. Se debe seleccionar el pixel haciendo click con el mouse, y los resultados aparecerán en la pestaña "Consola" del administrador de capas.

El botón **Menú de análisis** ![Menú de análisis](/cartografia-digital/images/clase-01/layer-raster-analyze.png) de la barra de herramientas del visualizador de mapas, permite acceder a las siguientes herramientas:

![Herramienta de medir distancia](/cartografia-digital/images/clase-01/measure-length.png) Herramienta de medir distancia
: Realiza una medición interactiva de longitudes planimétricas (horizontales) de segmentos definidos con el mouse. Se despliegan en la consola: la longitud de cada segmento, la longitud acumulada de todos los segmentos de una línea quebrada, y el ángulo de cada segmento, respecto al Norte, medido en el sentido de las manecillas del reloj. Las longitudes se miden en la unidades en que se encuentra construido el mapa.

![Herramienta de medir área](/cartografia-digital/images/clase-01/area-measure.png) Herramienta de medir área
: Realiza una medición interactiva de áreas definidas con el mouse. El área es medida usando la unidad de medida actual. Con un doble-click se termina la medición.

![Herramienta de perfil](/cartografia-digital/images/clase-01/layer-raster-profile.png) Herramienta de perfil
: Permite crear un perfil topográfico de un mapa raster de altitudes de forma interactiva. Este procedimiento se puede generalizar para construir perfiles de cualquier otra variable (relieve relativo, pendientes, curvaturas, etc.).

Un perfil topográfico es la representación del relieve de una región a partir de las variables de distancia y altitud. En una línea seleccionada sobre el mapa, se definen distancias desde el punto inicial hasta el punto final, y a cada punto se le asigna su respectivo valor de altitud. La gráfica de "distancia vs. altitud" corresponde al perfil topográfico de dicha línea. En una clase posterior aprenderemos a elaborar conjuntos de perfiles paralelos y de igual distancia, como un procedimiento que permite evaluar de manera más profunda la estructura del relieve de una región.

Con el botón **Opciones del gráfico** ![](/cartografia-digital/images/clase-01/settings.png) se pueden realizar modificaciones a los parámetros gráficos del perfil, por ejemplo: Color y espesor de la línea del perfil, texto y formato de las etiquetas de los ejes 'X' y 'Y'.

![Herramienta de histograma](/cartografia-digital/images/clase-01/layer-raster-histogram.png) Herramienta de histograma
: El histograma presenta la relación entre un valor del mapa (por ejemplo un valor de altitud) y el número de píxeles que presentan dicho valor. La herramienta de histograma permite:

- Seleccionar el número de tramos para dividir el rango de datos del mapa.
- Modificar colores de fondo y texto del histograma.
- Seleccionar la presentación de los datos (gráfico de barras o gráfico circular).
- Incluir información de pixeles nulos (sin valor).

## Vista 3D

Al seleccionar la Vista 3D en el visualizador de mapas, se habilita la pestaña de control de "Vista 3D" en el administrador de capas. Esta pestaña permite controlar:

### Visualización {#visualizacion}

- El punto de vista desde donde se observa el mapa (SE, NW, etc.), ubicando el punto con el mouse, o haciendo click en los botones de control de vista. A medida que el punto de vista se acerca al centro del campo de observación, se consigue una vista vertical (superior) del mapa.

**Consejo:** La visualización desde un punto de vista ortogonal no es la más adecuada puesto que no se percibe la perspectiva del mapa de manera adecuada. Por lo tanto, se recomienda una visualización desde un punto de vista diagonal.
{: .alert .alert-success}

- La altitud desde la cual se observa el mapa.
- La exageración vertical.
- La perspectiva.
- El color de fondo.

### Datos

- El mapa raster de superficie.
- La resolución de renderizado.
- Las reglas de color.

### Presentación {#presentacion}

- La iluminación.
- El márgen del mapa.

<!-- La terminal de comandos
-----------------------

![La terminal de comandos de GRASS](/cartografia-digital/images/clase-01/grass_terminal.png){: .img-responsive}

Observar como ahora en la terminal aparece el siguiente prompt de GRASS:

~~~
GRASS 7.2.0 (CursoGrass):~ >
~~~

### Gramática en GRASS {#gramatica-grass}

Diferenciar entre orden y parámetros del comando:

~~~
hacer el amor
~~~

~~~
hacer: no se encontró la orden
~~~
{: .output}

Quiere decir que el sistema no reconoce la orden `hacer`.

Ahora probemos en inglés:

~~~
make love
~~~

~~~
make: *** No hay ninguna regla para construir el objetivo «love».  Alto.
~~~
{: .output}

En este caso el sistema si reconoce la orden `make`, pero no reconoce el parámetro `love` como un objetivo válido de la orden `make`.

La terminal de comandos en GRASS funciona con el mismo intérprete que la terminal de GNU/Linux, por lo que todos los comandos de GNU/Linux (como por ejemplo los vistos en la clase anterior) funcionan dentro de GRASS, y además, los comandos propios de GRASS conservan una [sintaxis muy similar a la de los comandos GNU/Linux](../clase-01/#sintxis-bsica-de-los-comandos-en-la-terminal-de-gnulinux):

~~~
> x.comando -opciones parametro1=mapa1 parametro2=mapa2 ...
~~~

De manera que `x` indica el tipo de comando que será utilizado.

### ¿Cuáles serían los comandos mas básicos? {#comandos-basicos}

- Conocer qué capas raster hay en el sistema para trabajar.

~~~
g.list -p type=raster
~~~

~~~
----------------------------------------------

Archivos raster disponibles en el directorio de mapas de usuario (Mapset)<PERMANENT>:
ituango         porcecito       riogrande_sup

----------------------------------------------
~~~
{: .output}

- Copiar un archivo que se encuentra en el mapset `PERMANENT` para tenerlo disponible en el mapset donde se encuentra el usuario.

~~~
g.copy raster=porcecito@PERMANENT,porcecito
~~~

~~~
Copy raster <porcecito@PERMANENT> to current mapset as <porcecito>
~~~
{: .output}

- Cambiarle el nombre a un archivo raster (un mapa).

~~~
g.rename raster=porcecito,porcecito_copia
~~~

~~~
Rename raster <porcecito> to <porcecito_copia>
ADVERTENCIA: 'cell / porcecito' fue encontrado en mas directorios de mapas
             (mapsets) (también fue hallado en <PERMANENT>).
ADVERTENCIA: Utilizando <porcecito@CursoGrass>.
~~~
{: .output}

- Borrar un mapa (archivo) del mapset activo.

~~~
g.remove type=raster name=porcecito_copia
~~~

~~~
Removing raster <porcecito_copia>
~~~
{: .output}

- Imprimir la región de cálculo

~~~
g.region -p
~~~

~~~
projection: 99 (Transverse Mercator)
zone:       0
datum:      ** unknown (default: WGS84) **
ellipsoid:  international
north:      1231633.33333336
south:      1193683.33333335
west:       854822.22222223
east:       889777.77777778
nsres:      30.55555556
ewres:      30.55555556
rows:       1242
cols:       1144
cells:      1420848
~~~
{: .output}

- Ajustar la región de cálculo a un mapa raster.

~~~
g.region raster=riogrande_sup
~~~

- Ajustar la región de cálculo a un mapa raster e imprimirla en consola.

~~~
g.region -p rast=ituango
~~~

~~~
projection: 99 (Transverse Mercator)
zone:       0
datum:      ** unknown (default: WGS84) **
ellipsoid:  international
north:      1312911.11111149
south:      1271905.55555592
west:       788822.22222209
east:       829949.99999986
nsres:      30.55555556
ewres:      30.55555556
rows:       1342
cols:       1346
cells:      1806332
~~~
{: .output}

- Cambiar la tabla de colores de un mapa raster:

~~~
r.colors map=porcecito color=bcyr
~~~

~~~
Tabla de colores para mapa raster <porcecito> establecida a 'bcyr'
~~~
{: .output}

Utilizando el botón **Renderizar el mapa** ![Renderizar el mapa](/cartografia-digital/images/clase-01/layer-redraw.png), se refrescan las capas desplegadas y se observa el cambio de color:

![](/cartografia-digital/images/clase-01/clase-01_13.png){: .img-responsive}

### Consultar la documentación de los comandos {#consultar-documentacion-comandos}

Se puede consultar la documentación de los comandos para saber qué parámetros requieren y cuales son opcionales, así como sus funciones.

~~~
r.colors help
~~~

~~~
Descripción:
 Crea/modifica la tabla de colores asociada a una capa de mapa ráster.

Palabras clave:
 raster, tabla

Uso:
 r.colors [-rwlngaeiq] [map=name] [color=style] [raster=string]
   [rules=name] [--verbose] [--quiet]

Identificadores:
  -r   Eliminar la tabla de colores existente
  -w   Sólo escribir nueva tabla de colores si no existe ya una
  -l   Listar reglas disponibles y salir
  -n   Invertir colores
  -g   Escalado logarítmico
  -a   Escalado logarítmico-absoluto
  -e   Ecualización de histograma
  -i   Introducir reglas de forma interactiva
  -q   Ejecutar en modo silencioso
 --v   Salida detallada del módulo.
 --q   Salida "silenciosa" del módulo.

Parámetros:
     map   Nombre del mapa raster de entrada.
   color   Tipo de tabla de colores
           opciones: aspect,aspectcolr,bcyr,bgyr,byg,byr,celsius,corine,
                    curvature,differences,elevation,etopo2,evi,gdd,grey,
                    grey.eq,grey.log,grey1.0,grey255,gyr,haxby,ndvi,
                    population,population_dens,precipitation,
                    precipitation_monthly,rainbow,ramp,random,rstcurv,rules,
                    ryb,ryg,sepia,slope,srtm,terrain,wave
            aspect: aspect oriented grey colors
            aspectcolr: aspect oriented rainbow colors
            bcyr: blue through cyan through yellow to red
            bgyr: blue through green through yellow to red
            byg: blue through yellow to green
            byr: blue through yellow to red
            celsius: blue to red for degree Celsius temperature
            corine: EU Corine land cover colors
            curvature: for terrain curvatures (from v.surf.rst and r.slope.aspect)
            differences: differences oriented colors
            elevation: maps relative ranges of raster values to elevation color ramp
            etopo2: colors for ETOPO2 worldwide bathymetry/topography
            evi: enhanced vegetative index colors
            gdd: accumulated growing degree days
            grey: grey scale
            grey.eq: histogram-equalized grey scale
            grey.log: histogram logarithmic transformed grey scale
            grey1.0: grey scale for raster values between 0.0-1.0
            grey255: grey scale for raster values between 0-255
            gyr: green through yellow to red
            haxby: relative colors for bathymetry or topography
            ndvi: Normalized Difference Vegetation Index colors
            population: color table covering human population classification breaks
            population_dens: color table covering human population density classification breaks
            precipitation: precipitation color table (0..2000mm)
            precipitation_monthly: precipitation color table (0..1000mm)
            rainbow: rainbow color table
            ramp: color ramp
            random: random color table
            rstcurv: terrain curvature (from r.resamp.rst)
            rules: create new color table based on user-specified rules read from stdin
            ryb: red through yellow to blue
            ryg: red through yellow to green
            sepia: yellowish-brown through to white
            slope: r.slope.aspect-type slope colors for raster values 0-90
            srtm: color palette for Shuttle Radar Topography Mission elevation
            terrain: global elevation color table covering -11000 to +8850m
            wave: color wave
  raster   Nombre del mapa ráster del que copiar la tabla de colores
   rules   Path to rules file ("-" to read rules from stdin)
~~~
{: .output}

Colocando al final de cada comando de GRASS el parámetro `help`, obtenemos información acerca de lo que puede realizar cada comando.

La ayuda incluye:

Descripción
: En pocas palabras dice lo que se puede hacer con el comando.

Palabras claves
: Palabras indicadoras de la operación que realiza el comando.

Uso
: Indica la manera como se debe escribir la orden para que el computador la comprenda y la pueda llevar a cabo. El uso es por lo tanto la sintaxis del comando: La manera como deben ir las letras, las palabras, los signos y los espacios para que el mensaje pueda entenderse por el sistema GRASS.

Opciones (Identificadores)
: El SIG GRASS emplea el signo `-` acompañado de letras como opciones para el usuario si desea que se despliegue el resultado de una acción o que no se despliegue.

Parámetros
: Hace referencia a una acción o a un objeto (archivo) que se desea hacer o desplegar respectivamente.

De igual manera se puede abrir una documentación más completa en el navegador web con el comando `g.manual`:

~~~
g.manual -i
~~~

~~~
Starting browser <xdg-open> for module index...
~~~
{: .output}

Esto abre el índice (parámetro `-i`) de la documentación.

También se pueden abrir directamente los manuales de comandos específicos:

~~~
g.manual entry=r.colors
~~~

~~~
Starting browser <xdg-open> for module r.colors...
~~~
{: .output}

### Consultar los estadísticos básicos de un mapa raster {#consultar-estadisticos-basicos-mapa-raster}

~~~
r.univar map=porcecito
~~~

~~~
 100%
~~~
{: .output}

El cálculo de los estadísticos básicos de un mapa se realiza sobre la región de cálculo, es decir, si la región de cálculo no corresponde con el mapa a consultar, la salida será nula.

Para obtener el resultado correcto, primero debemos asegurarnos de tener la región de cálculo bien definida al mapa que será consultado:

~~~
g.region rast=porcecito
r.univar map=porcecito
~~~

~~~
 100%
total null and non-null cells: 1420848
total null cells: 0

Of the non-null cells:
----------------------
n: 1420848
minimum: 958
maximum: 2873
range: 1915
mean: 1794.74
mean of absolute values: 1794.74
standard deviation: 413.958
variance: 171362
variation coefficient: 23.0651 %
sum: 2550048192
~~~
{: .output}

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

## Tarea 2
{: .text-danger}

Elaborar un guión que:

- Defina la región de cálculo al mapa `ituango`.

- Consulte los estadísticos básicos del mismo mapa.

- Cambie la tabla de colores del mapa `ituango` por una que pueda destacar mejor algunos rasgos del relieve. -->

*[GRASS GIS]: Geographic Resources Analysis Support System
