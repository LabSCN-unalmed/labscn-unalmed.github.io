###############################################################################
# Ejemplo del uso de matrices de rotaci�n.
# Autor: Kenneth Roy Cabrera Torres.
# Identificaci�n: CC 71684893.
# Correo electr�nico: krcabrer@unal.edu.co>.
# Objetivo: Mostrar ejemplos del uso de matrice de rotaci�n.
###############################################################################

# Definici�n de coordenadas de un tr�angulo
triangulo <- cbind(c(0, 10, 5), c(0, 0, 7))

# Definici�n de la matriz de rotaci�n.
M <- function(theta){
  R <- matrix(c(cos(theta), -sin(theta), 
                sin(theta), cos(theta)),
                byrow = TRUE,
              nrow = 2, ncol = 2)
  return(R)
}  

# Define el �ngulo de rotaci�n.
angulo <- 30
# Convierte el �ngulo en radianes.
angulo_R <- angulo*pi/180
# Dibuja una pantalla vac�a.
plot(-20:20, -20:20, type = "n", asp = 1)
# Dibuja el tri�ngulo original.
polygon(triangulo)
# Dibuja el tri�ngulo rotado el �ngulo requerido.
polygon(t(M(angulo_R)%*%t(triangulo)), col = "blue")





