require(ggplot2) #Cargando paquete ggplot2

#Se define un objeto con las base de datos y las variables a graficar
h<-ggplot(data = data.frame(u = c(0,10)),aes(u))
#Se define la funci�n de correlaci�n para phi = 3 (exponencial)
h<-h +stat_function(fun = function(u){exp(-u/3)}, aes(col = 'exp phi = 3'))
#Se define la funci�n de correlaci�n para phi = 3 (Gaussiana)
h<-h+stat_function(fun = function(u){exp(-(u/3)^2)}, aes(col = 'gauss phi = 3'))
#Se define la l�nea de intercepto en rho(u) = 0.05
h<-h+geom_hline(yintercept = 0.05, linetype = 'dashed', col = 'red')
#Cambiar el aspecto del gr�fico
h<- h + ylab(expression(rho (u)))+theme_bw()+
  theme(axis.title.x = element_text(face = "bold", size = 15),
        axis.title.y = element_text(face = "bold",size = 15))

#Producci�n del gr�fico
h
