Funciones
========================================================
author: Kenneth Cabrera
date: 04 abril, 2018
width: 1440
height: 900


Funciones I
===================================================

Las funciones se crean con la instrucción `function()` y
se guardan en R como cualquier objeto. Son de la clase "function".


```r
f <- function(<argumentos>) {
       ## Instrucciones
     }
```
- Las funciones puden ser pasadas como argumentos a otras funciones.
- Las funciones pueden ser anidadas.
- La última expresión de una función se toma como el valor que
  la función retorna (omitiendo el `return`)

 Funciones II
===================================================

Las funciones tienen argumento con nombre los cuales
tienen potencialmente valores por omisión.

- Los argumentos formales son los que se incluyen en la
definción de la función.
- La función `formals` muestra una lista de todos los argumentos
de una fución.
- No todo llamado a una función en R usa todos los argumentos formales.
- Los argumentos pueden no estar presentes o tener valores por omisión.

Funciones II
===================================================
En R los argumentos de las funciones se pueden indicar por su
posición o por su nombre.


```r
misdatos <- rnorm(100)
formals(sd)
sd(misdatos)
sd(x = misdatos)
sd(x = misdatos, na.rm = FALSE)
sd(na.rm = FALSE, x = misdatos)
sd(na.rm = FALSE, misdatos)
```

- Se recomienda utilizar el nombre de los argumentos y conservar el orden.


Funciones III
===================================================

```r
formals(lm)
args(lm)

x <- rnorm(1000, mean = 50, sd = 10)
y <- 1 + 5 * x + rnorm(1000)

misdatos <- data.frame(x,y)

lm(data = misdatos, y ~ x,  model = FALSE,  1:100)
lm(y ~ x, misdatos, 1:100, model = FALSE)
```

Se puede mezclar el emparejamiento por posición y por nombre.
Cuándo se empareja por nombre, se "saca" de la lista de argumentos y
los demás argumentos siguen el orden en que están definidos.

Funciones IV
===================================================
Los argumentos de las funciones pueden ser *parcialmente*
emparejadas, lo cuál es útil en un trabajo interactivo.

El orden de emparejamiento es:
- Chequea el emparejado exacto para un argumento con nombre.
- Realiza un chequeo parcial.
- Realiza un chequeo posicional.

Definición de función
===================================================

```r
 f <- function(a, b = 1, c = 2, d = NULL) {

 }
```

Además de no definir un valor por omisión se puede
establecer como un argumento de NULL.

Evaluación "perezosa" I
===================================================
Los argumentos de una función se evalúan de manera
*perezosa*, de forma que se evalúan si se necesitan.


```r
f <- function(a, b){
  a^2
}

f(2)
```

Debido a que esta función realmente no utiliza el argumento `b`,
el llamado la función `f(2)` no produce ningún error, porque
el `2` se empareja con la variable `a`.


Evaluación "perezosa" II
===================================================

```r
f <- function(a, b){
  print(a)
  print(b)
}

f(45)
```

Note que se muestra el `45` antes que se muestre el error.
Sólo se muestra el error cuando se evalúa `print(b)`


El argumento "..." I
===================================================
El argumento `...` indica un número variable de argumentos,
que usualmente se pasan a otras funciones.

- `...` se usa para extender otra función y no se quiere copiar
la lista completa de los argumentos de la función.


```r
miplot <- function(x, y, type = "l", ...){
  plot(x,y, type = type, ...)
}
```
- Las funciones genéricas usan `...` para que los argumentos
extras se pasen a los métodos. (POO).


```r
mean
```

```
function (x, ...) 
UseMethod("mean")
<bytecode: 0x31aa930>
<environment: namespace:base>
```

El argumento "..." II
===================================================
El argumento `...` es necesario cuando el número de
argumentos que se pasan a una función no se sabe
con anticipación.


```r
args(paste)
```

```
function (..., sep = " ", collapse = NULL) 
NULL
```

```r
args(cat)
```

```
function (..., file = "", sep = " ", fill = FALSE, labels = NULL, 
    append = FALSE) 
NULL
```

Argumentos después de "..."
===================================================
Todo argumento que aparezca *depués* de `...` deberá
ser nombrado explícitamente y no se puede emparejar
parcialmente.


```r
args(paste)
```

```
function (..., sep = " ", collapse = NULL) 
NULL
```


```r
paste("a", "b", sep = ":")

paste("a", "b", se = ":")
```

Ejemplo I
================================================================================

```r
fmala <- function(x, y) {
 z1 <- 2 * x + y
 z2 <- x + 2 * y
 z3 <- 2 * x + 2 * y
 z4 <- x / y
}
r1 <- fmala(8, 10)
r1
```

```
[1] 0.8
```

Ejemplo I (corregido)
================================================================================

```r
fcorrecta <- function(x, y) {
 z1 <- 2 * x + y
 z2 <- x + 2 * y
 z3 <- 2 * x + 2 * y
 z4 <- x / y
 return(c(z1, z2, z3, z4))
}

r1 <- fcorrecta(1, 2)
r1
```

```
[1] 4.0 5.0 6.0 0.5
```

Ejemplo II
================================================================================

```r
f2 <- function(x, y) {
  z1 <- x + y
  z2 <- x + 2 * y
  list(z1, z2)
}

f2(2, 5)

f2(2, 5)[[2]]

f2(2, 5)$z1
```

Ejemplo III
================================================================================

```r
f3 <- function(x, y) {
  z1 <- x + y
  z2 <- x + 2 * y
  list(result1 = z1, result2 = z2)
}

f3(2, 5)
f3(2, 5)[[2]]
f3(2, 5)$result2
```

Ejemplo IV
================================================================================

```r
v1 <- c(2, 3, 5, 7)
v2 <- c(4, 0, 1, 9)
f3(v1, v2)

m1 <- matrix(c(1, 2, 3, 4,  5,  6), ncol=2)
m2 <- matrix(c(2, 4, 6, 8, 10, 12), ncol = 2)
f3(m1, m2)
```

Validación de argumentos
================================================================================

```r
f4 <- function(a, b, c, d){
  stopifnot(a >= 0, a <= 1, b > 1, c > 0)
  r1 <- c(qnorm(a), log(b-1), sqrt(c))
  return(r1)
}

f4(2, 2, 0.5)

f4(0.1, 0.5, 0.5)

f4(0.1, 5, -2)

f4(0.1, 0.5, -1)
```

Recomendaciones I
================================================================================
- Realice los ejercicios de algoritmos. (Adquira un pensamiento algorítmico).
- Comente su código.
- RTFM!. (LEMM o LEPM)
- Piense antes de escribir. (Piense primero en el que y luego en el como).
- Diseñe en forma *"top-down"*, codifique en forma *"bottom up"*.
- Divida el problema en pequeñas funciones significativas.


Recomendaciones  II
================================================================================
- Evite escribir la misma rutina dos veces.
- Use nombres relevantes.
- Realice una prueba de escritorio o seguimiento. (función por función en
   forma *"bottom up"*)
- No se rinda, quéjese!! (ayuda a listas, compañeros, etc).
- Evite iteracciones (R es vectorizado)
