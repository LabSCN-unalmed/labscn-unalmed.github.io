---
layout: curso
title: 'Talleres'
curso: 'programacion-R'
order: 05
---


## Primer taller individual

### Actividades

1. Instalar el lenguaje estadístico [R](https://cran.r-project.org/bin/windows/base/), la última version.
2. Instalar la interfaz [RStudio](https://www.rstudio.com/products/rstudio/download/), la última version.
3. Ejecutar el RStudio y en la ventana de **console** instalar los siguientes paquetes (y sus dependencias),
   mediante la siguiente instrucción:
   
   ```
   install.packages(c("ggplot2","rmarkdown"), dependencies = TRUE)
   ```
   
4. Construir un archivo en formato **html** (mediante el knit html) que contenga las siguientes
   especificaciones y los código en R correspondientes en el mismo archivo:
   
   * Titulo: Primer Taller.
   * Autor: (Nombre completo del estudiante)
   * Fecha: Jueves, 10 de marzo de 2016.
   * Lectura de la base de datos [NBI_Desem_fiscal](./dbs/NBI_Desem_fiscal.xlsx),
     (recuerde pasarlo al formato **csv** para facilitar la lectura de la base 
     de datos en R)
   * Gráfica de las variables **NBI_total** (eje y) vs **Desemp_fiscal** (eje x).
   
5. Enviar el archivo en formato **html**  al correo **krcabrer@unal.edu.co** el
   día jueves 10 de marzo de 2016 antes de las 23:59 hora de Colombia, no olvidar en asunto
   escribir [Modulo_R].
   
### Documento a entregar
   * Archivo en formato **html**, que incluya el código en R y los resultados.
   * Base de datos en formato **.csv**.
