# -----------------------------------------------------------------------------#
# Titulo: Elementos, objetos, clases y tipos básicos en R
# Tipo: Tutorial
# Nombre: Kenneth Roy Cabrera Torres
# Fecha: martes, 21 de junio de 2016
# Enunciado: Se presentan los elementos básicos del R
# -----------------------------------------------------------------------------#


# Numéricos
x <- 10.5      # Asigna un número con punto decimal.
x              # Muestra el contenido del objeto x.

class(x)       # Muestra la clase del objeto x.
typeof(x)      # Tipo genérico interno del R.
storage.mode(x) # Modo de almacenamientos específico para exportar de R.

y <- 10        # En general los números son reales.
y

class(y)
typeof(y)
storage.mode(y)
is.integer(y)

# Enteros
y <- as.integer(3) 
y              

class(y)  
typeof(y)
storage.mode(y)

w <- 4L
w              

class(w)  
typeof(w)
storage.mode(w)


is.integer(y)  

as.integer(3.14)

as.integer("5.27")

as.integer("Joe")

as.integer(TRUE)

as.integer(FALSE)

# Complejos

z <- 1 + 2i 
z          

class(z)   
typeof(z)

sqrt(-4) 

sqrt(-4+0i)

sqrt(as.complex(-4)) 

# Lógicos (booleanos)
x <- 1; y <- 2   
z <- x > y      
z

class(z)
typeof(z)

u <- TRUE; v <- FALSE 
u & v

u | v

!u

help("&")

# Carácter y sarta
x <- as.character(3.141592) 
x 

class(x)
typeof(x)

nombres <- "Jully Patricia"; apellido <- "Aristizabal" 
paste(nombres, apellido)

sprintf("%s tiene %d pesos", "Julian", 100000)

substr("Mambrú se fue a la guerra", start=3, stop=12)

sub("Mambrú", "José", "Mambrú se fue a la guerra")

help("sub")

paste("x", 1:5)

paste("x", 1:5, sep = "")

paste("x", 1:5)

cat("x", 1:5)

cat("x", 1:5, sep = "")

mensaje <- paste("Ejemplo de", "un mensaje", "con 'paste()'")
mensaje

mensaje <- paste("Ejemplo de", "un mensaje", 'con "paste()"')
mensaje
print(mensaje)
cat(mensaje)

cat("Otro ejemplo:\n", "con dos renglones")
paste("Otro ejemplo:\n", "con dos renglones")
mensaje2 <- paste("Otro ejemplo:\n", "con dos renglones")
mensaje2
print(mensaje2)
cat(mensaje2)

cat("Otro ejemplo:\n", "con dos renglones", sep = "")
paste("Otro ejemplo:\n", "con dos renglones", sep = "")
mensaje2 <- paste("Otro ejemplo:\n", "con dos renglones", sep = "")
mensaje2
print(mensaje2)
cat(mensaje2)

