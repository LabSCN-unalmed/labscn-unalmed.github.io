---
layout: curso
title: 'Trabajos'
curso: 'programacion-R'
order: 4
---

En el manejo de datos ambientales se muy usual que se tengan datos
georreferenciados con respecto a sitios específicos, corrientes de agua y
polígonos que corresponden a clasificación del terreno.

Suponga que se tienen los siguientes elementos:

 - Una base de datos con coordenadas en donde se identifican puntos que
   corresponden a sitios de interés.
 - Una seguda base de datos en donde se tienen polilineas que corresponden
   a corrientes de agua.
 - Una tercera base de datos en donde se tiene la información que identifica
   área o polígonos de información de interés.

En [este archivo](EjemploBaseDeDatos.xlsx) en Excel
se muestra la forma como está estructurada la
información.

Se tendrá los siguientes supuestos:

 - Todas las coordenadas se suponen que están en coordenadas planas y
   la unidad son metros.
 - El orden de flujo de las corrientes sigue el orden de los puntos que
   corresponden a la polilínea.
 - Los polígonos tienen las coordenadas de los vértices en donde el primer
   vértice coincide con el último para que el polígono cierre.
 - Los polígonos no tendrán lados que se crucen entre ellos, pero pueden
   ser cóncavos y convexos.     

 Se propone crear un paquete en R que permita realizar las siguientes tareas:

 - Leer la respectiva información y configurarla en estructuras que
   faciliten su graficación mediante la graficación básica en R.
 - Crear una función que permita identificar para cada punto el polígono
   al cual corresponde cada punto. (Si un punto queda exactamente en el
   límite de un polígono se identifica los dos polígonos al cual podría
   pertenecer el punto).

   En [este enlace](http://alienryderflex.com/polygon/) se puede encontrar
   la idea algorítmica para establecer si un punto está dentro de
   un polígono cualquiera.
 - Crear una función para determinar los puntos de corte de las corrientes
   de agua con los polígonos.

# Trabajo 1 (Etapa inicial)

Fecha de entrega: Martes 28 de junio de 2016 antes de las 23:59 hora de
Colombia al correo **krcabrer@unal.edu.co** y no olvidar la etiqueta
**[CursoR]**.

Una primera etapa en donde se plantea un esquema del paquete que deberá
contener los siguientes elementos:

 - Definición de los objetos o estructura de datos a constuir y manejar.
 - Funciones o métodos con sus respectivas entradas y salidas de acuerdo
   al esquema de objetos o estructura de datos utilizadas.

El archivo a entrgar es un documento en formato ".pdf".

# Trabajo 2 (Etapa final)

Fecha de entrega: Viernes 1 de julio de 2016 antes de las 23:59 hora de Colombia
al correo **krcabrer@unal.edu.co** y no olvidar la etiqueta **[CursoR]**.
Entrega de un paquete en R en donde se muestre la implementación del trabajo
planteado en la primera etapa del proyecto.

El paquete deberá permitir:

1. Leer una base de datos de:
  * puntos.
  * polilíneas (corrientes de agua).
  * polígonos.
2. Permita graficar:
  * los puntos.
  * los polígonos.
  * las corrientes de agua (mostrando la dirección de flujo).
3. Permita graficar los polígonos y su correspondiente identificador.
4. Permita graficar puntos, corrientes y polígonos en cualquier
   combinación posible que desee el usuario.
5. Mostrar los puntos clasificados de acuerdo al polígono al que pertenecen.
6. Mostrar los puntos de intersección de la corrientes con los polígonos.
7. Escribir o exportar a bases de datos externas los resultados de los puntos
    clasificados. También la base de datos de los puntos de intersección de
    cada polilínea o corriente de agua con los polígonos.

Condiciones del paquete:

- El paquete estará escrito en código de R para una entrega "normal" del paquete.
- Se deberá mostrar uso de la característica de programación vectorial o
  matricial del R.
- El paquete debe estar documentado adecuadamente.        
- Para alcanzar la excelencia se debe mostrar implementación de partes
  en código C++.


El archivo a entregar es un archivo ".tar.gz" a partir del cual se pueda instalar
el paquete en el R.
