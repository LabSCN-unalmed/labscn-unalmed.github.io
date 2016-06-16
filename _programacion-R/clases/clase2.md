---
layout: curso
title: 'Tema 2'
curso: 'programacion-R'
---

## Contenido.
{: .no_toc}

* ToC
{: toc}

## Lenguaje de programación C, C++.

Se utilizará la integración del lenguaje C, C++ al
lenguaje R

## Equivalencias de tipos de datos.

 - Escalares

    * `int` : Entero.
    * `float`, `double` : Real.
    * `std::string`: Sarta.
    * `std::char`: Carácter.

 - Vectoriales

    * `IntegerVector`:  Entero vector[]
    * `NumericVector`:  Real vector[]
    * `CharacterVector`: Sarta vector[]    
    * `IntegerMatrix`:  Entero matriz[][]
    * `NumericMatrix`:  Real matriz[][]
    * `CharacterMatrix`: Sarta matriz[][]

## Operadores

 Los operadores son similares al seudocódigo, teniendo en cuenta algunos
 aspectos:

  - El símbolo para la división (/), sirve tanto para la división entera,
    como para la división de reales. Si los dos números son enteros,
    realizará la división entera si algunos de ellos es real, entonces
    realizará la división real.
  - El operador módulo (mod) es (%).
  - Para potencia se utiliza la función de la biblioteca estándar `std::pow(x,y)`.

## Simplificaciones de contadores y acumuladores.

  - La operación `i++`, es equivalente a `i = i - 1`.
  - La operación `i--`, es equivalente a `i = i - 1`.
  - La operación `c += a`, es equivalente a `c = c + a`.
  - La operación `c -= a`, es equivalente a `c = c - a`.
  - La operación `c *= a`, es equivalente a `c = c * a`.
  - La operación `c /= a`, es equivalente a `c = c / a`.
  - La operación `c %= a`, es equivalente a `c = c % a`.

## Estructuras básicas.

  - Asignación

``` c++
   variable1 = <expresión>
```

  - Entrada/Salida.

La entrada y salida usual en el C++, es utilzando los métodos
cin y cout. Pero nn la itegración del R con el C++.
No se utiliza entradas dentro del código de C++.
Toda entrada se deja al R que la maneje.

Las salidas se prefiere que sean también responsabilidad del R.

Pero en donde sea necesario se utiliza la siguiente estructura.

``` c++
    Rcout::cout << var1 << var2 << std::endl;
```

  - Decisión

``` c++
     if (<condición>){
      <instrucción 1>
      <instrucción 2>
      .
      .
      .
      <instrucción k>
     }else{
       <instrucción k+1>
       <instrucción k+2>
       .
       .
       .
       <instrucción k+n>
     }     
```
  - Repetición

``` c++
    while (<condición>){
      <instrucción 1>
      <instrucción 2>
      .
      .
      .
      <instrucción n>
    }
```

``` c++
    for( <condición inicial>; <condición de final>; <incremento>)
      <instrucción 1>
      <instrucción 2>
      .
      .
      .
      <instrucción n>
    }
```

## Plantilla ejemplo básica integrada a R.

[Plantilla](plantilla.cpp)

``` c++
//----------------------------------------------------------------------------//
// Titulo: Función para sumar dos enteros.
// Tipo: Plantilla
// Nombre: Kenneth Roy Cabrera Torres
// Fecha: Jueves, 16 de junio de 2016
// Enunciado: Se construye la función suma.
//----------------------------------------------------------------------------//
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

## Ejemplos.

Escriba una función en C++ integrada a R que:

 - realice el saludo clásico de "Hola, mundo". ([Ejemplo 1](ejemplo1.cpp)).
 - utilice como entrada el nombre del usuario
 y devuelva un saludo. ([Ejemplo 2](ejemplo2.cpp)).
 - utilice como entrada tenga dos números y que
   devuelva un vector con la suma, la diferencia y
   el producto.([Ejemplo 3](ejemplo3.cpp))
 - utilice como entrada un vector de números y que devuelva
   un vector con la suma y el producto de todos
   los números. ([Ejemplo 4](ejemplo4.cpp)).
 - Utilice como entrada tres vectores en donde están las
   coordenadas de tres puntos y mediante la fórmula de Herón,
   muestre el área del triángulo correspondiente. ([Ejemplo 5](ejemplo5.cpp)).

## Ejercicios

Escriba una función en C++ integrada a R que:

-
