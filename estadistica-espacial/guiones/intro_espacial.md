# Introducción datos espaciales en R
Kenneth Roy Cabrera Torres  
11/02/2015  

# Elementos de la estructra de datos en R.


```r
# Uos del R como aparente calculadora.
pi * 10^2
```

```
## [1] 314.2
```

```r
# Operación "real" como funciones dentro de R
"*"(pi, "^"(10,2))
```

```
## [1] 314.2
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
## [1] 314.2
```

```r
# Uso explícito del método "print()".
print(x)
```

```
## [1] 314.2
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
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
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

![plot of chunk unnamed-chunk-1](intro_espacial_files/figure-html/unnamed-chunk-11.png) 

```r
plot(dist ~ qspeed, data = cars)
```

![plot of chunk unnamed-chunk-1](intro_espacial_files/figure-html/unnamed-chunk-12.png) 

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
##      -17.58         3.93
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
##          18.2           22.0           32.0           51.1
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
## Error: Geographical CRS given to non-conformant data: 370 95
```

# Subclase **SpatialPoints**

Ejemplo utilizando las coordenadas de algunos lugares en el mundo donde existe un espejo del CRAN.



```r
# Lectura a una base de datos
CRAN_bd <- read.table("CRAN051001a.txt", header = TRUE)
CRAN_mat <- cbind(CRAN_bd$long, CRAN_bd$lat)
row.names(CRAN_mat) <- 1:nrow(CRAN_mat)
str(CRAN_mat)
```

```
##  num [1:54, 1:2] 153 145 16.3 -49.3 -42.9 ...
##  - attr(*, "dimnames")=List of 2
##   ..$ : chr [1:54] "1" "2" "3" "4" ...
##   ..$ : NULL
```

```r
# Especificaciones de la clase SpatialPoints
require(sp)
getClass("SpatialPoints")
```

```
## Class "SpatialPoints" [package "sp"]
## 
## Slots:
##                                           
## Name:       coords        bbox proj4string
## Class:      matrix      matrix         CRS
## 
## Extends: "Spatial"
## 
## Known Subclasses: 
## Class "SpatialPointsDataFrame", directly
## Class "SpatialPixels", directly
## Class "SpatialPixelsDataFrame", by class "SpatialPixels", distance 2
```

```r
# Construcción de la clase de tipos espaciales
sistema_proj <- CRS("+proj=longlat +ellps=WGS84")
CRAN_sp <- SpatialPoints(CRAN_mat, proj4string = sistema_proj)
# Resumen
summary(CRAN_sp)
```

```
## Object of class SpatialPoints
## Coordinates:
##               min    max
## coords.x1 -122.95 153.03
## coords.x2  -37.82  57.05
## Is projected: FALSE 
## proj4string : [+proj=longlat +ellps=WGS84]
## Number of points: 54
```

## Algunos métodos asociados.

### Información principal

```r
# Extracción de la información de las coordenadas.
bbox(CRAN_sp)
```

```
##               min    max
## coords.x1 -122.95 153.03
## coords.x2  -37.82  57.05
```

```r
# Extracción de la información de de la proyección.
proj4string(CRAN_sp)
```

```
## [1] "+proj=longlat +ellps=WGS84"
```

### Subconjunto de datos

```r
# Índices del subconjunto
brazil <- which(CRAN_bd$loc == "Brazil")
brazil
```

```
## [1] 4 5 6 7 8
```

```r
# Coordenadas de esos índices
coordinates(CRAN_sp)[brazil, ]
```

```
##   coords.x1 coords.x2
## 4    -49.27    -25.42
## 5    -42.87    -20.75
## 6    -43.20    -22.90
## 7    -47.63    -22.72
## 8    -46.63    -23.53
```

```r
# Si se extrae un subconjunto, el recalcula el marco que contiene los puntos.
summary(CRAN_sp[brazil, ])
```

```
## Object of class SpatialPoints
## Coordinates:
##              min    max
## coords.x1 -49.27 -42.87
## coords.x2 -25.42 -20.75
## Is projected: FALSE 
## proj4string : [+proj=longlat +ellps=WGS84]
## Number of points: 5
```

```r
# Se puede hacer todo el procedimiento en una sola línea:
summary(CRAN_sp[CRAN_bd$loc == "Brazil", ])
```

```
## Object of class SpatialPoints
## Coordinates:
##              min    max
## coords.x1 -49.27 -42.87
## coords.x2 -25.42 -20.75
## Is projected: FALSE 
## proj4string : [+proj=longlat +ellps=WGS84]
## Number of points: 5
```


