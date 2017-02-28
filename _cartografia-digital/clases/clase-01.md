---
layout: clase
title: 'Elementos introductorios'
curso: 'cartografia-digital'
clase: 1
---

Software libre
-------------

"Software libre" es el software que respeta la libertad de los usuarios y la comunidad. A grandes rasgos, significa que los usuarios tienen la libertad de ejecutar, copiar, distribuir, estudiar, modificar y mejorar el software. Es decir, el "software libre" es una cuestión de libertad, no de precio. Para entender el concepto, piense en "libre" como en "libre expresión", no como en "barra libre".

Un programa es "software libre" si los usuarios tienen las cuatro libertades esenciales:

* Libertad de ejecutar el programa como se desea, con cualquier propósito.
* Libertad de estudiar como funciona el programa, y cambiarlo para que haga lo que se quiera. El acceso al código fuente es una condición necesaria para ello.
* Libertad de redistribuir copias para ayudar a los demás.
* Libertad de distribuir copias de sus versiones modificadas a los demás. Esto le permite ofrecer a toda la comunidad la oportunidad de beneficiarse de las modificaciones. El acceso al código fuente es una condición necesaria para ello.

Estos principios garantizan que la construcción del software sea realmente accesible a todas las personas y por lo tanto permite desarrollar nuevas tecnologías de manera colaborativa.

El Laboratorio de Sistemas Complejos Naturales apoya esta filosofía en el contexto de la misión de la Universidad Nacional de Colombia, no solamente para sus estudiantes sino para toda la comunidad a la que le debe el conocimiento.

Introducción a GNU/Linux {#introduccion-gnu-linux}
------------------------

En entornos GNU/Linux existen interfaces gráficas de usuario (GUI) donde se puede hacer click, arrastrar y, con suerte, se puede lograr mucho sin documentarse primero. Sin embargo, el entorno tradicional es una interfaz de línea de comandos (CLI) donde se escriben comandos que le dicen al computador qué hacer. Lo cual es más rápido y poderoso pero requiere aprender qué hacen los comandos. Esta interfaz de línea de comandos, la llamaremos 'la terminal'.

## Comandos esenciales {#comandos-esenciales}

La terminal es una herramienta muy sencilla pero sumamente poderosa, permite interactuar con el sistema por medio de comandos, en el siguiente ejercicio vamos a aprender los comandos más básicos para desenvolvernos dentro de la terminal.

### El prompt {#prompt}

Se conoce como prompt a una línea de texto que se muestra al comienzo de una terminal de comandos. El prompt indica que la terminal se encuentra disponible y a la espera de una órden (comando) que dará el usuario. En los sitemas GNU/Linux, el prompt luce así:

~~~
usuario@ubuntu:~ $
~~~

Además proporciona información adicional: El usuario `usuario` está en la máquina `ubuntu` y se encuentra en el directorio `~` (el símbolo `~` es una abreviación para la carpeta personal de usuario). El símbolo `$` implica que es un usario regular (sin privilegios de administrador), en el caso del superusuario (con privilegios de administrador) `root` el símbolo sería `#`.

### Sintáxis básica de los comandos en la terminal de GNU/Linux {#sintaxis-basica-comandos-terminal-gnu-linux}

En la terminal, los comandos conservan una estructura de cómo deben ser introducidos para ser interpretados correctamente. En términos genéricos, esta es la estructura para la mayoría de los comandos en GNU/Linux:

~~~
$ comando -opciones parametro1 parametro2 ...
~~~

**Nota:** Observar que los espacios delimitan el comando y los parámetros, es decir, un parámetro no debe contener espacios.
{: .alert .alert-info}

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

En la salida del comando `pwd`, vemos lo siguiente:

`/`
: La raíz del sistema de archivos.

`home`
: Directorio que contiene la carpeta personal de cada usuario.

`/`
: Acceso a un subdirectorio dentro de `/home`

`usuario`
: Directorio que contiene la carpeta personal del usuario actual, el nombre coincide con el nombre de usuario.

**Nota:** Con la combinación de `/` y nombres específicos de directorios, se puede acceder a otros subdirectorios del sistema de archivos.
{: .alert .alert-info}

### ls

El comando `ls` (list) imprime una lista del contenido del directorio actual:

~~~
ls
~~~

~~~
01CreacionLocations  04UsoVector  Downloads  Pictures  Shared
02ZonasVida          Desktop      Grass      Public    Templates
03AntioquiaVector    Documents    Music      R         Videos
~~~
{: .output}

El comando `ls` tiene varias opciones que permiten organizar la información brindada, por ejemplo, para ver una lista larga y detallada de los elementos, se utiliza la opción `-l` (long):

~~~
ls -l
~~~

~~~
total 56
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 01CreacionLocations
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 02ZonasVida
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 03AntioquiaVector
drwxrwxr-x 2 usuario usuario 4096 ago  5  2014 04UsoVector
drwxrwxr-x 2 usuario usuario 4096 jun 22 15:50 Desktop
drwxr-xr-x 2 usuario usuario 4096 jun 22 16:37 Documents
drwxr-xr-x 2 usuario usuario 4096 jul 29 10:34 Downloads
drwxrwxr-x 3 usuario usuario 4096 abr 24  2014 Grass
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Music
drwxr-xr-x 3 usuario usuario 4096 abr 25  2014 Pictures
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Public
drwxrwxr-x 3 usuario usuario 4096 abr 24  2014 R
lrwxrwxrwx 1 usuario usuario   17 ago  6  2014 Shared -> /media/sf_shared/
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Templates
drwxr-xr-x 2 usuario usuario 4096 abr 24  2014 Videos
~~~
{: .output}

- La primer columna contiene información del tipo de elemento, es decir, diferencia entre directorio y archivo. Para los directorios la columna inicia con una `d`; para los archivos la columna inicia con un `-`.
- La tercer y cuarta columna contienen información del propietario del elemento.
- La quinta columna contiene información del tamaño del elemento.
- Las columnas sexta, séptima y octava contienen información de la fecha y hora de modificación del elemento.
- La novena y última columna contiene el nombre del elemento.

Opcionalmente, si se quiere ver la lista de un directorio diferente al actual, al comando `ls` se le puede indicar la ruta de dicho directorio como un parámetro, e incluso se pueden especificar las opciones:

~~~
ls -l 02ZonasVida
~~~

~~~
total 1424
-rwxrwxrwx 1 usuario usuario    3330 abr 21  2008 zvidantioq.dbf
-rwxrwxrwx 1 usuario usuario     284 ago 27  2001 zvidantioq.sbn
-rwxrwxrwx 1 usuario usuario     132 ago 27  2001 zvidantioq.sbx
-rwxrwxrwx 1 usuario usuario 1440196 ago 27  2001 zvidantioq.shp
-rwxrwxrwx 1 usuario usuario     228 ago 27  2001 zvidantioq.shx
~~~
{: .output}

### cd

El comando `cd` (change diretory) cambia de directorio, permitiendo ubicarse en una ruta diferente a la actual.

Para acceder al directorio `02ZonasVida`:

~~~
cd 02ZonasVida
~~~

Comprobar la ruta actual con el comando `pwd`. Además el prompt también indicará la ruta actual:

~~~
usuario@ubuntu:~/02ZonasVida $
~~~

Si se desea subir un nivel en el árbol de directorios (es decir, ubicarse en el directorio que contiene al directorio actual):

~~~
cd ..
~~~

Nuevamente comprobar la ruta actual con `pwd` y el prompt.

También se puede ingresar a un directorio varios niveles abajo en el árbol de directorios especificando la ruta:

~~~
cd Grass/CursoGrass/
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
/home/usuario/Grass/CursoGrass/
~~~
{: .output}

Una vez más, comprobar con `pwd` y observar el cambio en el prompt.

Este último ejemplo, funciona de manera similar al botón "Previous Channel" de los controles remotos de TV.

### mkdir

El comando `mkdir` (make directory) crea un directorio o carpeta.

Para crear el directorio `directorio` en la ubicación actual:

~~~
mkdir directorio
~~~

Este comando también cuenta con una opción bastante útil que permite crear un árbol de directorios de manera simultánea. Por ejemplo, suponiendo que se quiere crear el directorio `ejercicios` y dentro de éste, el subdirectorio `clase1` , se utiliza la opción `-p`:

~~~
mkdir -p ejercicios/clase1
~~~

En consecuencia, el directorio `clase1` está dentro del directorio `ejercicios`, y éste último quedará en el directorio `~` (carpeta personal de usuario) al igual que el directorio `directorio`.

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

### cp

El comando `cp` (copy) permite copiar archivos y directorios, especificando primero el origen y después el destino.

Por ejemplo para copiar el archivo `ejercicio1.txt` al directorio `clase1` dentro de `ejercicios`:

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

## Hola mundo {#hola-mundo}

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

### Comandos de visualización de archivos de texto {#comandos-visualizacion-archivos-texto}

El comando `cat` (concatenate) permite visualizar el contenido de un archivo de texto sin la necesidad de abrirlo en un editor.

Para ver el contenido del primer guión:

~~~
cat holaMundo.sh
~~~

En el caso de archivos de texto de gran tamaño, existen otros comandos como `head` y `tail`, que permiten visualizar las primeras o las últimas líneas del archivo; o comandos como `more` y `less`, que permiten visualizar los archivos por páginas.

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
cowsay -f <cowfile> "<mensaje>"
~~~

* Ejecutar el script con el comando `bash`.


## Tarea 1
{: .text-danger}

Siguiendo una metodología similar al ejercicio anterior, realizar un guión que muestre la siguiente salida:

~~~
 ______________________________________
/ ¡Fogosa bienvenida al curso de GRASS \
\ GIS!                                 /
 --------------------------------------
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
~~~
{: .output}
