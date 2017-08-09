---
layout: curso
title: 'Tareas'
curso: 'programacion-R'
custom_js: 'mathjax'
order: 3
---

## Primera tarea individual

### Enunciado

Escriba un algoritmo en seudocódigo que:

 1.  Lea las lados de un rectángulo y como resultado muestre su área.
 2.  Lea las coordenadas de dos puntos y muestre la distancia de
    [Manhattan o City o distancia del taxista](https://es.wikipedia.org/wiki/Geometr%C3%ADa_del_taxista).
 3.  Lea las coordenadas de los vétices de un triángulo y determine si es un
     triángulo rectángulo.
 4.  Lea la longitud de tres segmentos y determine si con
     ellos se puede construir un triángulo.
 5.  Dadas las coordenadas de dos puntos de una recta,
     determinar si dicha recta es paralela a otra recta dada
     las coordenadas de dos puntos de la segunda recta.

 6.  **Punto extra** (Vale por los cinco puntos) Se tiene $$ N $$ posiciones de ciertos eventos,
     $$ (x_1, y_1), (x_2, y_2), \cdots , (x_n, y_n) $$
     se tiene además un radio $$ B $$ denominado zona de confort, se pretende
     calcular la posibilidad del origen de los eventos para cada coordenada
     $$ (X_i, Y_j) $$ de una cuadrícula mediante la fórmula:

     $$
     p_{ij} = \sum_{k = 1}^N \left[  \frac{\phi}{|X_i - x_k| + |Y_i - y_k|}  +
              \frac{1- \phi}{(2B - |X_i - x_k| - |X_i - y_k|)} \right]
     $$

     Dónde:

     $$
       \phi = \begin{cases}
                  1 & \textrm{ si } (|X_i - x_k| + |Y_i - y_k|) > B  \\
                  0 & \text{ en otro caso, e. o. c.}
              \end{cases}
     $$

     Calcule para una matriz de $$ 10 \times 10 $$, para cada posición
     $$ i, j $$ los valores de $$ p_{ij} $$.

     Para entender el uso del punto extra conviene verse el
     episodio 1 de la temporada 1 de la serie Numb3rs.

       - [Episodio 01 Temporada 01 (español de España)](https://dl.dropboxusercontent.com/u/5532451/numb3rs101/Numb3s_1x01_Piloto_Espanol(Espana).avi).
       - [Episodio 01 Temporada 01 (Inglés)](https://dl.dropboxusercontent.com/u/5532451/numb3rs101/Numb3rs_1x01_Pilot_English.avi).
       - [Subtítulos en español](https://dl.dropboxusercontent.com/u/5532451/numb3rs101/Numb3rs_1x01_Pilot_English.srt).

### Archivos para entregar:

Cinco o un archivos con los siguientes nombres:

- Tarea1Punto1.txt
- Tarea1Punto2.txt
- Tarea1Punto3.txt
- Tarea1Punto4.txt
- Tarea1Punto5.txt

o

- Tarea1PuntoExtra.txt   

siguiendo la plantilla dada para el curso.

**Se entrega o los cinco puntos o el punto extra, no los dos**

### Fecha de entrega:

Miércoles 16 de agosto de 2017 antes de las 23:59
[hora de Colombia](http://horalegal.inm.gov.co/)
al correo krcabrer@unal.edu.co y en asunto no olvidar
**[CursoR]**
