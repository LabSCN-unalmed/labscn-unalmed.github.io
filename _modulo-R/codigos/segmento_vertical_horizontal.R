################################################################################
# Trazo de un segmento vertical u horizontal
# de acuerdo a la cercanía del lado del cuadrado.
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
xmin <- floor(r1$x / 10) * 10
ymin <- floor(r1$y / 10) * 10

# Calcular las coordenadas del destino del segmento.
xmax <- ceiling(r1$x / 10) * 10
ymax <- ceiling(r1$y / 10) * 10


# Definición del cuadrante

cuad1 <- r1$y > r1$x - xmin + ymin
cuad2 <- r1$y > -(r1$x - xmin) + ymax

# Cálculo de las coordenadas del segmento a trazar.

## Forma completa

# x0 <- (cuad1 & cuad2) * 1 * xmin +
#       (!cuad1 & !cuad2) * 1 * xmin +
#       (cuad1 &  !cuad2) * 1 * xmin +
#       (!cuad1 & cuad2) * 1 * xmax
# 
# y0 <- (cuad1 & cuad2) * 1 * ymax +
#       (!cuad1 & !cuad2) * 1 * ymin +
#       (cuad1 &  !cuad2) * 1 * ymin +
#       (!cuad1 & cuad2) * 1 * ymin
# 
# x1 <- (cuad1 & cuad2) * 1 * xmax +
#       (!cuad1 & !cuad2) * 1 * xmax +
#       (cuad1 &  !cuad2) * 1 * xmin +
#       (!cuad1 & cuad2) * 1 * xmax
# 
# y1 <- (cuad1 & cuad2) * 1 * ymax +
#       (!cuad1 & !cuad2) * 1 * ymin +
#       (cuad1 &  !cuad2) * 1 * ymax +
#       (!cuad1 & cuad2) * 1 * ymax

## Forma simplificada

x0 <-  (!(!cuad1 & cuad2) * 1) * xmin +
       (!cuad1 & cuad2) * 1 * xmax

y0 <- (cuad1 & cuad2) * 1 * ymax +
      (!(cuad1 & cuad2) * 1) * ymin 

x1 <- (!(cuad1 &  !cuad2) * 1) * xmax +
       (cuad1 &  !cuad2) * 1 * xmin 
  
y1 <- (!cuad1 & !cuad2) * 1 * ymin +
      (!(!cuad1 & !cuad2) * 1) * ymax

## Punto central del cuadro  
cx <-xmin + (xmax-xmin)/2
cy <-ymin + (ymax-ymin)/2

## Cálculo de la distancia al punto central
dist_cent <- sqrt((r1$x - cx) ^ 2 + (r1$y - cy) ^ 2)
dist_cent

## Determinar si está muy cerca del centro o no 
x1 <- ((dist_cent < 2) * 1) * x0 +
      ((dist_cent > 2) * 1) * x1

y1 <- ((dist_cent < 2) * 1) * y0 +
      ((dist_cent > 2) * 1) * y1

# Trazado del segmento. 
segments(x0, y0, x1, y1)