---
layout: curso
title: 'Guías'
curso: 'programacion-R'
order: 1
---

## Enlaces para descargar las herramientas del curso

  - [Lenguaje R](https://cran.r-project.org/bin/windows/base/)
  - [Interfaz RStudio](https://www.rstudio.com/products/rstudio/download/)
  - [Herramientas básicas de desarrollo en R (Rtools33.exe)](https://cran.r-project.org/bin/windows/Rtools/)
  - [MiKTeX](http://miktex.org/download)

## Documentos

 - [Introducción a la programación orientada a objetos](ProgOrientadaObjetos.pdf)

## Plantilla de entrega de tareas (seudocódigo).

```
# -----------------------------------------------------------------------------#
# Titulo:
# Tipo:
# Nombre:
# Fecha:
# Enunciado:
# -----------------------------------------------------------------------------#

Cuerpo del código

```

## Ejemplo de entrega de tareas (seudocódigo).

```
# -----------------------------------------------------------------------------#
# Titulo: Saludo en pseudocódigo
# Tipo: Tarea 0
# Nombre: Kenneth Roy Cabrera Torres
# Fecha: Lunes, 13 de junio de 2016
# Enunciado: El código muestra un saludo de "Hola, mundo" en la salida.
# -----------------------------------------------------------------------------#

Algoritmo saludo

Inicio
  Escriba "Hola, mundo"
Fin
```


## Convertir de sartas a expresiones en R

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

## Cambiar de tamaño de letras en archivos `.Rmd`.

Después del encabezado del archivo `.Rmd` se escribe
el siguiente código `css`.

```css
<style type="text/css">
body, td {
   font-size: 25px;
}
code.r{
  font-size: 20px;
}
pre {
  font-size: 15px
}
</style>

```
