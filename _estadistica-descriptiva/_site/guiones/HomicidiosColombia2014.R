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
                     main = "Tasas de homicidios para cada cien mila habitantes"))

     