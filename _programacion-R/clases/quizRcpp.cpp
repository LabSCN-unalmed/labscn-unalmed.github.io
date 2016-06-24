#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector saltoCaballo(int fil, int colum){
  int  i, j, k, a, b, x, y, contFil;
  NumericVector v1;
  NumericVector v2;
  contFil = 0;
  for (k = 1; k <= 2; k++){
    for (i = 1; i <= 2; i++){
      b = (i%2)*1 + ((i+1)%2)*(-1);
      for (j = 1; j <= 2; j++){
        a = (j%2)*1 + ((j+1)%2)*(-1);
        if (k==1){
          x = a*2 + fil;
          y = b*1 + colum;
        }else{
          x = b*1 + fil;
          y = a*2 + colum;
        }
        if ((x >= 1 && x <= 8) && (y >= 1 && y <= 8)){
            v1.push_back(x);
            v2.push_back(y);
            contFil++;
        }
      }
    }
  }
  NumericMatrix M(contFil, 2);
  M(_,0) = v1;
  M(_,1) = v2;
  return M;
}


/*** R
saltoCaballo(1, 1)
*/
