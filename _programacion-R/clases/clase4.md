---
layout: clase
title: 'Introducción al R'
curso: 'programacion-R'
clase: 4
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


## Tipos y clases derivados.

## Operaciones básicas.
