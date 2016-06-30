---
layout: clase
title: 'Programación orientada a objetos en R'
curso: 'programacion-R'
clase: 12
order: 12
custom_js: 'mathjax'
---


## Orientación a objetos S3

Mostrar el código interno de la función `summary`.

```r
summary
```

```
## function (object, ...)
## UseMethod("summary")
## <bytecode: 0x2dd4720>
## <environment: namespace:base>
```



```r
x <- factor(rep(c("a", "b"), c(7, 13)))
class(x)
```

```
## [1] "factor"
```

```r
summary(x)
```

```
##  a  b
##  7 13
```

```r
y <- rnorm(20)
class(y)
```

```
## [1] "numeric"
```

```r
summary(y)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
## -1.4960 -1.0000  0.4186  0.1007  0.7112  2.6390
```

```r
modelo1 <- lm(y ~ x)
class(modelo1)
```

```
## [1] "lm"
```



```r
methods(summary)
```

```
##  [1] summary.aov                    summary.aovlist*              
##  [3] summary.aspell*                summary.check_packages_in_dir*
##  [5] summary.connection             summary.data.frame            
##  [7] summary.Date                   summary.default               
##  [9] summary.ecdf*                  summary.factor                
## [11] summary.glm                    summary.infl*                 
## [13] summary.lm                     summary.loess*                
## [15] summary.manova                 summary.matrix                
## [17] summary.mlm*                   summary.nls*                  
## [19] summary.packageStatus*         summary.PDF_Dictionary*       
## [21] summary.PDF_Stream*            summary.POSIXct               
## [23] summary.POSIXlt                summary.ppr*                  
## [25] summary.prcomp*                summary.princomp*             
## [27] summary.proc_time              summary.srcfile               
## [29] summary.srcref                 summary.stepfun               
## [31] summary.stl*                   summary.table                 
## [33] summary.tukeysmooth*          
## see '?methods' for accessing help and source code
```

```r
summary.factor
```

```
## function (object, maxsum = 100, ...)
## {
##     nas <- is.na(object)
##     ll <- levels(object)
##     if (any(nas))
##         maxsum <- maxsum - 1
##     tbl <- table(object)
##     tt <- c(tbl)
##     names(tt) <- dimnames(tbl)[[1L]]
##     if (length(ll) > maxsum) {
##         drop <- maxsum:length(ll)
##         o <- sort.list(tt, decreasing = TRUE)
##         tt <- c(tt[o[-drop]], `(Other)` = sum(tt[o[drop]]))
##     }
##     if (any(nas))
##         c(tt, `NA's` = sum(nas))
##     else tt
## }
## <bytecode: 0x21a3428>
## <environment: namespace:base>
```

```r
summary.default
```

```
## function (object, ..., digits = max(3L, getOption("digits") -
##     3L))
## {
##     if (is.factor(object))
##         return(summary.factor(object, ...))
##     else if (is.matrix(object))
##         return(summary.matrix(object, digits = digits, ...))
##     value <- if (is.logical(object))
##         c(Mode = "logical", {
##             tb <- table(object, exclude = NULL)
##             if (!is.null(n <- dimnames(tb)[[1L]]) && any(iN <- is.na(n))) dimnames(tb)[[1L]][iN] <- "NA's"
##             tb
##         })
##     else if (is.numeric(object)) {
##         nas <- is.na(object)
##         object <- object[!nas]
##         qq <- stats::quantile(object)
##         qq <- signif(c(qq[1L:3L], mean(object), qq[4L:5L]), digits)
##         names(qq) <- c("Min.", "1st Qu.", "Median", "Mean", "3rd Qu.",
##             "Max.")
##         if (any(nas))
##             c(qq, `NA's` = sum(nas))
##         else qq
##     }
##     else if (is.recursive(object) && !is.language(object) &&
##         (n <- length(object))) {
##         sumry <- array("", c(n, 3L), list(names(object), c("Length",
##             "Class", "Mode")))
##         ll <- numeric(n)
##         for (i in 1L:n) {
##             ii <- object[[i]]
##             ll[i] <- length(ii)
##             cls <- oldClass(ii)
##             sumry[i, 2L] <- if (length(cls))
##                 cls[1L]
##             else "-none-"
##             sumry[i, 3L] <- mode(ii)
##         }
##         sumry[, 1L] <- format(as.integer(ll))
##         sumry
##     }
##     else c(Length = length(object), Class = class(object), Mode = mode(object))
##     class(value) <- c("summaryDefault", "table")
##     value
## }
## <bytecode: 0x2dcc6c0>
## <environment: namespace:base>
```

```r
getAnywhere(summary.loess)
```

```
## A single object matching 'summary.loess' was found
## It was found in the following places
##   registered S3 method for summary from namespace stats
##   namespace:stats
## with value
##
## function (object, ...)
## {
##     class(object) <- "summary.loess"
##     object
## }
## <bytecode: 0x2977b30>
## <environment: namespace:stats>
```

### Problema


```r
estadisticos <- function(x) {
  n = length(x)
  p = mean(x)
  mu = n*p
  sigma = sqrt(n*p*(1-p))
  return( list(mu = mu, sigma = sigma, n = n) )
}

y1 <- rbinom(100, size = 1, p = 0.3)
estadisticos(y1)
```

```
## $mu
## [1] 29
##
## $sigma
## [1] 4.537621
##
## $n
## [1] 100
```

```r
y2 <- rnorm(100, mean = 0.3, sd = 1)
estadisticos(y2)
```

```
## $mu
## [1] 23.46921
##
## $sigma
## [1] 4.238062
##
## $n
## [1] 100
```

```r
mean(y2)
```

```
## [1] 0.2346921
```

```r
sd(y2)
```

```
## [1] 0.8793631
```

### Definición de clases


```r
as.binomial <- function(x) {
 class(x) <- "binomial"
 return( x )
}

as.normal <- function(x) {
 class(x) <- "normal"
 return( x )
}
```

### Creación de instancias


```r
y1 <- as.binomial(y1)
class(y1)
```

```
## [1] "binomial"
```

```r
y2 <- as.normal(y2)
class(y2)
```

```
## [1] "normal"
```

## Definición de métodos


```r
estadisticos <- function(x) UseMethod("estadisticos")

estadisticos.binomial <- function(x) {
  n = length(x)
  p = mean(x)
  mu = n*p
  sigma = sqrt(n*p*(1-p))
  return( list(mu = mu, sigma = sigma, n = n) )
}

estadisticos.normal <- function(x) {
  n = length(x)
  mu = mean(x)
  sigma = sd(x)
  return( list(mu = mu, sigma = sigma, n = n) )
}

estadisticos.default <- function(x) stop("¡Datos con distribución desconocida!")
```

### Polimorfismo


```r
estadisticos(y1)
```

```
## $mu
## [1] 29
##
## $sigma
## [1] 4.537621
##
## $n
## [1] 100
```

```r
estadisticos(y2)
```

```
## $mu
## [1] 0.2346921
##
## $sigma
## [1] 0.8793631
##
## $n
## [1] 100
```

```r
y3 <- rnorm(100,mean=2,sd=1)
estadisticos(y3)
```

```
## Error in estadisticos.default(y3): ¡Datos con distribución desconocida!
```

### Herencia


```r
as.standardNormal <- function(x){
x <- as.normal(x)
class(x) <- c("standardNormal", class(x))
return( x )
}

estadisticos.standardNormal <- function(x){
object <- estadisticos.normal(x)
object$sigma <- 1
return(object)
}

y4<-rnorm(100)

y4<-as.standardNormal(y4)

estadisticos(y4)
```

```
## $mu
## [1] 0.09918677
##
## $sigma
## [1] 1
##
## $n
## [1] 100
```

```r
class(y4)
```

```
## [1] "standardNormal" "normal"
```

### Encapsulamiento


```r
juan <- list(height = 173,
            weight = 75, name = "Juan")
class(juan) <- "persona"
class(juan)
```

```
## [1] "persona"
```

```r
print(juan)
```

```
## $height
## [1] 173
##
## $weight
## [1] 75
##
## $name
## [1] "Juan"
##
## attr(,"class")
## [1] "persona"
```

```r
print.persona <- function(x, ...) {
 cat("Nombre:", x$name, "\n")
 cat("Estatura:", x$height, "metros", "\n")
 cat("Peso:", x$weight, "kilogramos", "\n")
}

print(juan)
```

```
## Nombre: Juan
## Estatura: 173 metros
## Peso: 75 kilogramos
```

```r
juan
```

```
## Nombre: Juan
## Estatura: 173 metros
## Peso: 75 kilogramos
```

### Funciones útiles


```r
methods("print")
```

```
##   [1] print.acf*                                        
##   [2] print.AES*                                        
##   [3] print.anova*                                      
##   [4] print.aov*                                        
##   [5] print.aovlist*                                    
##   [6] print.ar*                                         
##   [7] print.Arima*                                      
##   [8] print.arima0*                                     
##   [9] print.AsIs                                        
##  [10] print.aspell*                                     
##  [11] print.aspell_inspect_context*                     
##  [12] print.bibentry*                                   
##  [13] print.Bibtex*                                     
##  [14] print.browseVignettes*                            
##  [15] print.by                                          
##  [16] print.bytes*                                      
##  [17] print.changedFiles*                               
##  [18] print.check_code_usage_in_package*                
##  [19] print.check_compiled_code*                        
##  [20] print.check_demo_index*                           
##  [21] print.check_depdef*                               
##  [22] print.check_details*                              
##  [23] print.checkDocFiles*                              
##  [24] print.checkDocStyle*                              
##  [25] print.check_doi_db*                               
##  [26] print.check_dotInternal*                          
##  [27] print.checkFF*                                    
##  [28] print.check_make_vars*                            
##  [29] print.check_nonAPI_calls*                         
##  [30] print.check_package_code_assign_to_globalenv*     
##  [31] print.check_package_code_attach*                  
##  [32] print.check_package_code_data_into_globalenv*     
##  [33] print.check_package_code_startup_functions*       
##  [34] print.check_package_code_syntax*                  
##  [35] print.check_package_code_unload_functions*        
##  [36] print.check_package_compact_datasets*             
##  [37] print.check_package_CRAN_incoming*                
##  [38] print.check_package_datasets*                     
##  [39] print.check_package_depends*                      
##  [40] print.check_package_description*                  
##  [41] print.check_package_description_encoding*         
##  [42] print.check_package_license*                      
##  [43] print.check_packages_in_dir*                      
##  [44] print.check_packages_in_dir_changes*              
##  [45] print.check_packages_used*                        
##  [46] print.check_po_files*                             
##  [47] print.checkRd*                                    
##  [48] print.check_Rd_contents*                          
##  [49] print.check_Rd_line_widths*                       
##  [50] print.check_Rd_metadata*                          
##  [51] print.check_Rd_xrefs*                             
##  [52] print.checkReplaceFuns*                           
##  [53] print.checkS3methods*                             
##  [54] print.check_so_symbols*                           
##  [55] print.check_T_and_F*                              
##  [56] print.checkTnF*                                   
##  [57] print.check_url_db*                               
##  [58] print.check_vignette_index*                       
##  [59] print.checkVignettes*                             
##  [60] print.citation*                                   
##  [61] print.codoc*                                      
##  [62] print.codocClasses*                               
##  [63] print.codocData*                                  
##  [64] print.colorConverter*                             
##  [65] print.compactPDF*                                 
##  [66] print.condition                                   
##  [67] print.connection                                  
##  [68] print.CRAN_package_reverse_dependencies_and_views*
##  [69] print.data.frame                                  
##  [70] print.Date                                        
##  [71] print.default                                     
##  [72] print.dendrogram*                                 
##  [73] print.density*                                    
##  [74] print.difftime                                    
##  [75] print.dist*                                       
##  [76] print.Dlist                                       
##  [77] print.DLLInfo                                     
##  [78] print.DLLInfoList                                 
##  [79] print.DLLRegisteredRoutines                       
##  [80] print.dummy_coef*                                 
##  [81] print.dummy_coef_list*                            
##  [82] print.ecdf*                                       
##  [83] print.factanal*                                   
##  [84] print.factor                                      
##  [85] print.family*                                     
##  [86] print.fileSnapshot*                               
##  [87] print.findLineNumResult*                          
##  [88] print.formula*                                    
##  [89] print.fseq*                                       
##  [90] print.ftable*                                     
##  [91] print.function                                    
##  [92] print.getAnywhere*                                
##  [93] print.glm*                                        
##  [94] print.hclust*                                     
##  [95] print.help_files_with_topic*                      
##  [96] print.hexmode                                     
##  [97] print.HoltWinters*                                
##  [98] print.hsearch*                                    
##  [99] print.hsearch_db*                                 
## [100] print.htest*                                      
## [101] print.html*                                       
## [102] print.html_dependency*                            
## [103] print.infl*                                       
## [104] print.integrate*                                  
## [105] print.isoreg*                                     
## [106] print.kmeans*                                     
## [107] print.knitr_kable*                                
## [108] print.Latex*                                      
## [109] print.LaTeX*                                      
## [110] print.libraryIQR                                  
## [111] print.listof                                      
## [112] print.lm*                                         
## [113] print.loadings*                                   
## [114] print.loess*                                      
## [115] print.logLik*                                     
## [116] print.ls_str*                                     
## [117] print.medpolish*                                  
## [118] print.MethodsFunction*                            
## [119] print.mtable*                                     
## [120] print.NativeRoutineList                           
## [121] print.news_db*                                    
## [122] print.nls*                                        
## [123] print.noquote                                     
## [124] print.numeric_version                             
## [125] print.object_size*                                
## [126] print.octmode                                     
## [127] print.packageDescription*                         
## [128] print.packageInfo                                 
## [129] print.packageIQR*                                 
## [130] print.packageStatus*                              
## [131] print.pairwise.htest*                             
## [132] print.PDF_Array*                                  
## [133] print.PDF_Dictionary*                             
## [134] print.pdf_doc*                                    
## [135] print.pdf_fonts*                                  
## [136] print.PDF_Indirect_Reference*                     
## [137] print.pdf_info*                                   
## [138] print.PDF_Keyword*                                
## [139] print.PDF_Name*                                   
## [140] print.PDF_Stream*                                 
## [141] print.PDF_String*                                 
## [142] print.person*                                     
## [143] print.persona                                     
## [144] print.POSIXct                                     
## [145] print.POSIXlt                                     
## [146] print.power.htest*                                
## [147] print.ppr*                                        
## [148] print.prcomp*                                     
## [149] print.princomp*                                   
## [150] print.proc_time                                   
## [151] print.raster*                                     
## [152] print.Rd*                                         
## [153] print.recordedplot*                               
## [154] print.restart                                     
## [155] print.RGBcolorConverter*                          
## [156] print.rle                                         
## [157] print.roman*                                      
## [158] print.sessionInfo*                                
## [159] print.shiny.tag*                                  
## [160] print.shiny.tag.list*                             
## [161] print.simple.list                                 
## [162] print.smooth.spline*                              
## [163] print.socket*                                     
## [164] print.srcfile                                     
## [165] print.srcref                                      
## [166] print.stepfun*                                    
## [167] print.stl*                                        
## [168] print.StructTS*                                   
## [169] print.subdir_tests*                               
## [170] print.summarize_CRAN_check_status*                
## [171] print.summary.aov*                                
## [172] print.summary.aovlist*                            
## [173] print.summaryDefault                              
## [174] print.summary.ecdf*                               
## [175] print.summary.glm*                                
## [176] print.summary.lm*                                 
## [177] print.summary.loess*                              
## [178] print.summary.manova*                             
## [179] print.summary.nls*                                
## [180] print.summary.packageStatus*                      
## [181] print.summary.ppr*                                
## [182] print.summary.prcomp*                             
## [183] print.summary.princomp*                           
## [184] print.summary.table                               
## [185] print.table                                       
## [186] print.tables_aov*                                 
## [187] print.terms*                                      
## [188] print.ts*                                         
## [189] print.tskernel*                                   
## [190] print.TukeyHSD*                                   
## [191] print.tukeyline*                                  
## [192] print.tukeysmooth*                                
## [193] print.undoc*                                      
## [194] print.vignette*                                   
## [195] print.warnings                                    
## [196] print.xgettext*                                   
## [197] print.xngettext*                                  
## [198] print.xtabs*                                      
## see '?methods' for accessing help and source code
```

```r
methods(class = "lm")
```

```
##  [1] add1           alias          anova          case.names    
##  [5] coerce         confint        cooks.distance deviance      
##  [9] dfbeta         dfbetas        drop1          dummy.coef    
## [13] effects        extractAIC     family         formula       
## [17] hatvalues      influence      initialize     kappa         
## [21] labels         logLik         model.frame    model.matrix  
## [25] nobs           plot           predict        print         
## [29] proj           qr             residuals      rstandard     
## [33] rstudent       show           simulate       slotsFromS3   
## [37] summary        variable.names vcov          
## see '?methods' for accessing help and source code
```

```r
getS3method("print","persona")
```

```
## function(x, ...) {
##  cat("Nombre:", x$name, "\n")
##  cat("Estatura:", x$height, "metros", "\n")
##  cat("Peso:", x$weight, "kilogramos", "\n")
## }
```

```r
residuals.HoltWinters
```

```
## Error in eval(expr, envir, enclos): objeto 'residuals.HoltWinters' no encontrado
```

```r
getS3method("residuals.HoltWinters")
```

```
## Error in getS3method("residuals.HoltWinters"): no function 'residuals.HoltWinters' could be found
```

```r
getAnywhere("residuals.HoltWinters")
```

```
## A single object matching 'residuals.HoltWinters' was found
## It was found in the following places
##   registered S3 method for residuals from namespace stats
##   namespace:stats
## with value
##
## function (object, ...)
## object$x - object$fitted[, 1]
## <bytecode: 0x33aa830>
## <environment: namespace:stats>
```
