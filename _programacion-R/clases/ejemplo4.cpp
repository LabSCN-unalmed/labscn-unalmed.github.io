//----------------------------------------------------------------------------//
// Titulo: Suma y producto.
// Tipo: Ejemplo 4.
// Nombre: Kenneth Roy Cabrera Torres.
// Fecha: Jueves, 16 de junio de 2016
// Enunciado: Escriba una función en C++ integrada a R que
// utilice como entrada un vector de números y que devuelva
// un vector con la suma y el producto de todos los números.
//----------------------------------------------------------------------------//
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector operaciones2(NumericVector A){
  double suma, producto;
  int i, longitud;
  NumericVector oper(2);
  
  suma = 0;
  producto = 1;
  longitud = A.size();
  for (i = 0; i < longitud; i++){
    suma +=  A[i];
    producto *=  A[i];
  }
  oper[0] = suma;
  oper[1] = producto;
  return oper;
}


/*** R
v1 <- c(10, 4, 7, 9)
operaciones2(v1)
*/
