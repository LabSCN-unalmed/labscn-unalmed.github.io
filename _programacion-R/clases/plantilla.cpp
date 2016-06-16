//----------------------------------------------------------------------------//
// Titulo: Función para sumar dos enteros.
// Tipo: Plantilla
// Nombre: Kenneth Roy Cabrera Torres
// Fecha: Jueves, 16 de junio de 2016
// Enunciado: Se construye la función suma.
//----------------------------------------------------------------------------//
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int sume(int x, int y) {
  int suma = x + y;
  return suma;
}

/*** R
sume(1,2)
*/
