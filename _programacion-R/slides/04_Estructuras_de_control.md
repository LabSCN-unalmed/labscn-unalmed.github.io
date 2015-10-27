Estructuras de control
========================================================
author: Kenneth Cabrera
date: 27 octubre, 2015
Estructuras de contol en R
========================================================

- `if, else`: Condicionales.
- `for`: Estructura de repetición con un número
  fijo de repeticiones.
- `while`: Estructura de repetición que se realiza
mientras las condición sea verdadera.
- `repeat`: Estructura de repetición "infinita".
- `break`: Rompe la ejecución de un ciclo repetición.
- `next`: Se salta un ciclo de repetición o interacción
- `return`: Sale de una función.

Estructura condicional I
========================================================

```r
if (<condición>) {
   ## instrucciones
} else {
   ## otras instrucciones
}

if (<condición>) {
   ## instrucciones
} else if (<condición>) {
   ## otras instrucciones
} else {
   ## otras instrucciones alternativas
}
```

Estructura condicional II
========================================================
Estructura válida:

```r
if (x > 3) {
     y <- 10
} else {
     y <- 0
}
```
También es estructura válida:

```r
y <- if (x > 3) {
     10
} else {
     0
}
```

Estructura de repetición I
========================================================

```r
for (i in 1:10) {
  print(i)
}
```

```
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
```

Estructura de repetición II
========================================================

```r
x <- c("a", "b", "c", "d")
for (i in 1:4){
    print(x[i])
}

for (i in seq_along(x)) {
     print(x[i])
}

for (letra in x) {
    print(letra)
}

for (i in 1:4) print(x[i])
```

Estructura de repetición III
========================================================

```r
x <- matrix(1:6, 2, 3)
for (i in seq_len(nrow(x))) {
    for (j in seq_len(ncol(x))) {
        print(x[i, j])
    }
}
```
No se recomienda anidar más de 2 a 3 niveles.

Estructura de repetición IV
========================================================


```r
conteo <- 0
while (conteo < 10) {
   print(conteo)
   conteo <- conteo + 1
}
```
¡Recuerde evitar los ciclos infinitos!


Estructura de repetición V
========================================================

```r
z <- 5
while (z >= 3 && z <= 10){
    print(z)
    moneda <- rbinom(1, 1, 0.5)
    if (moneda == 1){
         z <- z + 1
    } else {
         z <- z - 1
    }
}
```
La estructura condicional simpre se evalúa de izquierda a derecha.

Diferencia entre & y &&.
========================================================

```r
((-2:2) >= 0) & ((-2:2) <= 0)

((-2:2) >= 0) && ((-2:2) <= 0)
```

Eficiencia de la forma vectorizada
========================================================

```r
n <- 100000
# Primera forma
vect <- numeric(0)
system.time(for(i in 1:n) vect <- c(vect, i*2))
# Segunda forma
vect <- numeric(n)
system.time(for(i in 1:n) vect[i] <- i*2)
# Tercera forma
system.time(vect <- seq(0,n,2))
# Cuarta forma
system.time(vect <- (1:n)* 2)
```

Estructura de repetición VI
========================================================


```r
x0 <- 1; tol <- 1e-6; i <- 0
repeat {
     x1 <- 1/(x0+1)
     i <- i + 1
     cat("inter= ",i,"valor= ",x1, "\n")
     if (abs(x1 - x0) < tol) {
        break
     } else {
        x0 <- x1
     }
}
```
La única forma de salir del `repeat` es mediante el `break`.

Mejor sería limitar el número de interacciones.

Estructura de repetición VII
========================================================

```r
for (i in 1:100) {
    if ((i + 1)%%7 != 0){
      next
    }
    print (i)
}
```

El `return` se utiliza en el contexto de funciones


