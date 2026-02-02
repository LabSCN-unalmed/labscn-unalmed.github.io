---
layout: curso
title: 'Ecología Numérica'
curso: 'ecologia-numerica'
order: 0
---

## Objetivo

Este curso introduce el análisis cuantitativo de datos ecológicos multivariados con enfoque aplicado. El estudiante aprende a explorar, medir similitud/disimilitud, clasificar (clustering), ordenar (ordination) y modelar relaciones especies–ambiente (ordenación canónica), integrando además estructura espacial cuando exista. El eje metodológico es el flujo de trabajo completo en **R** con análisis reproducibles (Quarto/RMarkdown), utilizando datasets reales de comunidades biológicas.

El curso sigue como texto guía **Borcard, Gillet & Legendre (2011), _Numerical Ecology with R_**, y prioriza interpretación ecológica, selección justificada de métodos y comunicación clara de resultados.

## Resultados de aprendizaje (learning outcomes)

Al finalizar el curso, el estudiante podrá:

1. Diagnosticar la estructura de datos ecológicos multivariados (ceros, escalas, distribución, outliers) y decidir transformaciones/estandarizaciones apropiadas.
2. Seleccionar y justificar medidas de (dis)similitud según tipo de datos (abundancia, presencia–ausencia) y objetivo ecológico.
3. Aplicar métodos de **clasificación** (jerárquicos y particionales), evaluar estabilidad y extraer tipologías interpretables.
4. Aplicar e interpretar **ordenación no restringida** (PCA, CA, PCoA, NMDS), comparando supuestos, distancias y escalamiento.
5. Modelar relaciones **comunidad ~ ambiente** mediante **ordenación canónica** (RDA/CCA/db-RDA), evaluar significancia con permutaciones y reportar efectos relevantes.
6. Producir análisis **reproducibles** (datos + código + narrativa), con figuras y tablas orientadas a la interpretación ecológica.

## Software

- Lenguaje estadístico [R](https://cran.r-project.org/bin/windows/base/).
- Interfaz de usuario [Positrón](https://positron.posit.co/download.html).
- Sistema de publicación técnica y científica [Quarto](https://quarto.org/docs/get-started/).
- Interfaz tradicional de R - [RStudio](https://posit.co/download/rstudio-desktop/). 

## Prerrequisitos y recomendaciones

- Estadística básica: descriptiva, regresión lineal simple, conceptos de hipótesis.
- Álgebra lineal elemental: vectores, matrices, valores/vectores propios (se refuerza en el curso).
- Conocimientos básicos de R recomendados (no obligatorios si el estudiante compensa con trabajo autónomo).

## Política de reproducibilidad (obligatoria)

Toda entrega debe incluir:
1. Archivo `.qmd` o `.Rmd` (ejecutable) con narrativa.
2. Script(s) `.R` (si aplica) con funciones y flujo limpio.
3. Carpeta `/data` (o link) y descripción de origen de datos.
4. Semilla cuando aplique, y reporte de `sessionInfo()`.
5. Informe en formato HTML o pdf de acuerdo a los requerimientos específicos de la tarea o trabajo.

## Política de uso de IA (permitido con declaración y trazabilidad)

Se permite el uso de herramientas de IA **solo** como apoyo (sintaxis, explicación de errores, sugerencias de visualización), bajo estas reglas:

- Debe incluirse un **Anexo de IA** al final del reporte con:
  - herramienta usada,
  - prompts relevantes,
  - qué partes influyó y cómo verificaste el resultado.
- Está prohibido entregar resultados sin entendimiento: el docente puede solicitar **defensa oral** o **replicación en vivo** de cualquier sección.

## Bibliografía

### Texto guía (principal)
- Borcard, D., Gillet, F., & Legendre, P. (2011). **Numerical Ecology with R**. Springer.

### Complementaria (recomendada)
- Legendre, P., & Legendre, L. (2012). *Numerical Ecology* (3rd English ed.). Elsevier.
- Zuur, A. F., Ieno, E. N., & Smith, G. M. (2007). *Analysing Ecological Data*. Springer.
- McCune, B., & Grace, J. B. (2002). *Analysis of Ecological Communities*. MjM Software.


## Evaluación (según estructura del curso)

###  Talleres (20%)
Talleres breves y prácticos, con rúbrica:
- Correctitud técnica (40%)
- Interpretación ecológica (40%)
- Reproducibilidad/claridad del código (20%)

###  Trabajos (30%)
- **Trabajo 1 (15%)**: EDA + transformaciones (si son necesarias) + justificación metodológica.
- **Trabajo 2 (15%)**: Agregación + ordenación no restringida + comparación e interpretación.

###  Proyecto final (50%)
- **Propuesta (10%)**: pregunta ecológica, datos, plan y decisiones iniciales.
- **Avance (15%)**: EDA + elección de transformaciones/distancias + resultados preliminares.
- **Entrega final + sustentación (25%)**: análisis completo (incluye canonical y/o espacial si aplica), discusión, limitaciones, reproducibilidad.
