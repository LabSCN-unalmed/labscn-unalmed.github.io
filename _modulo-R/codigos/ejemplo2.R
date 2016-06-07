################################################################################
# Ejemplo 1
# Dibuja un punto el el lugar de la pulsación
# Por: Kenneth Roy Cabrera Torres
# Fecha de creación: 31 de marzo de 2016
################################################################################

# Establece las coordenadas del plano cartesiano
plot(c(0,9),c(0,9), type = "n", axes = FALSE,
     ylab = "", xlab = "", asp = 1)
# Dibuja cuatro lìneas cruzadas
segments(c(0,0,3,6),c(3,6,0,0),c(9,9,3,6),c(3,6,9,9))
# Guarda el lugar de la pulzación
lugar <- locator(n=1)
# Dibuja un punto "grande" en el lugar de la pulsaciòn del ratòn.
points(lugar, pch = 1, col = "blue", cex = 6)
