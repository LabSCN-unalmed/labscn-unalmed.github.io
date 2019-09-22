###############################################################################
# Ejemplo del uso de matrices de rotación.
# Autor: Kenneth Roy Cabrera Torres.
# Identificación: CC 71684893.
# Correo electrónico: krcabrer@unal.edu.co>.
# Objetivo: Halle el centoide de una figura.
###############################################################################

# Definición de coordenadas de un tríangulo
triangulo <- cbind(c(0, 10, 5), c(0, 0, 7))

# Halla el centroide de una figura.

centroide <- apply(triangulo, 2, mean)
centroide