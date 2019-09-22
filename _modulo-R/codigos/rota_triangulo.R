###############################################################################
# Ejemplo del uso de matrices de rotación.
# Autor: Kenneth Roy Cabrera Torres.
# Identificación: CC 71684893.
# Correo electrónico: krcabrer@unal.edu.co>.
# Objetivo: Mostrar ejemplos del uso de matrice de rotación.
###############################################################################

# Definición de coordenadas de un tríangulo
triangulo <- cbind(c(0, 10, 5), c(0, 0, 7))

# Definición de la matriz de rotación.
M <- function(theta){
  R <- matrix(c(cos(theta), -sin(theta), 
                sin(theta), cos(theta)),
                byrow = TRUE,
              nrow = 2, ncol = 2)
  return(R)
}  

# Define el ángulo de rotación.
angulo <- 30
# Convierte el ángulo en radianes.
angulo_R <- angulo*pi/180
# Dibuja una pantalla vacía.
plot(-20:20, -20:20, type = "n", asp = 1)
# Dibuja el triángulo original.
polygon(triangulo)
# Dibuja el triángulo rotado el ángulo requerido.
polygon(t(M(angulo_R)%*%t(triangulo)), col = "blue")





