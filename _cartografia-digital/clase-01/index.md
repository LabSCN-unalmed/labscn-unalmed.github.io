---
layout: clase
title: 'Elementos introductorios'
curso: 'cartografia-digital'
clase: 1
---

Introducción a GNU/Linux
------------------------

La filosofía del curso es utilizar software libre porque...

En entornos GNU/Linux existen interfaces gráficas de usuario (GUI) donde se puede hacer click, arrastrar y, con suerte, se puede lograr mucho sin documentarse primero. Sin embargo, el entorno tradicional es una interfaz de línea de comandos (CLI) donde se escriben comandos que le dicen al computador qué hacer. Lo cual es más rápido y poderoso pero requiere aprender qué hacen los comandos.

## Comandos esenciales

La terminal es una herramienta muy sencilla pero sumamente poderosa, permite interactuar con el sistema por medio de comandos, en el siguiente ejercicio vamos a aprender los comandos más básicos para desenvolvernos dentro de la terminal.

### El prompt

Se conoce como prompt a una línea de texto que se muestra al comienzo de una terminal de comandos, el prompt indica que la terminal se encuentra a la espara de comandos, en los sitemas GNU/Linux, el prompt luce así:

~~~
usuario@equipo:~ $
~~~

Además proporciona información adicional: El usuario `usuario` está en la máquina `ubuntu` y se encuentra en el directorio `~` (el símbolo `~` es una abreviación para la carpeta personal de usuario). El símbolo `$` implica que es un usario regular, en el caso del usuario administrador `root` el símbolo sería `#`.

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

Comprobar la ruta actual con el comando `pwd`. Además el prompt también indicará la ruta actual:

~~~
usuario@ubuntu:~/directorio $
~~~

Si se desea subir un nivel en el árbol de directorios (es decir, ubicarse en el directorio que contiene al directorio actual):

~~~
cd ..
~~~

Nuevamente comprobar la ruta actual con `pwd` y el prompt.

También se puede ingresar a un directorio varios niveles abajo en el árbol de directorios especificando la ruta:

~~~
cd ejercicios/clase1
~~~

Comprobar con `pwd` y observar el cambio en el prompt.

Para ir a la carpeta personal (`/home/usuario`) desde cualquier parte, sólo basta con el comando `cd` sin más parámetros:

~~~
cd
~~~

Nuevamente observar el cambio en el prompt y comprobar con `pwd`.

Y si se quiere volver al directorio anterior sin necesidad de ingresar la ruta completa:

~~~
cd -
~~~

~~~
/home/usuario/ejercicios/clase1
~~~
{: .output}

Una vez más, comprobar con `pwd` y observar el cambio en el prompt.

### touch

El comando `touch` crea un archivo vacío. Si el archivo ya existe, el comando actualiza la hora de modificación.

Para crear el archivo `ejercicio1.txt` dentro del directorio actual:

~~~
touch ejercicio1.txt
~~~

Para crear el archivo `ejercicio2.txt` dentro del directorio `clase1` que a su vez se encuentra dentro del directorio `ejercicios`:

~~~
touch ejercicios/clase1/ejercicio2.txt
~~~

### ls

El comando `ls` (list) imprime una lista del contenido del directorio actual:

~~~
ls
~~~

~~~
01CreacionLocations  Desktop     ejercicio1.txt  Pictures  Templates
02ZonasVida          directorio  ejercicios      Public    Videos
03AntioquiaVector    Documents   Grass           R
04UsoVector          Downloads   Music           Shared
~~~
{: .output}

El comando `ls` tiene varias opciones que permiten organizar la información brindada, por ejemplo, para ver una lista larga y detallada de los elementos, se utiliza la opción `-l` (long):

~~~
ls -l
~~~

~~~
total 64
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 01CreacionLocations
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 02ZonasVida
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 03AntioquiaVector
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 04UsoVector
drwxrwxr-x 2 usuario usuario 4096 jun 22 17:02 Desktop
drwxrwxr-x 2 usuario usuario 4096 jun 30 16:16 directorio
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Documents
drwxr-xr-x 2 usuario usuario 4096 jun 25  2014 Downloads
-rw-rw-r-- 1 usuario usuario    0 jun 30 16:16 ejercicio1.txt
drwxrwxr-x 4 usuario usuario 4096 jun 30 16:14 ejercicios
drwxrwxr-x 3 usuario usuario 4096 abr 24  2014 Grass
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Music
drwxr-xr-x 3 usuario usuario 4096 abr 25  2014 Pictures
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Public
drwxrwxr-x 3 usuario usuario 4096 abr 24  2014 R
lrwxrwxrwx 1 usuario usuario   17 abr 24  2014 Shared -> /mnt/hgfs/shared/
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Templates
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Videos
~~~
{: .output}

Opcionalmente, si se quiere ver la lista de un directorio diferente al actual, al comando `ls` se le puede indicar la ruta de dicho directorio como un parámetro, e incluso se pueden especificar las opciones:

~~~
ls -l directorio
~~~

~~~
total 0
~~~
{: .output}

~~~
ls -l ejercicios
~~~

~~~
total 4
drwxrwxr-x 2 usuario usuario 4096 jun 26 15:59 clase1
~~~
{: .output}

~~~
ls -l ejercicios/clase1
~~~

~~~
total 0
-rw-rw-r-- 1 usuario usuario 0 jun 30 15:59 ejercicio2.txt
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

Comprobar con `ls`.

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

**Advertencia:** Este comando elimina permanentemente los archivos o directorios especificados, utilizar con precaución.
{: .alert .alert-warning}

## Hola mundo

A lo largo del curso se hará uso de archivos de texto con instrucciones que serán ejecutadas una tras otra en el orden en el que se encuentren en el achivo, a estos archivos los llamaremos guiones o "scripts".

Para la creación de estos archivos se puede utilizar el aplicativo gedit, disponible en el menú de aplicaciones de la máquina virtual.

El primer guión a crear en esta clase introductoria será un guión que imprima en pantalla la famosa frase "¡Hola mundo!", para ello, se deberá copiar el siguiente texto en el editor de texto gedit y guardarse con el nombre `holaMundo.sh`.

~~~
# Imprimir el saludo
cowsay "¡Hola mundo!"
~~~

Una vez creado el archivo, se puede ejecutar con el comando `bash`, de la siguiente manera:

~~~
bash holaMundo.sh
~~~

A partir de este punto, se pueden hacer modificaciones al guión, guardar los cambios y ejecutar de nuevo, facilitando la ejecución de los comandos.

**Consejo:** Introducir la opción `-f tux` al comando `cowsay` en el guión y ejecutar nuevamente.
{: .alert .alert-success}

~~~
cowsay -f tux "¡Hola mundo!"
~~~

### Comandos de visualización de archivos de texto

El comando `cat` (concatenate) permite visualizar el contenido de un archivo de texto sin la necesidad de abrirlo en un editor.

Para ver el contenido del primer guión:

~~~
cat holaMundo.sh
~~~

En el caso de archivos de texto de gran tamaño, existen otros comandos como `head` y `tail`, que permiten visualizar las primeras o las últimas líneas del archivo; o comandos como `more` y `less`, que permiten visualizar por páginas los archivos.

## Ejercicio

Utilizar únicamente la terminal de comandos para el siguiente ejercicio

* Crear un directorio para guardar los guiones o "scripts". El nombre del directorio lo decide el estudiante.

* Crear un archivo dentro de este directorio, con el nombre que desee el estudiante, para en él escribir un nuevo guión similar al "Hola mundo".

* Comprobar los diferentes dibujos (cow files) que tiene el comando `cowsay` utilizando la opción `-l`.

~~~
cowsay -l
~~~

* Abrir el archivo creado en gedit y crear un guión similar al de "Hola mundo", utilizando la opción `-f` del comando `cowsay` para especificar un dibujo personalizado (del gusto del estudiante), y hacer que el saludo sea con el nombre del estudiante.

~~~
cowsay -f <cowfile> "¡Hola <nombre del estudiante>!"
~~~
