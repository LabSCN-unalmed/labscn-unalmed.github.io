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
   
## Segundo taller individual

### Actividades 
   Escribir un código en R que muestre los índices de las diagonales
   secundarias de una matriz cuadrada.

### Materiales a entregar
   - Código en R documentado.   
   
## Tercer taller individual

### Actividades

   Escribir un código que permita mostrar la distribución de la longitud
   de la cola que se hace en una taquilla del metro teniendo en cuenta que:
   
   - La distribución de llegada de las personas es poission con un 
     promedio de 5 personas por minuto.
   - La distribución de los tiempos de atención a las personas es una
     distribución exponencial con un promedio de 20 segundos por persona. 
   - Obtener la distribución de la cola de la taquilla al terminar un
     periodo de 60 minutos.
     
### Materiales a entregar
   
   Código en R de la simulación e histograma de la distribución de los
   tiempo en formato ".html" obtenido mediante Rmarkdown.
        
     
