################################################################################
# Ejemplo 1
# Forma de detectar una pusación del ratón en un plano cartesiano
# Por: Kenneth Roy Cabrera Torres
# Fecha de creación: 31 de marzo de 2016
################################################################################

# Establce coordenadas sin digujar ningún elemento
plot(c(0,10),c(0,10), type = "n", axes = FALSE,
     ylab = "", xlab = "")
# Dibuja una caja que contiene el plano cartesiano definido
box()
# Función que detecta las coordenadas de un solo click del ratón.
locator(n=1)
