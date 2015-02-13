# Datos Espaciales en R
Kenneth Roy Cabrera Torres  
11/02/2015  

# Tipo `SpatialPoints`

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
```

```
## Loading required package: sp
```

```r
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
##                  min      max
## coords.x1 -122.95000 153.0333
## coords.x2  -37.81667  57.0500
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
##                  min      max
## coords.x1 -122.95000 153.0333
## coords.x2  -37.81667  57.0500
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
## 4 -49.26667 -25.41667
## 5 -42.86667 -20.75000
## 6 -43.20000 -22.90000
## 7 -47.63333 -22.71667
## 8 -46.63333 -23.53333
```

```r
# Si se extrae un subconjunto, el recalcula el marco que contiene los puntos.
summary(CRAN_sp[brazil, ])
```

```
## Object of class SpatialPoints
## Coordinates:
##                 min       max
## coords.x1 -49.26667 -42.86667
## coords.x2 -25.41667 -20.75000
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
##                 min       max
## coords.x1 -49.26667 -42.86667
## coords.x2 -25.41667 -20.75000
## Is projected: FALSE 
## proj4string : [+proj=longlat +ellps=WGS84]
## Number of points: 5
```

## Datos de puntos con una base de datos asociada.


```r
# Construcción de una base de puntos con base de datos asociada.
CRAN_spbd1 <- SpatialPointsDataFrame(CRAN_mat, CRAN_bd,
              proj4string = sistema_proj, match.ID = TRUE)

# La base de datos nueva se maneja muy similar a un "data.frame" estándar
CRAN_spbd1[4, ]
```

```
##              coordinates    place   north    east    loc      long
## 4 (-49.26667, -25.41667) Curitiba 25d25'S 49d16'W Brazil -49.26667
##         lat
## 4 -25.41667
```

```r
str(CRAN_spbd1$loc)
```

```
##  Factor w/ 30 levels "Australia","Austria",..: 1 1 2 3 3 3 3 3 4 19 ...
```

```r
str(CRAN_spbd1[["loc"]])    
```

```
##  Factor w/ 30 levels "Australia","Austria",..: 1 1 2 3 3 3 3 3 4 19 ...
```

```r
# Aún si la base de datos no está en el mismo orden de las coordenadas,
# pero los nombres de las filas de cada caso son coincidentes,
# el sistema armará la base de datos consistentemente.

# Base de datos en otro orden
nuevo_ord <- sample(nrow(CRAN_bd))
nuevaCRAN_bd <- CRAN_bd[nuevo_ord, ]
CRAN_spbd2 <- SpatialPointsDataFrame(CRAN_mat, nuevaCRAN_bd,
               proj4string = sistema_proj, match.ID = TRUE)

# Son la bases de datos iguales?
all.equal(CRAN_spbd2, CRAN_spbd1)
```

```
## [1] TRUE
```

```r
CRAN_spbd2[4, ]
```

```
##              coordinates    place   north    east    loc      long
## 4 (-49.26667, -25.41667) Curitiba 25d25'S 49d16'W Brazil -49.26667
##         lat
## 4 -25.41667
```

## Estructura jerárquica de `SpatialPointsDataFrame`

![alt text](figuras/estrucSpatialPointsDataFrame.png)


```r
# Características de la subclase
getClass("SpatialPointsDataFrame")
```

```
## Class "SpatialPointsDataFrame" [package "sp"]
## 
## Slots:
##                                                                   
## Name:         data  coords.nrs      coords        bbox proj4string
## Class:  data.frame     numeric      matrix      matrix         CRS
## 
## Extends: 
## Class "SpatialPoints", directly
## Class "Spatial", by class "SpatialPoints", distance 2
## 
## Known Subclasses: 
## Class "SpatialPixelsDataFrame", directly, with explicit coerce
```

Todas las subclases que tienen el sufijo *DataFrame* están
diseñadas para que se usen casi como los *data.frame* estándar.



```r
# Nombres
names(CRAN_spbd1)
```

```
## [1] "place" "north" "east"  "loc"   "long"  "lat"
```

```r
# Estructura para modelación
str(model.frame(lat ~ long, data = CRAN_spbd1), give.attr = FALSE)
```

```
## 'data.frame':	54 obs. of  2 variables:
##  $ lat : num  -27.5 -37.8 48.2 -25.4 -20.8 ...
##  $ long: num  153 145 16.3 -49.3 -42.9 ...
```

## Otras forma de construir una estrucutra de puntos con una base de datos asociada


```r
# Si ambas bases están ordenadas, no necesitamos que las identidades de los puntos coincidan.

CRAN_bd1 <- CRAN_bd
row.names(CRAN_bd1) <- sample(c(outer(letters, letters,
                                      paste, sep = "")), nrow(CRAN_bd1))
CRAN_spbd3 <- SpatialPointsDataFrame(CRAN_mat, CRAN_bd1,
              proj4string = sistema_proj, match.ID = FALSE)
# No coinciden exactamente
all.equal(CRAN_spbd3, CRAN_spbd1)
```

```
## [1] "Attributes: < Component \"coords\": Attributes: < Component \"dimnames\": Component 1: 54 string mismatches > >"     
## [2] "Attributes: < Component \"data\": Attributes: < Component \"row.names\": Modes: character, numeric > >"              
## [3] "Attributes: < Component \"data\": Attributes: < Component \"row.names\": target is character, current is numeric > >"
```

```r
# Pero la información está construida de manera similar.
CRAN_spbd1[4, ]
```

```
##              coordinates    place   north    east    loc      long
## 4 (-49.26667, -25.41667) Curitiba 25d25'S 49d16'W Brazil -49.26667
##         lat
## 4 -25.41667
```

```r
CRAN_spbd3[4, ]
```

```
##               coordinates    place   north    east    loc      long
## jv (-49.26667, -25.41667) Curitiba 25d25'S 49d16'W Brazil -49.26667
##          lat
## jv -25.41667
```

```r
# Sin embargo se genera un erros si intentamos utilizar "match.ID", y los identificadores no coinciden.
CRAN_spbd3x <- SpatialPointsDataFrame(CRAN_mat, CRAN_bd1,
              proj4string = sistema_proj, match.ID = TRUE)
```

```
## Error in SpatialPointsDataFrame(CRAN_mat, CRAN_bd1, proj4string = sistema_proj, : row.names of data and coords do not match
```


              


# Tipo `SpatialLines`

# Tipo `SpatialPolygons`

# Tipo `SpatialGrid`

# Tipo `Raster` del paquete **raster** 
