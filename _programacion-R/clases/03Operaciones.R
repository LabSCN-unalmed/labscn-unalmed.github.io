# -----------------------------------------------------------------------------#
# Titulo: Operaciones básicas
# Tipo: Tutorial
# Nombre: Kenneth Roy Cabrera Torres
# Fecha: miércoles, 22 de junio de 2016
# Enunciado: Ejemplos de operaciones básica en R.
# -----------------------------------------------------------------------------#

# Tipos de datos numéricos (vectores y matrices)
# Generalmente las operaciones son vectoriales y se realizas elemento 
# a elementos y reciclando en donde aplica.

a <- c(4, 2, 3, 0)
x <- c(4, 2, 3, 3, 2, 1, 2, 3)

a + x
a - x
a / x
a * x
a ^ x
a %% x
a %/% x

a <- c(4, 2, 3, 0, 1)
x <- c(4, 2, 3, 3, 2, 1, 2, 3)

a + x
a - x
a / x
a * x
a ^ x
a %% x
a %/% x

exp(1)

options()

names(options())

options()$digits

options(digits = 16)
exp(1)
pi
sin(pi/6)
options(digits = 7)

optAnt <- options()
options(digits = 20)
pi
options(optAnt)
pi

x <- 10000
(1 + 1/x)^x

y <- (1 + 1/x)^x
y

(z <- (1 + 1/x)^x)

# Secuencias y repeticiones

1:20

3:9

10:2

seq(2, 15)

seq(2, 15, 2)

seq(2, 15, length.out = 6)

(x <- 1:5)

seq(2, 15, along.with = x)

sequence(c(3, 4, 2))

rep(4, 6)

rep(c(1, 3, 2), 3)

rep(c(1, 3, 2), each = 3)

rep(c(1, 3, 2), len = 10)

rep(c(1, 3, 2), each = 4, len = 10)

rep(c(1, 3, 2), times = 3)

rep(c(1, 3, 2), times = 3, each = 2)

rep(c(1, 3, 2), times = 3, each = 2, len = 20)

rep(c(1, 3, 2), times = c(3, 4, 1))

# Genera un error si "times" no es de longitud 1 o del mismo tamaño
# del argumento.
# rep(c(1, 3, 2), times = c(3, 4))

rev(c(1, 2, 8, 10, 3))

# Ejemplo de generación de índices sin ciclos
filas <- 3
columnas <- 4

1:columnas
1:filas

(i <- rep(1:filas, each = columnas))
(j <- rep(1:columnas, times = filas))

cbind(i, j)

# Ahora en forma de zig-zag

jz <- (i%%2)*j + ((i+1)%%2)*(columnas - j +1)

cbind(i, jz)

# Producto interno
a %*% a

# Producto externo
a %o% a

# Con matrices

m1 <- matrix(1:6, 2, 3)
m1
m2 <- matrix(7:12, 3, 2)
m2

# m1 + m2 # Produce un error por dimensiones no compatibles

m1 + t(m2)

t(m1) + m2

m1 %*% m2

m2 %*% m1


