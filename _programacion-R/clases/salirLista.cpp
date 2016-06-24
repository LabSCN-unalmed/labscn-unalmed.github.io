#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List ejemploLista(int a, int b, List w) {
  CharacterVector x = CharacterVector::create("Angelica", "Maria");
  NumericVector y   = NumericVector::create(0.0, 1.0);
  y(0) = a;
  List z            = List::create(x, y, a, b, w);
  return z;
}

/*** R
y <- list(nada = 2, algo = 5)
ejemploLista(11, 9, y)
*/
