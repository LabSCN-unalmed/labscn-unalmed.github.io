---
layout: clase
title: 'Sesión introductoria a GRASS GIS'
curso: 'cartografia-digital'
clase: 2
---

Iniciando GRASS
---------------

Al abrir GRASS GIS, se inicia una terminal de comandos y aparece la siguiente ventana de inicio:

![Ventana de inicio de GRASS](/cartografia-digital/images/clase-02/grass_start.png){: .img-responsive}

#### ![](/cartografia-digital/images/clase-02/circle_1.png) Seleccionar el directorio de datos SIG

Los datos de GRASS se almacenan en un directorio al cual se le conoce como una base de datos SIG (GISDBASE). Dentro de esta base de datos SIG, se encuentran organizados los proyectos como subdirectorios llamados LOCATIONs.

#### ![](/cartografia-digital/images/clase-02/circle_2.png) Seleccionar la locación del proyecto (LOCATION)

Un LOCATION se define por su sistema de coordenadas, proyección y límites geográficos. Los subdirectorios y archivos que definen un LOCATION son creados automáticamente cuando GRASS se inicia la primera vez con un nuevo LOCATION. Es importante comprender que cada proyección permanece en su propio LOCATION.

#### ![](/cartografia-digital/images/clase-02/circle_3.png) Seleccionar el directorio de mapas (MAPSET)

Cada LOCATION puede tener múltiples MAPSET. Cada MAPSET es un subdirectorio de un LOCATION. Se pueden crear nuevos MAPSET desde la ventana de inicio de GRASS.

#### ![](/cartografia-digital/images/clase-02/circle_4.png) Asistente de localizaciones

El asistente de localizaciones permite crear fácilmente un nuevo LOCATION, a partir de un archivo georeferenciado, definiendo los parámetros manualmente, o a partir del código de proyección EPSG.

#### ![](/cartografia-digital/images/clase-02/circle_5.png) Iniciar GRASS

Una vez se hayan seleccionado el LOCATION y el MAPSET, se puede iniciar GRASS.

Para el caso del presente curso será necesario crear un MAPSET con el nombre del estudiante e iniciar GRASS en el LOCATION CursoGrass y el MAPSET recién creado.

Al iniciar GRASS se abrirán 2 ventanas adicionales a la terminal de comandos: una ventana de administración de capas y una ventana para la visualización de mapas.

Adicionalmente se recomienda abrir el gedit para registrar los comandos utilizados en la terminal, a manera de guión o script.

Durante el desarrollo de los ejercicios del curso, se utilizará la terminal para realizar todo el trabajo de procesamiento, y la interfaz gráfica se utilizará para la visualización.

Este es el aspecto del entorno de trabajo:

![Entorno de trabajo del GIS GRASS](/cartografia-digital/images/clase-02/grass_workspace.png){: .img-responsive}

La interfaz gráfica {#interfaz-grafica}
-------------------

La interfaz gráfica está compuesta por 2 ventanas:

* El **Administrador de Capas**
* El **Visualizador de Mapas**

### Administrador de Capas

El administrador de capas constituye una herramienta para crear y administrar monitores (displays). Contiene una barra de herramientas para controlar las capas desplegadas, y un marco de capas en donde se organizan las capas a desplegar, utilizando pestañas para cada monitor.

![Administrador de Capas](/cartografia-digital/images/clase-02/grass_layer_manager.png){: .img-responsive}

### Visualizador de Mapas

La ventana de visualización de mapas incluye una barra de herramientas, un espacio en donde se despliegan los mapas, y una barra de estado con información de la región geográfica de los mapas desplegados.

![Visualizador de Mapas](/cartografia-digital/images/clase-02/grass_map_display.png){: .img-responsive}

Cada ventana de visualización de mapas tiene una lista de capas independiente en el administrador de capas.

En la parte superior de la ventana se encuentra una barra de herramientas con botones para manipular el mapa desplegado (ampliación, vista panorámica), consulta y análisis (medir distancia, creación de perfiles e histogramas, agregar elementos al mapa (escala, flecha de norte, leyenda y etiquetas de texto personalizadas), y para exportar o imprimir el monitor.

En la parte inferior de la ventana se encuentra la barra de estado, en ella se puede elegir si presentar las coordenadas bajo el cursor, la extensión de la región actual, la región de cálculo (incluyendo visualización gráfica), la geometría del mapa desplegado (número de fílas, columnas y resolución), y la escala. Marcar la opción de **renderizar** hace que la ventana se actualice automáticamente cada que se añade un mapa, se borra, o se cambia en la lista de capas.

El nivel de acercamiento o "zoom", no incide sobre la región de cálculo establecida mediante `g.region`.

#### Región de cálculo

El comando `g.region` define lo que se denominará **región de cálculo**{: .text-info}, la cual corresponde a la región sobre la cual se ejecutarán los comandos de procesamiento **raster**{: .text-warning}. Y es independiente de la visualización de las capas.

### Barras de herramientas

#### Barra de herramientas del administrador de capas

![Abrir nuevo monitor](/cartografia-digital/images/clase-02/monitor-create.png) Abrir nuevo monitor
: Abre una ventana de visualización de mapas adicional y crea una pestaña vacía en la ventana de administración de capas.

![Crear un nuevo espacio de trabajo](/cartografia-digital/images/clase-02/create.png) Crear un nuevo espacio de trabajo
: Quita todas las capas del árbol de capas.

![Abrir espacio de trabajo](/cartografia-digital/images/clase-02/open.png) Abrir espacio de trabajo
: Abre un archivo de espacio de trabajo, que contiene un conjunto de capas con sus respectivas opciones.

![Guardar espacio de trabajo](/cartografia-digital/images/clase-02/save.png) Guardar espacio de trabajo
: Guarda el conjunto actual de capas y sus respectivas opciones en un archivo.

![Cargar mapas al espacio de trabajo](/cartografia-digital/images/clase-02/layer-open.png) Cargar mapas al espacio de trabajo
: Carga mapas raster o vectoriales seleccionados a la actual lista de capas.

![Agregar capa de mapa raster](/cartografia-digital/images/clase-02/layer-raster-add.png) Agregar capa de mapa raster
: Agrega un mapa raster a la lista de capas.

![Agregar varias capas de mapas raster](/cartografia-digital/images/clase-02/layer-raster-more.png) Agregar varias capas de mapas raster (RGB, HIS, relieve sombreado...)
: Abre un menu desplegable que permite:

![Agregar una capa de mapa raster 3D](/cartografia-digital/images/clase-02/layer-raster3d-add.png) Agregar una capa de mapa raster 3D
: Agrega un mapa raster 3D a la lista de capas.

![Agregar una capa raster RGB](/cartografia-digital/images/clase-02/layer-rgb-add.png) Agregar una capa raster RGB
: Combina y despliega tres mapas raster definidos como canales rojo (Red), verde (Green) y azul (Blue) para crear un mapa de color RGB.

![Agregar una capa raster HIS](/cartografia-digital/images/clase-02/layer-his-add.png) Agregar una capa raster HIS
: Combina y despliega dos o tres mapas raster definidos como canales de matiz (Hue), intensidad (Intensity), y opcionalmente saturación (Saturation) para crear un mapa de color.

![Agregar una capa de mapa raster de relieve sombreado](/cartografia-digital/images/clase-02/layer-shaded-relief-add.png) Agregar una capa raster de relieve sombreado
: Agrega una capa de mapa raster de relieve sombreado.

![Agregar una capa raster de flechas](/cartografia-digital/images/clase-02/layer-aspect-arrow-add.png) Agregar una capa raster de flechas
: Agrega un mapa de pixeles raster con flechas de dirección dibujadas. Las flechas de dirección y su longitud se determinan por mapas separados de aspecto/dirección, y opcionalmente pendiente/intensidad.

![Agregar una capa raster de números](/cartografia-digital/images/clase-02/layer-cell-cats-add.png) Agregar una capa raster de números
: Agrega un mapa de pixeles raster con números que representan los valores de los pixeles.

![Agregar una capa de mapa vector](/cartografia-digital/images/clase-02/layer-vector-add.png) Agregar una capa de mapa vector
: Agregar una capa de mapa vector.

![Agregar varias capas de mapas vector](/cartografia-digital/images/clase-02/layer-vector-more.png) Agregar varias capas de mapas vector (temática, gráfica...)
: Abre un menu desplegable que permite:

![Agregar una capa de mapa de área temática](/cartografia-digital/images/clase-02/layer-vector-thematic-add.png) Agregar una capa de mapa de área temática (para todos los tipos de mapa vector)
: Agrega una capa para despliegue temático de los valores de un atributo asociado a un mapa vectorial. Las opciones incluyen: Tipo de despliegue temático (colores en gradiente o tamaños de puntos), métodos para crear intervalos de despliegue, consultas SQL para seleccionar y limitar los atributos a desplegar, control de los tipos de íconos y tamaños, control de los esquemas de color, y creación de leyenda para el mapa temático.

![Agregar una capa de gráfica temática](/cartografia-digital/images/clase-02/layer-vector-chart-add.png) Agregar una capa de gráfica temática (para mapas vector de puntos)
: Agrega una capa en la cual se pueden crear gráficos de barra o circulares en las ubicaciones de puntos vectoriales. Los gráficos despliegan los valores de columnas seleccionadas en la tabla de atributos asociada. Las opciones incluyen: Tipo de gráfico, capa y atributos a graficar, colores del gráfico, tamaño del gráfico (fijo o basado en un atributo).

![Agregar grupo](/cartografia-digital/images/clase-02/layer-group-add.png) Agregar grupo
: Agrega un grupo vacío al cual se pueden agregar capas.

![Agregar cuadrícula o etiquetas vectoriales](/cartografia-digital/images/clase-02/layer-more.png) Agregar cuadrícula o etiquetas vectoriales
: Abre un menu desplegable que permite:

![Agregar cuadrícula](/cartografia-digital/images/clase-02/layer-grid-add.png) Agregar cuadrícula
: Agrega una capa para desplegar una cuadrícula de coordenadas.

![Agregar una capa de etiquetas para objetos vectoriales](/cartografia-digital/images/clase-02/layer-label-add.png) Agregar una capa de etiquetas para objetos vectoriales (a partir de un archivo de etiquetas existente)
: Agrega una capa de texto a partir de un archivo de etiquetas para objetos vectoriales creado con el módulo `v.label`.

![Agregar una capa de líneas geodésicas](/cartografia-digital/images/clase-02/shortest-distance.png) Agregar una capa de líneas geodésicas
: Agrega una capa para desplegar líneas geodésicas.

![Agregar una capa de líneas de rumbo](/cartografia-digital/images/clase-02/shortest-distance.png) Agregar una capa de líneas de rumbo
: Agrega una capa para desplegar líneas de rumbo.

![Agregar una capa de comandos](/cartografia-digital/images/clase-02/layer-command-add.png) Agregar una capa de comandos
: Agrega una capa en la cual se pueden ingresar comandos para realizar el despliegue.

![Eliminar capa seleccionada](/cartografia-digital/images/clase-02/layer-remove.png) Eliminar capa seleccionada
: Remueve la capa seleccionada (o el grupo) de la lista de capas.

![Mostrar tabla de atributos](/cartografia-digital/images/clase-02/table.png) Mostrar tabla de atributos
: Abre el administrador de tablas de atributos para el mapa vectorial seleccionado.

![Importar datos raster o vector](/cartografia-digital/images/clase-02/layer-open.png) Importar datos raster o vector
: Permite importar datos raster o vector.

![Importar datos raster](/cartografia-digital/images/clase-02/layer-import.png) Importar datos raster
: Importa datos raster a GRASS usando el módulo `r.in.gdal` y los carga a la lista de capas.

![Importar datos vector](/cartografia-digital/images/clase-02/layer-import.png) Importar datos vector
: Importa datos vector a GRASS usando el módulo `v.in.ogr` y carga a la lista de capas.

![Calculadora de mapas raster](/cartografia-digital/images/clase-02/calculator.png) Calculadora de mapas raster
: Abre la interfaz gráfica de la calculadora de mapas raster `r.mapcalc`.

![Modelador gráfico](/cartografia-digital/images/clase-02/modeler-main.png) Modelador gráfico
: Abre el modelador gráfico para crear modelos y ejecutarlos.

![Herramienta de georectificación](/cartografia-digital/images/clase-02/georectify.png) Herramienta de georectificación
: Abre el administrador de puntos de control terrestre para crear, editar y administrar puntos de amarre.

![Compositor cartográfico](/cartografia-digital/images/clase-02/print-compose.png) Compositor cartográfico
: Abre el compositor cartográfico para crear mapas imprimibles de forma interactiva.

![Configuración](/cartografia-digital/images/clase-02/settings.png) Configuración
: Abre un diálogo para modificar la configuración de la interfaz gráfica.

![Ayuda](/cartografia-digital/images/clase-02/help.png) Ayuda
: Abre la documentación de GRASS en un navegador web.

#### Atajos de teclado claves

`Ctrl+Q`
: Salir de la interfaz gráfica.

`Ctrl+N`
: Crear un nuevo espacio de trabajo.

`Ctrl+O`
: Cargar un espacio de trabajo de un archivo.

`Ctrl+S`
: Guardar el espacio de trabajo actual a un archivo.

`Ctrl+Shift+L`
: Agregar múltiples capas de mapas raster o vector al monitor actual.

`Ctrl+Shift+R`
: Agrega una capa de mapa raster al monitor actual.

`Ctrl+Shift+V`
: Agrega una capa de mapa vector al monitor actual.

`Ctrl+W`
: Cierra el monitor actual.

`Tab`
: Muestra una guía rápida del comando.

`Esc`
: Esconde la guía rápida del comando.

`Ctrl+Space`
: Permite autocompletar los nombres de los comandos, los parámetros y los mapas.

`Arriba/Abajo`
: Navega por el historial de comandos.

`Enter`
: Ejecuta el comando.

#### Barra de herramientas del visualizador de mapas

![Desplegar mapa](/cartografia-digital/images/clase-02/show.png) Desplegar mapa
: Despliega todas las capas activas de la lista de capas y renderiza las capas que hayan cambiado, agregado o eliminado.

![Renderizar el mapa](/cartografia-digital/images/clase-02/layer-redraw.png) Renderizar el mapa
: Renderiza nuevamente todas las capas activas.

![Borrar monitor](/cartografia-digital/images/clase-02/erase.png) Borrar monitor
: Borra el contenido del monitor, dejando el fondo blanco.

![Puntero](/cartografia-digital/images/clase-02/pointer.png) Puntero
: Selecciona el puntero como cursor para el monitor.

![Consulta de mapas](/cartografia-digital/images/clase-02/info.png) Consulta de mapas
: Consulta la capa seleccionada usando el ratón. El mapa a consultar se debe seleccionar previamente en la lista de capas. Los mapas vectoriales temáticos y de gráficas no pueden ser consultados. Los resultados de la consulta se mostrarán en la consola.

![Vista panorámica](/cartografia-digital/images/clase-02/pan.png) Vista panorámica
: Permite seleccionar el centro de la vista en el monitor de forma interactiva usando el ratón, arrastrándo el cursor haciendo click con el botón izquierdo. Cambia la ubicación de la región desplegada pero no el tamaño del área o la resolución. _**NO**_ afecta la región de cálculo para los procesamientos.

![Acercar](/cartografia-digital/images/clase-02/zoom-in.png) Acercar
: Permite acercar la vista de manera interactiva usando el mouse, dibujando un recuadro para que el área seleccionada ocupe completamente el monitor. Hacer click con el cursor de acercar hace que el monitor se acerque 30%, centrándose en el punto donde se hizo click. La resolución del mapa no cambia al acercar pero si se restablece la extensión de la región desplegada. _**NO**_ afecta la región de cálculo para los procesamientos.

![Alejar](/cartografia-digital/images/clase-02/zoom-out.png) Alejar
: Permite alejar la vista de manera interactiva usando el mouse, dibujando un recuadro para que el área desplegada se reduzca hasta ocupar el recuadro dibujado. Hacer click con el cursor de alejar hace que el monitor se aleje 30%, centrándose en el punto donde se hizo click.  La resolución del mapa no cambia pero si se restablece la extensión de la región desplegada. _**NO**_ afecta la región de cálculo para los procesamientos.

![Acercar al mapa seleccionado](/cartografia-digital/images/clase-02/zoom-extent.png) Acercar al mapa seleccionado
: Establece la extensión del monitor basándose en el mapa seleccionado. La resolución del mapa no cambia pero si se restablece la extensión de la región desplegada. _**NO**_ afecta la región de cálculo para los procesamientos.

![Volver al acercamiento anterior](/cartografia-digital/images/clase-02/zoom-last.png) Volver al acercamiento anterior
: Vuelve a la extensión de acercamiento anterior. Se mantienen hasta 10 niveles anteriores de acercamiento.

![Opciones de acercamiento](/cartografia-digital/images/clase-02/zoom-more.png) Opciones de acercamiento
: Abre un menú desplegable que permite elegir una opción:

* Acercamiento que coincida con la extensión de un mapa seleccionado.
* Acercamiento a la región de cálculo (establecida con `g.region`.
* Acercamiento a la región de cálculo predeterminada.
* Acercamiento a una región guardada.
* Establecer región de cálculo a la extensión de la vista actual (sin cambiar la resolución).
* Guardar la geometría de la vista actual a una región.

![Menú de análisis](/cartografia-digital/images/clase-02/layer-raster-analyze.png) Menú de análisis
: Abre un menú desplegable con las siguientes herramientas:

![Herramienta de medir distancia](/cartografia-digital/images/clase-02/measure-length.png) Herramienta de medir distancia
: Medición interactiva de longitudes definidas con el mouse. La longitud de cada segmento y la longitud acumulada se despliega en la consola. Las longitudes se miden en la unidad de medida actual.

![Herramienta de perfil](/cartografia-digital/images/clase-02/layer-raster-profile.png) Herramienta de perfil
: Creación de perfil de un mapa raster de forma interactiva. El transecto del perfil se dibuja con el mouse en el monitor. El perfil puede ser del mapa desplegado o de un mapa diferente. Se pueden perfilar hasta tres mapas de manera simultánea.

![Herramienta de histograma](/cartografia-digital/images/clase-02/layer-raster-histogram.png) Herramienta de histograma
: Despliega un histograma del mapa raster seleccionado en una nueva ventana.

![Agregar elementos](/cartografia-digital/images/clase-02/overlay-add.png) Agregar elementos
: Abre un menú desplegable que permite:

![Agregar escala y flecha norte](/cartografia-digital/images/clase-02/scalebar-add.png) Agregar escala y flecha norte
: Agrega una capa para desplegar una escala y una flecha norte. Las opciones incluyen la ubicación (usando coordenadas o el mouse), el formato y los colores de la escala.

![Agregar leyenda de mapa raster](/cartografia-digital/images/clase-02/legend-add.png) Agregar leyenda de mapa raster
: Agrega una capa para desplegar una leyenda del mapa raster seleccionado.

![Agregar texto](/cartografia-digital/images/clase-02/text-add.png) Agregar texto
: Agrega una capa para desplegar una línea de texto utilizando el tipo de letra predeterminado de GRASS. Las opciones incluyen la ubicación (coordenadas), el tamaño, el formato y el color del texto.

![Guardar el monitor a un archivo](/cartografia-digital/images/clase-02/map-export.png) Guardar el monitor a un archivo
: Guarda la imágen visible en el monitor a diferentes formatos de gráficos raster.

![Imprimir mapa](/cartografia-digital/images/clase-02/print.png) Imprimir mapa
: Imprime el mapa en la impresora nativa del sistema, o en un dispositivo PostScript; guarda el mapa visible (incluyendo texto y etiquetas) en archivos PDF o EPS.

Modo de despliegue de mapas
: Menú desplegable donde se elige si se quieren visualizar los mapas en 2D o 3D. También da la opción de digitalizar mapas vectoriales agregando una barra de herramientas para la digitalización. Permite digitalizar un nuevo mapa o editar uno existente.

## Despliegue de mapas

Utilizando el botón ![Agregar capa de mapa raster](/cartografia-digital/images/clase-02/layer-raster-add.png) vamos a agregar una nueva capa: el mapa `porcecito`.

La siguiente es la ventana de selección del mapa a desplegar:

![](/cartografia-digital/images/clase-02/clase-02_01.png){: .img-responsive}

El administrador de capas ahora tendrá la capa del mapa `porcecito`, así:

![](/cartografia-digital/images/clase-02/clase-02_02.png){: .img-responsive}

Y este será desplegado en el visualizador de mapas, así:

![](/cartografia-digital/images/clase-02/clase-02_03.png){: .img-responsive}

Agregando una segunda capa, en este caso del mapa `ituango`:

![](/cartografia-digital/images/clase-02/clase-02_04.png){: .img-responsive}

El administrador de capas muestra las 2 capas agregadas:

![](/cartografia-digital/images/clase-02/clase-02_05.png){: .img-responsive}

Sin embargo, el visualizador de mapas sigue mostrando el mapa `porcecito`. Esto es debido a que ambas capas corresponden a regiones geográficas diferentes, por lo tanto, para visualizar el nuevo mapa `ituango`, en el visualizar de mapas se utiliza el botón ![Acercar al mapa seleccionado](/cartografia-digital/images/clase-02/zoom-extent.png). Ahora si se muestra el mapa correspondiente.

![](/cartografia-digital/images/clase-02/clase-02_06.png){: .img-responsive}

Si se quieren visualizar ambos mapas, se deben seleccionar en el administrador de capas utilizando haciendo click sobre las capas mientras se presiona la tecla `Ctrl`:

![](/cartografia-digital/images/clase-02/clase-02_07.png){: .img-responsive}

Y nuevamente utilizando el botón ![Acercar al mapa seleccionado](/cartografia-digital/images/clase-02/zoom-extent.png) en el visualizador de mapas, obtendremos:

![](/cartografia-digital/images/clase-02/clase-02_08.png){: .img-responsive}

Observemos que en el administrador de capas, cada una de las capas agregadas, tiene una casilla de verificación, la cual permite activar o desactivar la capa respectiva:

![](/cartografia-digital/images/clase-02/clase-02_09.png){: .img-responsive}

Y al desactivar una de las capas:

![](/cartografia-digital/images/clase-02/clase-02_10.png){: .img-responsive}

Esta dejará de desplegarse en el visualizador de mapas:

![](/cartografia-digital/images/clase-02/clase-02_11.png){: .img-responsive}

La activación es diferente de la selección, por lo que al utilizar el botón ![Acercar al mapa seleccionado](/cartografia-digital/images/clase-02/zoom-extent.png), sólo se tendrán en cuenta las capas activas de las seleccionadas, por lo que acercará unicamente a la capa activa.

De manera similar, intentar acercar a una capa inactiva:

![](/cartografia-digital/images/clase-02/clase-02_12.png){: .img-responsive}

No tendría ningún efecto en la región desplegada.

La terminal de comandos
-----------------------

![La terminal de comandos de GRASS](/cartografia-digital/images/clase-02/grass_terminal.png){: .img-responsive}

Observar como ahora en la terminal aparece el siguiente prompt de GRASS:

~~~
GRASS 6.4.3 (CursoGrass):~ >
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

### La taxonomía de comandos {#taxonomia-comandos}

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

Utilizando el botón ![Renderizar el mapa](/cartografia-digital/images/clase-02/layer-redraw.png), se refrescan las capas desplegadas y se observa el cambio de color:

![](/cartografia-digital/images/clase-02/clase-02_13.png){: .img-responsive}

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

- Cambie la tabla de colores del mapa `ituango` por una que pueda destacar mejor algunos rasgos del relieve.

*[GRASS GIS]: Geographic Resources Analysis Support System
