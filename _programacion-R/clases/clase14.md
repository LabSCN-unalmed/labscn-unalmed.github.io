---
layout: clase
title: 'Procesamiento en paralelo con R'
curso: 'programacion-R'
clase: 14
custom_js: 'mathjax'
---


La biblioteca *"parallel"* es una biblioteca que viene con el sistema básico
del R.


La forma más simple de paralelizar un proceso es utilizando la función
*mclapply()*.

Supongamos que hacer una simulación para establecer la distribución del $$R^2$$
cuando el tamaño de muestra es pequeña de una regresión lineal simple.


## Problema básico.

```{r}
pendiente <- 1
intercepto <- 2
s <- 1

numsim <- 10000
valores_de_x <- 1:5
x <- rep(valores_de_x, numsim)
y <- intercepto + pendiente * x + rnorm(n = length(x), sd = s)
simulacion <- rep(1:numsim, each = length(valores_de_x))

datos <- data.frame(x, y, simulacion)
```

```{r}
lista_datos <- split(datos[, c("x", "y")], datos$simulacion)
```

## Función a paralelizar.

```{r}
calcula_R2 <- function(base_datos){
  modelo <- lm(y ~ x, data = base_datos)
  R2 <- summary(modelo)$r.squared
  return(R2)
}
```

```{r}
r1 <- calcula_R2(lista_datos[[1]])
r1
```

## Forma en ciclo.

```{r}
R2s <- numeric()
ini <- Sys.time()
for (i in 1:length(lista_datos)){
  R2 <- calcula_R2(lista_datos[[i]])
  R2s <- c(R2, R2s)
}
Sys.time() - ini
```

## Forma vectorial.

```{r}
ini <- Sys.time()
R2s_2 <- lapply(lista_datos, calcula_R2)
R2s_2 <- as.numeric(R2s_2)
Sys.time() - ini
```

## Otra forma vectorial usando *purrr*.


```{r}
library(tidyverse)
ini <- Sys.time()
R2s_3 <- lista_datos %>%
  map_dbl(calcula_R2)
Sys.time() - ini
```


## Forma en paralelo.

```{r}
library(parallel)
num_nucleos <- detectCores()
ini <- Sys.time()
R2s_4 <- mclapply(lista_datos, calcula_R2, mc.cores = num_nucleos)
R2s_4 <- as.numeric(R2s_3)
Sys.time() - ini
```

## Forma en paralelo usando *foreach()*.

```{r}
library(parallel)
library(foreach)
library(doParallel)
num_nucleos <- detectCores()

cluster1 <- makeCluster(num_nucleos)
registerDoParallel(cluster1)

ini <- Sys.time()
R2s_5 <- foreach(i = 1:length(lista_datos), .combine = c) %dopar% {
              calcula_R2(lista_datos[[i]])
}
Sys.time() - ini

stopCluster(cluster1)
```

## Otra forma en paralelo usando *foreach()*

```{r}
library(parallel)
library(foreach)
library(doParallel)
num_nucleos <- detectCores()

cluster1 <- makeCluster(num_nucleos)
registerDoParallel(cluster1)

ini <- Sys.time()
R2s_6 <- foreach(i = lista_datos, .combine = c) %dopar% {
              calcula_R2(i)
}
Sys.time() - ini

stopCluster(cluster1)
```

## Uso de la función *parLapply()*.

```{r}
library(parallel)
library(foreach)
library(doParallel)
num_nucleos <- detectCores()

cluster1 <- makeCluster(num_nucleos)

ini <- Sys.time()
R2s_7 <- parLapply(cluster1, lista_datos, calcula_R2)
R2s_7 <- as.numeric(R2s_7)
Sys.time() - ini

stopCluster(cluster1)
```
