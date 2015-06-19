---
layout: clase
title: 'Elementos introductorios'
curso: 'cartografia-digital'
clase: 1
---

Introducción a GNU/Linux
------------------------

La filosofía del curso es utilizar software libre porque...

En entornos GNU/Linux es muy común el manejo por medio de la terminal de comandos...

## Comandos esenciales

<!-- http://hipertextual.com/archivo/2014/04/comandos-basicos-terminal/ -->

La terminal es una herramienta muy sencilla pero sumamente poderosa, permite interactuar con el sistema por medio de comandos, en el siguiente ejercicio vamos a aprender los comandos más básicos para desenvolvernos dentro de la terminal.

### Sintáxis básica de los comandos en la terminal de GNU/Linux

~~~
comando -opciones parametro1 parametro2
~~~

### pwd

El comando `pwd` (print working directory) imprime la ruta del directorio actual, es muy conveniente utilizarlo para conocer en qué parte del sistema de archivos estamos ubicados:

~~~
pwd
~~~

### mkdir

El comando `mkdir` (make directory) nos sirve para crear un directorio o carpeta a partir de nuestra ubicación actual.

Para crear la carpeta LabSCN en nuestra ubicación actual utilizamos el siguiente comando:

~~~
mkdir directorio
~~~

Este comando también cuenta con una opción bastante útil que permite crear un árbol de directorios de manera simultánea. Por ejemplo, suponiendo que si queremos crear el directorio `clase1` dentro del directorio `ejercicios`, utilizamos la opción `-p`:

~~~
mkdir -p ejercicios/clase1
~~~

### cd

El comando `cd` (change diretory) permite cambiar de directorio, permite ubicarse en una ruta diferente a la actual.

Para acceder al directorio de ejercicios utilizamos el siguiente comando:

~~~
cd directorio
~~~

Comprobamos nuestra ruta actual con el comando `pwd`.

Si deseamos subir un nivel en el árbol de directorios (es decir, para ubicarnos en el directorio que contiene a nuestro directorio actual) se utiliza el siguiente comando:

~~~
cd ..
~~~

Nuevamente comprobamos la ruta actual con `pwd`.

También se puede ingresar a un directorio varios niveles abajo en el árbol de directorios especificando la ruta:

~~~
cd ejercicios/clase1
~~~

Comprobar con `pwd`.

Y si queremos volver al directorio anterior se utiliza el comando:

~~~
cd -
~~~

Una vez más, comprobar con `pwd`.

### touch

El comando `touch` crea un archivo vacío. Si el archivo ya existe, el comando actualiza la hora de modificación.

Para crear el archivo `prueba1.txt` dentro del directorio actual:

~~~
touch prueba1.txt
~~~

Para crear el archivo `prueba2.txt` dentro del directorio `ejercicios/clase1`:

~~~
touch ejercicios/clase1/prueba2.txt
~~~

### ls

El comando `ls` (listar) permite obtener una lista del contenido del directorio actual:

~~~
ls
~~~

El comando `ls` tiene varias opciones que permiten organizar la información brindada, por ejemplo, para ver los elementos ocultos se utiliza la opción `-a` (all):

~~~
ls -a
~~~

Para ver una lista larga y detallada de los elementos, se utiliza la opción `-l` (long):

~~~
ls -l
~~~

Estas opciones se pueden combinar en un sólo comando, que permite ver una lista larga de todos los elementos (incluyendo los ocultos):

~~~
ls -la
~~~

Opcionalmente, si queremos ver la lista de un directorio diferente al actual, al comando `ls` se le puede indicar la ruta de dicho directorio como un parámetro, e incluso podemos especificar las opciones:

~~~
ls directorio
ls -l ejercicios
ls -la ejercicios/clase1
~~~

### cp

### mv

### rm

### cat

### less

### Consideraciones generales

## Hola Mundo!

Script básico y cómo ejecutarlo

~~~
bash holaMundo.sh
~~~