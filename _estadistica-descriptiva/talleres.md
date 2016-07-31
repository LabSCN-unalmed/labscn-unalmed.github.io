---
layout: curso
title: 'Talleres'
curso: 'estadistica-descriptiva'
order: 4
---

## Talleres individuales

### Primer taller individual

Objetivo: Recolectar la información solicitada para el primer día de clase.

Entregar llena la encuesta realizada el primer día de clase, martes
agosto 2 de 2016 en la hora de clase.


### Segundo taller individual

#### Objetivo:

Realizar una lectura de la base de datos de homicidios en Colombia
y mostrar una gráfica de barras que muestre la tasa de homicidios por
cada cien mil persoas de rangos de edades específicos ya sea de hombres o
de mujeres.

Si usted es mujer utilice la tasa de homicidios de los hombres y si es hombre
lo realiza con la tasa de homcidios de las mujeres.

#### Ejemplo del guión ([homicidiosColombia2014.R](./guiones/HomicidiosColombia2014.R))

```r
# Lectura de la base de datos de homicidios en Colombia en el 2014
homCol <- read.csv2("HomicidiosColombia2014.csv")
# Muestra la base de datos de homicidios en Colombia en el 2014
homCol
# Cálculo de estadísticos de tasa de homicidios totales
with(homCol, summary(TasaT))
# Gráfica sencilla con las tasas de homicidios totales por grupo de edad
with(homCol, barplot(TasaT))
# Gráfica mejorada con las tasas de homicidios totales por grupo de edad
with(homCol, barplot(TasaT, names.arg = GrupoEdad, las = 2,
                     main = "Tasas de homicidios para cada cien mil habitantes"))     
```

#### Materiales a engregar:

 + Documento en formato ".pdf" en donde se muestre la gráfica realizada y
   un breve análisis de los resultados obtenidos.
 + Guión en R que muestre la manera como obtuvo la gráfica en formato ".R"
   debidamente documentado.

#### Fecha de entrega:

Miércoles 10 de agosto de 2016 antes de las 23:59 hora de colombia al correo
***krcabrer@unal.edu.co*** y no olvidar escribir en asunto **[EDAED]**.

## Talleres en grupo
