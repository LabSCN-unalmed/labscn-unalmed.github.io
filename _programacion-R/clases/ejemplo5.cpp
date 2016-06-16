//----------------------------------------------------------------------------//
// Titulo: Área de un triángulo.
// Tipo: Ejemplo 5.
// Nombre: Kenneth Roy Cabrera Torres.
// Fecha: Jueves, 16 de junio de 2016
// Enunciado: Escriba una función en C++ integrada a R que
// utilice como entrada tres vectores en donde están las
// coordenadas de tres puntos y mediante la fórmula de Herón,
// muestre el área del triángulo correspondiente.
//----------------------------------------------------------------------------//
#include <Rcpp.h>
using namespace Rcpp;

double distancia(NumericVector punto1, NumericVector punto2){
  double aux;
  aux = std::pow(punto1[0] - punto2[0],2) + std::pow(punto1[1] - punto2[1],2);
  aux = std::pow(aux, 1.0/2.0);
  return aux;
}

// [[Rcpp::export]]
double area_triang(NumericVector p1, NumericVector p2, NumericVector p3){
  double a, b, c, s, area;
  a = distancia(p1, p2);
  b = distancia(p2, p3);
  c = distancia(p3, p1);
  s = (a + b + c)/2.0;
  area = std::pow(s*(s-a)*(s-b)*(s-c),1.0/2.0);
  return area;
}


/*** R
punt1 <- c(5, 1)
punt2 <- c(3, 1)
punt3 <- c(1, 4)
area_triang(punt1, punt2, punt3)
*/
