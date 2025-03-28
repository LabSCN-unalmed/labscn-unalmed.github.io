#################################################################################
# "Movimiento de una bola que rebota"                                           #
#################################################################################

# Coordenadas de inicio del movimiento
xini <- 50
yini <- 50

# �ngulo de inicio del recorrido entre 0 y 90 grados.

angulo <- 60

# N�mero m�ximo de pasos en la trayectoria.
numMaxPasos <- 100

pasos <- 0 # Contador del n�mero de pasos
dirX <- 1 # Direcci�n inicial en x de la trayectoria.
dirY <- 1 # Direcci�n inicial en y de la trayectoria.
paso <- 2 # Longitud del paso
x <- xini # Establecer la coordenada y del punto.
y <- yini # Establecer la coordenada y del punto.


# Ciclo para generar la animaci�n
while(pasos <= numMaxPasos){ # La condici�n es que no se exceda del n�mero de pasos.
  
  # Grafica de nuevo el tablero inicial
  plot(c(0, 100), c(0, 100), 
       type = "n", axes = FALSE,
       xlab = "", ylab = "",
       asp = 1)
  rect(0, 0, 100, 100)
  
  
  points(x, y, pch = 19, col = "black") # Grafica el punto en las coordenadas actuales
  
  # Si se chocha con el l�mite derecho del eje x.
  if(x >= 98){
    dirX = -1             # Cambia de direci�n.
    angulo <- 90 - angulo # Cambia de �ngulo.
  }
  # Si se chocha con el l�mite izquierdo del eje x.
  if (y >= 98){
    dirY = -1             # Cambia de direci�n.
    angulo <- 90 - angulo # Cambia de �ngulo.
  }
  # Si se chocha con el l�mite superior del eje y.
  if (x <= 2){
    dirX = 1              # Cambia de direci�n.
    angulo <- 90 - angulo # Cambia de �ngulo.
  }
  # Si se chocha con el l�mite inferior del eje y.
  if (y <= 2){
    dirY = 1              # Cambia de direci�n.
    angulo <- 90 - angulo # Cambia de �ngulo.
  }
  
  # Calcula la nueva coordenada en x.
  x <- x + dirX * paso * sin(angulo * pi / 180)
  # Calcula la nueva coordenada en y.
  y <- y + dirY * paso * cos(angulo * pi / 180)
  pasos <- pasos + 1 # Actualiza el contador del n�mero de pasos.
  Sys.sleep(0.1)     # Espera de tiempo.
}