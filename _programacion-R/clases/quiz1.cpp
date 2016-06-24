#include <iostream>
#include <locale>

using namespace std;

int fil, colum, i, j, k, a, b, x, y;

int main(){
   setlocale(LC_ALL, "");

   cout << "Entre la fila en donde está el caballo" << endl;
   cin >> fil;

   cout << "Entre la columna en donde está el caballo"<< endl;
   cin >> colum;

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
           cout << x << " " << y << endl;
         }
       }
     }
   }
}
