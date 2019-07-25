---
layout: curso
title: 'Talleres'
curso: 'modulo-R'
order: 5
---




## Contenido
{: .no_toc}

* ToC
{: toc}

## Primer taller individual.

Trazar un segmento horizontal o vertical
de acuerdo a un click en donde sea más próximo
en una malla de puntos.



<!---

 + [Enunciado](./talleres/pobreza_mundial_enunciado.html)
 + [Solución](./talleres/pobreza_mundial_solucion.html)



 * [Enunciado](./talleres/quiz1.html)
 * Entrega: Se espera un archivo en formato ".R"
   y con el apellido y nombres del estudiante al
   correo **krcabrer@unal.edu.co**.
   No olvidar en asunto escribir **[ModuloR]**.
 * Fecha de entrega 21 de marzo de 2018, antes de
   las 10:30 de la mañana.   

## Primer taller individual recuperatorio (Quiz 1)
  * [Enunciado](./talleres/quiz1_rec.html)
  * Entrega: Se espera un archivo en formato ".R"
    y con el apellido y nombres del estudiante al
    correo **krcabrer@unal.edu.co**.
    No olvidar en asunto escribir **[ModuloR]**.
  * Fecha de entrega 23 de marzo de 2018, antes de
    las 12:00 del medio día.

## Segundo taller individual (Quiz 2)

 * En la página de datos abiertos se require
   obtener una base de datos en un formato adecuado (tidy) de
   la base de datos:
   [Matrícula establecimientos educativos oficiales y no oficiales Municipio de Medellín 2017](https://www.datos.gov.co/Educaci-n/Matr-cula-establecimientos-educativos-oficiales-y-/6qaa-344w)

## Tercer taller individual (Quiz 3)   

 * Dado el [siguiente código](./codigos/quiz3.R) que hace que una bolita rebote en
   los bordes de un tablero, modificar el código de tal manera que




 ## Primer taller individual (Quiz 1)


### Enunciado

1. Muestre el código para crear una lista
   cuyo primer elemento sea una base datos
   de seis registros y de tres columnas
   de las cuales  dos columnas sean numéricas y una tercera
   que sea categórica,
   un segundo elemento de la lista que
   sea una matriz de 3x2 de cadenas, sartas o `strings` y
   un tercer elemento de la lista que sea un
   vector de 10 elementos de números complejos.


2.  Muestre el logaritmo en base 10 de un
    vector numérico de sólo los valores que sean
    mayores de cero. La función en R para el
    logaritmo en base 10 es `log10()`.

3.  Muestre el menor de los números de un vector
    numérico positivo pero que no sea cero.
    La función para hallar el valor mínimo
    de un vector es `min()`.



4. Se tiene el resultado de una regresión lineal.
    Escriba el código para obtener únicamente el valor p
    de la regresión.

    El valor p de la regresión necesita el estadístico
    F y los grados de libertad del numerador y
    del denominador y se halla con el R mediante la función `pf()`, con esos tres parámetros y el valor p sería
    `1-pf(valorF, gradlibNum, gradlibDen)`.

    Por ejemplo:

    ```
     set.seed(0)
     x1 <- 1:6
     x2 <- c(2, 3, 1, 2, 3, 5)
     y <- 3 * x1 - 4 * x2 + rnorm(6)
     modelo <- lm(y ~ x1 + x2)
     anova(modelo)
     summary(modelo)
    ```

    En el caso anterior deberá mostrar el valor de 0.0003053.


5. Suponga que tiene dos vectores de números,
        escriba las instrucciones para que muestre
        la diferencia simétrica entre los elementos
        de los dos vectores.

        Por ejemplo:

        ```
         x <- c(1, 3, 9, 4, 4, 1, 4, 2, 8)
         y <- c(2, 2, 3, 8, 10, 1, 1, 3)
         [1]  9 4 10   
        ```    


### Entrega.

Enviar un archivo ".html" que muestre el código
de las soluciones de cada punto del quiz antes
de las 12:00 hora de Colombia, del día 15 de septiembre de 2017 al correo **krcabrer@unal.edu.co** y no olvidar en asunto
**[ModuloR]**.


## Taller individual

 - [Composición de funciones periódicas](./talleres/funciones_periódicas.html)
 - [Primera base de datos de ejemplo](./talleres/taller1.xlsx)

 Plantilla del resultado esperado:
 - [Ejemplo del resultado esperado](./talleres/composición_funciones.html)
 - [Segunda base de datos de ejemplo](./talleres/ejemplo2.xlsx)

 -->
