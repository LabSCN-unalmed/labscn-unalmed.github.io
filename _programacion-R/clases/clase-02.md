---
layout: clase
title: 'Lenguaje de programación C, C++'
curso: 'programacion-R'
clase: 2
custom_js: 'mathjax'
---

## Lenguaje de programación C, C++

Se utilizará la integración del lenguaje C, C++ al
lenguaje R

## Equivalencias de tipos de datos

 - Escalares

    * `int` : Entero.
    * `float`, `double` : Real.
    * `std::string`: Sarta.
    * `std::char`: Carácter.
    * `bool`: booleano. Toma los valores de `true` o `false`

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

## Simplificaciones de contadores y acumuladores

  - La operación `i++`, es equivalente a `i = i + 1`.
  - La operación `i--`, es equivalente a `i = i - 1`.
  - La operación `c += a`, es equivalente a `c = c + a`.
  - La operación `c -= a`, es equivalente a `c = c - a`.
  - La operación `c *= a`, es equivalente a `c = c * a`.
  - La operación `c /= a`, es equivalente a `c = c / a`.
  - La operación `c %= a`, es equivalente a `c = c % a`.

## Estructuras básicas

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
    Rcout << var1 << var2 << std::endl;
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
    for( <condición inicial>; <condición de final>; <incremento>){
      <instrucción 1>
      <instrucción 2>
      .
      .
      .
      <instrucción n>
    }
```

## Plantilla ejemplo básica integrada a R

[Plantilla](plantilla.cpp)

``` c++
{% include_relative plantilla.cpp %}
```


## Ejemplos

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

Uso de las listas en la integración de R y C++.

``` c++
{% include_relative salirLista.cpp %}
```

## Ejercicios

Escriba una función en C++ integrada a R que:

- dado un número entero de tres cifras y muestre el mísmo número de pero con
  los dígitos invertidos (sin utilizar el tipo sarta).
- halle la aproximación a la raiz de un número de
  la siguiente manera: Lea un número al cual se le hallará la raíz, y luego
  lea un número cualquiera como primera aproximación a la
  raíz del número. Mejore el resultado hallando el promedio entre el número
  aproximado y la división del número inicial y el número aproximado. Este promedio
  es de nuevo un valor aproximado a la raíz. Continuar el proceso hasta que
  la aproximación sea correcta en el orden de las millonésimas. (No utilizar
  la operación `std::pow()`).
- dadas las dimensiones de una matriz (n filas, m columnas), mostrar los índices
  de la matriz en forma de zig-zag (horizontal),
  comenzando por la posición [1][1]. Los índices se entregan en una
   matrix de orden $$(nm)\times 2$$.
- dada la dimensión de una matriz cuadrada muestre los índices de las diagonales
  secundarias comenzando por la posición [1][1] en una
  matriz de orden $$(n^2)\times 2$$.
- dado un número encuentre su factorial. Recuerde que
  $$n! = n\cdot(n-1)\cdot...2\cdot1$$ y además $$0! = 1$$.
- dado un ángulo en radianes calcule el valor de la función trigonomética
  seno mediante la [expansión de Taylor](https://es.wikipedia.org/wiki/Serie_de_Taylor).
  Use una precisión de milésimas.
- dado un ángulo en radianes muestre el número de términos de la expansión de
  Taylor que se necesitan para tener una aproximación a la millonésima.    
