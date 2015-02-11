Introducción al R
========================================================
author: Kenneth Cabrera
date: 11 febrero, 2015
transition: rotate

Breve historia
========================================================
- El R es un dialecto del lenguaje S.
- El S fue desarrollado por John Chambers.
- El S fue hecho incialmente para las bibliotecas en Frotran.
- En 1988 el sistema se reescribió en C 
  y es básicamente lo que se tiene ahora
  (se denomina versión 3 del lenguaje). El libro asociado
  es el "libro blanco" (white book) "Statistical Models in S".
- La versión 4 se liberó en 1998. El libro asociado es
  es el "libro verde" (green book) "Programming with Data" y
  es la versión sobre el cual R trabaja hoy en día.

Notas históricas del S
========================================================
* En 1993 los laboratorios Bell le otorgó a StatSci (ahora 
  la empresa se llama Insightful Corp.) una licencia para desarrollar
  y vender el S.
* En el 2004 Insightful le compró el lenguaje S a Lucent por
  dos millones de dólares y es el dueño actual.
* Insightful construyó una plataforma GUI y actualmente el producto
  se denomina S-PLUS, y el "PLUS" es por esta plataforma.
* En el 2009 Insightful fue comprada por TIBCO por 25 millones de dólares.

Notas históricas del R
========================================================
- 1991: Creado en Nueva Zelandia or Ross Ihaka y Robert Gentleman.
  Publica el artículo en 1996 en la revista JCGS (Journal of
  Computational and Graphical Statistics).
- 1993: Anuncio del R al público.
- 1995: Martin Mächler convenció a Ross y a Robert pasarlo a GNU.
- 1997: Se formó el grupo núcleo del R (The R Core Group). 
  Administra el código fuente del R.
- 2000: Versión 1.0.0, 2004: Versión 2.0.0., 2013: Versión 3.0.0.
- 10 de Julio de 2014: Última versión oficial liberada a la fecha 
  3.1.1. "Sock it to Me" ("Give it to me")
  
Características principales del R
========================================================
- Sintaxis similar al S.
- Semántica superficialmente simila al S.
- Ejecuta casi en toda plataforma.
- Desarrollo en constate actividad.
- Útil para trabajo interactivo.
- Es libre (gratis, y abierto).

Desventajas
========================================================
- Basado en tecnología de hace 40 años.
- No soporta muy bien gráficas 3-D.
- La funcionalidad se base en la demanda del consumidor.
  Usted necesita hacer lo que otros no hacen.
- Los objetos de almacenan en memoria.
- No sirve para todo. 

Paquetes princiales
========================================================

* El sistema básico o base el el paquete **base**.
* El sistema básico incluye paquetes como el **utils**,
  **stats**, **datasets**, **graphics**, **parallel** y otros.
* Paquetes recomendados  **boot**, **class**, **cluster**
  **lattice**, **KernSmooth**, **nlme**, **nnet**, y otros.

Paquetes adicionales
========================================================
* Existen más de 4000 paquetes en el CRAN.
* Hay proyectos asociados como el Bioconductor (http://bioconductor.org).
* Algunos tienen desarrollos en su propia página por lo
  tanto es más difícil de seguirles el rastro.
  

Clases de objetos
========================================================
El R tiene cinco clases de objetos básicos o "atómicos"
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
- El valor `NaN` es un valor no definio ("not a number").

Atributos
========================================================
Un objeto en R puede tener atributos como:
- nombres (`names`, `dimnames`).
- dimensiones (`dim`).
- clase (`class`).
- longitud (`length`).
- Otros metadatos y atributos particulares.
Se utiliza la función `attribute()` para obtenerlos.

Asignación
========================================================
El símbolo `<-` es el operador de asignación.

También se utiliza `->` para realizar la asignación de izquierda a 
derecha.

```
x <- 1
print(x)
```
```
45 -> y
print(y)
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

El operador ``:` crea secuencias.

Vectores
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

Vectores
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


```r
x <- factor(c("si", "si", "no", "si", "no"))
table(x)
```

```
x
no si 
 2  3 
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


```r
x <- factor(c("si", "si", "no", "si", "no"),
            levels = c("si", "no"))
x
```

```
[1] si si no si no
Levels: si no
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


