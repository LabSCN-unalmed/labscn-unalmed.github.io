#función para graficar ambas curvas
graf<-function(u,p)
{
  #Correlación Exponencial
  fu1<-function(u,p) exp(-(u/p))

  #Rango práctico fcn Exponencial
  minExp<-u[which.max(fu1(u,p)<=0.05)]

  #Correlación Gaussiana
  fu2<-function(u,p) exp(-(u/p)^2)

  #Rango práctico fcn Gaussiana
  minGau<-u[which.max(fu2(u,p)<=0.05)]

  #Gráfico Exponencial
  plot(u,fu1(u,p),type='l',col=4,ylab = 'Corr',ylim=c(0,1),
       main='Comparación Exponencial vs Gausiana')

  #Gráfico Gaussiano
  lines(u,fu2(u,p),col=2)

  #Rango práctico
  abline(v=c(minExp,minGau),lty=c(3,3),col=c(4,2))
  text(c(minExp,minGau),c(0.6,0.8),col=c(4,2),
       as.expression(c(bquote(u==.(round(minExp,2))),bquote(u==.(round(minGau,2))))))

  #Legenda del gráfico
  legend("topright",legend=c('Exponencial','Gausiana',as.expression(bquote(Phi==.(p)))),
         col=c(4,2,0),lty=c(1,1),lwd=2)
}

#Generación del vector de datos desde 0 a 30 de tamaño 100.000
u<-seq(0,30,length.out=100000)

#Cargar el paquete "manipulate", o instalarlo si no lo tiene R
if(!require(manipulate)){
  install.packages("manipulate")
  library(manipulate)
}

#Función "manipulate" para modificar el gráfico con respecto a phi
manipulate(
  graf(u,p),

  #Como 'p' es el que varía, se crea el slider con los posibles valores
  p=slider(1,10,initial=3,label='Phi',step=.5)
)
