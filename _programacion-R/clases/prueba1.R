#------------------------------------------------------------------------------#
# Titulo: Prueba del paquete ajedrez
# Tipo: Prueba de funciones
# Nombre: Kenneth Roy Cabrera Torres
# Fecha: Viernes, 24 de junio de 2016
# Enunciado: Prueba para determinar si las funciones del paquete
# trabajan adecuadamente.
#------------------------------------------------------------------------------#

library(ajedrez)

# Muestra las posiciones a las cuales puede saltar un caballo.
saltoCaballo(4, 4)

# Muestra el tablero de ajedrez cuando el caballo está en la posición (4,4).
print(muestraTablero(4, 4))

# Muestra el tablero de ajedrez cuando el caballo está en la posición (1,1).
print(muestraTablero(1, 1))

# Muestra el tablero de ajedrez cuando el caballo está en la posición (1,5).
print(muestraTablero(1, 5))
