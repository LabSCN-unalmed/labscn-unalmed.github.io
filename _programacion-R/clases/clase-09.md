---
layout: clase
title: 'Manejo de base de datos'
curso: 'programacion-R'
clase: 9
custom_js: 'mathjax'
---

A manera de ejemplo utilizaremos la base de datos de los
resultados del [ICFES para 2015](20152.xls) segundo semestre por las instituciones
educativas del país.


## Lectura de la base de datos

```{r}
icfes201502 <- read.csv2("20152.csv", skip = 5)
```

## Dimensión y registros iniciales y registros finales

```{r}
dim(icfes201502)
head(icfes201502)
tail(icfes201502)
```

## Manejo básico.

```{r}
subset(icfes201502, select = c(DEPARTAMENTO, NOMBREMUNICIPIO, EVALUADOS))

subset(icfes201502, DEPARTAMENTO == "ANTIOQUIA" & NOMBREMUNICIPIO == "MEDELLIN")

subset(icfes201502, DEPARTAMENTO == "ANTIOQUIA" & NOMBREMUNICIPIO == "MEDELLIN",
       select = c(DEPARTAMENTO, NOMBREMUNICIPIO, EVALUADOS))

subset(icfes201502, DEPARTAMENTO == "ANTIOQUIA" &
                                     NOMBREMUNICIPIO == "MEDELLIN" &
                                     EVALUADOS >= 20,
      select = c(DEPARTAMENTO, NOMBREMUNICIPIO, EVALUADOS,
                 PROMLECTURACRITICA:PROMCOMPETENCIASCIUDADAN))
```

## Uso del paquete `dplyr`

```{r}
require(dplyr)
icfes201502 <- tbl_df(icfes201502)
icfes201502
```

## Filtrado de una base de datos
```{r}
filter(icfes201502, DEPARTAMENTO == "ANTIOQUIA", NOMBREMUNICIPIO == "MEDELLIN")
```

## Selección de posiciones específicas de una base de datos

```{r}
slice(icfes201502, 1000:1050)
```

## Ordenación de la base de datos

```{r}
arrange(icfes201502, DEPARTAMENTO)
arrange(icfes201502, DEPARTAMENTO, NOMBREINSTITUCION)
arrange(icfes201502, PROMLECTURACRITICA)
arrange(icfes201502, desc(PROMLECTURACRITICA))
```

## Seleccion de columnas
```{r}
select(icfes201502, NOMBREMUNICIPIO, DEPARTAMENTO, PROMLECTURACRITICA)
```

## Elementos o registros únicos
```{r}
distinct(select(icfes201502, DEPARTAMENTO))
```

## Adicionar una nueva columna
```{r}
mutate(icfes201502, promTotal = (PROMLECTURACRITICA + PROMMATEMATICA + PROMINGLES)/3)
transmute(icfes201502, promTotal = (PROMLECTURACRITICA + PROMMATEMATICA + PROMINGLES)/3)
```

## Resumir variables o consolidar valores
```{r}
summarise(icfes201502, mean(PROMMATEMATICA))
```

## Agrupación
```{r}
group_by(icfes201502, DEPARTAMENTO)
```

## Combinación de "verbos" en base de datos
```{r}
agrupados_deptos <- group_by(icfes201502, DEPARTAMENTO)
promedio_depto <- summarise(agrupados_deptos, mean(PROMMATEMATICA))
promedio_depto
```

## Mediante encadenamiento de verbos.
```{r}
icfes201502 %>% group_by(DEPARTAMENTO) %>% summarise(mean(PROMMATEMATICA))
```

## Combinación de manejo de datos.
```{r}
icfes201502 %>%
  mutate(promTotal = rowMeans(.[10:16])) %>%
  group_by(CODIGOMUNICIPIO) %>%
  arrange(desc(promTotal)) %>%
  select(NOMBREINSTITUCION, NOMBREMUNICIPIO, DEPARTAMENTO, promTotal) %>%
  slice(1:3)
```

## ¿Cuántas Instituciones Educativas tiene cada municipio?

```{r}
icfes201502 %>%
  group_by(CODIGOMUNICIPIO, NOMBREMUNICIPIO, DEPARTAMENTO) %>%
  summarise(n = n()) %>%
  select(DEPARTAMENTO, NOMBREMUNICIPIO, n) %>%
  group_by(DEPARTAMENTO) %>%
  arrange(desc(n))
```
