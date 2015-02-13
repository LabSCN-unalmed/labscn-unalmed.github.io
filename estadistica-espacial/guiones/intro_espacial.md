# Introducción datos espaciales en R
Kenneth Roy Cabrera Torres  
11/02/2015  

# Elementos de la estructra de datos en R.


```r
# Uos del R como aparente calculadora.
pi * 10^2
```

```
## [1] 314.1593
```

```r
# Operación "real" como funciones dentro de R
"*"(pi, "^"(10,2))
```

```
## [1] 314.1593
```

```r
# Asignación de un resultado. 
# Realmente "x" es un objeto.
# Un objeto tiene datos y métodos.
x <- pi*10^2

# Uso implícito del método "print()".
x
```

```
## [1] 314.1593
```

```r
# Uso explícito del método "print()".
print(x)
```

```
## [1] 314.1593
```

```r
# Uso explícito del método "print()", con parámetros adicionales.
print(x, digits=12)
```

```
## [1] 314.159265359
```

```r
# Identificación de la clase de objeto.
class(x)
```

```
## [1] "numeric"
```

```r
# Identificación del tipo de objeto.
typeof(x)
```

```
## [1] "double"
```

```r
# Ejemplo de la clase "data.frame" (no espacial).
data(cars)
# Clase
class(cars)
```

```
## [1] "data.frame"
```

```r
# Tipo
typeof(cars)
```

```
## [1] "list"
```

```r
# Atributo mediante el método "names()"
names(cars)
```

```
## [1] "speed" "dist"
```

```r
# Método
summary(cars)
```

```
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
```

```r
# Muestra la estrucutra del objeto. "La función más útil de R"
str(cars)
```

```
## 'data.frame':	50 obs. of  2 variables:
##  $ speed: num  4 4 7 7 8 9 10 10 10 11 ...
##  $ dist : num  2 10 4 22 16 10 18 26 34 17 ...
```

```r
# Otra clase usada en modelación en R.
class(dist ~ speed)
```

```
## [1] "formula"
```

```r
# Ejemplo de la diferencia en los tipos de objetos,
# en particular de la clase "factor".
cars$qspeed <- with(cars, cut(speed, breaks = quantile(speed), include.lowest = TRUE))
is.factor(cars$qspeed)
```

```
## [1] TRUE
```

```r
# Respuesta diferente del objeto "formula" de acuerdo a la clase de datos.
plot(dist ~ speed, data = cars)
```

![](intro_espacial_files/figure-html/unnamed-chunk-1-1.png) 

```r
plot(dist ~ qspeed, data = cars)
```

![](intro_espacial_files/figure-html/unnamed-chunk-1-2.png) 

```r
# Ejemplo de la diferencia en la modelación de acuerdo al tipo de objeto
lm(dist ~  speed, data = cars)
```

```
## 
## Call:
## lm(formula = dist ~ speed, data = cars)
## 
## Coefficients:
## (Intercept)        speed  
##     -17.579        3.932
```

```r
lm(dist ~ qspeed, data = cars)
```

```
## 
## Call:
## lm(formula = dist ~ qspeed, data = cars)
## 
## Coefficients:
##   (Intercept)  qspeed(12,15]  qspeed(15,19]  qspeed(19,25]  
##         18.20          21.98          31.97          51.13
```

# La clase **Spatial** del paquete **sp**

Clase "Spatial":

Dos slots:

1. Matriz con coordenadas del marco (box) que contiene la información
de el rectángulo que tiene los datos espaciales.
Esta matriz numérica tiene: 

  - Dos columnas: mínimo ("min") y máximo ("max").
  - Dos filas:
     * La primera fila que se refiere a las coordenada este (eje x).
     * la segunda fila a las coordenadas norte (eje y).

2. Un objeto de la clase CRS (Coordinate Reference System) que indica el tipo de referencia espacial de los datos. Es decir el sitema de coordenadas sobre
la cual están los datos.


```r
# Carga el paquete "sp"
require(sp)
```

```
## Loading required package: sp
```

```r
# Muestra las características de la clase "Spatial"
getClass("Spatial")
```

```
## Class "Spatial" [package "sp"]
## 
## Slots:
##                               
## Name:         bbox proj4string
## Class:      matrix         CRS
## 
## Known Subclasses: 
## Class "SpatialPoints", directly
## Class "SpatialGrid", directly
## Class "SpatialLines", directly
## Class "SpatialPolygons", directly
## Class "SpatialPointsDataFrame", by class "SpatialPoints", distance 2
## Class "SpatialPixels", by class "SpatialPoints", distance 2
## Class "SpatialGridDataFrame", by class "SpatialGrid", distance 2
## Class "SpatialLinesDataFrame", by class "SpatialLines", distance 2
## Class "SpatialPixelsDataFrame", by class "SpatialPoints", distance 3
## Class "SpatialPolygonsDataFrame", by class "SpatialPolygons", distance 2
```

```r
# El objeto "CRS", más de cerca. 
getClass("CRS")
```

```
## Class "CRS" [package "sp"]
## 
## Slots:
##                 
## Name:   projargs
## Class: character
```

# Construcción de un ejemplo simple del objeto "Spatial"

La proyección CRS sigue el formato de PROJ.4, que se ha convertido en un estándar para respresentar proyecciones terrestres.


```r
require(sp)

m <- matrix(c(0, 0, 1, 1), ncol = 2,
            dimnames = list(NULL, c("min", "max")))
m
```

```
##      min max
## [1,]   0   1
## [2,]   0   1
```

```r
crs <- CRS(projargs = as.character(NA))
crs
```

```
## CRS arguments: NA
```

```r
S <- Spatial(bbox = m, proj4string = crs)
S
```

```
## An object of class "Spatial"
## Slot "bbox":
##      min max
## [1,]   0   1
## [2,]   0   1
## 
## Slot "proj4string":
## CRS arguments: NA
```

### Ejemplo de una proyección mal especificada.


```r
bb <- matrix(c(350, 85, 370, 95), ncol = 2, dimnames = list(NULL, c("min","max")))
Spatial(bb, proj4string = CRS("+proj=longlat"))
```

```
## Error in validityMethod(object): Geographical CRS given to non-conformant data: 370  95
```


