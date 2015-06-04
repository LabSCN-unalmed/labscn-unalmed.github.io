---
layout: curso
title: 'Trabajos'
curso: 'programacion-R'
order: 04
---

## Trabajo final

### Objetivo

Realizar un script en R para leer un archivo de texto plano que permita
hacer la predicción sobre valores de una red neuronal.

### Condiciones de guión o scrpit.

1. Los archivos de lectura (entrada) son:
   - Un archivo plano con los coeficientes y estrucutra de la red neuronal.
     Se puede ensayar con estos dos archivos:
     * [Red neuronal 1](redNeuronal1.txt)
     * [Red neuronal 2](redNeuronal2.txt)
   - Un archivo en formato ".csv" con los valores de las variables para
     varios regístros a los que se les pretende hacer la predicción.
     Un ejemplo para de archivo de datos para la primera red neuronal es:
     * [datos.csv](datos.csv)
2. El archivo de escritura (salida) es:
   - Un archivo en formato ".csv" con los mismos valores de entrada y
     con una columna adicional en donde se muestra el resultado de
     la predicción de la red neuronal.
3. La lectura de los archivo **no** se permitirán rutas de archivos absolutas como:
   "C:\usuario\mis documentos", tampoco funciones como "`file.choose()`".
4. El formato del archivo de salida será ".csv" y deberá tener el mismo nombre
   del archivo de entrada ".csv" pero añadiéndole el sufijo "_pred". Es decir
   si el archivo de entrada se denomina "datos.csv", el de saluda será "datos_pred.csv".
5. El trabajo es individual, por lo tanto no se permiten copias o clones como
   solución al ejercicio, porque cada persona lo hace diferente.


### Entregables

   Guión o script en formato ".R" **documentado**, que realize la lectura del formato
   plano y de los datos de la red neuronal con el fin de añadir la
   clasificación que realiza la red neuronal como una columna adicional
   de la base de datos.

### Fecha de entrega
  
   Sábado 13 de junio de 2015 antes de la 17:59 hora de Colombia al correo
   "krcabrer@unal.edu.co" en asunto escribir ModuloR.

### Evaluación

   El script será calificado correctamente si al cambiar el nombre del archivo,
   por otro archivo y otra base de datos, realice la predicción y genere el archivo
   de salida correctamente coresponde al 60% de la calificación final.

   Criterios complementarios:

   - Documentación adecuada. (10%). Se refiere a que se diga, qué es lo que
     hacen las funciones, o las instrucciones.
   - Uso de las características vectoriales del R. (10%)
   - Construcción de funciones que faciliten el proceso. (10%)
   - Uso eficiente de las expresiones regulares. (10%).

   
