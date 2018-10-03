---
layout: clase
title: 'Sesión introductoria a GRASS GIS'
curso: 'cartografia-digital'
clase: 1
---

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

Al seleccionar la Vista 3D en el visualizador de mapas, se habilita la pestaña de control de "Vista 3D" en el administrador de capas.

Esta pestaña permite controlar:

![](/cartografia-digital/images/clase-01/clase-01_12.png){: .img-responsive}

### Visualización {#visualizacion}

- El punto de vista desde donde se observa el mapa (SE, NW, etc.), ubicando el punto con el mouse, o haciendo click en los botones de control de vista. A medida que el punto de vista se acerca al centro del campo de observación, se consigue una vista vertical (superior) del mapa.

**Consejo:** La visualización desde un punto de vista ortogonal no es la más adecuada puesto que no se percibe la perspectiva del mapa de manera adecuada. Por lo tanto, se recomienda una visualización desde un punto de vista diagonal.
{: .alert .alert-success}

- La altitud desde la cual se observa el mapa.
- La exageración vertical.
- La perspectiva.
- El color de fondo.

![](/cartografia-digital/images/clase-01/clase-01_13.png){: .img-responsive}

### Datos

- El mapa raster de superficie.
- La resolución de renderizado.
- Las reglas de color.

![](/cartografia-digital/images/clase-01/clase-01_14.png){: .img-responsive}

### Presentación {#presentacion}

- La iluminación.

![](/cartografia-digital/images/clase-01/clase-01_15.png){: .img-responsive}

- El márgen del mapa.

![](/cartografia-digital/images/clase-01/clase-01_16.png){: .img-responsive}

Finalmente, luego de definir las diferentes propiedades de visualización 3D el mapa porcecito se verá así:

![](/cartografia-digital/images/clase-01/porcecito_3D.png){: .img-responsive}

*[GRASS GIS]: Geographic Resources Analysis Support System
