//----------------------------------------------------------------------------//
// Titulo: Función para sumar dos enteros.
// Tipo: Plantilla
// Nombre: Kenneth Roy Cabrera Torres
// Fecha: Miércoles, 27 de mayo de 2016
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
