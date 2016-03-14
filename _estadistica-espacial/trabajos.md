---
layout: curso
title: 'Trabajos'
curso: 'estadistica-espacial'
custom_js: 'mathjax'
order: 05
---

## Trabajo en grupo (primer trabajo)

### Actividades

1. Formar grupos de máximo 3 personas.
2. Seleccionar dos variables de interés del grupo.
   Una de las variables, deberá ser un modelo Matérn y
   cercana a un modelo gausiano y la otra también Matérn, pero
   cercana a un modelo exponencial.
3. Para cada variable de interés, simular una 
   realización del campo aleatorio en donde
   el rango esté alrededor de la mitad de la distancia máxima.
4. Simular muestreos hasta obtener un tamaño de muestra que
   sea cercano al 80% de potencia para hallar la estructura espacial.
5. Repetir los pasos 3 y 4, pero con un rango que sea mayor de la distancia máxima.
   (alrededor de dos veces más).
6. Repetir los pasos 3 y 4, pero con un rango muy pequeño, alrededor de
   un 5% de la distancia máxima.
7. Repetir los pasos 3 hasta el 6 para cada variable de interés pero 
   cambiando la varianza en tres valores distintos.
8. Repetir el paso 7, pero esta vez cambiando el "efecto pepita",
   (nugget) en 30% de la varianza, 50% de la varianza y un 80% de la varianza.
9. Mostrar gráficas resumen en donde se puedan visualizar los resultados
   de los tamaños muestrales para cada uno de los escenarios simulados.
10. Realizar una presentación de los resultados obtenidos.

Valor de $$\sigma^2$$ usual:

|        |   Tipos de modelos    ||
|Rango   | Cercano a exponencial | Cercano a gausiano |
--------- |:-------------:|----------:|
|1/2 de la distancia máxima| efecto pepita  | efecto pepita  |
| | ($$\tau^2$$=0, 30%, 50% y 80% de $$\sigma^2$$) | ($$\tau^2$$=0, 30%, 50% y 80% de $$\sigma^2$$) |
|Doble de la distancia máxima| efecto pepita  | efecto pepita  |
| | ($$\tau^2$$=0, 30%, 50% y 80% de $$\sigma^2$$) | ($$\tau^2$$=0, 30%, 50% y 80% de $$\sigma^2$$) |
|5% de la distancia máxima| efecto pepita  | efecto pepita |
| | ($$\tau^2$$=0, 30%, 50% y 80% de $$\sigma^2$$) | ($$\tau^2$$=0, 30%, 50% y 80% de $$\sigma^2$$) |


* Repetir la tabla con dos valores de $$\sigma^2$$, por encima y por debajo
del valor usual.
   
### Documentos a entregar
1. Presentación en formato ".pdf" en donde se muestran los resultados
   obtenidos.
2. Guión o código en R, donde se documente el procedimiento utilizado
   para obtener los resultados de las simulaciones.

### Fecha de entrega

Viernes, 1 de abril de 2016 se realizará la exposición en clase.
Antes de las 23:59 hora de Colombia se entregarán los documentos pedidos,
al correo **krcabrer@unal.edu.co** con asunto **[EE]**.

### Tip del estudiante Cristian Santa

De acuerdo con el estudiante Cristian Santa, se sugiere hacer la simulación
utilizando varios núcleos de acuerdo a la guía que se encuentra en la
siguiente página:

[Ciclos paralelos en R para windows y linux](http://www.r-bloggers.com/parallel-r-loops-for-windows-and-linux/){:target="_blank"}
   
   
      
         
