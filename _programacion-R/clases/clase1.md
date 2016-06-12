---
layout: curso
title: 'Tema 1'
curso: 'programacion-R'
---


## Estructuras básicas en lógica de programación.

1. Tipos de variables.
   - Booleano:
      * Sólo toma los valores de V o F (Verdadero o Falso)
   - Numéricos:
      * Entero.
      * Real.
   - Alfanuméricos:
      * Carácter.
      * Sarta.

2. Operaciones básicas.
   - Numéricos:
    * Enteros: +, -, * , div, mod, ^.
    * Reales: +, -, * , /, ^.      
   - Alfanuméricos
    * \+ : concatenar
    * subsarta(s,ini,fin)
    * indice(s)

3. Relaciones lógicas:
    - \>  : mayor que
    - \>= : mayor igual que
    - <  : menor que
    - <= : menor igual que
    - == : igual
    - != : diferente

3. Estructuras básicas:
   - Asignación.

```   
    <var1> <- <operaciones>
```      
   - Entrada/Salida.

```   
      Lea <var1>, <var2>, ..., <varN>
      Escriba <var1>, <var2>, ..., <varN>
```      
   - Decisión.

```   
     si (<condicion>)
     Inicio
        <instruccion 1>
        <instruccion 2>
        .
        .
        .
        <instruccion n>                
     Fin
     sino
     Inicio
       <instruccion k+1>
       <instruccion k+2>
       .
       .
       .
       <instruccion k+n>                      
     Fin       
```      

   - Repetición.

```   
   mientras (<condicion>)
   Inicio
    <instruccion 1>
    <instruccion 2>
    .
    .
    .
    <instruccion n>                   
   Fin
```   

```
   Para (<var1> = <ini> hasta <fin>)
   Inicio
    <instruccion 1>
    <instruccion 2>
    .
    .
    .
    <instruccion n>                   
   Fin
```   
4. Plantilla o esquema de la escritura en seudocódigo.

  - Escriba un algoritmo que lea dos números enteros y
    muestre la suma de ambos.

```
Algoritmo suma_enteros
  Entero num1, num2

Inicio
  Escriba "Entre dos números enteros"
  Lea num1, num2
  suma <- num1 + num2
  Escriba "La suma de", num1, "y", num2, "es:", suma
Fin   
```

## Vectores y matrices.

 - Un vector es un arreglo de un único tipo de datos identificado
   por las posiciones de cada elemento en el arreglo.
 - Una matriz es un arreglo rectangular de cualquier tipo de datos y
   se identifica por las posiciones de fila y columna en el arreglo.

## Funciones

- Son subalgoritmos que realizan una tarea específica.
- Opcionalmente puede tener entradas, pero **siempre** deberá tener
  algun tipo de salida.
