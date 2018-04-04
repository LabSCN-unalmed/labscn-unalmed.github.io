<style type="text/css">
.small-code pre code {
   font-size: 1.1em;
}
</style>


Expresiones Regulares
========================================================
author: Kenneth Roy Cabrera Torres
date: miércoles, 04 de abril de 2018
width: 1440
height: 900


Expresiones regulares en R
========================================================

En las ayudas de R se encuentra los principios del
uso de expresiones regulares.


```
Help on topic 'regex' was found in the following packages:

  Package               Library
  stringr               /home/kenneth/R/x86_64-pc-linux-gnu-library/3.4
  base                  /usr/lib/R/library


Using the first match ...
```

Definición
========================================================
Una expresión regular (RE, siglas en inglés) es un
mecanismo que permite seleccionar una cadena o sarta
específica de otra cadena.

Existen dos definiciones: expresiones regulares básicas (BRE) y
(ERE) expresiones regulares extendidas. El R utiliza por omisión
la ERE.

Funciones asociada a ER
========================================================

Las funciones más usuales que trabajan con expresiones regulares son:
`grep`, `regexpr`, `gregexpr`, `sub`, `gsub` y `strsplit`.

Metacaracteres
========================================================

Los siguientes símbolos son utilizados como metacaracteres o
simbolos que implican significados especiales.

`. \ | ( ) [] {} ^ $ * + ?`

Su significado depende del contexto.

Algunos elementos que no son metacaracteres, pero que se
utilizan como una secuencia de "escape".

`\a` como BEL, `\e`  como ESC, `\f` como FF, `\n` como LF,
`\r` como CR and `\t` como TAB.

Ejemplo 1
========================================================
El caso más simple es encontrar una sarta o cadena específica
en una sarta.


```r
texto <- c("Nada, como tu", "Inigualable", "Incomparable")
regexpr("able",texto)
```

```
[1] -1  8  9
attr(,"match.length")
[1] -1  4  4
attr(,"useBytes")
[1] TRUE
```

Ejemplo 2
========================================================
El resultado depende de la función utilizada.


```r
texto <- c("Nada, como tu", "Inigualable", "Incomparable")
gsub("In","",texto)
```

```
[1] "Nada, como tu" "igualable"     "comparable"   
```


Uso y significado de `[]`
========================================================
Una clase de carácter es una lista de caracteres entre
corchetes `[]` el cual identifica o hace coincidir cualquier
carácter en la lista.

Ejemplo 3
========================================================


```r
texto <- c("Una sarta","2da sarta")
regexpr("[n]",texto)
```

```
[1]  2 -1
attr(,"match.length")
[1]  1 -1
attr(,"useBytes")
[1] TRUE
```

```r
regexpr("[na]",texto)
```

```
[1] 2 3
attr(,"match.length")
[1] 1 1
attr(,"useBytes")
[1] TRUE
```

Ejemplo 4
========================================================

```r
texto <- c("Una sarta","2da sarta")
gsub("[n]","",texto)
```

```
[1] "Ua sarta"  "2da sarta"
```

```r
gsub("[na]","",texto)
```

```
[1] "U srt"  "2d srt"
```

```r
sub("[na]","",texto)
```

```
[1] "Ua sarta" "2d sarta"
```

Ejemplo 5
========================================================

```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
grep("[%]",texto)
```

```
integer(0)
```

```r
grep("[%0-9]",texto)
```

```
[1] 2 3
```

```r
grep("[0-9%]",texto)
```

```
[1] 2 3
```

Ejemplo 6
========================================================

```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
grep("[U]",texto)
```

```
[1] 1
```

```r
grep("[(]",texto)
```

```
[1] 3
```

```r
grep("[U]",texto)
```

```
[1] 1
```

Ejemplo 7
========================================================
class: small-code

```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
regexpr("0-9",texto)
```

```
[1] -1 -1 -1
attr(,"match.length")
[1] -1 -1 -1
attr(,"useBytes")
[1] TRUE
```

```r
regexpr("[0-9]",texto)
```

```
[1] -1  1  2
attr(,"match.length")
[1] -1  1  1
attr(,"useBytes")
[1] TRUE
```

```r
regexpr("[^0-9]",texto)
```

```
[1] 1 2 1
attr(,"match.length")
[1] 1 1 1
attr(,"useBytes")
[1] TRUE
```

Ejemplo 8
========================================================

```r
direcciones <- c("Cra 24 Nro 15 A 38",
                 "cra 24 Nro 15 A 38",
                 "Calle 24 # 15 A 38",
                 "Kra 24 Nro 15 A 38",
                 "carrera 8B N 6B Sur 1")
regexpr("[CcKk]ra",direcciones)
```

```
[1]  1  1 -1  1 -1
attr(,"match.length")
[1]  3  3 -1  3 -1
attr(,"useBytes")
[1] TRUE
```

Ejemplo 9
========================================================

```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
gsub("[[:digit:]]","",texto)
```

```
[1] "Una sarta"  "da sarta"   "(ra) sarta"
```

```r
gsub("[[:blank:]]","",texto)
```

```
[1] "Unasarta"   "2dasarta"   "(3ra)sarta"
```

```r
gsub("[[:alpha:]]","",texto)
```

```
[1] " "    "2 "   "(3) "
```

```r
gsub("[[:alnum:]]","",texto)
```

```
[1] " "   " "   "() "
```


Ejemplo 10
========================================================

```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
gsub("[[:blank:]]","",texto)
```

```
[1] "Unasarta"   "2dasarta"   "(3ra)sarta"
```

```r
gsub("[:blank:]","",texto)
```

```
[1] "U srt"    "2d srt"   "(3r) srt"
```

```r
gsub("[[:digit:]]+[[:alpha:]]+","",texto)
```

```
[1] "Una sarta" " sarta"    "() sarta" 
```


Ejemplo 11
========================================================

```r
nomVars <- c("MO...en..mg","Temp...C","O.....m..")
gsub("\\.+",".",nomVars)
```

```
[1] "MO.en.mg" "Temp.C"   "O.m."    
```

```r
gsub("\\.+$","",nomVars)
```

```
[1] "MO...en..mg" "Temp...C"    "O.....m"    
```

Ejemplo 12
========================================================

```r
s <- c(" nada ","Nada  ","  Nada"," nADA","NADA")
gsub("^ +","",s)
```

```
[1] "nada "  "Nada  " "Nada"   "nADA"   "NADA"  
```

```r
gsub(" +$","",s)
```

```
[1] " nada"  "Nada"   "  Nada" " nADA"  "NADA"  
```

```r
gsub("^ +| +$","",s)
```

```
[1] "nada" "Nada" "Nada" "nADA" "NADA"
```

Ejemplos adicionales
========================================================

- [Ejemplos del uso de expresiones regulares](http://stat545.com/block022_regular-expression.html)
- [Segundo tutorial de expresiones regulares](http://www.endmemo.com/program/R/grep.php)
- [Uso de expresiones regulares en RStudio](https://www.r-bloggers.com/regular-expressions-in-r-vs-rstudio/)
