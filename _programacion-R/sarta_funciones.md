# De sartas a funciones
Kenneth Roy Cabrera Torres  
1 de julio de 2016  



## De sarta a funciones

```r
sarta1 <- "function(x) x^2"
f1 <- eval(parse(text = sarta1))
f1(5)
```

```
## [1] 25
```

```r
sartas <- c("function(x) x^2", "function(x) x^3")
stof <- function(x) eval(parse(text=x))
funciones <- sapply(sartas, stof)

funciones[[1]](3)
```

```
## [1] 9
```

```r
funciones[[2]](3)
```

```
## [1] 27
```

```r
names(funciones) <- paste("f", 1:2, sep = "")

funciones$f1(2)
```

```
## [1] 4
```

```r
funciones$f2(2)
```

```
## [1] 8
```

