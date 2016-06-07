# Definición de funciones
#------------------------------------------------------------------------------#
# Definición de pasos de la escalera
pasosEscalera <- function(inicio, final){
  coord1 <- coordTablero[inicio,]*10-5
  coord2 <- coordTablero[final,]*10-5
  dif1 <-coord2-coord1
  delta <- dif1%/%10
  x <- seq(coord1[1],coord2[1],delta[1])
  y <- seq(coord1[2],coord2[2],delta[2])
  return(cbind(x,y))
}
#------------------------------------------------------------------------------#
# Dibuja escalera
dibujaEscalera <- function(x0,y0,x1,y1){
  for (i in 1:length(x0)){
   dif1 <-c(x1[i],y1[i])-c(x0[i],y0[i])
   delta <- dif1%/%10
   #cat(x0[i],x1[i],y0[i],y1[i],delta,"\n")
   x <- seq(x0[i],x1[i],delta[1])
   y <- seq(y0[i],y1[i],delta[2])
   x <- x[-c(1,length(x))]
   y <- y[-c(1,length(y))]
   segments(x-4,y,x+4,y,col="chocolate4",lwd=3)
   segments(x-4,y-0.5,x+4,y-0.5,col="chocolate2",lwd=3)
  }
  segments(c(x0-4,x0+4),c(y0,y0),
           c(x1-4,x1+4),c(y1,y1),
           col = "chocolate3",lwd=4)
  segments(c(x0-4+0.5,x0+4+0.5),c(y0,y0),
           c(x1-4+0.5,x1+4+0.5),c(y1,y1),
           col = "chocolate4",lwd=4)
}
#------------------------------------------------------------------------------#
# Calcula los coeficientes de una curva cuadrática
calcula_coef <- function(matriz) {
 Y <- matriz[,2]
 X <- cbind(matriz[,1]^2,matriz[,1],1)
 return(solve(X,Y))
}
#------------------------------------------------------------------------------#
# Define los pasos que hace la ficha al descender por el tobogán
pasoTobogan <- function(inicio,final){
  coord1 <- coordTablero[inicio,]*10-5
  coord2 <- coordTablero[final,]*10-5
  dif1 <- coord2 - coord1
  delta <- dif1%/%10
  coord3 <- c(coord2[1]+dif1[1]/2,coord1[2]+dif1[2]/2)
  coefcuad <- calcula_coef(rbind(coord1,coord2,coord3))
  x <- seq(coord1[1],coord2[1],delta[1])
  y <- coefcuad[1]*x^2 + coefcuad[2]*x + coefcuad[3]
  return(cbind(x,y))
}
#------------------------------------------------------------------------------#
# Define los pasos que hace la ficha al descender por el tobogán
# Dibuja el tobogán siguiendo una curva cuadrática
dibujaTobogan <- function(x0,y0,x1,y1){
  x2 <- x1+(x1-x0)/2
  y2 <- y0+(y1-y0)/2
  for (i in 1:length(x2)){
    mat1 <- matrix(c(x0[i],x1[i],x2[i],y0[i],y1[i],y2[i]),3,2)
    coefcuad <- calcula_coef(mat1)
    delta <- (x1[i]-x0[i])%/%20
    x <- seq(x0[i],x1[i],delta)
    y <- coefcuad[1]*x^2 + coefcuad[2]*x + coefcuad[3]
    if (delta > 0){
      lines(x+2,y+2, col = "darkblue", lwd = 3)
      lines(x-2,y-2, col = "darkblue", lwd = 3)
    }else{
      lines(x+2,y-2, col = "darkblue", lwd = 3)
      lines(x-2,y+2, col = "darkblue", lwd = 3)
    }
  }
}
#------------------------------------------------------------------------------#
# Obtiene la matriz de coordenadas de las escaleras
coordEsc <- function(escaleras){
  l1 <- NULL
  inicio <- which(escaleras!=0)
  finaliza <-  escaleras[escaleras!=0]
  return(cbind(coordTablero[inicio,],coordTablero[finaliza,]))
}
#------------------------------------------------------------------------------#
# Función para calcular la matriz de rotación
Mrot <- function(angulo = 45){
  angulo <- angulo*pi/180
  return(matrix(c(cos(angulo),sin(angulo),-sin(angulo),cos(angulo)),2,2))
}
#------------------------------------------------------------------------------#
# Dibuja cada ficha en el sitio correspondiente
dibujaFicha2 <- function(vector1){
  if (sum(vector1[2:3])!=0) {
  lugar <- t(t(figuras[[vector1[1]]]) + vector1[2:3])
  polygon(lugar, col = colores[vector1[[1]]])
  }
}
#------------------------------------------------------------------------------#
# Convierte las posiciones a coordenadas reales
ajusta_pos <- function(posiciones){
  coordTab <- t(sapply(posiciones, function(p1){ 
                       if(p1==0) matrix(c(0,0),1,2)
                       else coordTablero[p1,]*10-5}))
 posicionesC <- cbind(1:length(posiciones),coordTab)
 return(posicionesC)
}
#------------------------------------------------------------------------------#
# Función pantalla (Dibuja la pantalla = Tablero + Dados)
pantalla <- function(){
  layout(matrix(c(1,2), 1, 2, byrow = TRUE),widths=c(5,1))
  # Graficación del tablero de juebo
  par(mar = rep(0.2,4))
  plot(0:100,0:100, asp = 1, type = "n", axes = FALSE, xlab = "", ylab = "")
  segments(c(sec1,rep1),c(rep1,sec1),c(sec1,rep2),c(rep2,sec1))
  rect(1,1,9,9, col = "#0000ff80")
  rect(1,91,9,99, col = "gold")
  # Numerar cada casilla
  text(coordTablero[,1]*10-5,coordTablero[,2]*10-5,1:100,cex=0.7)
  # Graficación de las escaleras
  inicio <- which(escaleras!=0)
  finaliza <-  escaleras[escaleras!=0]
  dibujaEscalera(coordTablero[inicio,1]*10-5,coordTablero[inicio,2]*10-5,
                 coordTablero[finaliza,1]*10-5,coordTablero[finaliza,2]*10-5)
  # Graficación de los toboganes o serpientes
  inicio <- which(toboganes!=0)
  finaliza <-  toboganes[toboganes!=0]
  dibujaTobogan(coordTablero[inicio,1]*10-5,coordTablero[inicio,2]*10-5,
           coordTablero[finaliza,1]*10-5,coordTablero[finaliza,2]*10-5)
  # Graficación de cada ficha de acuerdo a sus coordenadas
  apply(posicionesC, 1,  dibujaFicha2)
  # Graficación de los dados
  par(mar = rep(0,4))
  plot(0:100,0:100*3, asp = 1, type = "n",axes = FALSE)
  rect(10,10,90,90, col = "#ff000010")
  if (dado1 !=0) 
    points(puntosDados[[dado1]][,1],puntosDados[[dado1]][,2], cex = 2, pch=19)
  rect(10,110,90,190, col = "#ff000010")
  if (dado2 !=0)
    points(puntosDados[[dado2]][,1],puntosDados[[dado2]][,2]+100, cex = 2, pch=19)
  # Texto para indicar el turno, jugador y finalmente el ganador.
  text(50,240,paste("Jugador:",jug),cex=0.8)
  text(50,260,paste("Turno:",turno),cex=0.8)
  if (termina) text(50,220,paste("Ganó el jugador",ganador),cex=0.8)
  Sys.sleep(0.1)
}

#------------------------------------------------------------------------------#
## Definición de variables globales

# Número máximo de jugadores
maxJugadores <- 10

# Coordenadas de los puntos de los dados para su graficación
puntosDados <- list(
  uno = matrix(c(50,50),1,2),
  dos = matrix(c(25,75,25,75),2,2),
  tres = matrix(c(25,50,75,25,50,75),3,2),
  cuatro = matrix(c(25,75,25,75,25,25,75,75),4,2),
  cinco  = matrix(c(25,75,25,75,50,25,25,75,75,50),5,2),
  seis   = matrix(c(25,25,25,75,75,75,25,50,75,25,50,75),6,2)
)
# Definición la figura básica
fig1 <- cbind(c(2,8,8,2),c(2,8,2,8)) - 5
figuras <- list(fig1)
# Definición de las posiciones de máximo número de jugadores
posiciones <- rep(0,maxJugadores)
# Inicio de los valores de los dados.
dado1 <- 0
dado2 <- 0
# Definición de los diez colores disponibles para las figuras
colores <- c("red","purple","magenta","yellow","orange",
             "darkred","goldenrod4","deeppink3","indianred","lightpink3")
# Definición de las coordenadas de las posiciones en el trablero
s1 <- seq(1,100)
x <- (((s1-1)%/%10)%%2==0)*((s1 - 1) %% 10) +
  (((s1-1)%/%10)%%2==1)*((10-1) -((s1 - 1) %% 10))
y <- rep(0:9, each = 10)
coordTablero <- cbind(x+1,y+1)
# Vector de definiciones de las escaleras
escaleras <- rep(0,100)
escaleras[5] <- 79
escaleras[6] <- 91
escaleras[40] <- 77
escaleras[46] <- 87
# Vector de definiciones de los toboganes
toboganes <- rep(0,100)
toboganes[90] <- 56
toboganes[97] <- 49
toboganes[51] <- 2
toboganes[80] <-11
# Definición de secuencias para la malla del tablero
sec1 <- seq(0,100,l=11)
rep1 <- rep(0,11)
rep2 <- rep(100,11)