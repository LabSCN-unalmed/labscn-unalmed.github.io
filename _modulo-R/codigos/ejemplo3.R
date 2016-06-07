################################################################################
# Ejemplo 1
# Realiza una animaciòn en un plano cartesiano vacío
# Por: Kenneth Roy Cabrera Torres
# Fecha de creación: 31 de marzo de 2016
################################################################################

# Coordenadas de un objeto a mover.

figura1 <- cbind(c(0,1,0.5,0,1),c(0,1,0.5,1,0))

# Dibuja el plano cartesiano vacio
plot(c(0,9),c(0,9), type = "n", axes = FALSE,
     ylab = "", xlab = "", asp = 1)

# Dibuja la figura en un lugar inicial
lines(figura1, col = "blue")

# Muestra la animaciòn simulando el movimiento
for(i in 1:20){
  lines(figura1, col = "white", lwd = 2)
  figura1 <- figura1 + 0.25
  lines(figura1, col = "blue")
  Sys.sleep(0.5)
}

