################################################################################
# Simulación y ejemplo de cálculo mediante simulación de un tamaño
# de muestras para estimar una proporción
################################################################################

# Número de hombres y mujeres de un grupo en particular
numhombres <- 52
nummujeres <- 15

# Tamaño de muestra de la población
tammuestra <- 10
# Número de simulaciones para estimar el tamaño de muestra apropiado
nsim <- 2000

# Generar la población total
total <- c(rep("Hombre",numhombres),rep("Mujer",nummujeres))
total

# Tabla de frecuencia "real" a partir de la población
table(total)
# Proporción "real" a partir de la población
table(total)/sum(table(total))

# Estraer sólo la proporción de hombres
propHomR <- (table(total)/sum(table(total)))[1]
propHomR

# Generar una muestra aleatoria sin reemplazamiento
muestra <- sample(total,tammuestra)
muestra

# Tabla de frecuencia de la muestra
table(muestra)
# Proporción de la muestra
table(muestra)/sum(table(muestra))

# "Error" entre la proporción "real" y la de la "muestra"
# o diferencia entre la proporción "real" y la muestra
# Proporción real
pR <- table(total)/sum(table(total))
# Proporción de la muestra
pM <- table(muestra)/sum(table(muestra))
# Diferencia de las proporciones en valor absoluto
pR-pM
# Diferencia de las proporciones en valor absoluto
abs(pR-pM)

# Estimación de la distribución del la proporción utilizando
# un tamaño de muestra específico de acuerdo a la variable
# "tammuestra2" y replicado el número de simulaciones
simula1 <- data.frame(replicate(nsim,sample(total,tammuestra)))
# Cálculo de la proporción de hombres para cada muestra generada
propHom <- sapply(simula1,function(x) (table(x)/sum(table(x)))[1])

# Histograma de la proporciones de hombres de acuerdo a la muestra.
hist(propHom, col = "red")
# Resumen estadístico de la proporción simulada.
summary(propHom)
# Estimación del intervalo de confianza al 95%
quantile(propHom,c(0.025,0.975))

# Distribución del error
# Cálculo de la diferencia entre el valor "verdadero" y
# el valor obtenido de las muestras.
error1 <- propHomR-propHom
# Histograma de las diferencias, desviaciones o errores.
hist(error1,col="blue")
# Cálculo del intervalo de confianza al 95% de los errores.
quantile(error1,c(0.025,0.975))

