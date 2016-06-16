//----------------------------------------------------------------------------//
// Titulo: Saludo al mundo.
// Tipo: Ejemplo 1.
// Nombre: Kenneth Roy Cabrera Torres.
// Fecha: Jueves, 16 de junio de 2016.
// Enunciado: Escriba una función en C++ integrada a R que
// realice el saludo clásico de "Hola, mundo".
//----------------------------------------------------------------------------//
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void saludo(){
  Rcout << "Hola, mundo" << std::endl;
}

/*** R
saludo()
*/
