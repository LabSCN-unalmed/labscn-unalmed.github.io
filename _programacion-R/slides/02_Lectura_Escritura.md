Lectura/Escritura en R
========================================================
author: Kenneth Cabrera
date: 22 octubre, 2015
transition: rotate
width: 1440
height: 900



Modos de texto I
========================================================
- `dumping` y `dputing` son útiles porque el archivo que resulta es en
   un formato que se puede corregir, y en caso de que el archivo se
   degrade, potencialmente se puede recuperar.
- A diferencia de escribir los resultados en una tabla o en un formato
  `csv`, `dump` y `dput` mantiene la información de `metadatos` 
  (sacrificando algo de legibilidad), de tal manera que otro usuario no 
  tendría que reconstruir el objeto de nuevo.

Modos de texto II
========================================================
- Los modos de texto funcionan mejor para interactuar con programas que
  llevan el seguimiento de cambios de archivo tipo texto.
- Este modo sigue la "filosofía linux" en lo que respecta a archivos.
- Desventaja: No es eficiente en el uso del espacio.

Ejemplo I
========================================================
```
y <- data.frame(a = 1:6, b = letters[1:6])
y
dput(y)
dput(y, file = "y.R")
nuevo.y <- dget("y.R")
nuevo.y
```

Ejemplo II
========================================================
```
x <- "foo"
y <- data.frame(a = 6:1, b = letters[6:1])
dump(c("x", "y"), file = "datos.R")
rm(x, y)
source("datos.R")
y
x
```

Interfaces al mundo exterior
========================================================
- `file`, abre una conexión a algún archivo.
- `gzfile`, abre una conexión a un archivo comprimido con gzip.
- `bzfile`, abre una conexión a un archivo comprimido con bzip2.
- `url`, abre una conexión a una página web.

Conexión tipo "file"
========================================================
```
str(file)
```
- `description` es el nombre del archivo.
- `open` es un código que indica
   * `r` solo lectura.
   * `w` escritura (inicia un nuevo archivo).
   * `a` adición a un archivo.
   * `rb`, `rb`, `ab`, lectura, escritura y adición en modo binario
     (únicamente en `windows`)
     
Conexiones
========================================================
```
con <- file("foo.txt", "r")
datos <- read.csv(con)
close(con)
```

equivale a:
```
datos <- read.csv("foo.txt")
```

Lectura de página web.
========================================================

```r
urlbTRM <- readLines("url_banrep_trm.txt")
urlbTRM
```

```
[1] "http://obiee.banrep.gov.co/analytics/saw.dll?Go&NQUser=publico&NQPassword=publico&Path=/shared/Consulta%20Series%20Estadisticas%20desde%20Excel/1.%20Tasa%20de%20Cambio%20Peso%20Colombiano/1.1%20TRM%20-%20Disponible%20desde%20el%2027%20de%20noviembre%20de%201991/1.1.1%20Serie%20historica&Options=rdf"
```

```r
con <- url(urlbTRM, "r")
x <- readLines(con)
close(con)
```

```
head(x, 200)
tail(x, 200)
```


Recuperar el valor de la TRM desde enero 1 hasta hoy
========================================================

```r
require(stringr)
fechas <- str_extract(x, "[0-9]{2}/[0-9]{2}/[0-9]{4}")
valores <- str_extract(x, "[0-9][,][0-9]{3}\\.[0-9]{2}")
fechas <- fechas[!is.na(fechas)]
fechas <- as.POSIXct(strptime(fechas, format = "%d/%m/%Y"))
valores <- valores[!is.na(valores)]
valores <- as.numeric(str_replace(valores, "[,]",""))
trm <- data.frame(fechas, valores)
```

```
head(trm)
```


Gráfica de la TRM hasta hoy I
========================================================
Con graficación básica

```r
plot(trm, type = "l")
```

![plot of chunk unnamed-chunk-3](02_Lectura_Escritura-figure/unnamed-chunk-3-1.png) 

Gráfica de la TRM hasta hoy II
========================================================
Con lattice

```r
require(lattice)
xyplot(valores ~ fechas, data = trm, type = "l")
```

![plot of chunk unnamed-chunk-4](02_Lectura_Escritura-figure/unnamed-chunk-4-1.png) 

Gráfica de la TRM hasta hoy III
========================================================
Con ggplot2

```r
require(ggplot2)
g1 <- ggplot(trm, aes(fechas, valores)) + geom_line()
g1
```

![plot of chunk unnamed-chunk-5](02_Lectura_Escritura-figure/unnamed-chunk-5-1.png) 

