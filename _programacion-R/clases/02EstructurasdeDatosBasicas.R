# -----------------------------------------------------------------------------#
# Titulo: Estructuras de datos básicos
# Tipo: Tutorial
# Nombre: Kenneth Roy Cabrera Torres
# Fecha: martes, 21 de junio de 2016
# Enunciado: Se presentan las estructuras básica del R
# -----------------------------------------------------------------------------#

# Vectores

v1 <- c(2, 3, 5) 
class(v1)
typeof(v1)

v2 <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 
class(v2)
typeof(v2)

v3 <-  c("aa", "bb", "cc", "dd", "ee") 
class(v3)
typeof(v3)

n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
c(n, s) 

a <- c(1, 3, 5, 7) 
b <- c(1, 2, 4, 8)

5 * a
a + b 
a - b 
a * b 
a / b

u <- c(10, 20, 30) 
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9) 
u + v

s <- c("aa", "bb", "cc", "dd", "ee") 
s[3]

s[-3] 

s[10]

s[c(2, 3)]

s[c(2, 3, 3)]

s[c(2, 1, 3)] 

s[2:4]

help(":")

L <- c(FALSE, TRUE, FALSE, TRUE, FALSE) 
s[L] 

s[c(FALSE, TRUE, FALSE, TRUE, FALSE)] 

v <- c("Maria", "Susana") 
v 

names(v) <- c("Primera", "Última") 
v

v["Primera"]

v[c("Última", "Primera")]

# Funciones útiles con vectores
length(v)

# Factores

colores_mangos <- c('verde','verde','amarillo','rojo','rojo','rojo','verde')
class(colores_mangos)
typeof(colores_mangos)

factor_col_mangos <- factor(colores_mangos)

print(factor_col_mangos)
print(levels(factor_col_mangos))
print(nlevels(factor_col_mangos))

class(factor_col_mangos)
typeof(factor_col_mangos)

meses <- c("enero", "enero", "febrero", "abril", "abril", "abril")
meses <- factor(meses)
meses
as.integer(meses)

meses <- factor(meses, levels = c("enero", "febrero", "abril"))
meses
as.integer(meses)

meses <- factor(meses, labels  = c("Enero", "Febrero", "Abril"))
meses
as.integer(meses)

# ¿Porqué este código es un problema?
meses <- c("enero", "enero", "febrero", "abril", "abril", "abril")
meses <- factor(meses, labels = c("Enero", "Febrero", "Abril"))
meses
as.integer(meses)

# Una mejor forma
meses <- c("enero", "enero", "febrero", "abril", "abril", "abril")
meses <- factor(meses, levels = c("enero", "febrero", "abril"),
                labels = c("Enero", "Febrero", "Abril"))
meses
as.integer(meses)

                
# Matrices

A <- matrix(c(2, 4, 3, 1, 5, 7), nrow=2, ncol=3, byrow = TRUE)        

A

A[2, 3]

A[2, ] 

A[, 3]

dimnames(A) = list( 
     c("fila1", "fila2"),        
     c("col1", "col2", "col3"))

A

A["fila2","col3"]

B <- matrix(c(2, 4, 3, 1, 5, 7), nrow=3, ncol=2) 
B

t(B)


C <- matrix(c(7, 4, 2), nrow=3, ncol=1) 
C 

cbind(B, C)

D <- matrix(c(6, 2), nrow=1,  ncol=2) 
D 

rbind(B, D) 

c(B) 
# Listas

n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
b <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x <- list(n, s, b, 3)
 
x[2]

x[c(2, 4)]

x[[2]]


x[[2]] <- "ta"

s


v <- list(numeros=c(2, 3, 5), nombres=c("aa", "bb")) 
v 

v["numeros"]

v[c("nombres", "numeros")]

v[["numeros"]]

v$numeros

attach(v)
numeros
detach(v)


# Bases de datos (data.frames)

n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc") 
b <- c(TRUE, FALSE, TRUE) 
df <- data.frame(n, s, b)


mtcars

mtcars[1, 2]

mtcars["Mazda RX4", "cyl"]

head(mtcars)

mtcars[[9]]

mtcars[["am"]]

mtcars$am

mtcars[, "am"]

mtcars[1]

mtcars["mpg"]

mtcars[c("mpg", "hp")]

mtcars[24, ]

mtcars[c(3, 24), ]

mtcars["camaro Z28", ]

mtcars[c("Datsun 710", "Camaro Z28"), ]

L = mtcars$am == 0
L

mtcars[L, ]

mtcars[L, ]$mpg

# Problemas a evitar en el uso de los "data.frames"
mal <- data.frame(cbind(a = 1:2, b = c("a", "b")))
mal
str(mal)

bien1 <- data.frame(a = 1:2, b = c("a", "b"))
bien1
str(bien1)

bien2 <- data.frame(a = 1:2, b = c("a", "b"), stringsAsFactors = FALSE)
bien2
str(bien2)


# "Columnas" especiales en las bases de datos.
df <- data.frame(x = 1:3)
df$y <- list(1:2, 1:3, 1:4)
df
str(df)

# data.frame(x = 1:3, y = list(1:2, 1:3, 1:4)) # Se genera un error

dfl <- data.frame(x = 1:3, y = I(list(1:2, 1:3, 1:4)))
dfl
str(dfl)
dfl[2, "y"]

dfm <- data.frame(x = 1:3, y = I(matrix(1:9, nrow = 3)))
dfm
str(dfm)
dfm[2, "y"]

# Se debe tener mucho cuidado al utilizar estas opciones en las
# bases de datos porque muchas funciones asumen que cada columa de 
# una base de datos es de tipo atómico.

# Atributos de objetos (estructura de datos) en R.

y <- 1:10
attr(y, "mi_attribute") <- "Este es un vector"
attr(y, "mi_attribute")
str(attributes(y))

(y2 <- structure(1:10, mi_attribute = "Este es un vector"))

attributes(y[1])
attributes(y2[1])

attributes(sum(y))
attributes(sum(y2))

# Ejemplo del uso de atributos
x <- 1:10
y <- rnorm(10)

modeloLineal1 <- lm(y ~ x)

str(modeloLineal1)
attributes(modeloLineal1)
attr(modeloLineal1, "class") ## No es aconsejable utilizarlo de esta manera
class(modeloLineal1)

# Los tres atributos más importantes son:
# 1. names(): Aplica a vectores y listas.
# 2. dim(): Aplica a matrices y arreglos.
# 3. class(): Aplica a cualquier objeto.
# Se llaman directamente con su función respectiva,
# los demás atributos se utiiza la función attributes() y attr().


