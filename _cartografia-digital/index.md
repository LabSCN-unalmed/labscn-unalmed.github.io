---
layout: curso
title: 'Cartografía Digital'
curso: 'cartografia-digital'
order: 0
---



## Descarga de datos de ejemplo

Los datos de ejemplo para el desarrollo de este curso se encuentran en una [carpeta compartida](https://drive.google.com/drive/u/1/folders/1WECb41Sdrmqd0zjkXO0LCOCwm83x8AI4?usp=drive_link){:target="blank"} en Google Drive.

<hr>

¿Qué es la superficie terrestre?
--------------------------------

### La superficie terrestre presenta una estructura y una dinámica

Los SIG son muy útiles en primer lugar para realizar una descripción cuantitativa de la estructura del relieve. Como se trata de describir cuantitativamente una forma se habla por lo tanto de morfometría o mejor de geomorfometría.

### La dinámica del relieve se puede registrar en sensores remotos

Esto depende de la frecuencia y del periodo de registro.

### Elementos importantes de una descripción morfométrica del relieve

- La altitud.
- La pendiente.
- Las curvaturas del terreno (horizontal y vertical).
- El "aspect": Hacia donde “mira” el terreno.
- Conocer si un punto en el terreno pertenece a una divisoria o a una superficie de escorrentía o si pertenece a una canal de una corriente.
- Identificar puntos especiales en el relieve (pico, "pit" o centro de una depresión cerrada, identificar un "pass" o "saddle", es decir, el punto central de una concavidad ubicada en una divisoria de aguas).
- Identificar conjuntos de puntos que configuran lineas especiales en un relieve (un eje de vaguada que puede ser un canal de corriente, "channel", o una linea de divisoria de aguas, "ridge").
- Identificar superficies especiales: Una superficie plana.

El modelo de datos raster y la descripción del relieve
------------------------------------------------------

### La representación del relieve en un modelo de datos raster

Una cuadricula georeferenciada (eje X, eje Y, y altitud en el caso de un modelo digital de elevaciones).

Una cuadricula georeferenciada (eje X, eje Y, e inclinación del terreno en el caso de un modelo digital de pendientes o mapa de pendientes).

Resolución espacial de un archivo raster.

Modelo digital del terreno (DTM) y modelo digital de superficie (DSM).

### Dependencia escalar de los problemas geográficos

Una resolución espacial más fina implica una observación más detallada de los objetos.

Un mismo objeto puede ser representado como punto o polígono de distinta área, dependiendo de la resolución espacial.

Los problemas regionales con imágenes regionales, problemas locales con imágenes detalladas.

Los documentos regionales acotan el tipo de problemas geográficos a resolver.

Los costos de los diferentes tipos de documentos.
