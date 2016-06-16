//----------------------------------------------------------------------------//
// Titulo: Saludo al usuario.
// Tipo: Ejemplo 2.
// Nombre: Kenneth Roy Cabrera Torres.
// Fecha: Jueves, 16 de junio de 2016.
// Enunciado: Escriba una función en C++ integrada a R que utilice 
// como entrada el nombre del usuario
// y devuelva un saludo.
//----------------------------------------------------------------------------//
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void saludo2(std::string nombre){
  Rcout << "Hola " << nombre << std::endl;
}

/*** R
nombre <- "Kenneth"
saludo2(nombre)
*/
