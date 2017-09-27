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

También paquetes como el `stringr` o el `stringi`.

## Metacaracteres

Los siguientes símbolos son utilizados como metacaracteres o
simbolos que implican significados especiales.

`. \ | ( ) [] {} ^ $ * + ?`

Cuantificadores:

- `*`: al menos 0 veces.
- `+`: al menos 1 vez.
- `?`: a lo sumo una vez.
- `{n}`: exactamente `n` veces.
- `{n,}`: al menos `n` veces.
- `{n,m}`: entre `n` y `m` veces.  

Posición en la sarta o cadena:

- `^`: al inicio de la sarta.
- `$`: al finalizar la sarta.
- `\b`: una sarta en blanco al borde de una palabra.
        No se confunda con `^ $` que sería los bordes de una sarta.
- `\B`: una sarta vacía dado que no es el borde de una palabra.


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

- `[:digit:]` or \d: digitos, 0 1 2 3 4 5 6 7 8 9, equivalente a [0-9].
\D: no digitos, equivalente a [^0-9].
- `[:lower:]`: minúsculas, equivalente a [a-z].
- `[:upper:]`: mayúsculas, equivalente a [A-Z].
- `[:alpha:]`: símbolos alfabéticos, equivalente a [[:lower:][:upper:]] o [A-z].
- `[:alnum:]`: símbolos alfanuméricos, equivalente a [[:alpha:][:digit:]] o [A-z0-9].
- `\w`: palabra de letras, equivalente a `[[:alnum:]_]` o `[A-z0-9_]`.
- `\W`: no una palabra, equivalente a [^A-z0-9_].
- `[:xdigit:]`: digitos hexadecimales  (base 16), 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f, equivalente a [0-9A-Fa-f].
- `[:blank:]`: símbolos en blanco, i.e. espacios y tabuladores.
- `[:space:]`: símbolos de espacios: tab, newline, vertical tab, form feed, carriage return, space.
- `\s`: espacios, ` `.
- `\S`: no espacio.
- `[:punct:]`: símbolos de puntuación, `! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [  ] ^ _  { | } ~`.
- `[:graph:]`: símbolos legibles por humanos: equivalente a `[[:alnum:][:punct:]]`.
- `[:print:]`: símbolos imprimibles, equivalente a [[:alnum:][:punct:]\\s].
- `[:cntrl:]`: símbolos de control, como \n o \r, [\x00-\x1F\x7F].


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
