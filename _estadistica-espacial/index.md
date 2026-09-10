---
layout: curso
title: 'Estadística Espacial'
curso: 'estadistica-espacial'
order: 00
---

## Temas principales

1. Introducción a datos espaciales.
2. Manejo de datos espaciales en R.
3. Procedimientos en datos geoestadísticos.
4. Procedimientos en datos de patrones de puntos.
5. Procedimientos en datos areales.
6. Procedimientos en datos raster (grid).


## Ejes Temáticos Ampliados

### Eje 1: Introducción a Datos Espaciales y Conceptos Geodésicos
- **La Primera Ley de Tobler y autocorrelación espacial:** Ruptura de supuestos clásicos, escalas espaciales y el debate de "red herrings" en ecología geográfica.
- **Modelos del espacio:** Entidades/objetos discretos vs. campos continuos.
- **Soporte espacial (*Spatial Support*):** Definición del soporte (puntual, lineal, poligonal, bloques); problema del cambio de soporte (COSP) y la Unidad de Área Modificable (MAUP - efectos de escala y zonificación).
- **Geodesia y Cartografía:** Geoide, elipsoides de referencia (WGS84, GRS80), Datums geocéntricos y locales; coordenadas geográficas vs. proyecciones planas métricas (UTM, proyecciones conformes/equivalentes); códigos EPSG y estándares PROJ/WKT2.

### Eje 2: Manejo de Datos Espaciales en R

- **Datos vectoriales con `sf`:** Simple Features (`POINT`, `LINESTRING`, `POLYGON`), manipulación con gramática `tidyverse`/`dplyr` y graficación mediante `ggplot2::geom_sf()`.
- **Operaciones geométricas (GEOS):** Predicados binarios (`st_intersects`, `st_contains`, `st_within`) y operaciones espaciales (`st_buffer`, `st_union`, `st_intersection`, cálculo de centroides y áreas).
- **Uniones espaciales y agregación:** *Spatial joins* (`st_join`), agregación zonal de variables muestreadas y diseño de muestreos espaciales (aleatorio, en rejilla regular, estratificado).

### Eje 3: Procedimientos en Datos Geoestadísticos (Campos Continuos)
- **Procesos espaciales continuos:** Variables regionalizadas, supuestos de estacionariedad (segundo orden e hipótesis intrínseca).
- **El Semivariograma:** Construcción empírica a partir de distancias y rezagos (*lags*, *cutoff*); modelado teórico (esférico, exponencial, gaussiano, Matérn); interpretación de parámetros de estructura (pepita/*nugget*, meseta/*sill*, rango). Detección de anisotropía direccional.
- **Predicción e Interpolación con `gstat`:** Inverso de la distancia ponderada (IDW) vs. Kriging Ordinario (BLUE e incertidumbre mediante la varianza del error de kriging); Kriging Universal / con deriva externa (inclusión de covariables continuas como elevación o pendiente).
- **Diagnóstico:** Validación cruzada *Leave-One-Out* (LOOCV) y métricas de error (RMSE, sesgo, z-scores).

### Eje 4: Procedimientos con Datos de Patrones de Puntos (*Point Patterns*)
- **Fundamentos:** La ubicación del evento como variable aleatoria; definición del dominio y ventanas de observación (`owin`); efectos de borde.
- **Aleatoriedad Espacial Completa (CSR):** Procesos homogéneos de Poisson como hipótesis nula; patrones agregados, regulares y aleatorios.
- **Propiedades de primer orden:** Intensidad puntual ($\lambda$); conteo por cuadrantes, estimación de densidad por kernels (KDE) y selección de anchos de banda (*bandwidth*).
- **Propiedades de segundo orden:** Análisis de distancias de interacción: función $G$ (evento-evento), función $F$ (espacio vacío), función $K$ de Ripley y función $L$ de Besag; bandas de simulación Monte Carlo para pruebas de hipótesis.
- **Modelos no homogéneos:** Ajuste de modelos de intensidad puntual dependientes de covariables ambientales (`spatstat::ppm`).

### Eje 5: Procedimientos en Datos Areales (*Lattice Data*)
- **Estructura territorial:** Polígonos de límites fijos (cuencas, parcelas, divisiones administrativas).
- **Matrices de vecindad y pesos espaciales ($W$):** Criterios de contigüidad (Torre/*Rook*, Reina/*Queen*), umbrales de distancia métrica y $k$-vecinos más cercanos; estandarización por filas; retardo espacial (*spatial lag*).
- **Autocorrelación global:** Índice $I$ de Moran y coeficiente $C$ de Geary; pruebas analíticas y por permutación de Monte Carlo; diagrama de dispersión de Moran.
- **Autocorrelación local (LISA):** $I$ de Moran local para identificación cartográfica de conglomerados espaciales (*hotspots* Alto-Alto, *coldspots* Bajo-Bajo) y valores atípicos (*outliers* espaciales).
- **Introducción a regresión espacial:** Diagnóstico de residuos MCO; modelos autorregresivos de retardo espacial (SLM) y de error espacial (SEM) con `spdep` y `spatialreg`.

### Eje 6: Procedimientos en Datos Ráster y Álgebra de Mapas
- **Estructura ráster con `terra` y `stars`:** Modelos de celda/rejilla regular, resolución espacial, extensión, valores nodata; gestión eficiente en memoria y en disco.
- **Álgebra de mapas de Tomlin:**
  - Operaciones locales (cálculo de índices espectrales como NDVI).
  - Operaciones focales (ventanas móviles para filtros de textura, pendientes o suavizado).
  - Operaciones zonales (resúmenes estadísticos de celdas según polígonos o categorías).
  - Operaciones globales (superficies de distancia euclidiana y rutas de menor costo).
- **Interoperabilidad ráster-vector:** Extracción de valores ráster en puntos o polígonos de inventario (`extract`), rasterización de coberturas vectoriales y vectorización de superficies.


## Bibliografía

### Textos principales

1. Pebesma, Edzer, Bivand, Roger. [Spatial Data Science
With Applications in R.](https://r-spatial.org/book/) January 22, 2025.
2. Bivand, Roger S, Pebesma Edzer y Gómez-Rubio Virgilio.
Applied Spatial Data Analysis with R. Second Edition. Springer New York.
2013
3. Diggle Peter J. y Ribeiro Pablo J. Jr. Model-based Geostatistics.
Springer Science+Business Media, LLC. 2007.
4. LLoyd, Christopher D. Local Models for Spatial Analysis.
 Second Edition. CRC Press. 2011.
5. Martha Patricia Bohórquez Castañeda (2025). [Geoestadística para datos espaciales, espacio-temporales y funcionales](https://catalogoferias.unal.edu.co/geoestadistica-para-datos-espaciales-espacio-temporales-y-funcionales-krofx.html). Editorial UNAL - Universidad Nacional de Colombia.


### Textos complementarios

1. Cressie, Noel A. C. Statistics for Spatial Data.
John Wiley & Sons, Inc. 1991.
2. Gaetan Carlo y Guyon Xavier. Spatial Statistics and Modeling.
Springer Science+Business Media. 2010.
3. Gelfand Alan E., Diggle J. Peter, Fuentes Monserrat y Guttorp Peter.
Handbook of Spatial Statistics. Chapman & Hall/CRC Press. Handbooks of
Modern Statistical Methods. 2010.
4. Cressie Noel y Wikle Christopher K. Statistics for Spation-temporal Data.
John Wiley & Sons, Inc. 2011
5. Schabenberger, Oliver y Pierce Francis J. Contemporary Statistical Models:
for the Plant and Soil Sciencies.
Capítulo 09:Statistical Models for Spatial Data. CRC Press. 2002

## Evaluación

| Item                   | Porcentaje |
|:-----------------------|:----------:|
| Seguimiento - Talleres |        30% |
| Proyecto final         |        70% |
{: .table .table-hover}

## Enlaces principales


* [Sitio de descarga del Lenguaje Estadístico R.](http://cran.r-project.org/bin/windows/base/)
* [Sitio de descarga de la interfaz para el R: Positron.](https://positron.posit.co/download.html)

* [Descarga del Gimp](http://www.gimp.org/downloads/)
* [Descarga del imageJ](http://fiji.sc/Downloads)


### Rutas Metodológicas del Proyecto Final

El estudiante selecciona una ruta aplicada a datos de su propia tesis o provistos por el curso:
1. **Ruta A (Patrones de Puntos):** Estimación de densidad Kernel, análisis multiescala con función $K/L$, prueba formal contra CSR con bandas Monte Carlo y discusión biológica/forestal del proceso.
2. **Ruta B (Geoestadística):** Semivariograma experimental, ajuste teórico justificado, interpolación mediante Kriging Ordinario/Universal, mapas de estimación e incertidumbre (varianza del error) y validación cruzada.
3. **Ruta C (Datos en Área):** Formulación de matrices $W$ (justificación ecológica del criterio de vecindad), prueba de Moran global, análisis LISA con mapa de conglomerados (*hotspots*/*coldspots*) e interpretación territorial.

<!--

## Libro complementario:

* [Lecturas sobre estadística espacial](https://www.dropbox.com/s/hfqfqtevsu85twy/contemporaryStatisticalModels.pdf?dl=0)


## Horario de atención

Lunes 8:00 am a 10:00 am.


Lugar: Laboratorio de Sistemas Complejos Naturales 21-215


Este párrafo será de color verde
{: .text-success}

Este tendrá el fondo rojo
{: .bg-danger}

Este será de color amarillo y fondo azul
{: .text-warning .bg-info}
-->
