---
layout: curso
title: 'Talleres'
curso: 'estadistica-descriptiva'
order: 4
---

## Talleres individuales

### Primer taller individual

Objetivo: Recolectar la información solicitada para el primer día de clase.

Entregar llena la [encuesta](./documentos/Encuesta201602.pdf) realizada el primer día de clase, martes
agosto 2 de 2016 en la hora de clase.


### Segundo taller individual

#### Objetivo:

Realizar una lectura de la base de datos de homicidios en Colombia
y mostrar una gráfica de barras que muestre la tasa de homicidios por
cada cien mil persoas de rangos de edades específicos ya sea de hombres o
de mujeres.

Si usted es mujer utilice la tasa de homicidios de los hombres y si es hombre
lo realiza con la tasa de homcidios de las mujeres.

#### Ejemplo del guión ([homicidiosColombia2014.R](./guiones/HomicidiosColombia2014.R))

```r
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
                     main = "Tasas de homicidios para cada cien mil habitantes"))     
```

#### Materiales a entregar:

 + Documento en formato ".pdf" en donde se muestre la gráfica realizada y
   un breve análisis de los resultados obtenidos.
 + Guión en R que muestre la manera como obtuvo la gráfica en formato ".R"
   debidamente documentado.

#### Fecha de entrega:

Miércoles 10 de agosto de 2016 antes de las 23:59 hora de colombia al correo
***krcabrer@unal.edu.co*** y no olvidar escribir en asunto **[EDAED]**.

### Tercer taller individual.

Responder en clase las siguientes dos preguntas:

1. Resuma en un párrafo el argumento principal del espisodio 1 de
   la primera temporada de Numb3rs.

2. Describa un detalle particular que le haya llamado la atención.

### Cuarto taller individual.

[Enunciado del cuarto taller individual](Taller4.html)  

## Primer taller en grupo

### Objetivo
Recolectar datos para realizar una análisis exploratorio que permita
determinar que factores influencian el tiempo de reacción.

### Actividades

 - Población objetivo: Estudiantes universitarios que residan en
   el Valle del Aburrá.
 - Marco muestral: Estudiantes amigos o conocidos de los integrantes
   del grupo.
 - Formar un grupo de trabajo de máximo cinco (5) estudiantes.
 - Tomar el tiempo de reacción utilizando el juego que se encuentra
   en la página de [HumanBenchmark](http://www.humanbenchmark.com/tests/reactiontime),
   a por lo menos cincuenta (50) personas.
   Se perimitirá que se juegue el juego dos veces a manera de práctica.
   Se tomará como dato definitivo la tercera vez que realice el juego completo.
   Un juego completo es el promedio de los cinco (5) intentos.
   Sin embargo se registrarán todos los tiempos de los tres juegos realizados y
   también se llevarán a la base de datos.

 - Las variables que se tomarán serán las siguientes:
   + Tiempo promedio de los cinco intentos a la primera vez que realice el juego
     (milisegundos ms).
   + Tiempo promedio de los cinco intentos a la segunda vez que realice el juego
       (milisegundos ms).  
   + Tiempo promedio de los cinco intentos a la tercera vez que realice el juego
         (milisegundos ms).       
   + Demográficas
     * Edad (Años complidos).
     * Género (Femenino, Masculino).
     * Estatura (cm).
     * Ancho de la mano (cm)
     * Carrera.     
   + Tecnológicas
     * Velocidad del computador en donde se hace el ejercicio. (Megaherz Mhz)
     * Nivel promedio de ruido durante la toma del experimento de la tercera vez
       (Decibeles dB).
     * Dimensiones del mouse utilizado en la toma del juego.
       1. Ancho (mm).
       2. Largo (mm).
       3. Grueso o alto (mm).
     * Dimensión de la pantalla del computador utilizada en el juego.
       1. Ancho (cm).
       2. Largo (cm).
   + Hábitos de consumo
     * Última comida (Desayuno, almuerzo o cena).
     * Hace cuánto consumió esa comida (Horas o fracciones de hora).
     * Último tipo de bebida consumida fuera de la comida
       (Café, gasesosa, energizante, jugo natural, aromática, té, ninguna).
     * Hace cuánto tiempo consumió esa última bebida (Horas o fracciones de hora).
     * Hora del día cuando realizó el juego de reacción (En formato 24 horas).
     * Número de horas que durmió la noche anterior (Horas o fracción).
     * Hora a la que se levantó ese día (En formato 24 horas).
   + Actividades físicas
     * Tipo de jugador de video juegos (hasta tres (3) en los que se considera que
       tiene mayor habilidad), de acuerdo a la clasificación la página de [historia y tipos de videojuegos](http://listas.20minutos.es/lista/todas-las-consolas-de-la-historia-videoconsolas-de-todas-las-generaciones-301580/).
       1. Generación (Número entero).
       2. Nombre (Por ejemplo Playstation 2, Nintendo DS, Game Boy, Playstation,
         Wii, Xbox 360, Super Nintendo, Xbox One, etc) (Sarta o *string*).
     * Horas a la semana de juego en videojuegos (horas).
     * Practica algún deporte de actividad física más de 8 horas a la semana (Si, No).
     * Tiene alguna afición o pasatiempo (hobbie) de destreza manual fina
       (Toca instrumento, manualidades, dibujo, pintura, etc.)
     * Horas a la semana que practica la afición o pasatiempo (hobbie) (horas o fracciones).

 - El grupo puede decidir aumentar el número de variables que considere importantes
   y que influencien el desempeño en el juego.

### Documentos a entegar.

   - Hoja de Excel con los datos recolectados al correo **krcabrer@unal.edu.co**
   el día viernes 16 de septiembre de 2016 antes de las 23:59 hora de Colombia y
   no olvidar mencionar en asunto **[EDAED]** y en el correo el **nombre completo** y
   **la identificación** de los integrantes del grupo.

   -  Seguir la plantilla o el formato de la
      [hoja de Excel](./basesdedatos/TiempoReacción.xlsx) propuesta, todas las
      variables adicionales irán al final de las columnas de la plantilla.

   - Si el grupo añadió variables, en otra hoja del mismo archivo de Excel,
      realizar la explicación de las variables adicionales.  
