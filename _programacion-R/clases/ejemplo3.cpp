//----------------------------------------------------------------------------//
// Titulo: Operaciones básicas.
// Tipo: Ejemplo 3.
// Nombre: Kenneth Roy Cabrera Torres.
// Fecha: Jueves, 16 de junio de 2016.
// Enunciado: Escriba una función en C++ integrada a R que
// devuelva un vector con la suma, la diferencia y el producto.
//----------------------------------------------------------------------------//
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector operaciones(double A, double B){
  double suma, diferencia, producto;
  NumericVector oper(3);
  suma = A + B;
  diferencia = A - B;
  producto = A*B;
  oper[0] = suma;
  oper[1] = diferencia;
  oper[2] = producto;
  return oper;
}

/*** R
x <- 48
y <- 21
operaciones(x, y)
*/
