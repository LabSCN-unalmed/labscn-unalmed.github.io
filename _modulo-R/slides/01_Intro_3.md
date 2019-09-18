<style>
.small-code pre code {
  font-size: 1.2em;
}
</style>

Introducción al R (Parte III)
========================================================
author: Kenneth Cabrera
date: miércoles, 18 de septiembre de 2019


Estructura de un objeto.
========================================================
class: small-code

```r
x <- list(l1 = list(n1 = 3, list( c1 = "Ab", c2 = "X"), c3 = "M"), l2 = 5)

str(x)
```

```
List of 2
 $ l1:List of 3
  ..$ n1: num 3
  ..$   :List of 2
  .. ..$ c1: chr "Ab"
  .. ..$ c2: chr "X"
  ..$ c3: chr "M"
 $ l2: num 5
```

```r
str(x, max.level = 1)
```

```
List of 2
 $ l1:List of 3
 $ l2: num 5
```

Reversar el orden de un vector.
========================================================

```r
v1 <- c(4, 8, 2, 3, 1, 2)

rev(v1)
```

```
[1] 2 1 3 2 8 4
```

Indicador de orden de un vector.
========================================================

```r
v1 <- c(4, 8, 2, 3, 1, 2)

order(v1)
```

```
[1] 5 3 6 4 1 2
```

```r
v1[order(v1)]
```

```
[1] 1 2 2 3 4 8
```

Identificador del indice de posición en un vector.
========================================================

```r
v1 <- c(4, 8, 2, 3, 1, 2)

which(v1 < 3)
```

```
[1] 3 5 6
```

Operador de pertenencia.
========================================================

```r
v2 <- c(6, 9, 2, 10, 3, 0, 2)
v3 <- c(1, 2, 3, 3)

v2 %in% v3
```

```
[1] FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE
```

```r
v3 %in% v2
```

```
[1] FALSE  TRUE  TRUE  TRUE
```


Operadores de conjuntos.
========================================================
class: small-code

```r
v2 <- c(6, 9, 2, 10, 3, 0, 2)
v3 <- c(1, 2, 3, 3)

union(v2, v3)
```

```
[1]  6  9  2 10  3  0  1
```

```r
intersect(v3, v2)
```

```
[1] 2 3
```

```r
setdiff(v2, v3)
```

```
[1]  6  9 10  0
```

```r
setdiff(v3, v2)
```

```
[1] 1
```
