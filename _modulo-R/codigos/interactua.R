################################################################################
# Inicio del juego de la batalla naval
# Por: Kenneth Roy Cabrera Torres
# Fecha de creación: 12 de Agosto de 2016
# Fechas de correcciones:
# Condiciones: Se hace necesario que exista un archivo que indique
# la jugada realizada y posiblemente la indicación del jugador en turno
# Un ejemplo en línea del juego se puede encontrar en:
# http://es.battleship-game.org/
################################################################################

# Lectura de una archivo externo
archivoCon <- file("jugada.txt", "r")
datosJugada <- readLines(archivoCon)
close(archivoCon)

# Datos leídos del archivo externo
listaJugada <- strsplit(datosJugada, " ")

# Para convertir las letras a números
letras <- x
names(letras) <- LETTERS[x]

# Obtener la fila y la columna de la jugada leída
fila <- as.integer(listaJugada[[1]][3])
columna <- letras[listaJugada[[1]][2]]

# Construcción del trablero de juego
x <- 1:10
y <- 1:10
linea1 <- rep(c(0,1), length(x)/2)
linea2 <- rep(c(1,0), length(x)/2)
lineas2 <- c(linea1,linea2)
z <- matrix(rep(lineas2,length(y)/2), length(x), length(y))

image(x, y, z, asp = 1, axes = FALSE, ylab = "", xlab = "",
      col = c("lightblue","coral1"))
axis(1, at = x, labels = LETTERS[x])
text(-0.5, y,  labels = y)
sec1 <- seq(1-0.5, 10+0.5, 1)
segments(sec1, -0.5, sec1, 10.5)
segments(1-0.5, sec1, 10.5, sec1)
# Temporizador
Sys.sleep(2)
# Muestra la posición de la jugada
rect(columna-0.4,fila-0.4, columna+0.4, fila+0.4, col = "blue")




