#include <iostream>
#include <locale>

using namespace std;

int fil, colum, i, j, p1, p2, sw1, sw2, sw3;

int main(){
   setlocale(LC_ALL, "");

   cout << "Entre la fila en donde está el caballo" << endl;
   cin >> fil;

   cout << "Entre la columna en donde está el caballo"<< endl;
   cin >> colum;

   for (i = 1; i <= 4; i++){
     sw1 = (i%2)*1 + ((i+1)%2)*(-1);
     for (j =1; j <= 2; j++){;
       sw2 = (j%2)*1 + ((j+1)%2)*(-1);
       sw3 = i/2;
       p1 = (colum + 2)*sw1 + (fil + 1)*sw2;
       p2 = (colum + 2)*sw1 + (fil + 1)*sw2;
       cout << p1 << "," << p2 << endl;
     }
   }
}
