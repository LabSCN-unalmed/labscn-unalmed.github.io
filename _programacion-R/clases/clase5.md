---
layout: clase
title: 'Funciones en R'
curso: 'programacion-R'
clase: 05
custom_js: 'mathjax'
---

## Plantilla de funciones en R

``` r
nombreDeLaFuncion <- function(argumentos) {
  Cálculos con los argumentos de la función.
  Series de instrucciones en R.
  Desarrollo del cuerpo de la función.
}
```

## Elementos de una función.

Todas la funciones tienen las siguientes partes:

  - El cuerpo: `body()`: Código propio de la función.
  - Parámetros formales: `formals()`: Lista de argumentos de la función.
  - Entorno: `environment()`: Mapa en donde se localizan
    las variables de la función.

``` r
# Definción de una función simple
miPrimeraFuncion <-function(n) {
  n*n  #  Halle el cuadrado de un número.
}
# Uso de la función.
# Definir un valor:
k <- 10

# Llamado a la función
# Tres forma de llamar a una función

miPrimeraFuncion(k)

m <- miPrimeraFuncion(k)
m

(m <- miPrimeraFuncion(k))
```

La instrucción `return()` finaliza la función y se recomienda si se
utiliza, sólo al final de la función.

[Función simple](06funciones01.html)

## Trabajo de funciones en R.

Las funciones tienen argumento con nombre los cuales
tienen potencialmente valores por omisión.

- Los argumentos formales son los que se incluyen en la definción de la función.
- La función `formals` muestra una lista de todos los argumentos de una función.
- No todo llamado a una función en R usa todos los argumentos formales.
- Los argumentos pueden no estar presentes o tener valores por omisión.


[Trabajo con funciones](06funciones02.html)

## Funciones en el paquete básico del R.

Para obtener todas las funciones de un paquete en R (en particular el paquete
  `base`)

``` r
objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)
```

## Preguntas finales.

[Preguntas sobre funciones](06funciones03.html)
