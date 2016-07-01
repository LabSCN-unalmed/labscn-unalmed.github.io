---
layout: clase
title: 'Procesamiento en paralelo con R'
curso: 'programacion-R'
clase: 14
custom_js: 'mathjax'
---


```r
library(parallel)

num_nucl <- detectCores()

lapply(2:4, function(expo) 2^expo)
```

```
## [[1]]
## [1] 4
##
## [[2]]
## [1] 8
##
## [[3]]
## [1] 16
```

```r
cl <- makeCluster(num_nucl)
parLapply(cl, 2:4, function(expo) 2^expo)
```

```
## [[1]]
## [1] 4
##
## [[2]]
## [1] 8
##
## [[3]]
## [1] 16
```

```r
stopCluster(cl)

f1 <- function(expo) mean(2 ^ expo)
```


```r
n <- 300000
replicas <- 10

lista1 <- replicate(replicas, rnorm(n), simplify = FALSE)
```



```r
r1 <- lapply(lista1, f1)

require(microbenchmark)
```

```
## Loading required package: microbenchmark
```

```r
microbenchmark(lapply(lista1, f1))
```

```
## Unit: milliseconds
##                expr      min       lq     mean   median       uq      max
##  lapply(lista1, f1) 269.7519 271.5816 273.9633 272.0311 272.9677 308.8619
##  neval
##    100
```


```r
cl <- makeCluster(num_nucl)
r2 <- parLapply(cl, lista1, f1)
stopCluster(cl)


require(microbenchmark)
cl <- makeCluster(num_nucl)
microbenchmark(parLapply(cl, lista1, f1))
```

```
## Unit: milliseconds
##                       expr      min       lq     mean   median      uq
##  parLapply(cl, lista1, f1) 136.3514 157.6061 168.4288 161.3579 184.378
##       max neval
##  238.1791   100
```

```r
stopCluster(cl)
```



```r
require(doParallel)
```

```
## Loading required package: doParallel
```

```
## Loading required package: foreach
```

```
## Loading required package: iterators
```

```r
num_nucl <- detectCores()
cl <- makeCluster(num_nucl)
registerDoParallel(cl)
r3 <- foreach(i = 1:length(lista1)) %dopar% f1(lista1[[i]])
stopCluster(cl)


require(microbenchmark)
num_nucl <- detectCores()
cl <- makeCluster(num_nucl)
registerDoParallel(cl)
microbenchmark(foreach(i = 1:length(lista1), .combine = c) %dopar% f1(lista1[[i]]))
```

```
## Unit: milliseconds
##                                                                 expr
##  foreach(i = 1:length(lista1), .combine = c) %dopar% f1(lista1[[i]])
##       min       lq     mean   median       uq      max neval
##  304.9762 309.5383 316.0415 312.1521 313.9834 621.2772   100
```

```r
stopCluster(cl)
```
