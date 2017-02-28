---
layout: clase
title: 'Visualización de mapas raster'
curso: 'cartografia-digital'
clase: 5
---

## Elementos básicos de un mapa {#elementos-basicos-mapa}

### Desde el administrador de capas

El botón **Agregar cuadrícula o etiquetas** ![Agregar cuadrícula o etiquetas vectoriales](/cartografia-digital/images/clase-02/layer-more.png) ubicado en la barra de herramientas del administrador de capas, permite agregar una cuadrícula:

![Agregar cuadrícula](/cartografia-digital/images/clase-02/layer-grid-add.png) Agregar cuadrícula
: La cuadrícula, de una dimensión seleccionada a voluntad del usuario, facilita la lectura de distancias planimétricas del mapa; igualmente indica las coordenadas del mapa en la proyección en que este se encuentre.

### Desde el visualizador de mapas

El botón **Agregar elementos** ![Agregar elementos](/cartografia-digital/images/clase-02/overlay-add.png) ubicado en la barra de herramientas del visualizador de mapas, permite agregar elementos básicos al mapa desplegado:

![Agregar escala y flecha norte](/cartografia-digital/images/clase-02/scalebar-add.png) Agregar escala y flecha norte
: Permite superponer una flecha que indica el sentido del Norte, acompañada de una barra de escala planimétrica del mapa. Entre sus opciones están dibujar sólo la flecha de Norte, o sólo la barra de escala, cambiar el tamaño y el color del texto, cambiar el color de fondo, etc.

![Agregar leyenda de mapa raster](/cartografia-digital/images/clase-02/legend-add.png) Agregar leyenda de mapa raster
:

![Agregar texto](/cartografia-digital/images/clase-02/text-add.png) Agregar texto
:

## Consultas de la información del mapa {#consultas-informacion-mapa}

El botón **Consulta de mapas** ![Consulta de mapas](/cartografia-digital/images/clase-02/info.png) de la barra de herramientas del visualizador de mapas, permite identificar la información a nivel de un pixel específico: Coordenadas, valor, y etiquetas en el caso de mapas clasificados. Se debe seleccionar el pixel haciendo click con el mouse, y los resultados aparecerán en la pestaña "Consola" del administrador de capas.

El botón **Menú de análisis** ![Menú de análisis](/cartografia-digital/images/clase-02/layer-raster-analyze.png) de la barra de herramientas del visualizador de mapas, permite acceder a las siguientes herramientas:

![Herramienta de medir distancia](/cartografia-digital/images/clase-02/measure-length.png) Herramienta de medir distancia
: Realiza una medición interactiva de longitudes planimétricas (horizontales) de segmentos definidos con el mouse. Se despliegan en la consola: la longitud de cada segmento, la longitud acumulada de todos los segmentos de una línea quebrada, y el ángulo de cada segmento, respecto al Norte, medido en el sentido de las manecillas del reloj. Las longitudes se miden en la unidades en que se encuentra construido el mapa.

![Herramienta de perfil](/cartografia-digital/images/clase-02/layer-raster-profile.png) Herramienta de perfil
: Permite crear un perfil topográfico de un mapa raster de altitudes de forma interactiva. Este procedimiento se puede generalizar para construir perfiles de cualquier otra variable (relieve relativo, pendientes, curvaturas, etc.).

Un perfil topográfico es la representación del relieve de una región a partir de las variables de distancia y altitud. En una línea seleccionada sobre el mapa, se definen distancias desde el punto inicial hasta el punto final, y a cada punto se le asigna su respectivo valor de altitud. La gráfica de "distancia vs. altitud" corresponde al perfil topográfico de dicha línea. En una clase posterior aprenderemos a elaborar conjuntos de perfiles paralelos y de igual distancia, como un procedimiento que permite evaluar de manera más profunda la estructura del relieve de una región.

Con el botón **Plot Options** ![](/cartografia-digital/images/clase-02/settings.png) se pueden realizar modificaciones a los parámetros gráficos del perfil, por ejemplo: Color y espesor de la línea del perfil, texto y formato de las etiquetas de los ejes 'X' y 'Y'.

![Herramienta de histograma](/cartografia-digital/images/clase-02/layer-raster-histogram.png) Herramienta de histograma
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

- La altitud desde la cual se observa el mapa...
- La exageración vertical...
- La perspectiva...
- El color de fondo...

### Datos

- El mapa raster de superficie
- La resolución de renderizado
- Las reglas de color

### Presentación {#presentacion}

- La iluminación
- El márgen del mapa
