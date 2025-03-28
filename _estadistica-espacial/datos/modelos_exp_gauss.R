###############################################################################
# Graficaci�n de funciones de correlaci�n exponencial y gauss con 
# par�metro phi = 3
# Autor: Kenneth Roy Cabrera Torres
# Fecha de creaci�n: 20 de febrero de 2016
# Actualizaciones: 
###############################################################################

#-----------------------------------------------------------------------------#
# Funci�n exponencial
corrExp <- function(u, phi){
  # Calcula la funci�n de correlaci�n exponencial 
  #
  # Args:
  #   u   : Vector de distancias sobre la cu�l es calcular� la funci�n.
  #   phi : Par�metro de la funci�n de correlaci�n exponencial.
  # 
  # Retorna:
  # Valor de la correlaci�n para los valores del vector de distancias u.
  return(exp(-u/phi))
}

#-----------------------------------------------------------------------------#
# Funci�n exponencial
corrGauss <- function(u, phi){
  # Calcula la funci�n de correlaci�n exponencial 
  #
  # Args:
  #   u   : Vector de distancias sobre la cu�l es calcular� la funci�n.
  #   phi : Par�metro de la funci�n de correlaci�n de Gauss.
  # 
  # Retorna:
  # Valor de la correlaci�n para los valores del vector de distancias u.
  return(exp(-(u/phi)^2))
}

###############################################################################
# Programa principal
###############################################################################

# Definici�n del vector de distancias.
u <- seq(0, 12, 0.1)
# Definici�n del valor del par�metro phi.
phi <- 3

# C�culo de los valores de correlaci�n exponencial.
curvExp   <- corrExp(u, phi)
# C�culo de los valores de correlaci�n de Gauss.
curvGauss <- corrGauss(u, phi)

# Gr�fica de las funciones de correlaci�n.
# L�nea para la funci�n exponencial.
plot(u, curvExp, type = "l", col = "blue", lwd = 2,
     ylab = expression(rho (u)), xlab = "Distancias (u)", las = 2,
     main = expression(paste("Funciones de correlaci�n con ", phi, "= 3")))
# L�nea para la funci�n de Gauss
lines(u, curvGauss, col = "red", lwd = 2)
# Leyenda 
legend("topright", 
       legend = c("Correlaci�n Exponencial", "Correlaci�n de Gauss"),
       lwd = 2, col = c("blue", "red"))
# L�nea horizontal a una correlaci�n de 0.05 (rho=0.05).
abline(h = 0.05, col = "black")
# L�nea vertical aproximadamente en el punto de corte con la correlaci�n 
# exponencial.
abline(v = 9, col = "gray", lty = 2)
# L�nea vertical aproximadamente en el punto de corte con la correlaci�n
# de Gauss.
abline(v = 5.2, col = "gray", lty = 2)



