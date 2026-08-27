---
layout: curso
title: 'Estadística Descriptiva y Análisis Exploratorio de Datos'
curso: 'estadistica-descriptiva'
order: 0
---

## Descripción del curso

El curso desarrolla competencias para explorar, limpiar, describir y comunicar hallazgos en datos reales. Se enfatiza el análisis exploratorio (EDA) como un
proceso iterativo basado en visualización, transformación y modelos ligeros para comprensión (no inferencia formal). Se trabaja con reportes reproducibles.

## Objetivo general:

Manejar los principios básicos de la estadística descriptiva y desarrollar habilidades en el análisis exploratorio de datos.

## Objetivos específicos:

-   Desarrollar habilidades para depurar, desplegar y analizar datos con un objetivo científico.
-   Usar la estadística descriptiva como herramienta de análisis estadístico inicial.
-   Desarrollar habilidades para desplegar datos con el fin de obtener un panorama global del comportamiento de los mismos.
-   Adquirir habilidades investigativas para planear, ejecutar y analizar una investigación estadísticamente válida.

## El estudiante tendrá al final de curso la capacidad de:

 - Importar datos y diagnosticar calidad (tipos, faltantes, duplicados, rangos, consistencia).
- Estructurar datos en formato “tidy” y documentar un diccionario de datos.
- Construir resúmenes descriptivos apropiados (tendencia central, dispersión, percentiles, frecuencias, proporciones).
- Diseñar visualizaciones EDA con intención (distribuciones, comparaciones, relaciones).
- Analizar covariación (num–num, cat–num, cat–cat) sin confundir asociación con causalidad.
- Tomar y justificar decisiones de limpieza (NA, outliers, reglas de coherencia).
- Usar “modelos ligeros” como herramienta exploratoria para revelar patrones.
- Comunicar hallazgos de forma clara y reproducible en un reporte Quarto.
- Demostrar comprensión operativa de R: lectura, modificación, depuración y explicación de código. 

## Contenido del curso:

El proceso investigativo y el uso de los datos

  - La pregunta de investigación como eje rector: cómo definir objetivos claros y comprobables.
  - Datos primarios vs. datos secundarios: ventajas, limitaciones y fuentes confiables (bases de datos oficiales, repositorios académicos).
  - Sesgos comunes en la investigación (sesgo de selección, sesgo de memoria, sesgo de publicación) y cómo identificarlos antes de tocar los datos.
  - Ética y privacidad en el manejo de datos (anonimización, consentimiento informado).

Planeación de toma de datos con fines investigativos

  - Diseños muestrales básico: muestreo probabilístico (aleatorio simple)
  - Determinación del tamaño de muestra de manera intuitiva (introducción a fórmulas básicas y factores que influyen: margen de error, nivel de confianza, variabilidad esperada).
  - Instrumentos de recolección: encuestas, cuestionarios, mediciones experimentales, scraping web. Criterios para diseñar preguntas no sesgadas.
  - Prueba piloto: importancia de validar el instrumento antes de la recolección masiva.

Conceptos básicos del análisis exploratorio de datos (EDA)

  - Filosofía del EDA (John Tukey): explorar sin hipótesis rígidas predefinidas, dejar que los datos "hablen".
  - Estructura de los datos: identificar filas (registros/individuos) y columnas (variables).
  - Detección y manejo de valores atípicos (outliers): métodos gráficos (boxplots) y numéricos (rango intercuartílico). Decidir si eliminarlos, imputarlos o mantenerlos según el contexto.

Visualización e interpretación de datos

  - Gramática de los gráficos (capas, escalas, estética),
  - Gráficos univariados: histograma, diagrama de caja (boxplot), diagrama de violín y gráfico de densidad.
  - Gráficos bivariados/multivariados: diagrama de dispersión (scatter plot), matriz de correlación, gráficos de barras agrupadas y mapas de calor (heatmaps).
  - Principios de percepción visual: evitar gráficos engañosos (escalas truncadas, mal uso de 3D, colores inapropiados) y aplicar la relación "dato-tinta" (Tufte).

Entendimiento de la naturaleza de los datos

  - Niveles o escalas de medición: Nominal (categorías sin orden), Ordinal (categorías con orden), Intervalo (diferencias significativas, sin cero absoluto) y Razón (cero absoluto). Esto es clave porque determina qué estadísticos y gráficos son válidos.
  - Clasificación de variables: Cualitativas (nominales/ordinales) vs. Cuantitativas (discretas/continuas).
  - Estructura temporal y espacial de los datos: series de tiempo (tendencias, estacionalidad) vs. datos transversales (cross-section) vs. datos de panel.

Estadística descriptiva (medidas, tablas de frecuencia, etc.)

  - Tablas de frecuencia: absolutas, relativas, porcentuales, acumuladas. Agrupación en intervalos de clase (regla de Sturges, etc.).
  - Medidas de tendencia central: media, mediana y moda. ¿Cuándo es más robusta la mediana? (distribuciones asimétricas).
  - Medidas de posición: cuartiles, deciles, percentiles (fundamentales para entender la dispersión y construir boxplots).
  - Medidas de dispersión: rango, varianza, desviación estándar, rango intercuartílico (IQR) y coeficiente de variación.
  - Forma de la distribución: asimetría (sesgo positivo/negativo) y curtosis (apuntalamiento o colas pesadas). Introducción al análisis bivariado con covarianza y correlación de Pearson (y su versión no paramétrica, Spearman).

Limpieza y transformación de datos (Data Wrangling)
  - En la práctica, el 70-80% del tiempo se va en preparar datos. 
  - Enseñar a filtrar, ordenar, fusionar tablas, crear variables derivadas (por ejemplo, Índice de Masa Corporal a partir de peso y talla) y estandarizar/normalizar escalas. 

Introducción a la probabilidad y distribuciones teóricas 
  - Sirve como puente hacia la estadística inferencial. 
  - Cubrir conceptos básicos de probabilidad, variable aleatoria y las distribuciones normal, t-Student y chi-cuadrado. Esto da sustento para entender por qué ciertas medidas descriptivas son útiles. 
 
Análisis exploratorio multivariado (introductorio) No limitarse a lo univariado/bivariado. 
  - Incluir conceptos como análisis de conglomerados jerárquicos (clustering básico) o análisis de componentes principales (ACP) de forma intuitiva y gráfica, para que los estudiantes vean patrones en múltiples dimensiones. 
 
Comunicación de resultados y "Storytelling con datos"

  - Elaborar informes ejecutivos o dashboards (Tabla de frecuencias + gráfico + interpretación en lenguaje coloquial). Enseñar a redactar hallazgos sin tecnicismos excesivos, enfocándose en el público objetivo (investigador, cliente o tomador de decisiones). |



## Metodología
- **Clase:** conceptos, ejemplos guiados y discusión de decisiones analíticas.
- **Laboratorio:** práctica en R con datasets reales, actividades en vivo (LC) y depuración.
- **Aprendizaje basado en proyectos:** un proyecto de grupo con hitos, más entregas individuales.
- **Énfasis transversal:** reproducibilidad, trazabilidad y comunicación.

## Bibliografía

Se utilizará en la mayor parte del curso las indicaciones del libro digital [R para ciencia de datos](https://davidrsch.github.io/r4ds-es/)

Se puede utilizar otra bibliografía auxiliar de acuerdo al desarrollo del curso.


## Evaluación:

| Item                                           | Porcentaje |
|:-----------------------------------------------|:----------:|
| Talleres individuales y en grupo (seguimiento) |    20%     |
| Trabajos en grupo                              |    25%     |
| Trabajos individuales                          |    25%     |
| Final                                          |    30%     |


## Software

- Lenguaje estadístico [R](https://cran.r-project.org/bin/windows/base/).
- Interfaz de usuario [Positron](https://positron.posit.co/download.html).
- Sistema de publicación técnica y científica [Quarto](https://quarto.org/docs/get-started/).
- Interfaz tradicional de R - [RStudio](https://posit.co/download/rstudio-desktop/).

## Política de uso de IA (permitida con transparencia)
La IA puede utilizarse como herramienta de aprendizaje (sugerir ideas, depurar, explicar errores, refactorizar), pero [**no reemplaza**](https://www.clarin.com/sociedad/jose-escamilla-usar-ia-tareas-escolares-pagar-suscripcion-gimnasio-pedirle-alguien-vaya-vos_0_9Hq0FuTGJu.html) el aprendizaje esperado. El curso evalúa la comprensión mediante coherencia con los datos, defensa oral y tareas en vivo.

### Anexo IA obligatorio (en cada entrega)
Máximo 10 líneas, al final del reporte:

1. ¿Usó IA? (Sí/No)  
2. ¿En qué la usó? (depuración, ideas, gráficos, explicación)  
3. **¿qué cambió usted?** y **¿qué aprendió?**  
4. 1–2 prompts clave (máx 6 líneas)

### Qué se penaliza
- Entregas **no reproducibles** (no corren / rutas rotas / objetos no creados).
- Contradicciones entre narrativa y evidencia (gráficos/tablas).
- Incapacidad de explicar o modificar el análisis en defensa o actividades en vivo.



## Enlaces importantes

-   Libro electrónico [Manual de R](https://fhernanb.github.io/Manual-de-R/).

-   Libro electrónico [Gráficos con R](https://fhernanb.github.io/Graficos-con-R/).

-   [Canal de YouTube](https://www.youtube.com/channel/UCMLQ_dQirjjwPjR8skwX3gA) del profesor Freddy Hernández Barajas. Tutoriales cortos de R, RStudio, estadística y modelación en estadística.

-   [Página de semillero de R](https://semillerorpy.netlify.app/) por el profesor Edimer David Jaramillo

## Reproducibilidad y formato de entrega

Todas las entregas deben incluir:

- **Proyecto con estructura mínima:** `/datos`, `/reporte`, `/R`
- **Reporte Quarto** (`.qmd`) y salida (HTML/PDF si aplica)
- `sessionInfo()` al final del reporte
- Semilla (`set.seed()`) cuando aplique

## Políticas del curso

-   Se utilizará la plataforma [UN virtual](https://unvirtual.medellin.unal.edu.co/) de la Universidad Nacional de Colombia.
-   Los grupos de trabajo serán de máximo cinco (5) personas.
-   Todo correo que se envíe a [krcabrer\@unal.edu.co](mailto:krcabrer@unal.edu.co){.email} debe llevar en asunto: \[EDAED\] (No olvide incluir los chorchetes)
-   Las sesiones virtuales que se programen se utilizará solo el correo electrónico de la Universidad (.unal.edu.co).

## Reglas de colaboración e integridad académica

- Se permite discusión conceptual entre estudiantes.
- En entregas individuales, el trabajo debe reflejar decisiones y comprensión propias.
- Copiar reportes completos o resultados sin atribución se considera falta grave.
- El Anexo IA hace transparente el uso de herramientas y evita ambigüedad.

## Código QR para incluirse en la lista de discusión

![WhatsApp](shared_qr_code.png){width=30%}
