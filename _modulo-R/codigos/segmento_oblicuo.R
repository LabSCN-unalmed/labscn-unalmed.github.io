################################################################################
# Trazo de un segmento oblicuo al click del mouse.
#
# Autor: Kenneth Roy Cabrera Torres.
# Fecha: Martes, 23 de julio de 2019.
################################################################################

# Construcción de la malla
x <- seq(0, 100, 10)
y <- x

malla <- expand.grid(x = x, y = y)

# Despliegue de la malla 
x11()

plot(malla, asp = 1)
# Obtener las coordenadas en click.
r1 <- locator(1)

# Calcular las coordenadas del origen del segmento.
x0 <- floor(r1$x/10) * 10
y0 <- floor(r1$y/10) * 10

# Calcular las coordenadas del destino del segmento.
x1 <- ceiling(r1$x/10) * 10
y1 <- ceiling(r1$y/10) * 10

# Trazado del segmento. 
segments(x0, y0, x1, y1)