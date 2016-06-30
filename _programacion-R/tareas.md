---
layout: curso
title: 'Tareas'
curso: 'programacion-R'
custom_js: 'mathjax'
order: 3
---

## Tarea 1

Fecha de entrega: miércoles 15 de junio de 2016 antes de las 23:59
  [hora de Colombia](http://horalegal.inm.gov.co/).

Escriba un algoritmo que:

 - Lea dos números y los muestre en las variables intercambiadas (sin utilizar
   una tercera variable auxiliar).

 - Lea un número entero cualquiera y determine si es
   [capicúa](https://es.wikipedia.org/wiki/Capic%C3%BAa).

 - Lea una oración y determine el número de palabras, suponiendo que cada
   palabra está separada de otra por mínimo un espacio en blanco. Suponga
   también que no se tienen signos de puntuación.

 - Lea las coordenadas de los vértices de un tríangulo y
   determine si es rectángulo.

 - Lea la longitud de tres segmentos y determine si con ellos se puede
   constuir un triángulo.

 - **Punto extra** (Vale por los cinco anteriores) Lea las coordenadas
   de dos puntos de una recta y determine las coordenadas
   del punto de intersección con otra recta dada las coordenadas de dos puntos
   que pertenecen a la otra recta.

Archivos para entrega:

Cinco o un archivos con los siguientes nombres:

 - Tarea1Punto1.txt
 - Tarea1Punto2.txt
 - Tarea1Punto3.txt
 - Tarea1Punto4.txt
 - Tarea1Punto5.txt

o

 - Tarea1PuntoExtra.txt   

siguiendo la plantilla dada para el curso.

## Tarea 2
Fecha de entrega: martes 21 de junio de 2016 antes de las 23:59
  [hora de Colombia](http://horalegal.inm.gov.co/).

Escriba una función en C++ integrada a R que:

1. dado un vector de valores numéricos de una serie de tiempo, calcule
   el valor pronosticado utilizando el
   [suavizamiento exponencial](https://mx.answers.yahoo.com/question/index?qid=20110405160019AAxnVlI)
   simple  dado el valor de $$\alpha$$. Utilice como pronóstico inicial el
   promedio de los dos primeros valores.

2. dado un vector de enteros y un booleano que indique que se quieren
   los pares o los enteros impares, devuelva en un vector de enteros
   los números que indique la variable booleana.
3. dadas las coodenadas de un punto indique si está a la izquierda (-1),
   o a la derecha (1) o sobre la recta (0) dados dos puntos pertenecientes
   esa recta, si esta recta no es horizontal.
   Si la recta es horizontal indique si está abajo (-1) o arriba(1) o en la recta (0).   
4. dada las dimensiones de una matriz cualquiera en un vector numérico,
   donde la primer componente son las filas y la segunda son las columnas,
   devuelva los indices de la matriz en forma de espiral en una matriz de
   orden $$(n\times m)\times 2$$.
5. dada una matriz de orden $$n \times 2$$ donde cada renglón representa
   las coordenadas de un punto perteneciente a una polilínea devuelva la
   longitud de la polilínea.

6. **Punto extra** Dada una matriz de orden $$n\times 2$$ donde cada renglón
   representa las coordenadas de un punto perteneciente a una polilínea devuelva
   las coordenadas de las intersecciones de los segmentos de la polilínea que cortan
   con una recta dada por una matriz de orden $$2\times 2$$ donde cada renglón
   representa las coodenadas de un punto que pertenecen a la recta.


Archivos para entrega:

  - Tarea2Punto1.cpp
  - Tarea2Punto2.cpp
  - Tarea2Punto3.cpp
  - Tarea2Punto4.cpp
  - Tarea2Punto5.cpp

o

 - Tarea2PuntoExtra.cpp

## Tarea 3

Fecha de entrega: viernes 24 de junio de 2016 antes de las 23:59
  [hora de Colombia](http://horalegal.inm.gov.co/).

Se pide resolver los algoritmos y las funciones de C++, pero todo en
código R y simplificar donde sea posible en forma matricial el código
respectivo.

Archivos para entregar:

  - Tarea3Punto1seudo.R
  - Tarea3Punto2seudo.R
  - Tarea3Punto3seudo.R
  - Tarea3Punto4seudo.R
  - Tarea3Punto5seudo.R    
  - Tarea3Punto1cpp.R
  - Tarea3Punto2cpp.R    
  - Tarea3Punto3cpp.R    
  - Tarea3Punto4cpp.R    
  - Tarea3Punto5cpp.R    

o

  - Tarea3PuntoExtraseudo.R
  - Tarea3PuntoExtracpp.R

## Tarea extra

  [Tarea extra](tareaExtra.html)
