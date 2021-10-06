---
layout: clase
title: 'Introducción al R'
curso: 'programacion-R'
clase: 2
custom_js: 'mathjax'
---


## Funciones útiles en R.

 - `str()` : Muestra la estructura interna.
 - `names()`: Nombres de los elementos en un objeto.
 - `class()`: La clase interna de un objeto de R.
 - `mode()`: Tipo de almacenamiento (similar a `typeof()`)
 - `length()`: Dimensión de vectores o listas.
 - `dim()`: Dimensión de arreglos y matices.
 - `sessionInfo()`: Información del R y paquetes montados.

## Tipos y clases atómicos.

 - Numéricos (`"numeric"`)
 - Enteros (`"integer"`)
 - Complejos (`"complex"`)
 - Lógicos (`"logical"`)
 - Carácter (`"character"`)

### Ejemplos

  - [Tipos básicos o atómicos](01ElementosBasicos.R)

```r
x <- 10.5      # Asigna un número con punto decimal.
x              # Muestra el contenido del objeto x.

class(x)       # Muestra la clase del objeto x.

y <- 10        # En general los números son reales.
y

class(y)
is.integer(y)
```

 - [Estrucutras de datos básicas](02EstructurasdeDatosBasicas.R)

    * Vectores (`vector`).
    * Matrices (`matrix`).
    * Factores (`factor`).
    * Listas (`list`).
    * Bases de datos (`data.frame`).

## Operaciones básicas.

 - Operaciones para tipos numéricos, enteros, complejos y lógicos.

   * Potencia (`^`).
   * Producto, división, división entera y módulo (`*, /, %/%, %%`).
   * Suma y diferencia (`+, -`).
   * Mayor, mayor o igual, menor, menor o igual,
     igual y diferente que (`>, >=, <, <=, ==, !=`)
   * Conjunción (`&`, `&&`), disyunción (`|`, `||`),
   * Negación (`!`).
   * Asignación (`<-`, `->`).

 Si existen dos operadores con la misma precedencia,
 se ejecuta la operación de izquierda a derecha.

 Toda precedencia se puede modificar mediante los
 paréntesis `()`.

  - Operaciones para tipos matrices y vectores.

    * Suma vectorial y matricial (`+, -`).
    * Multiplicación y división elemento a elemento (`*, /`).
    * Producto punto, producto entre matrices (`%*%`).
    * Producto externo (`%o%`).

  - Operaciones para tipos factores y sartas:
    No olvidar utilizar `as.character()`, en el caso de los factores si
    se quiere trabajar con los identificadores de los niveles del factor.

    * Concatenar (`paste(), paste0(), cat()`).
    * Subsarta (`substr()`, `substring()`).
    * Índice (`gregexr()`)

### Ejemplos

  - [Operaciones básicas](03Operaciones.R)

## Estilo de codificación en R

  - [Estilo en R](04EstiloR.html)

## Estructuras de control en R

  - [Estrucutras de control](05Estructuradeprogramacion.html)
