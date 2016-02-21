graf<-function(u,p)
{
  fu1<-function(u,p) exp(-(u/p))
  fu2<-function(u,p) exp(-(u/p)^2)
  plot(u,fu1(u,p),type='l',col=4,ylab = 'Corr',ylim=c(0,1),
       main='Comparación Exponencial vs Gausiana')
  lines(u,fu2(u,p),col=2)
  legend("topright",legend=c('Exponencial','Gausiana'),col=c(4,2),
         lty=c(1,1),lwd=2)
}

u<-seq(0,10,length.out=10000)

require(manipulate)
manipulate(
  graf(u,p),
  p=slider(1,10,initial=3,label='Phi',step=.5)
)
