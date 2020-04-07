###############################################################################3
# Interprete de LOGO
# Programa principal
# Autor: Kenneth Roy Cabrera Torres
###############################################################################3

## Cargar el archivo de funciones auxiliares.
source("funciones.R", encoding = "latin1")

## Solicita el archivo exterior.
nomb_archivo <- readline("Entre el archivo en logo: ")

## Preprocesamiento de archivo fuente.
prog1 <- readLines(nomb_archivo, encoding = "latin1")
## Quita los espacios en blanco repetidos.
prog1 <- gsub("[ ]+", " ", prog1)
## Lleva todos los comandos a minúsculas.
prog1 <- tolower(prog1)
## Quita los símbolos ":" y '"' del script.
prog1 <- gsub('\\:|\"', '', prog1)
## Selecciones solo las líneas que tienen código
prog1 <- prog1[prog1 != " " & prog1 != ""]
## Construye los ciclos en forma logo estándar.
prog1 <- construye_prog_rep(prog1)
## Elimina los espacios en blanco al iniciar el código.
prog1 <- gsub("^[ ]+", "", prog1)

## Construye una lista con cada comando o parámetro de manera dividida.
lista_prog <- strsplit(prog1, " ")

# Configuración de comandos logo básicos para traducirlos al R.
comandos <- sapply(lista_prog, function(x) x[[1]])

## Vector de salida de comando traducidos a R.
salidaCR <- vector(mode = "character")

# Inicio de cualquier programa de logo traducido a R.
salidaCR[1] <- "tortuga1 <- inicio_mundo()"
salidaCR[2] <- "dibuja_tortuga(tortuga1)"

# Conversión de cada comando a su equivalente R.
for (i in 1:length(comandos)){
  if(any(comandos[i] %in% comandos_basicos)){
  salidaCR[i + 2] <- switch(comandos[i],
         "bp" = inicio_mundo(),
         "gi" = construye_gi(lista_prog[[i]][2]),
         "gd" = construye_gd(lista_prog[[i]][2]),
         "av" = construye_av(lista_prog[[i]][2]),
         "cp" = construye_cp(paste("'",lista_prog[[i]][2], "'", sep = "")),
         "ot" = construye_ot(),
         "mt" = construye_mt(),
         "sp" = construye_sp(),
         "haga" = construye_haga(lista_prog[[i]][2], lista_prog[[i]][3]),
         "rep"  = construye_rep(lista_prog[[i]][2]),
         "fin_rep" = "}",
         "para" = construye_funcion(lista_prog[[i]][2], lista_prog[[i]][3]),
         "fin" = "return(tortuga1)}"
         )
  }else{
    salidaCR[i + 2] <- construye_llama_funcion(lista_prog[[i]][1], 
                                           lista_prog[[i]][2])
  }
}

# Escribe el archivo de salida en comandos R.

writeLines(salidaCR, "salida.R")

# Ejecución del código en R.

source("salida.R")

# Borra el espacio de trabajo ("Enviroment"). 
rm(list = ls())