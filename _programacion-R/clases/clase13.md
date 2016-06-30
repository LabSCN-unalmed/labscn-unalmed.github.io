---
layout: clase
title: 'Sartas en R usando `stringr`'
curso: 'programacion-R'
clase: 13
custom_js: 'mathjax'
---

[Un sito](http://www.regular-expressions.info/reference.html)
para ampliar el uso de las expresiones regulares.

[Sitio](http://regexr.com/) para ensayar los patrones de las
expresiones regulares.



```r
require(stringr)
```

```
## Loading required package: stringr
```

## Operaciones básicas

 - `str_c()`  equivalente a `paste()`.
 - `str_length()` equivalente a `nchar()`.
 - `str_sub()` equivalente a `substr()`.
 - `str_str<-` equivalente a `substr()` pero acepta ínidices negativos.
 - `str_dup()` duplica carateres en una sarta.
 - `str_trim()` quita los espacios en blanco al inicio y al final.
 - 'str_pad()` acomoda una sarta con espacios extra a la izquierda o derecha,
               o a ambos lados.


```r
rbind(
  str_pad("Roy", 30, "left"),
  str_pad("Roy", 30, "right"),
  str_pad("Roy", 30, "both")
)
```

```
##      [,1]                            
## [1,] "                           Roy"
## [2,] "Roy                           "
## [3,] "             Roy              "
```

## Operaciones con patrones de sartas.

Las operaciones más usuales son
 `detect, locate, extract, match, replace,` y `split`.


```r
sartas <- c(
  "mango",
  "219 733 8965",
  "329-293-8753",
  "Trabajo: 579-499-7527; Residencia: 543.355.3679"
)
patron_tel <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"

str_detect(sartas, patron_tel)
```

```
## [1] FALSE  TRUE  TRUE  TRUE
```

```r
str_subset(sartas, patron_tel)
```

```
## [1] "219 733 8965"                                   
## [2] "329-293-8753"                                   
## [3] "Trabajo: 579-499-7527; Residencia: 543.355.3679"
```

```r
str_locate(sartas, patron_tel)
```

```
##      start end
## [1,]    NA  NA
## [2,]     1  12
## [3,]     1  12
## [4,]    10  21
```

```r
str_locate_all(sartas, patron_tel)
```

```
## [[1]]
##      start end
##
## [[2]]
##      start end
## [1,]     1  12
##
## [[3]]
##      start end
## [1,]     1  12
##
## [[4]]
##      start end
## [1,]    10  21
## [2,]    36  47
```

```r
str_extract(sartas, patron_tel)
```

```
## [1] NA             "219 733 8965" "329-293-8753" "579-499-7527"
```

```r
str_extract_all(sartas, patron_tel)
```

```
## [[1]]
## character(0)
##
## [[2]]
## [1] "219 733 8965"
##
## [[3]]
## [1] "329-293-8753"
##
## [[4]]
## [1] "579-499-7527" "543.355.3679"
```

```r
str_match(sartas, patron_tel)
```

```
##      [,1]           [,2]  [,3]  [,4]  
## [1,] NA             NA    NA    NA    
## [2,] "219 733 8965" "219" "733" "8965"
## [3,] "329-293-8753" "329" "293" "8753"
## [4,] "579-499-7527" "579" "499" "7527"
```

```r
str_match_all(sartas, patron_tel)
```

```
## [[1]]
##      [,1] [,2] [,3] [,4]
##
## [[2]]
##      [,1]           [,2]  [,3]  [,4]  
## [1,] "219 733 8965" "219" "733" "8965"
##
## [[3]]
##      [,1]           [,2]  [,3]  [,4]  
## [1,] "329-293-8753" "329" "293" "8753"
##
## [[4]]
##      [,1]           [,2]  [,3]  [,4]  
## [1,] "579-499-7527" "579" "499" "7527"
## [2,] "543.355.3679" "543" "355" "3679"
```

```r
str_replace(sartas, patron_tel, "XXX-XXX-XXXX")
```

```
## [1] "mango"                                          
## [2] "XXX-XXX-XXXX"                                   
## [3] "XXX-XXX-XXXX"                                   
## [4] "Trabajo: XXX-XXX-XXXX; Residencia: 543.355.3679"
```

```r
str_replace_all(sartas, patron_tel, "XXX-XXX-XXXX")
```

```
## [1] "mango"                                          
## [2] "XXX-XXX-XXXX"                                   
## [3] "XXX-XXX-XXXX"                                   
## [4] "Trabajo: XXX-XXX-XXXX; Residencia: XXX-XXX-XXXX"
```

```r
str_split(sartas, "-")
```

```
## [[1]]
## [1] "mango"
##
## [[2]]
## [1] "219 733 8965"
##
## [[3]]
## [1] "329"  "293"  "8753"
##
## [[4]]
## [1] "Trabajo: 579"                   "499"                           
## [3] "7527; Residencia: 543.355.3679"
```
