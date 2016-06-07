#------------------------------------------------------------------------------#
# Juego de simulación de la escalera
# Autor: Kenneth Roy Cabrera Torres
# Fecha: 1 de diciembre de 2015
#------------------------------------------------------------------------------#
# Cargar las funciones auxiliares
source("funciones.R")
#------------------------------------------------------------------------------#
# Programa principal
#------------------------------------------------------------------------------#
# Validación del número de jugadores
# No permitirá números que no sean enteros o simbolos o letras.
seleccion_num <- FALSE
njug <- 0
while (!seleccion_num){
 njug <- readline(paste("Cuántos jugadores (máximo",
                              maxJugadores,"jugadores): "))
 njug <- tryCatch(as.integer(njug), warning = function(c) 0)
 if (njug >= 1 && njug <= maxJugadores) seleccion_num <- TRUE
}
#------------------------------------------------------------------------------#
# Inicialización de variables globales
termina <- FALSE
n <- 0
turno <- 0
jug <-0
#------------------------------------------------------------------------------#
# Definir las figuras de acuerdo al número de jugadores seleccionados
if (njug > 1){
  pasoAng <- 180/njug
  for (angulo in seq(pasoAng, pasoAng*(njug-1), pasoAng)) {
    fig <- fig1 %*% Mrot(angulo)
    figuras <- c(figuras,list(fig))
  }
}
# Inicialización del juego y conservación de parámetros gráficos
def.par <- par(no.readonly = TRUE)
posicionesC <- ajusta_pos(posiciones)
pantalla()
# Bucle o ciclo del juego total
while(!termina){
 turno <- turno + 1
 # Un ciclo para pasar por cada jugador en cada turno
 for (jug in 1:njug){
   #Líneas comentadas para que el programa sea interactivo
   #readline(paste("Presione enter para el turno ",turno,
   #               " del jugador ",jug," :",sep=""))
   # Obtener los resultaos de los dados al azar
   dado1 <- sample(1:6,1)
   dado2 <- sample(1:6,1)
   # Obtener las coordenadas dada las posiciones
   posicionesC <- ajusta_pos(posiciones)
   pantalla()
   # Definición del avance del jugador a una nueva casilla.
   ini <- posiciones[jug]+1
   fin <- posiciones[jug]+dado1+dado2
   # Determinar si se ha llegado a la meta del juego
   # y definir como última posición la casilla final.
   if (fin >100) fin <- 100
   # Secuencia para move la ficha respectiva
   for (p1 in ini:fin) {
     posiciones[jug]<-p1
     posicionesC <- ajusta_pos(posiciones)
     pantalla()
   }
   # Subir por una escalera si ha llegado a una posición
   # en donde se encuentra una escalera.
   if (escaleras[posiciones[jug]]!=0) {
     inicio <- posiciones[jug]
     final <- escaleras[posiciones[jug]]
     pasosE <- pasosEscalera(inicio,final)
     # Realizar el movimiento de subir la escalera
     for (i in 1:nrow(pasosE)){
        posicionesC[jug,c(2,3)] <- pasosE[i,]
        pantalla()}
     # Actualizar la posición final del jugador.
     posiciones[jug] <- escaleras[posiciones[jug]]}
   # Bajar por el tobogán o serpiente de acuerdo 
   # al lugar en donde llegó la ficha.
   if (toboganes[posiciones[jug]]!=0) {
     inicio <- posiciones[jug]
     final <- toboganes[posiciones[jug]]
     pasosT <- pasoTobogan(inicio,final)
   # Bajar por el tobogán siguiendo la curva del tobogán
     for (i in 1:nrow(pasosT)){
       posicionesC[jug,c(2,3)] <- pasosT[i,]
       pantalla()}
     posiciones[jug] <- toboganes[posiciones[jug]]}
   # Actualiza las posiciones
   posicionesC <- ajusta_pos(posiciones)
   pantalla()
   # Vefificar si algún jugador ya alcanzó la meta y 
   # definir la salida del ciclo "mientras" así como
   # del ciclo "para"
   if (any(posiciones >= 100)) {
     termina <- TRUE
     ganador <- which(posiciones>=100)
     posiciones[ganador] <- 100
     posicionesC <- ajusta_pos(posiciones)
     pantalla()
     break}
   posicionesC <- ajusta_pos(posiciones)
   pantalla()}
}
par(def.par) 