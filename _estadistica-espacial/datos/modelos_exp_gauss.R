###############################################################################
# Graficación de funciones de correlación exponencial y gauss con 
# parámetro phi = 3
# Autor: Kenneth Roy Cabrera Torres
# Fecha de creación: 20 de febrero de 2016
# Actualizaciones: 
###############################################################################

#-----------------------------------------------------------------------------#
# Función exponencial
corrExp <- function(u, phi){
  # Calcula la función de correlación exponencial 
  #
  # Args:
  #   u   : Vector de distancias sobre la cuál es calculará la función.
  #   phi : Parámetro de la función de correlación exponencial.
  # 
  # Retorna:
  # Valor de la correlación para los valores del vector de distancias u.
  return(exp(-u/phi))
}

#-----------------------------------------------------------------------------#
# Función exponencial
corrGauss <- function(u, phi){
  # Calcula la función de correlación exponencial 
  #
  # Args:
  #   u   : Vector de distancias sobre la cuál es calculará la función.
  #   phi : Parámetro de la función de correlación de Gauss.
  # 
  # Retorna:
  # Valor de la correlación para los valores del vector de distancias u.
  return(exp(-(u/phi)^2))
}

###############################################################################
# Programa principal
###############################################################################

# Definición del vector de distancias.
u <- seq(0, 12, 0.1)
# Definición del valor del parámetro phi.
phi <- 3

# Cáculo de los valores de correlación exponencial.
curvExp   <- corrExp(u, phi)
# Cáculo de los valores de correlación de Gauss.
curvGauss <- corrGauss(u, phi)

# Gráfica de las funciones de correlación.
# Línea para la función exponencial.
plot(u, curvExp, type = "l", col = "blue", lwd = 2,
     ylab = expression(rho (u)), xlab = "Distancias (u)", las = 2,
     main = expression(paste("Funciones de correlación con ", phi, "= 3")))
# Línea para la función de Gauss
lines(u, curvGauss, col = "red", lwd = 2)
# Leyenda 
legend("topright", 
       legend = c("Correlación Exponencial", "Correlación de Gauss"),
       lwd = 2, col = c("blue", "red"))
# Línea horizontal a una correlación de 0.05 (rho=0.05).
abline(h = 0.05, col = "black")
# Línea vertical aproximadamente en el punto de corte con la correlación 
# exponencial.
abline(v = 9, col = "gray", lty = 2)
# Línea vertical aproximadamente en el punto de corte con la correlación
# de Gauss.
abline(v = 5.2, col = "gray", lty = 2)



