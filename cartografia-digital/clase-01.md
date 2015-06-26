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

## El prompt

~~~
usuario@equipo:~ $
~~~

## Comandos esenciales

La terminal es una herramienta muy sencilla pero sumamente poderosa, permite interactuar con el sistema por medio de comandos, en el siguiente ejercicio vamos a aprender los comandos más básicos para desenvolvernos dentro de la terminal.

### Sintáxis básica de los comandos en la terminal de GNU/Linux

En la terminal, los comandos conservan una estructura de cómo deben ser introducidos para ser interpretados correctamente. En términos genéricos, esta es la estructura para la mayoría de los comandos en GNU/Linux:

~~~
comando -opciones parametro1 parametro2
~~~

A continuación se enumeran una serie de comandos básicos para el uso en la terminal, con ejemplos ilustrativos de las operaciones que permiten realizar.

### pwd

El comando `pwd` (print working directory) imprime la ruta del directorio actual, es muy conveniente utilizarlo para conocer en qué parte del sistema de archivos se está ubicado:

~~~
pwd
~~~

~~~
/home/usuario
~~~
{: .output}

### mkdir

El comando `mkdir` (make directory) crea un directorio o carpeta.

Para crear `directorio` en la ubicación actual:

~~~
mkdir directorio
~~~

Este comando también cuenta con una opción bastante útil que permite crear un árbol de directorios de manera simultánea. Por ejemplo, suponiendo que se quiere crear el directorio `clase1` dentro del directorio `ejercicios`, se utiliza la opción `-p`:

~~~
mkdir -p ejercicios/clase1
~~~

### cd

El comando `cd` (change diretory) cambia de directorio, permitiendo ubicarse en una ruta diferente a la actual.

Para acceder a `directorio`:

~~~
cd directorio
~~~

Comprobar la ruta actual con el comando `pwd`.

Si se desea subir un nivel en el árbol de directorios (es decir, ubicarse en el directorio que contiene al directorio actual):

~~~
cd ..
~~~

Nuevamente comprobar la ruta actual con `pwd`.

También se puede ingresar a un directorio varios niveles abajo en el árbol de directorios especificando la ruta:

~~~
cd ejercicios/clase1
~~~

Comprobar con `pwd`.

Y si se quiere volver al directorio anterior:

~~~
cd -
~~~

~~~
/home/usuario
~~~
{: .output}

Una vez más, comprobar con `pwd`.

### touch

El comando `touch` crea un archivo vacío. Si el archivo ya existe, el comando actualiza la hora de modificación.

Para crear el archivo `ejercicio1.txt` dentro del directorio actual:

~~~
touch ejercicio1.txt
~~~

Para crear el archivo `ejercicio2.txt` dentro del directorio `clase1`:

~~~
touch ejercicios/clase1/ejercicio2.txt
~~~

### ls

El comando `ls` (list) imprime una lista del contenido del directorio actual:

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

Opcionalmente, si se quiere ver la lista de un directorio diferente al actual, al comando `ls` se le puede indicar la ruta de dicho directorio como un parámetro, e incluso se pueden especificar las opciones:

~~~
ls directorio
~~~

~~~
ls -l ejercicios
~~~

~~~
total 4
drwxrwxr-x 2 usuario usuario 4096 jun 26 15:59 clase1
~~~
{: .output}

~~~
ls -la ejercicios/clase1
~~~

~~~
total 8
drwxrwxr-x 2 usuario usuario 4096 jun 26 15:59 .
drwxrwxr-x 3 usuario usuario 4096 jun 26 15:58 ..
-rw-rw-r-- 1 usuario usuario    0 jun 26 15:59 ejercicio2.txt
~~~
{: .output}

### cp

El comando `cp` (copy) permite copiar archivos y directorios, especificando primero el origen y después el destino.

Por ejemplo para copiar el archivo `ejercicio1.txt` al directorio `clase1`:

~~~
cp ejercicio1.txt ejercicios/clase1
~~~

Comprobar el contenido de `clase1` utilizando `ls`.

Si se desea cambiar el nombre del destino sólo basta con indicarlo, por ejemplo para copiar `ejercicio1.txt` como `ejercicio3.txt` dentro de `clase1`:

~~~
cp ejercicio1.txt ejercicios/clase1/ejercicio3.txt
~~~

Para copiar directorios incluyendo sus archivos y directorios internos se emplea la opción `-r` (recursive), por ejemplo, para copiar el directorio `clase1` que se encuentra dentro de `ejercicios` como `clase2`

~~~
cp -r ejercicios/clase1 ejercicios/clase2
~~~

Comprobar el contenido de `clase1` y `clase2` utilizando `ls`.

### mv

El comando `mv` (move) permite mover archivos y directorios de una ubicación a otra, por ejemplo:

~~~
mv ejercicio1.txt ejercicios
~~~

De la misma manera que en `cp`, se especifica primero el origen, y luego el destino.

En el caso particular en el que la ubicación es la misma, el archivo o directorio es renombrado:

~~~
mv directorio respaldo
~~~

### rm

El comando `rm` (remove) permite eliminar archivos y directorios.

Para eliminar el archivo `ejercicio1.txt` del directorio `ejercicios`:

~~~
rm ejercicios/ejercicio1.txt
~~~

Comprobar con `ls`.

De manera similar a `cp`, se pueden borrar directorios incluyendo su contenido, utilizando la opción `-r` (recursive):

~~~
rm -r respaldo
~~~

**Este comando elimina permanentemente los archivos o directorios especificados, utilizar con precaución**

## Hola mundo

A lo largo del curso se hará uso intensivo de archivos de texto con instrucciones que serán ejecutadas una tras otra en el orden en el que se encuentren en el achivo, a estos archivos los llamaremos guiones o 'scripts'.

Para la creación de estos archivos se puede utilizar el aplicativo gedit, disponible en el menú de aplicaciones de la máquina virtual.

El primer guión a crear en esta clase introductoria será un guión que imprima en pantalla la famosa frase "¡Hola mundo!", para ello, se deberá copiar el siguiente texto en el editor de texto gedit y guardarse con el nombre `holaMundo.sh`.



~~~
#!/bin/bash

# Imprimir el saludo
cowsay "¡Hola mundo!"
~~~

Una vez guardado, se deben otorgar permisos de ejecución al archivo que contiene el guión. Para esto se emplea el comando `chmod`, el cual posee una gran variedad de opciones, que para el objetivo del curso no son pertinentes, se utiliza la opción `+x` (execute) para habilitar el permiso de ejecución en el archivo.

~~~
chmod +x holaMundo.sh
~~~

Una vez creado el archivo y habiéndole dado permisos, se puede ejecutar con `./`, de la siguiente manera:

~~~
./holaMundo.sh
~~~

A partir de este punto, se pueden hacer modificaciones al guión, guardar los cambios y ejecutar de nuevo, facilitando la ejecución de los comandos.

_**Consejo:**_ Introducir la opción `-f tux` al comando `cowsay` en el guión y ejecutar nuevamente.
{: .alert .alert-success}

### Comandos de visualización de archivos de texto

El comando `cat` (concatenate) permite visualizar el contenido de un archivo de texto sin la necesidad de abrirlo en un editor.

Para ver el contenido del primer guión:

~~~
cat holaMundo.sh
~~~

En el caso de archivos de texto de gran tamaño, existen otros comandos como `head` y `tail`, que permiten visualizar las primeras o las últimas líneas del archivo; o comandos como `more` y `less`, que permiten visualizar por páginas los archivos.

<!--http://www.chris.com/ascii/index.php?art=art%20and%20design/stereograms-->

## Cheat Sheet

## Ejercicios


