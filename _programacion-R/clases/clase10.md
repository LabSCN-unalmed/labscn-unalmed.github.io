---
layout: clase
title: 'Expresiones regulares'
curso: 'programacion-R'
clase: 10
custom_js: 'mathjax'
---

## Definición

Una expresión regular (RE, siglas en inglés) es un
mecanismo que permite seleccionar una cadena o sarta
específica de otra cadena.

Existen dos definiciones: expresiones regulares básicas (BRE) y
(ERE) expresiones regulares extendidas. El R utiliza por omisión
la ERE.

## Funciones asociada a ER

Las funciones más usuales que trabajan con expresiones regulares son:
`grep`, `regexpr`, `gregexpr`, `sub`, `gsub` y `strsplit`.

## Metacaracteres

Los siguientes símbolos son utilizados como metacaracteres o
simbolos que implican significados especiales.

`. \ | ( ) [] {} ^ $ * + ?`

Su significado depende del contexto.

Algunos elementos que no son metacaracteres, pero que se
utilizan como una secuencia de "escape".

`\a` como BEL, `\e`  como ESC, `\f` como FF, `\n` como LF,
`\r` como CR and `\t` como TAB.

## Ejemplos

El caso más simple es encontrar una sarta o cadena específica
en una sarta.


```r
texto <- c("Nada, como tu", "Inigualable", "Incomparable")
regexpr("able",texto)
```

El resultado depende de la función utilizada.


```r
texto <- c("Nada, como tu", "Inigualable", "Incomparable")
gsub("In","",texto)
```

## Uso y significado de `[]`

Una clase de carácter es una lista de caracteres entre
corchetes `[]` el cual identifica o hace coincidir cualquier
carácter en la lista.

```r
texto <- c("Una sarta","2da sarta")
regexpr("[n]",texto)
regexpr("[na]",texto)
```

```r
texto <- c("Una sarta","2da sarta")
gsub("[n]","",texto)
gsub("[na]","",texto)
sub("[na]","",texto)
```


```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
grep("[%]",texto)
grep("[%0-9]",texto)
grep("[0-9%]",texto)
```


```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
grep("[U]",texto)
grep("[(]",texto)
grep("[U]",texto)
```


```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
regexpr("0-9",texto)
regexpr("[0-9]",texto)
regexpr("[^0-9]",texto)
```

```r
direcciones <- c("Cra 24 Nro 15 A 38",
                 "cra 24 Nro 15 A 38",
                 "Calle 24 # 15 A 38",
                 "Kra 24 Nro 15 A 38",
                 "carrera 8B N 6B Sur 1")
regexpr("[CcKk]ra",direcciones)
```

```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
gsub("[[:digit:]]","",texto)
gsub("[[:blank:]]","",texto)
gsub("[[:alpha:]]","",texto)
gsub("[[:alnum:]]","",texto)
```


```r
texto <- c("Una sarta","2da sarta","(3ra) sarta")
gsub("[[:blank:]]","",texto)
gsub("[:blank:]","",texto)
gsub("[[:digit:]]+[[:alpha:]]+","",texto)
```

```r
nomVars <- c("MO...en..mg","Temp...C","O.....m..")
gsub("\\.+",".",nomVars)
gsub("\\.+$","",nomVars)
```

```r
s <- c(" nada ","Nada  ","  Nada"," nADA","NADA")
gsub("^ +","",s)
gsub(" +$","",s)
gsub("^ +| +$","",s)
```
