---
layout: curso
title: 'Trabajos'
curso: 'ecologia-numerica'
order: 3
custom_js: 'mathjax'
---



## Contenido
{: .no_toc}

* ToC
{: toc}

## Trabajo individual I

### Objetivo.

Realizar la estimación del tamaño de muestra para
una regresión lineal simple en un contexto específico
mediante simulación.

### Elementos del trabajo.

1. Realizar un análisis exploratorio de la base de datos,
   con el fin de seleccionar una subconjunto de la base
   de datos en donde una regresión de línea recta que tenga
   sentido.

2. Mostrar una gráfica en donde se muestre la relación de línea
   recta entre una variable explicativa \\( x \\) y
   una variable respuesta \\( y \\).

3. Estimar con la base de datos los valores de \\( \beta_0 \\) y de \\( \beta_1 \\).

4. Estimar el valor de \\( \sigma \\).

5. Utilizando la información obtenida determinar un valor mínimo detectable de \\( \beta_1 \\) y un nivel de precisión para estimar el valor de \\( \beta_1 \\).

6. Mediante la simulación determinar el tamaño de muestra para que
el parámetro \\( \beta_1 \\) sea detectado.

7. Utilizando la misma metodología de simulación hallar un tamaño de muestra con el nivel de precisión establecido en el punto 5.

8. Tomar otro valor de \\( \beta_1 \\) distinto al utilizado anteriormente con una justificación en el contexto y de nuevo determinar el tamaño de muestra para ser detectado y el tamaño de muestra para el nivel de precisión establecido.

9. Realizar una discusión sobre los supuestos de la regresión lineal con respecto a los datos utilizados en la simulación.

10. Utilizar la funcion `lm()` para estimar los parámetros de la regresión así también el valor de \\( R^2 \\), \\( R^2 \\) ajustado,
la estimación de la desviación estándar de los residuales (compararla con la utilizada en la simulación) y discutir el valor \\( p \\) obtenido de la regresión en el contexto del ejemplo utilizado. A continuación se muestran unos enlaces útiles para esta parte del trabajo:
  *  [Interpretación de \\( R^2 \\)](http://statisticsbyjim.com/regression/interpret-r-squared-regression/).
  *  [Diferencias entre \\( R^2 \\) y \\( R^2 \\) ajustado](https://discuss.analyticsvidhya.com/t/difference-between-r-square-and-adjusted-r-square/264/4).
  * [Discución del uso de \\( R^2 \\)](https://www.theanalysisfactor.com/small-r-squared/).
  * [Precaución en el uso del \\( R^2 \\)](https://onlinecourses.science.psu.edu/stat501/node/258/).

11. [En este enlace](https://kenbenoit.net/assets/courses/ME104/logmodels2.pdf) y
 [en este](https://onlinecourses.science.psu.edu/stat501/node/318/) se describe algunos modelos de regresión lineal simple pero utilizando transformaciones logarítmicas.
 Buscar una base de datos o si la que se utilizó entra en este contexto entonces realizar la transformación adecuada y de nuevo realizar todo el ejercicio de simulación y tamaño de muestra pero con la transformación realizada. Interpretar los resultados obtenidos y compararlos con el resultado anterior.

12. Escribir conclusiones.

13. Describir recomendaciones.

### Resultados a entregar.

- Archivo en formato "html" con los resultados y la discusión (sin el
  código de R utilizado).
- Archivo en formato ".Rmd" con el código fuente utilizado para realizar el trabajo.
- Archivo o archivos de o de las bases de datos utilizadas para que el código ".Rmd" se ejecute.

### Fecha de entrega.

- Miércoles, 6 de febrero de 2019.
