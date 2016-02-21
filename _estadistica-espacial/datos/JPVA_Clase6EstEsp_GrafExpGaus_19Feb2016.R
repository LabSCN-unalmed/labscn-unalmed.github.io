
#Clase 6: Estadística espacial
#Fecha: Febrero 19 de 2016
#Autor: Juan Pablo Valencia Arango
#Tema: Gráficos para funciones Gausianas y Exponencial


#Generación de secuencia de valores en los que se evaluarán las funciones
mu <- seq(0, 10, length=100)

#Valor de referencia para identificar rango práctico
a=0.05

# Gráficas para diferentes valores de phi
phi=10
rho_u1=exp(-(mu/phi)) #Función exponencial
rho_u12=exp(-(mu/phi)^2)#Función Gaussiana

phi=3
rho_u2=exp(-(mu/phi))#Función exponencial
rho_u22=exp(-(mu/phi)^2)#Función Gaussiana

phi=1
rho_u3=exp(-(mu/phi))#Función exponencial
rho_u32=exp(-(mu/phi)^2)#Función Gaussiana

phi=0.5
rho_u4=exp(-(mu/phi))#Función exponencial
rho_u42=exp(-(mu/phi)^2)#Función Gaussiana


#Gráfica de todos los casos en una sola ventana.
# Función Exponencial: Color rojo
# Función Gausiana: Color azul

par(mfrow = c(2, 2))#Divide la pantalla de graficación en dos filas y dos columnas
plot(mu,rho_u1,type="l",col="red",main="Rho 10")
lines(mu,rho_u12,type="l",col="blue")
abline(a,0)  
    
    
plot(mu,rho_u2,type="l",col="red",main="Rho 3")
lines(mu,rho_u22,type="l",col="blue")
abline(a,0)

plot(mu,rho_u3,type="l",col="red",main="Rho 1")
lines(mu,rho_u32,type="l",col="blue")
abline(a,0)


plot(mu,rho_u4,type="l",col="red",main="Rho 0.5")
lines(mu,rho_u42,type="l",col="blue")
abline(a,0)
