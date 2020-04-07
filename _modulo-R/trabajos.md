---
layout: curso
title: 'Trabajos'
curso: 'modulo-R'
order: 4
---

## Trabajo final.

### Objetivo.

Realizar un programa en R que sea intérprete de comandos básicos del [lenguaje LOGO o el lenguaje de la tortuga](https://es.wikipedia.org/wiki/Logo_%28lenguaje_de_programaci%C3%B3n%29).

### Especificaciones:

1. Constituir grupos de máximo tres (3) personas.
2. El código deberá hacer como mínimo intérprete de los siguientes comandos de LOGO:

```
av nn : Avanza nn pasos.
gi nn : gira a la izquierda nn grados.
gd nn : gira a la derecha nn grados.
bp    : borra pantalla
rep nn [acciones]  : repite nn veces las "acciones".
mt    : Mostrar tortuga.
ot    : Ocultar tortuga.
sp    : sin pluma
cp <color> : con pluma de <color>

haga "var <valor>

:var

para nombre_funcion :parametro
  <instrucion logo>
  <instrucion logo>
  <instrucion logo>
fin

nombre_funcion valor_parametro
```

### Condiciones

1. La pantalla principal deberá ser con centro en (0, 0) y
   mínimo de -50:50 en el eje x, y de -50:50 en el eje y.
2. Los colores mínimos que debe usar son:
   - negro.
   - rojo.
   - verde.
   - azul.
   - cian.
   - magenta.
   - amarillo.
   - gris.
   - Cualquier color en formato hexedecimal (#nnnnnn).
3. Si el código interpreta lo mínimo tiene una calificación de 3.0.
4. No se permitirá el uso de ningún paquete adicional en el R. Sólo con los paquetes que vienen incorporados por omisión.
5. Aumentar la funcionalidad del logo con otras funcionalidades, como:
   - Que el recorrido de la "tortuga" sea animado.
   - Que aumente el número de comando disponibles.
   - Que se permita constuir funciones desde LOGO.
   - Que permita tener la estructura de decisión.
   - Alguna adición creativa e interesante al interprete básico del LOGO.

6. El mejor grupo tendrá la calificación máxima y cada grupo será ranqueado de acuerdo a sus resultados y de acuerdo a ese ranqueo será la calificación del trabajo final.

### Fecha de entrega:

Lunes 18 de noviembre de 2019 antes de las 24:59 hora de Colombia.
Enviar al correo:

  1. Código(s) en formato ".R" del intérpete de LOGO.
  2. Indicación y ejemplo con los elementos adicionales a lo básico del intérprete.
  3. Video que muestre la ejecución de un código de LOGO.
  4. Enviar el código y el listado de los integrantes al correo: **krcabrer@unal.edu.co**.
  5. No olvidar escribir en asunto **[ModuloR]**.


## Ejemplo de solución al intérprete de LOGO.


  - Código del [intérpete de logo](./logo/interprete_logo.R).
  - [Funciones auxiliares](./logo/funciones.R).
  - [Código de LOGO](./logo/prueba1.logo) para prueba.
  - [Video con la demostración de ejecución del código en LOGO](./logo/prueba1.mp4)


<!--

## Trabajo final.

### Objetivo.

Realizar el juego de [puntos y cuadros](https://es.wikipedia.org/wiki/Timbiriche_(juego)),
de tal forma que el usuario juegue contra el computador.

### Ejemplo del juego.

En [esta página web](http://dotsandboxes.org/) se permite mirar el funcionamiento del juego.

### Fecha de entrega.

Miércoles, 28 de agosto de 2019 en horario de clase.




### Consideraciones.

- Se organizarán en grupos de máximo tres (3) personas.
- Se plantearán las reglas del juego.
    - Inicio del juego.
    - Desarrollo del juego.
    - Finalización del juego.
- Se constuirá un código en R para simular
  el juego de dominó con animación gráfica.

### Archivos para entregar.

- Máximo dos archivos de código:
   - Archivo con código del programa principal.
   - Archivo con funciones auxiliares.


### Aspectos de evaluación.

#### Forma.

  - Manejo gráfico de la interfaz del juego.

#### Fondo.

  - Estrategia de juego del computador vs el jugador.

### Fecha de entrega.

Viernes 20 de octubre de 2017 en hora de clase.




## Trabajo final

### Objetivo

Por grupos de máximo tres personas realizar una análisis
de dos grabaciones de un hombre y una mujer y mostrar
las características que se pueden utilizar para
diferenciar el género por las descomposición en
frecuencias de la respectiva señal de voz.

### Ejemplo de uso de grabaciones en R.

- [Código](./codigos/final1.nb.html)
- [Hola](./codigos/hola1.wav)
- [Buenos días](./codigos/buenosdias.wav)

### Ejemplo de la descompisión de Fourier.

- [Análisis de Fourier](./codigos/fourier1.nb.html)

### Resultados esperados.

 1. Archivo ".html" con el informe que muestre el
    análisis y las características que distinguen
    la voz de un hombre de la voz de una mujer.
 2. Archivo ".Rmd" con los códigos correspondientes.
 3. Archivos de sonido o de voces utilizadas.

  -->
