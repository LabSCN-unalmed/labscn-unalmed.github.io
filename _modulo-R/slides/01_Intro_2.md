<style>
.small-code pre code {
  font-size: 1.2em;
}
</style>

Introducción al R (Parte II)
========================================================
author: Kenneth Cabrera
date: domingo, 11 de marzo de 2018


Clases de objetos
========================================================
El R tiene como clases de objetos básicos o "atómicos"

- character (alfanumérico).
- numeric (reales).
- integer (enteros).
- complex (complejos).
- logical (lógicos TRUE/FALSE).

Objetos
========================================================
El objeto más básico es un vector.

- Un vector sólo puede tener objetos de la misma clase.
- Una lista puede contener objetos de diferentes clases.
- Un vector vacío se crea con la función `vector()`

Números
========================================================
- Los números en R se tratan como objetos numéricos (reales
  de doble precisión).
- Si quieres especificar un entero deberá finalizarlo con `L`.
- *Números* especiales: `Inf`, representa el infinito.
- El valor `NA` es un valor faltante ("Not Available")
- El valor `NaN` es un valor no definido ("Not a Number").

Atributos
========================================================
Un objeto en R puede tener atributos como:
- nombres (`names`, `dimnames`).
- dimensiones (`dim`).
- clase (`class`).
- longitud (`length`).
- Otros metadatos y atributos particulares.

Se utiliza la función `attribute()` para inspeccionarlos.

Asignación
========================================================
El símbolo `<-` es el operador de asignación. También
se utiliza `->` para realizar la asignación de izquierda a
derecha.


```r
x <- 1
print(x)
```

```
[1] 1
```

```r
45 -> y
print(y)
```

```
[1] 45
```


Salida
========================================================

```r
x <- 1:20
x
```

```
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

El operador dos puntos (`:`) crea secuencias.

Vectores I
========================================================

```r
x <- c(0.5, 0.6)      ## numérico
class(x)
```

```
[1] "numeric"
```

```r
x <- c(TRUE, FALSE)   ## lógico
x <- c(TRUE, FALSE)   ## lógico
x <- c("a", "b", "c") ## alfanumérico, carácter, sarta.
```

Vectores II
========================================================

```r
x <- c(0.5, 0.6)      ## numérico
x <- 9:29             ## entero
x <- c(1+0i, 2+4i)    ## complejo
# Uso de la función vector().
x <- vector("numeric", length = 10)
x
```

```
 [1] 0 0 0 0 0 0 0 0 0 0
```


Vectores III
========================================================

```r
x <- 1
class(x)
```

```
[1] "numeric"
```

```r
x <- 1L
class(x)
```

```
[1] "integer"
```

Mezcla de objetos (conversión implícita)
========================================================

```r
y <- c(1.7, "a")
y <- c(TRUE, 2)
y <- c("a", TRUE)
```

Conversión explícita I.
========================================================

```r
x <- 0:6
class(x)
```

```
[1] "integer"
```

```r
as.numeric(x)
```

```
[1] 0 1 2 3 4 5 6
```

```r
as.logical(x)
```

```
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

Conversión explícita II.
========================================================

```r
x <- 0:6
as.character(x)
```

```
[1] "0" "1" "2" "3" "4" "5" "6"
```

```r
as.complex(x)
```

```
[1] 0+0i 1+0i 2+0i 3+0i 4+0i 5+0i 6+0i
```

Conversión explícita II.
========================================================

```r
x <- c("a", "b", "c")
as.numeric(x)
```

```
[1] NA NA NA
```

```r
as.logical(x)
```

```
[1] NA NA NA
```

```r
as.complex(x)
```

```
[1] NA NA NA
```


Matrices I
========================================================
class: small-code

```r
m <- matrix(nrow = 2, ncol = 3)
m
```

```
     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA
```

```r
dim(m)
```

```
[1] 2 3
```

```r
attributes(m)
```

```
$dim
[1] 2 3
```


Matrices II
========================================================
class: small-code

```r
m <- matrix(1:6, nrow = 2, ncol = 3)
m
```

```
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```

Matrices III
========================================================
class: small-code

```r
m <- 1:10
m
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
dim(m) <- c(2, 5)
m
```

```
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
```

Concatenación por fila o por columna
========================================================
class: small-code

```r
x <- 1:3
y <- 10:12
cbind(x, y)
```

```
     x  y
[1,] 1 10
[2,] 2 11
[3,] 3 12
```

```r
rbind(x, y)
```

```
  [,1] [,2] [,3]
x    1    2    3
y   10   11   12
```

Listas
========================================================

```r
x <- list(1, "a", TRUE, 1 + 4i)
x
```

```
[[1]]
[1] 1

[[2]]
[1] "a"

[[3]]
[1] TRUE

[[4]]
[1] 1+4i
```

Factores
========================================================
Los factores se usan para representar variables categóricas.
Pueden ser ordenados o no ordenados. Y se pueden asimilar
a un vector donde cada categoría tiene una etiqueta.

- Se usan en modelación como `lm()` y `glm()`.
- Ahorran espacio y codifican con etiquetas legibles variables
  categóricas.

Factores
========================================================
class: small-code

```r
x <- factor(c("si", "si", "no", "si", "no"))
levels(x)
```

```
[1] "no" "si"
```

```r
unclass(x)
```

```
[1] 2 2 1 2 1
attr(,"levels")
[1] "no" "si"
```

Factores
========================================================
class: small-code

```r
x <- factor(c("si", "si", "no", "si", "no"))

as.numeric(x)
```

```
[1] 2 2 1 2 1
```

```r
x <- factor(x, levels = c("si","no"))
levels(x)
```

```
[1] "si" "no"
```

```r
as.numeric(x)
```

```
[1] 1 1 2 1 2
```

Valores faltantes
========================================================

* `is.na()` Se usa para probar si los objetos son `NA`.
* `is.nan()` para los valores `NaN`.
* `NA` existen tantos numéricos `NA` como de sarta `<NA>`.
* Un valor `NaN` es `NA` pero no al contrario.

Valores faltantes I
========================================================

```r
x <- c(1, 2, NA, 10, 3)
is.na(x)
```

```
[1] FALSE FALSE  TRUE FALSE FALSE
```

```r
is.nan(x)
```

```
[1] FALSE FALSE FALSE FALSE FALSE
```

Valores faltantes II
========================================================

```r
x <- c(1, 2, NaN, NA, 4)
is.na(x)
```

```
[1] FALSE FALSE  TRUE  TRUE FALSE
```

```r
is.nan(x)
```

```
[1] FALSE FALSE  TRUE FALSE FALSE
```

Bases de datos (data frames)
========================================================

* Son un tipo de lista, donde cada elemento de la lista
  tiene la misma longitud.
* Cada elemento de la lista es una columa y la longitud
  de cada elemento de la lista es el número de filas.
* A diferencia de las matrices los `data.frame` permiten
  tipos distintos para cada columna. En las matrices
  todos son de la misma clase.
* Los `data.frame` tienen atributos como `row.names`.
* Se crean mediante funciones como `read.table()` o
  `read.csv()`.
* Se pueden convertir a matrices con `data.matrix()`.


Bases de datos (data frames)
========================================================
class: small-code

```r
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
```

```
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4 FALSE
```

```r
nrow(x)
```

```
[1] 4
```

```r
ncol(x)
```

```
[1] 2
```

Nombres de los objetos (vectores)
========================================================
class: small-code

```r
x <- 1:3
names(x)
```

```
NULL
```

```r
names(x) <- c("foo", "bar", "norf")
x
```

```
 foo  bar norf 
   1    2    3 
```

```r
names(x)
```

```
[1] "foo"  "bar"  "norf"
```


Nombres de los objetos (listas)
========================================================

```r
x <- list(a = 1, b = 2, c = 3)
x
```

```
$a
[1] 1

$b
[1] 2

$c
[1] 3
```


Nombres de los objetos (matrices)
========================================================

```r
m <- matrix(1:4, nrow = 2, ncol = 2)
m
```

```
     [,1] [,2]
[1,]    1    3
[2,]    2    4
```

```r
dimnames(m) <- list(c("a", "b"),c("c", "d"))
m
```

```
  c d
a 1 3
b 2 4
```


Subconjuntos en listas
========================================================
- `[` Siempre devuelve un objeto de la misma clase que el original.
- `[[` Es usado para extraer los elementos de una lista.
   Sólo para extraer un elmento de la lista. Lo que devuelve
   puede ser de distitno tipo al de la lista o el `data.frame`.
- `$` se usa para extraer elementos de una lista o `data.frame`.
   Semánticamente es similar a `[[`.

Ejemplo de subconjuntos I
========================================================

```r
x <- c("a", "b", "c", "c", "d", "a")
x[1]
```

```
[1] "a"
```

```r
x[2]
```

```
[1] "b"
```

```r
x[1:4]
```

```
[1] "a" "b" "c" "c"
```

Ejemplo de subconjuntos II
========================================================

```r
x <- c("a", "b", "c", "c", "d", "a")
x > "a"
```

```
[1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE
```

```r
x[x > "a"]
```

```
[1] "b" "c" "c" "d"
```

```r
u <- x > "a"
x[u]
```

```
[1] "b" "c" "c" "d"
```


Subconjuntos (matrix) I
========================================================

```
x <- matrix(6:1, 2, 3)
x[1, 2]
x[2, 1]

x[1,]

x[,2]

```

Subconjuntos (matriz) II
========================================================
```
x <- matrix(6:1, 2, 3)
x[1, 2]
x[1, 2, drop = FALSE]

```

Subconjuntos (matriz)
========================================================
```
x <- matrix(6:1, 2, 3)
x[1, ]
x[1, , drop = FALSE]
```

Ejemplo subconjuntos (listas) I
========================================================

```r
x <- list(foo = 6:1, bar = 0.6)
x[1]
```

```
$foo
[1] 6 5 4 3 2 1
```

```r
x[[1]]
```

```
[1] 6 5 4 3 2 1
```

Ejemplo subconjuntos (listas) II
========================================================

```r
x$bar
```

```
[1] 0.6
```

```r
x[["bar"]]
```

```
[1] 0.6
```

```r
x["bar"]
```

```
$bar
[1] 0.6
```

Ejemplo subconjuntos (listas) III
========================================================
class: small-code

```r
x <- list(foo = 6:1, bar = 0.6, baz = "hello")
x[c(1,3)]
```

```
$foo
[1] 6 5 4 3 2 1

$baz
[1] "hello"
```

Ejemplo subconjuntos (listas) IV
========================================================
class: small-code

```r
x <- list(foo = 6:1, bar = 0.6, baz = "hello")
nombre <- "foo"
x[[nombre]]
```

```
[1] 6 5 4 3 2 1
```

```r
x$nombre
```

```
NULL
```

```r
x$foo
```

```
[1] 6 5 4 3 2 1
```

Ejemplo subconjuntos (listas) V
========================================================
class: small-code

```r
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1,3)]]
```

```
[1] 14
```

```r
x[[1]][[3]]
```

```
[1] 14
```

```r
x[[c(2,1)]]
```

```
[1] 3.14
```
