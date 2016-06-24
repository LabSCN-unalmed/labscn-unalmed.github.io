#------------------------------------------------------------------------------#
#' Matriz con posiciones del salto de caballo.
#' 
#' @param filC es un entero que indica la fila de la posición del caballo.
#' @param colC es un entero que indica la columna de la posición del caballo.
#' @author Kenneth Cabrera.
#' @description Muestra una matriz en donde puede saltar el caballo.
#------------------------------------------------------------------------------#

muestraTablero <- function(filC, colC){
  tablero <- matrix( rep(0, 8*8), nrow = 8, ncol = 8)
  tablero[filC, colC] <- 2
  tablero[saltoCaballo(filC, colC)] <- 1
  tablero
}

