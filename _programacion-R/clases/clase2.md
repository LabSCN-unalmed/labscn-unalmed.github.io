---
layout: curso
title: 'Tema 2'
curso: 'programacion-R'
---

## Lenguaje de programación C, C++

Se utilizará la integración del lenguaje C, C++ al
lenguaje R

### Equivalencias de tipos de datos

 - Escalares

    * `int` : Entero
    * `double` : Real

 - Vectoriales

    * `IntegerVector`:  Entero vector[]
    * `NumericVector`:  Real vector[]
    * `IntegerMatrix`:  Entero matrix[][]
    * `NumericMatrix`:  Real matrix[][]


### Plantilla ejemplo básica

``` c++
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
```
