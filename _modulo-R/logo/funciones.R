################################################################################
# Funciones auxiliares
# Autor: Kenneth Roy Cabrera Torres
################################################################################

## Definici�n de la figura para la "tortuga". Tri�ngulo is�sceles.
lado <- 10
coordenadas <- data.frame(x = c(0, lado/2, lado/4),
                          y = c(0, 0, sqrt(3) * lado/2))
## Calcula el centroide del tri�ngulo.
centroide <- apply(coordenadas, 2, mean)
## Calcula las coordenadas centradas.
coordenadas_centradas <- t(t(coordenadas) - centroide)

## Establece la estructura de la tortuga y sus caracter�sticas.
tortuga1 <- list(coordenadas = coordenadas_centradas,
                direccion  = 90,
                color = "darkgreen",
                pluma = TRUE,
                ruta  = list(list(matrix(c(0, 0), 1, 2), col = "black")))

## Lista de comando v�lidos del lenguaje LOGO.
comandos_basicos <- c("av", "gi", "gd", "bp", "rep",
                      "mt", "ot", "sp", "cp", "haga",
                      "para", "fin", "fin_para", "fin_rep")

## Funci�n para matriz de rotaci�n.
M <- function(angulo){
  R <- matrix(c(cos(angulo), 
                sin(angulo), 
                -sin(angulo),
                cos(angulo)), 
              nrow = 2,
              ncol = 2)
  return(R)
}

## Funci�n que dibuja cada uno de los segmentos de la ruta de la tortuga.

dibuja_linea <- function(segmento){
  if (nrow(segmento[[1]]) > 1)
  lines(segmento[[1]], col = segmento[[2]])
}

## Definici�n de la funci�n en R para borrar pantalla.

bp <- function(){
  Sys.sleep(0.1)
  plot(-50:50, -50:50, type = "n", asp = 1,
       ylab = "", xlab = "", las = 1)
}

## Funci�n en R que escribe la funci�n "bp()"
construye_bp <- function(){
  return("bp()")
}


## Funci�n que inicia el mundo de la tortuga.

inicio_mundo <- function(tortuga){
  plot(-50:50, -50:50, type = "n", asp = 1,
       ylab = "", xlab = "", las = 1)
  tortuga1 <- list(coordenadas = coordenadas_centradas,
                   direccion  = 90,
                   color = "darkgreen",
                   pluma = TRUE,
                   ruta  = list(list(matrix(c(0, 0), 1, 2), col = "black")))
  return(tortuga1)
}


## Funci�n para dibujar tortuga y ruta.

dibuja_tortuga <- function(tortuga){
  bp()
  sapply(tortuga$ruta, dibuja_linea)
  if (tortuga$pluma)
   polygon(tortuga$coordenadas, col = tortuga$color)
}


## Funci�n para girar a la izquierda.

gi <- function(tortuga, angulo){
  ## Halla el centroide.
  centroide <- apply(tortuga$coordenadas, 2, mean)
  ## Traslada la figura al centro (0, 0).
  tortuga$coordenadas <- t(t(tortuga$coordenadas) - centroide)
  ## Realiza la rotaci�n de la figura.
  tortuga$coordenadas <- t(M(angulo/180*pi) %*% t(tortuga$coordenadas))
  ## Devuelve las nuevas coordenadas.
  tortuga$coordenadas <- t(t(tortuga$coordenadas) + centroide)
  ## Actualiza el �ngulo de rotaci�n.
  tortuga$direccion   <- tortuga$direccion + angulo
  ## Recalcula el �ngulo para que quede entre -360 y 360. 
  tortuga$direccion   <- (tortuga$direccion/360 - 
                         trunc(tortuga$direccion/360)) * 360
  ## Dibuja el trazo y la tortuga
  dibuja_tortuga(tortuga)
  ## Devuelve el resultdo de las nuevas coordenadas de la tortuga.
  return(tortuga)
}

construye_gi <- function(grados){
  return(paste("tortuga1 <- gi(tortuga1,", grados, ")", sep = ""))
}

## Funci�n para dibujar girar a la derecha.

gd <- function(tortuga, angulo){
  tr <- gi(tortuga, -angulo)
  return(tr)
}

construye_gd <- function(grados){
  return(paste("tortuga1 <- gd(tortuga1,", grados, ")", sep = ""))
}

## Definici�n de la funci�n en R para avanzar

av <- function(tortuga, distancia){
  ## El avance se hace de acuerdo a la direcci�n actual de la tortuga.
  angulo <- tortuga$direccion
  ## C�lculo del deplazamiento en x y en y de acuerdo a la distancia.
  dx <- distancia * cos(angulo/180*pi)
  dy <- distancia * sin(angulo/180*pi)
  ## Actualizaci�n de las coordenadas.
  tortuga$coordenadas[, 1] <- tortuga$coordenadas[, 1] + dx
  tortuga$coordenadas[, 2] <- tortuga$coordenadas[, 2] + dy
  ## C�lculo del nuevo centroide para actualizar la ruta.
  n_centroide <- apply(tortuga$coordenadas, 2, mean)
  ## C�lculo de la ruta en el segmento actual.
  n_segmentos <- length(tortuga$ruta)
  ## C�lculo los puntos que se llevan en el respectivo segmento.
  n_puntos <- nrow(tortuga$ruta[[n_segmentos]])
  ## Actualiza la matriz con las coordenadas de los segmentos.
  tortuga$ruta[[n_segmentos]][[1]] <- 
    rbind(tortuga$ruta[[n_segmentos]][[1]], n_centroide)
  ## Dibuja la tortuga.
  dibuja_tortuga(tortuga)
  return(tortuga)
}

construye_av <- function(distancia){
  return(paste("tortuga1 <- av(tortuga1,", distancia, ")", sep = ""))
}

## Definici�n de cambio de color.

cp <- function(tortuga, color){
  colorC <- switch (color,
    negro    = "black",
    rojo     = "red",
    verde    = "green",
    azul     = "blue",
    cian     = "cyan",
    amarillo = "yellow",
    magenta  = "magenta",
    gris     = "grey"
  )
  ## Se construye un nuevo segmento, dado que se cambia el color.
  n_segmentos <- length(tortuga$ruta)
  ## El nuevo segmento inicia en donde finaliza el �ltimo segmento.
  n_puntos    <- nrow(tortuga$ruta[[n_segmentos]][[1]])
  ## Actualiza la ruta de la tortuga al iniciar un nuevo segmento.
  tortuga$ruta <- c(tortuga$ruta,
                  list(list(
                    matrix(tortuga$ruta[[n_segmentos]][[1]][n_puntos, ], 1, 2), 
                                 col = colorC)))
  return(tortuga)
}

construye_cp <- function(color){
  return(paste("tortuga1 <- cp(tortuga1,", color, ")", sep = ""))
}

## Funci�n para mostrar tortuga.
mt <- function(tortuga){
  tortuga$pluma <- TRUE
  dibuja_tortuga(tortuga)
  return(tortuga)
}

construye_mt <- function(){
  return("tortuga1 <- mt(tortuga1)")
}

## Funci�n para ocultar tortuga.
ot <- function(tortuga){
  tortuga$pluma <- FALSE
  dibuja_tortuga(tortuga)
  return(tortuga)
}

construye_ot <- function(){
  return("tortuga1 <- ot(tortuga1)")
}

## Funci�n para dejar de trazar ruta o "sin pluma"
## Es este caso se cambia el color a un "blanco trasnsparente" de la tortuga.
sp <- function(tortuga){
  tortuga <- cp(tortuga, "#00000000")
  return(tortuga)
}

construye_sp <- function(){
  return(paste("tortuga1 <- sp(tortuga1)", sep = ""))
}


## Asigna variables
construye_haga <- function(nom_var, valor){
  return(paste(nom_var, " <- ", valor, sep = ""))
}

## Crea ciclos
construye_rep <- function(pasos){
  return(paste("for (i in 1:", pasos, "){", sep = ""))
}

## Construye comando de logo de un ciclo
## Convierte un l�neas de comando de LOGO a varias l�neas en 
## donde cada l�nea es un solo comando de LOGO.
logo_wide2long <- function(sarta){
  sarta_sal <- vector(mode = "character")
  n <- length(sarta)
  i <- 1
  isal <- 1
  while (i <= n) {
    if (any(sarta[i] %in% c("av", "gi", "gd", "cp", "haga"))){
      sarta_sal[isal] <- paste(sarta[i], sarta[i + 1])
      i <-  i + 2
    }else{
      sarta_sal[isal] <-  sarta[i]
      i <-  i + 1
    }
    isal <- isal + 1
  }
  return(sarta_sal)
}

## Funci�n que construye en lenguaje LOGO el c�digo dentro de un
## ciclo o repetici�n.

construye_prog_rep <- function(programa_logo){
  # Identifica las posicione en donde hay ciclos.
  posiciones_rep <- grep("rep", programa_logo)
  # Realiza el procedimiento si hay alg�n ciclo en el c�digo.
  if (length(posiciones_rep) != 0){
    # Toma las l�neas en donde est� el c�digo a repetir.
    programa_logo_rep <- programa_logo[posiciones_rep]
    # Identifica el inicio del ciclo y el fin del ciclo.
    ini <- regexpr("\\[", programa_logo_rep)
    fin <- regexpr("\\]", programa_logo_rep)
    # Toma las instrucciones para convertir de una sola l�nea a varias l�neas.
    comando_logo_wide <- substring(programa_logo_rep, ini + 1, fin - 1)
    # Separa los comando.
    comando_logo_wide_sep <- strsplit(comando_logo_wide, " ")
    # Convierte una l�nea a varias l�neas de comandos en logo.
    comandos_long <- lapply(comando_logo_wide_sep, logo_wide2long)
    # Actualiza las l�neas en donde se inicia el ciclo.
    programa_logo[posiciones_rep] <- 
      substring(programa_logo[posiciones_rep], 1, ini - 2)
    # Construye el nuevo vector de comandos de LOGO.
    prog_sal <- vector(mode = "character")
    prog_sal <- programa_logo
    # Adiciona los nuevos comandos a�adiendo la indicaci�n de final de repetici�n.
    for (i in length(comandos_long):1){
      prog_sal <- append(prog_sal, c(comandos_long[[i]], "fin_rep"), 
                         after = posiciones_rep[i])
    }
  }else{
    prog_sal <- programa_logo
  }
  return(prog_sal)
}

## Funci�n para construir funciones en LOGO.
construye_funcion <- function(nom_fun, parametro){
  return(paste(nom_fun, " <- function(", parametro, "){" ))
}

## Funci�n que construye el llamado de una funci�n de acuerdo al par�metro.
construye_llama_funcion <- function(comando, valor){
  return(paste("tortuga1 <- ", comando, "(", valor ,")", sep = ""))
}
