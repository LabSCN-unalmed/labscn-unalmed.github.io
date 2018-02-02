# Manejo de base de datos (dplyr)
Kenneth Roy Cabrera Torres  



## Lectura de la base de datos

```r
icfes201502 <- read.csv2("20152.csv", skip = 5)
```

## Dimensión y registros inciales y registros finales

```r
dim(icfes201502)
```

```
## [1] 12162    24
```

```r
head(icfes201502)
```

```
##   CODINST                                                                 NOMBREINSTITUCION CODIGOMUNICIPIO
## 1  142133                         I.E. INTERNADO SAN RAFAEL DEL CARAPARANA - SEDE PRINCIPAL           91263
## 2   87445                      I.E. COLEGIO INDIGENA CASA DEL CONOCIMIENTO - SEDE PRINCIPAL           91405
## 3  117127                                 I.E. INTERNADO INDIGENA SAN JOSÉ - SEDE PRINCIPAL           91407
## 4   19109 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 5   38919                                   I.E. INEM JOSE EUSTASIO RIVERA - SEDE PRINCIPAL           91001
## 6   65482                                     I.E. INDIGENA SAN JUAN BOSCO - SEDE PRINCIPAL           91001
##   NOMBREMUNICIPIO DEPARTAMENTO CALENDARIO NATURALEZA              JORNADA EVALUADOS PROMLECTURACRITICA
## 1      EL ENCANTO     AMAZONAS          A    OFICIAL               MAÑANA        21              42.52
## 2     LA CHORRERA     AMAZONAS          A    OFICIAL               MAÑANA        38              40.13
## 3      LA PEDRERA     AMAZONAS          A    OFICIAL COMPLETA U ORDINARIA        31              39.87
## 4         LETICIA     AMAZONAS          A    OFICIAL               MAÑANA        89              49.93
## 5         LETICIA     AMAZONAS          A    OFICIAL               MAÑANA       134              45.85
## 6         LETICIA     AMAZONAS          A    OFICIAL COMPLETA U ORDINARIA        75              42.61
##   PROMMATEMATICA PROMSOCIALESYCIUDADANAS PROMCIENCIASNATURALES PROMINGLES PROMRAZONAMIENTOCUANTITA
## 1          42.05                   43.71                 44.24      45.95                    41.81
## 2          40.24                   41.26                 41.79      43.58                    40.32
## 3          39.48                   38.81                 42.74      43.77                    39.71
## 4          47.65                   50.28                 49.55      47.76                    48.01
## 5          44.00                   46.95                 46.49      46.58                    44.99
## 6          39.65                   42.61                 42.88      44.08                    39.35
##   PROMCOMPETENCIASCIUDADAN DESVLECTURACRITICA DESVMATEMATICA DESVSOCIALESYCIUDADANAS DESVCIENCIASNATURALES
## 1                    42.05               5.78           7.37                    7.52                  5.94
## 2                    39.05               6.01           7.43                    7.72                  5.23
## 3                    37.68               5.98           9.04                    8.56                  5.32
## 4                    49.44               7.94           9.50                    9.38                  6.81
## 5                    46.41               7.88           8.41                    8.22                  6.44
## 6                    41.13               6.22           7.90                    7.98                  5.35
##   DESVINGLES DESVRAZONAMIENTOCUANTITA DESVCOMPETENCIASCIUDADAN PERIODO
## 1       6.72                     8.23                     7.10   20152
## 2       4.48                     7.57                     7.27   20152
## 3       5.42                     9.30                     6.77   20152
## 4       7.49                    10.42                     8.95   20152
## 5       6.13                     8.90                     8.24   20152
## 6       4.96                     8.44                     7.24   20152
```

```r
tail(icfes201502)
```

```
##       CODINST                                            NOMBREINSTITUCION CODIGOMUNICIPIO NOMBREMUNICIPIO
## 12157   31039 I.E. NORMAL SUPERIOR FEDERICO LLERAS ACOSTA - SEDE PRINCIPAL           99001  PUERTO CARREÑO
## 12158   87460                   I.E. JOSE EUSTACIO RIVERA - SEDE PRINCIPAL           99001  PUERTO CARREÑO
## 12159   99366                         I.E. ANTONIA SANTOS - SEDE PRINCIPAL           99001  PUERTO CARREÑO
## 12160  135020                                         JOSÉ CELESTINO MUTIS           99001  PUERTO CARREÑO
## 12161  167981                       I.E. MARIA INMACULADA - SEDE PRINCIPAL           99001  PUERTO CARREÑO
## 12162   37440                I.E. INTERNADO CAMILO TORRES - SEDE PRINCIPAL           99624   SANTA ROSALIA
##       DEPARTAMENTO CALENDARIO NATURALEZA JORNADA EVALUADOS PROMLECTURACRITICA PROMMATEMATICA
## 12157      VICHADA          A    OFICIAL  MAÑANA        61              47.90          49.25
## 12158      VICHADA          A    OFICIAL  MAÑANA        77              47.49          47.14
## 12159      VICHADA          A    OFICIAL  MAÑANA        13              47.38          45.54
## 12160      VICHADA          A    OFICIAL  MAÑANA        23              48.22          47.57
## 12161      VICHADA          A    OFICIAL  MAÑANA        35              46.91          44.71
## 12162      VICHADA          A    OFICIAL  MAÑANA        42              48.31          49.40
##       PROMSOCIALESYCIUDADANAS PROMCIENCIASNATURALES PROMINGLES PROMRAZONAMIENTOCUANTITA
## 12157                   49.61                 48.49      48.64                    49.64
## 12158                   51.12                 49.16      47.95                    48.45
## 12159                   49.23                 50.38      46.38                    45.85
## 12160                   50.39                 48.61      46.04                    48.22
## 12161                   47.49                 47.23      46.23                    45.80
## 12162                   50.79                 48.24      47.29                    50.40
##       PROMCOMPETENCIASCIUDADAN DESVLECTURACRITICA DESVMATEMATICA DESVSOCIALESYCIUDADANAS
## 12157                    48.18               9.87          10.83                   10.20
## 12158                    50.03               7.48           9.62                    9.10
## 12159                    45.54               5.88          10.14                    9.25
## 12160                    49.57               6.80           8.46                    7.38
## 12161                    46.60               7.28           8.59                   10.49
## 12162                    48.71               6.80           9.55                    7.96
##       DESVCIENCIASNATURALES DESVINGLES DESVRAZONAMIENTOCUANTITA DESVCOMPETENCIASCIUDADAN PERIODO
## 12157                  9.39       7.21                    12.58                    10.59   20152
## 12158                  8.98       6.61                    10.52                     8.76   20152
## 12159                  8.27       4.82                    13.86                     9.53   20152
## 12160                  7.11       5.71                    11.02                     7.34   20152
## 12161                  5.99       6.20                     8.61                    10.11   20152
## 12162                  6.33       6.03                    11.06                     6.92   20152
```

## Convetir un data.frame a formato dplyr

```r
require(dplyr)
```

```
## Loading required package: dplyr
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
icfes201502 <- tbl_df(icfes201502)
icfes201502
```

```
## # A tibble: 12,162 × 24
##    CODINST                                                                 NOMBREINSTITUCION CODIGOMUNICIPIO
##      <int>                                                                            <fctr>           <int>
## 1   142133                         I.E. INTERNADO SAN RAFAEL DEL CARAPARANA - SEDE PRINCIPAL           91263
## 2    87445                      I.E. COLEGIO INDIGENA CASA DEL CONOCIMIENTO - SEDE PRINCIPAL           91405
## 3   117127                                 I.E. INTERNADO INDIGENA SAN JOSÉ - SEDE PRINCIPAL           91407
## 4    19109 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 5    38919                                   I.E. INEM JOSE EUSTASIO RIVERA - SEDE PRINCIPAL           91001
## 6    65482                                     I.E. INDIGENA SAN JUAN BOSCO - SEDE PRINCIPAL           91001
## 7    65490                                                    COL FEMENINO MARIA AUXILIADORA           91001
## 8    87429                                                                    COL CRISTO REY           91001
## 9    93229           I.E. COLEGIO TECNICO AGROPECUARIO JOSE CELESTINO MUTIS - SEDE PRINCIPAL           91001
## 10  117358                                    I.E. SAGRADO CORAZON DE JESUS - SEDE PRINCIPAL           91001
## # ... with 12,152 more rows, and 21 more variables: NOMBREMUNICIPIO <fctr>, DEPARTAMENTO <fctr>,
## #   CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>,
## #   PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

## Filtrado de una base de datos

```r
filter(icfes201502, DEPARTAMENTO == "ANTIOQUIA", NOMBREMUNICIPIO == "MEDELLIN")
```

```
## # A tibble: 419 × 24
##    CODINST                  NOMBREINSTITUCION CODIGOMUNICIPIO NOMBREMUNICIPIO DEPARTAMENTO CALENDARIO
##      <int>                             <fctr>           <int>          <fctr>       <fctr>     <fctr>
## 1       18              COL ATENEO HORIZONTES            5001        MEDELLIN    ANTIOQUIA          A
## 2       59                     INST EDUC CEFA            5001        MEDELLIN    ANTIOQUIA          A
## 3       75 INST EDUC SANTOS ANGELES CUSTODIOS            5001        MEDELLIN    ANTIOQUIA          A
## 4       83              COL BARBARA MICARELLI            5001        MEDELLIN    ANTIOQUIA          A
## 5       91                    COL BETHLEMITAS            5001        MEDELLIN    ANTIOQUIA          A
## 6      125              COL CALASANZ FEMENINO            5001        MEDELLIN    ANTIOQUIA          A
## 7      141                       COL CALASANZ            5001        MEDELLIN    ANTIOQUIA          A
## 8      174                    COL CORAZONISTA            5001        MEDELLIN    ANTIOQUIA          A
## 9      190        COL DE LA COMPANIA DE MARIA            5001        MEDELLIN    ANTIOQUIA          A
## 10     208  COL DE LA PRESENTACION - MEDELLIN            5001        MEDELLIN    ANTIOQUIA          A
## # ... with 409 more rows, and 18 more variables: NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>,
## #   PROMLECTURACRITICA <dbl>, PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>,
## #   PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>, PROMRAZONAMIENTOCUANTITA <dbl>,
## #   PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>, DESVMATEMATICA <dbl>,
## #   DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

## Selección de posiciones específicas de una base de datos

```r
slice(icfes201502, 1000:1050)
```

```
## # A tibble: 51 × 24
##    CODINST                                                    NOMBREINSTITUCION CODIGOMUNICIPIO
##      <int>                                                               <fctr>           <int>
## 1   162834                      I.E. CIUDADELA NUEVO OCCIDENTE - SEDE PRINCIPAL            5001
## 2   163253                         ESC BARRIO SAN NICOLAS-EN ADMINISTRACION(AC)            5001
## 3   163782       INST EDUC PBRO ANTONIO JOSE BERNAL LONDOÑO SJ - SEDE PRINCIPAL            5001
## 4   164491                                                      GIMN GUAYACANES            5001
## 5   164509                                COL FUNDADORES EN ADMINISTRACION (AC)            5001
## 6   168476                                      INST EDUC FEDERICO CARRASQUILLA            5001
## 7   168682                                      CENTRO DE ESTUDIOS MULTITÉCNICO            5001
## 8   168690                                      CENTRO DE ESTUDIOS MULTITÉCNICO            5001
## 9   169516                             I.E. MANUEL URIBE ÁNGEL - SEDE PRINCIPAL            5001
## 10  171249 I.E. COLEGIO LOYOLA PARA LA CIENCIA Y LA INNOVACIÓN - SEDE PRINCIPAL            5001
## # ... with 41 more rows, and 21 more variables: NOMBREMUNICIPIO <fctr>, DEPARTAMENTO <fctr>,
## #   CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>,
## #   PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

## Ordenación de la base de datos

```r
arrange(icfes201502, DEPARTAMENTO)
```

```
## # A tibble: 12,162 × 24
##    CODINST                                                                 NOMBREINSTITUCION CODIGOMUNICIPIO
##      <int>                                                                            <fctr>           <int>
## 1   142133                         I.E. INTERNADO SAN RAFAEL DEL CARAPARANA - SEDE PRINCIPAL           91263
## 2    87445                      I.E. COLEGIO INDIGENA CASA DEL CONOCIMIENTO - SEDE PRINCIPAL           91405
## 3   117127                                 I.E. INTERNADO INDIGENA SAN JOSÉ - SEDE PRINCIPAL           91407
## 4    19109 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 5    38919                                   I.E. INEM JOSE EUSTASIO RIVERA - SEDE PRINCIPAL           91001
## 6    65482                                     I.E. INDIGENA SAN JUAN BOSCO - SEDE PRINCIPAL           91001
## 7    65490                                                    COL FEMENINO MARIA AUXILIADORA           91001
## 8    87429                                                                    COL CRISTO REY           91001
## 9    93229           I.E. COLEGIO TECNICO AGROPECUARIO JOSE CELESTINO MUTIS - SEDE PRINCIPAL           91001
## 10  117358                                    I.E. SAGRADO CORAZON DE JESUS - SEDE PRINCIPAL           91001
## # ... with 12,152 more rows, and 21 more variables: NOMBREMUNICIPIO <fctr>, DEPARTAMENTO <fctr>,
## #   CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>,
## #   PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

```r
arrange(icfes201502, DEPARTAMENTO, NOMBREINSTITUCION)
```

```
## # A tibble: 12,162 × 24
##    CODINST                                                                 NOMBREINSTITUCION CODIGOMUNICIPIO
##      <int>                                                                            <fctr>           <int>
## 1    87429                                                                    COL CRISTO REY           91001
## 2    65490                                                    COL FEMENINO MARIA AUXILIADORA           91001
## 3   153510                                                  COL  NAVAL AF-41 ( ANTES JARDIN)           91001
## 4    87445                      I.E. COLEGIO INDIGENA CASA DEL CONOCIMIENTO - SEDE PRINCIPAL           91405
## 5    93229           I.E. COLEGIO TECNICO AGROPECUARIO JOSE CELESTINO MUTIS - SEDE PRINCIPAL           91001
## 6   104281                                        I.E. COLEGIO VILLA CARMEN - SEDE PRINCIPAL           91798
## 7    19109 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 8   173260 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 9   132506                                  I.E. FRANCISCO DEL ROSARIO VELA - SEDE PRINCIPAL           91001
## 10  135517                                       I.E. FRANCISCO DE ORELLANA - SEDE PRINCIPAL           91001
## # ... with 12,152 more rows, and 21 more variables: NOMBREMUNICIPIO <fctr>, DEPARTAMENTO <fctr>,
## #   CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>,
## #   PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

```r
arrange(icfes201502, PROMLECTURACRITICA)
```

```
## # A tibble: 12,162 × 24
##    CODINST                                  NOMBREINSTITUCION CODIGOMUNICIPIO         NOMBREMUNICIPIO
##      <int>                                             <fctr>           <int>                  <fctr>
## 1    77834                        CENT EDUC CAJASAN (ADULTOS)           68001             BUCARAMANGA
## 2   172783                                 C. E. R. CHAVERRAS            5756                  SONSON
## 3   196188         ESC RUR MIX MARIA AUXILIADORA DE ISLA MONO           27250 EL LITORAL DEL SAN JUAN
## 4    84368                  INST SER INTERNACIONAL, COMUNA 17           76001                    CALI
## 5   196931                 ESCOL RUR INDIG DE UNION CHOGORODO           27150       CARMEN DEL DARIEN
## 6   154450 COLEGIO DEPARTAMENTAL NACIONALIZADO ANTONIO NARIÑO           25483                  NARIÑO
## 7   135947                            INDIGENA MUREWON WAYURI           85125            HATO COROZAL
## 8   193466                                  LICEO DE ALTAMIRA            5093                 BETULIA
## 9   196907                                    SEDE DE LETICIA           13001               CARTAGENA
## 10  134494                             LICEO JOAQUIN F. VELEZ           13430                MAGANGUE
## # ... with 12,152 more rows, and 20 more variables: DEPARTAMENTO <fctr>, CALENDARIO <fctr>,
## #   NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>, PROMMATEMATICA <dbl>,
## #   PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

```r
arrange(icfes201502, desc(PROMLECTURACRITICA))
```

```
## # A tibble: 12,162 × 24
##    CODINST                           NOMBREINSTITUCION CODIGOMUNICIPIO NOMBREMUNICIPIO    DEPARTAMENTO
##      <int>                                      <fctr>           <int>          <fctr>          <fctr>
## 1   180372                       COL LEONARDO DA VINCI           15690     SANTA MARIA          BOYACA
## 2    66845                         INST ALBERTO MERANI           11001     BOGOTÁ D.C.          BOGOTA
## 3   112078                      COL BILINGÜE LANCASTER           76001            CALI           VALLE
## 4    99002                             LIC CAMPO DAVID           11001     BOGOTÁ D.C.          BOGOTA
## 5    17806                   LICEO FRANCES PAUL VALERY           76001            CALI           VALLE
## 6    48298                         ASPAEN LICEO TACURÍ           76001            CALI           VALLE
## 7    75176                                COL EL PINAR           76001            CALI           VALLE
## 8   105742                             COLEGIO FREINET           76001            CALI           VALLE
## 9   125211 CAMBRIDGE SCHOOL (GIMN BILING PLAZA SESAMO)           54518        PAMPLONA NORTE SANTANDER
## 10   79806                 COL NUEVO COLOMBO AMERICANO           11001     BOGOTÁ D.C.          BOGOTA
## # ... with 12,152 more rows, and 19 more variables: CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>,
## #   EVALUADOS <int>, PROMLECTURACRITICA <dbl>, PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>,
## #   PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>, PROMRAZONAMIENTOCUANTITA <dbl>,
## #   PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>, DESVMATEMATICA <dbl>,
## #   DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

## Seleccion de columnas

```r
select(icfes201502, NOMBREMUNICIPIO, DEPARTAMENTO, PROMLECTURACRITICA)
```

```
## # A tibble: 12,162 × 3
##    NOMBREMUNICIPIO DEPARTAMENTO PROMLECTURACRITICA
##             <fctr>       <fctr>              <dbl>
## 1       EL ENCANTO     AMAZONAS              42.52
## 2      LA CHORRERA     AMAZONAS              40.13
## 3       LA PEDRERA     AMAZONAS              39.87
## 4          LETICIA     AMAZONAS              49.93
## 5          LETICIA     AMAZONAS              45.85
## 6          LETICIA     AMAZONAS              42.61
## 7          LETICIA     AMAZONAS              39.93
## 8          LETICIA     AMAZONAS              55.67
## 9          LETICIA     AMAZONAS              41.11
## 10         LETICIA     AMAZONAS              47.64
## # ... with 12,152 more rows
```

## Elementos o registros únicos

```r
distinct(select(icfes201502, DEPARTAMENTO))
```

```
## # A tibble: 33 × 1
##    DEPARTAMENTO
##          <fctr>
## 1      AMAZONAS
## 2     ANTIOQUIA
## 3        ARAUCA
## 4     ATLANTICO
## 5        BOGOTA
## 6       BOLIVAR
## 7        BOYACA
## 8        CALDAS
## 9       CAQUETA
## 10     CASANARE
## # ... with 23 more rows
```

## Adicionalr una nueva columna

```r
mutate(icfes201502, promTotal = (PROMLECTURACRITICA + PROMMATEMATICA + PROMINGLES)/3)
```

```
## # A tibble: 12,162 × 25
##    CODINST                                                                 NOMBREINSTITUCION CODIGOMUNICIPIO
##      <int>                                                                            <fctr>           <int>
## 1   142133                         I.E. INTERNADO SAN RAFAEL DEL CARAPARANA - SEDE PRINCIPAL           91263
## 2    87445                      I.E. COLEGIO INDIGENA CASA DEL CONOCIMIENTO - SEDE PRINCIPAL           91405
## 3   117127                                 I.E. INTERNADO INDIGENA SAN JOSÉ - SEDE PRINCIPAL           91407
## 4    19109 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 5    38919                                   I.E. INEM JOSE EUSTASIO RIVERA - SEDE PRINCIPAL           91001
## 6    65482                                     I.E. INDIGENA SAN JUAN BOSCO - SEDE PRINCIPAL           91001
## 7    65490                                                    COL FEMENINO MARIA AUXILIADORA           91001
## 8    87429                                                                    COL CRISTO REY           91001
## 9    93229           I.E. COLEGIO TECNICO AGROPECUARIO JOSE CELESTINO MUTIS - SEDE PRINCIPAL           91001
## 10  117358                                    I.E. SAGRADO CORAZON DE JESUS - SEDE PRINCIPAL           91001
## # ... with 12,152 more rows, and 22 more variables: NOMBREMUNICIPIO <fctr>, DEPARTAMENTO <fctr>,
## #   CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>,
## #   PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>, promTotal <dbl>
```

```r
transmute(icfes201502, promTotal = (PROMLECTURACRITICA + PROMMATEMATICA + PROMINGLES)/3)
```

```
## # A tibble: 12,162 × 1
##    promTotal
##        <dbl>
## 1   43.50667
## 2   41.31667
## 3   41.04000
## 4   48.44667
## 5   45.47667
## 6   42.11333
## 7   41.81000
## 8   57.54000
## 9   40.58000
## 10  45.71667
## # ... with 12,152 more rows
```

## Resumir variables o consolidar valores

```r
summarise(icfes201502, mean(PROMMATEMATICA))
```

```
## # A tibble: 1 × 1
##   `mean(PROMMATEMATICA)`
##                    <dbl>
## 1               48.79921
```

## Agrupación

```r
group_by(icfes201502, DEPARTAMENTO)
```

```
## Source: local data frame [12,162 x 24]
## Groups: DEPARTAMENTO [33]
## 
##    CODINST                                                                 NOMBREINSTITUCION CODIGOMUNICIPIO
##      <int>                                                                            <fctr>           <int>
## 1   142133                         I.E. INTERNADO SAN RAFAEL DEL CARAPARANA - SEDE PRINCIPAL           91263
## 2    87445                      I.E. COLEGIO INDIGENA CASA DEL CONOCIMIENTO - SEDE PRINCIPAL           91405
## 3   117127                                 I.E. INTERNADO INDIGENA SAN JOSÉ - SEDE PRINCIPAL           91407
## 4    19109 I.E. ESCUELA NORMAL SUPERIOR MARCELIANO EDUARDO CANYES SANTACANA - SEDE PRINCIPAL           91001
## 5    38919                                   I.E. INEM JOSE EUSTASIO RIVERA - SEDE PRINCIPAL           91001
## 6    65482                                     I.E. INDIGENA SAN JUAN BOSCO - SEDE PRINCIPAL           91001
## 7    65490                                                    COL FEMENINO MARIA AUXILIADORA           91001
## 8    87429                                                                    COL CRISTO REY           91001
## 9    93229           I.E. COLEGIO TECNICO AGROPECUARIO JOSE CELESTINO MUTIS - SEDE PRINCIPAL           91001
## 10  117358                                    I.E. SAGRADO CORAZON DE JESUS - SEDE PRINCIPAL           91001
## # ... with 12,152 more rows, and 21 more variables: NOMBREMUNICIPIO <fctr>, DEPARTAMENTO <fctr>,
## #   CALENDARIO <fctr>, NATURALEZA <fctr>, JORNADA <fctr>, EVALUADOS <int>, PROMLECTURACRITICA <dbl>,
## #   PROMMATEMATICA <dbl>, PROMSOCIALESYCIUDADANAS <dbl>, PROMCIENCIASNATURALES <dbl>, PROMINGLES <dbl>,
## #   PROMRAZONAMIENTOCUANTITA <dbl>, PROMCOMPETENCIASCIUDADAN <dbl>, DESVLECTURACRITICA <dbl>,
## #   DESVMATEMATICA <dbl>, DESVSOCIALESYCIUDADANAS <dbl>, DESVCIENCIASNATURALES <dbl>, DESVINGLES <dbl>,
## #   DESVRAZONAMIENTOCUANTITA <dbl>, DESVCOMPETENCIASCIUDADAN <dbl>, PERIODO <int>
```

## Combinación de "verbos" en base de datos

```r
agrupados_deptos <- group_by(icfes201502, DEPARTAMENTO)
promedio_depto <- summarise(agrupados_deptos, mean(PROMMATEMATICA))
promedio_depto
```

```
## # A tibble: 33 × 2
##    DEPARTAMENTO `mean(PROMMATEMATICA)`
##          <fctr>                  <dbl>
## 1      AMAZONAS               42.07526
## 2     ANTIOQUIA               48.65945
## 3        ARAUCA               49.21113
## 4     ATLANTICO               47.67890
## 5        BOGOTA               53.92517
## 6       BOLIVAR               45.52955
## 7        BOYACA               51.54512
## 8        CALDAS               48.10144
## 9       CAQUETA               46.38431
## 10     CASANARE               48.17440
## # ... with 23 more rows
```

## Mediante encadenamiento de verbos

```r
icfes201502 %>% group_by(DEPARTAMENTO) %>% summarise(mean(PROMMATEMATICA))
```

```
## # A tibble: 33 × 2
##    DEPARTAMENTO `mean(PROMMATEMATICA)`
##          <fctr>                  <dbl>
## 1      AMAZONAS               42.07526
## 2     ANTIOQUIA               48.65945
## 3        ARAUCA               49.21113
## 4     ATLANTICO               47.67890
## 5        BOGOTA               53.92517
## 6       BOLIVAR               45.52955
## 7        BOYACA               51.54512
## 8        CALDAS               48.10144
## 9       CAQUETA               46.38431
## 10     CASANARE               48.17440
## # ... with 23 more rows
```

## Combinación de manejo de datos

```r
icfes201502 %>%
  mutate(promTotal = rowMeans(.[10:16])) %>%
  group_by(CODIGOMUNICIPIO) %>%
  arrange(desc(promTotal)) %>%
  select(NOMBREINSTITUCION, NOMBREMUNICIPIO, DEPARTAMENTO, promTotal) %>%
  slice(1:3)
```

```
## Adding missing grouping variables: `CODIGOMUNICIPIO`
```

```
## Source: local data frame [2,914 x 5]
## Groups: CODIGOMUNICIPIO [1,109]
## 
##    CODIGOMUNICIPIO                    NOMBREINSTITUCION NOMBREMUNICIPIO DEPARTAMENTO promTotal
##              <int>                               <fctr>          <fctr>       <fctr>     <dbl>
## 1             5001                       COL MONTESSORI        MEDELLIN    ANTIOQUIA  76.07714
## 2             5001          COL DE LA COMPANIA DE MARIA        MEDELLIN    ANTIOQUIA  75.84429
## 3             5001            COL SAN IGNACIO DE LOYOLA        MEDELLIN    ANTIOQUIA  74.81000
## 4             5002 I. E. FUNDACION CELIA DUQUE DE DUQUE       ABEJORRAL    ANTIOQUIA  56.24286
## 5             5002        I. E. ESCUELA NORMAL SUPERIOR       ABEJORRAL    ANTIOQUIA  51.93143
## 6             5002              I. E. R.  DE PANTANILLO       ABEJORRAL    ANTIOQUIA  49.43714
## 7             5004                  I. E.  LA MILAGROSA        ABRIAQUI    ANTIOQUIA  46.86857
## 8             5004                         COLEGIO IAUR        ABRIAQUI    ANTIOQUIA  35.05714
## 9             5021                  LICEO DE ALEJANDRIA      ALEJANDRIA    ANTIOQUIA  50.24429
## 10            5021            INSTITUTO REGIONAL COREDI      ALEJANDRIA    ANTIOQUIA  44.85571
## # ... with 2,904 more rows
```

## ¿Cuántas Instituciones Educativas tiene cada municipio?

```r
icfes201502 %>%
  group_by(CODIGOMUNICIPIO, NOMBREMUNICIPIO, DEPARTAMENTO) %>%
  summarise(n = n()) %>%
  select(DEPARTAMENTO, NOMBREMUNICIPIO, n) %>%
  group_by(DEPARTAMENTO) %>% 
  arrange(desc(n))
```

```
## Adding missing grouping variables: `CODIGOMUNICIPIO`
```

```
## Source: local data frame [1,109 x 4]
## Groups: DEPARTAMENTO [33]
## 
##    CODIGOMUNICIPIO    DEPARTAMENTO NOMBREMUNICIPIO     n
##              <int>          <fctr>          <fctr> <int>
## 1            11001          BOGOTA     BOGOTÁ D.C.  1459
## 2            76001           VALLE            CALI   438
## 3             5001       ANTIOQUIA        MEDELLIN   419
## 4             8001       ATLANTICO    BARRANQUILLA   341
## 5            13001         BOLIVAR       CARTAGENA   237
## 6            54001 NORTE SANTANDER          CUCUTA   167
## 7            73001          TOLIMA          IBAGUE   160
## 8            50001            META   VILLAVICENCIO   139
## 9            47001       MAGDALENA     SANTA MARTA   135
## 10           68001       SANTANDER     BUCARAMANGA   129
## # ... with 1,099 more rows
```

