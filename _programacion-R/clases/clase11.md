---
layout: clase
title: 'Fecha y tiempo'
curso: 'programacion-R'
clase: 11
custom_js: 'mathjax'
---

Las fechas y los tiempos en R siguen la reglas POSIX.

Internamente las fechas se guardan como enteros tomando como referencia
1 de Enero de 1070.

Las funciones para trabajar con fechas en R son `as.Date` y
para tiempo se utilizan `as.POSIXct` y `as. POSIXlt`.

## Convertir a fechas.

```r
as.Date('1915-6-16')
```

```
## [1] "1915-06-16"
```

```r
as.Date('1990/02/17')
```

```
## [1] "1990-02-17"
```

```r
as.integer(as.Date('1915-6-16'))
```

```
## [1] -19923
```

```r
as.integer(as.Date('1990/02/17'))
```

```
## [1] 7352
```

```r
# Fecha de hoy
Sys.Date()
```

```
## [1] "2017-09-29"
```



## Con formato

|Código|Valor|
|:----|:----|
|%d | Dia del mes (entero)|
|%m | Mes (entero)|
|%b | Nombre del mes (abreviado)|
|%B | Nombre del mes (completo)|
|%y | Año (2 dígitos)|
|%Y | Año (4 dígitos)|

Ver `help(strptime)`.


```r
as.Date('1/15/2001', format = '%m/%d/%Y')
```

```
## [1] "2001-01-15"
```

```r
as.Date('Abril 26, 2001', format = '%B %d, %Y')
```

```
## [1] "2001-04-26"
```

```r
as.Date('22JUN01', format = '%d%b%y')  
```

```
## [1] "2001-06-22"
```

## Identificación de características

```r
fechasNac <- c(tukey   = as.Date('1915-06-16'),
               fisher  = as.Date('1890-02-17'),
               cramer  = as.Date('1893-09-25'),
               kendall = as.Date('1907-09-06'))
weekdays(fechasNac)
```

```
##       tukey      fisher      cramer     kendall
## "miércoles"     "lunes"     "lunes"   "viernes"
```

## Con POSIX.

```r
fechas <- c("2005-10-21 18:47:22",
            "2005-12-24 16:39:58",
            "2005-10-28 07:30:05")
 as.POSIXlt(fechas)
```

```
## [1] "2005-10-21 18:47:22 COT" "2005-12-24 16:39:58 COT"
## [3] "2005-10-28 07:30:05 COT"
```

## Uso del `strptime()`


```r
fecha1 <- strptime('16/Oct/2005:07:51:00', format = '%d/%b/%Y:%H:%M:%S')
fecha1
```

```
## [1] "2005-10-16 07:51:00 COT"
```

```r
fecha2 <- strptime('16/Oct/2005:07:51:00', format = '%d/%b/%Y:%H:%M:%S', tz = "GMT")
fecha2
```

```
## [1] "2005-10-16 07:51:00 GMT"
```

```r
fecha3 <- ISOdate(2005, 10, 21, 18, 47, 22, tz = "VEN")
fecha3
```

```
## [1] "2005-10-21 18:47:22 VEN"
```

```r
format(fecha3,'%A, %B %d, %Y %H:%M:%S')
```

```
## [1] "viernes, octubre 21, 2005 18:47:22"
```


## Con el paquete `lubridate`


```r
library(lubridate)
```

```
##
## Attaching package: 'lubridate'
```

```
## The following object is masked from 'package:base':
##
##     date
```

```r
ymd("20110604")
```

```
## [1] "2011-06-04"
```

```r
ymd("2011-06-04")
```

```
## [1] "2011-06-04"
```

```r
mdy("06-04-2011")
```

```
## [1] "2011-06-04"
```

```r
dmy("04/06/2011")
```

```
## [1] "2011-06-04"
```


```r
llegada1 <- ymd_hms("2011-06-04 12:00:00", tz = "America/Bogota")
llegada1
```

```
## [1] "2011-06-04 12:00:00 COT"
```

```r
llegada2 <- ymd_hms("2011-06-04 12:00:00", tz = "Pacific/Auckland")
llegada2
```

```
## [1] "2011-06-04 12:00:00 NZST"
```

```r
llegada1-llegada2
```

```
## Time difference of 17 hours
```

### Extracción de información

Se utilizan las funciones `second, minute, hour, day, wday, yday, week, month, year,` y `tz`.


```r
second(llegada2)
```

```
## [1] 0
```

```r
second(llegada2) <- 25
llegada2
```

```
## [1] "2011-06-04 12:00:25 NZST"
```

```r
second(llegada2) <- 0

wday(llegada2)
```

```
## [1] 7
```

```r
wday(llegada2, label = TRUE)
```

```
## [1] Sat
## Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat
```
