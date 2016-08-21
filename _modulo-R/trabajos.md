---
layout: curso
title: 'Trabajos'
curso: 'modulo-R'
order: 4
---

## Primer trabajo individual ("Fenómeno de El Niño")  

### Actividades
En la [página del NOAA](http://www.cpc.ncep.noaa.gov/products/analysis_monitoring/ensostuff/ensoyears.shtml)
 (National Oceanic and Atmospheric Administration) se
encuentra publicado un índice ambiental para determinar el grado de intensidad
del fenómeno de "El Niño" o de "La Niña" de acuerdo a datos atmosféricos en
el mundo.

Utilizando la [base de datos](./dbs/ENSO.csv) allí publicada mediante
sólo código en R, transformar la base de datos para mostrar una gráfica
similar a la siguiente, sólo desde el mes y año de su fecha de nacimiento:

![elniño](./figs/ElNiño.png)

### Documentos a entregar.
  - Documento en formato ".Rmd" con el código que realiza la lectura,
    transformación y graficación de la base de datos.
  - Informe ejecutivo en formato ".html" con únicamente la gráfica (sin código)
    y un breve comentario sobre el comportamiento del índice del fenómeno de
    "El Niño" y su impacto en Colombia.

### Fecha de entrega    

Miércoles 17 de agosto de 2016 antes de las 23:59 hora de Colombia al
correo **krcabrer@unal.edu.co** y no olvidar en asunto escribir la sigla,
entre corchetes **[ModuloR]**.

## Trabajo extra individual ("Fenómeno de El Niño online")

### Objetivo
Realizar el mismo primer trabajo individual, pero leyendo la información
directamente desde la
[página del NOAA](http://www.cpc.ncep.noaa.gov/products/analysis_monitoring/ensostuff/ensoyears.shtml)
y que además tome también los colores que identifican una información
en cuanto al fenómeno del El Niño o de La Niña y que muestre en la gráfica este mismo color,
en los puntos correspondientes.

### Incentivo
  Este trabajo sustituye todos los talleres y trabajos del módulo (vale un 50% del módulo,
  el otro 50% del módulo es el trabajo final).

### Documentos a entregar

1. Archivo en formato ".Rmd" del código correspondiente.
2. Informe ejecutivo en formato ".html" (sin código) con unicamente la gráfica y un análisis del resultado
   y los efectos del fenómeno en la economía colombiana en los años más críticos
   del los periodos Niño y Niña (sustentado con bibliografía).

### Fecha de entrega

Miércoles 24 de Agosto de 2016 antes de 23:59 hora de Colombia al correo
al correo **krcabrer@unal.edu.co** y no olvidar en asunto escribir la sigla,
entre corchetes **[ModuloR]**.


## Trabajo final ("Batalla naval").

### Objetivo
Constuir el juego de la batalla naval en el R.
En [esta página](http://es.battleship-game.org/) se puede encontrar un ejemplo del juego.

### Procedimiento para conectar dos computadores.

1. Se utiliza un cable cruzado o "crossover" para la conexión. Aunque
   actualmente la mayoría de los equipos se pueden conectar con cables
   de red usuales.
2. Conecte los dos computadores mediante el cable de red. (Algunas veces
    este paso es suficiente para realizar la conexión).
    Selecciones uno de los computadores como el anfitrion (HOST) y
    el otro será el invitado o huesped (GUEST).
3. Para realizar la conexión manual con windows 7, 8 o 10 se procede a
   presionar las teclas "Windows + R".
4. Se escribe en la ventana que se muestra la orden "ncpa.cpl" (sin las comillas).
   Deberán aparecer las conexiones de red.
5. Utilice el click derecho del mouse en "Conexión de área local" y selecciona
   la opción de "Propiedades".
6. En la pestaña de "General" se busca la opción que dice
   "Protocolo de internet versión 4 (TCP/IP)" o "Internet Protocol Version 4 (TCP/IP)".
7. Seleccione la opción de "Usar la siguiente dirección IP:".
8. Configurar del siguiente modo el computador 1 (HOST o anfitrión).

   * Dirección IP:       192.168.0.1
   * Máscara de subred:  255.255.255.0
   * Los demás campos se dejan vacíos.

   Configurar del siguiente modlo el comptador 2 (GUEST, invitado o huesped).

   * Dirección IP:       192.168.0.2
   * Máscara de subred:  255.255.255.0
   * Los demás campos se dejan vacíos.


 9. Mediante el "Explorador de archivos" busca en Red la conexión de cualquiera
    de los dos computadores en el otro.
    Si el sistema le pide una clave hay que desactivar el sistema de clave en
    la red del hogar.

### Desactivar solicitud de contraseña.
  1. Incio > panel de control > redes e internet.
  2. Grupo Hogar > cambiar configuración de uso
     compartido avanzado.
  3. Casi al final se encuentra y se marca la opción:
     "Desactivar el uso compartido con petición por contraseña".
  4. Se puede hacer el mismo procedimiento en "Centro de redes y recursos compartidos".


### Procedimiento para comprartir una carpeta o archivo en red.

 1. Se realiza click derecho en una carpeta.
 2. En la pestaña "Compartir" y se marca el botón "Uso compartido avanzado".
 3. Marcar "Compartir esta carpeta", y la configuración de
    se desee de acuerdo a criterios del usuario.
 4. Se recomienda hacer este procedimiento en el computador HOST o anfitrión.
    (Pero no es obligatorio)

### Direccionamiento del archivo en R

  1. Los archivos compartidos se detectan en la red mediante direcciones como:
     **\\\computador\users\naval\archivoJugadas.txt**, sin embargo a la hora
     de escribir en R la dirección del archivo para leerlo con la
     función `readLines()` se utiliza la dirección de la siguiente manera
     **\\\computador/users/naval/archivo.txt**. En la mayoría de las veces
     también funciona como: **\\\\computador\\\users\\\naval\\\archivoJugadas.txt**

   2. Procure no utilizar espacios en blanco en los nombres de los archivos y
       carpetas porque esa forma the ruta es más compleja de manejar por el R.     

### Condiciones
En grupos de máximo seis (6) personas de debe constuir de manera que se puede
interactuar entre dos computadores conectados mediante un cable de red
tipo cruzado para conectar dos equipos directamente.

Se calificará con un ranking en orden desde el mejor juego.

Criterios de evaluación:

1. Si tiene animación.
2. Si toma tiempos de juego.
3. Dibujos y figuras interesantes.
4. Que permita armar el tablero de manera iteractiva.

#### Documentos a entregar.
 - Archivo en formato ".R" con el código del juego, junto con otros archivos
   de código en R, si son necesarios.
 - Archivo en ".pdf" donde indique cómo jugar el juego y como configurar los
   equipos y el programa para que funcione adecuadamente el juego.

### Fecha de entrega
 Viernes, 2 de septiembre en la hora de clase. Y los códigos y documentos
 a la dirección **krcabrer@unal.edu.co** antes de las 23:59 horas
 y no olvidar en asunto escribir la sigla, entre corchetes **[ModuloR]**.
