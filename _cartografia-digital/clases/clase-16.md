---
layout: clase
title: 'Manejo y despliegue de mapas vectoriales'
curso: 'cartografia-digital'
clase: 16
---

Manejo de mapas vector
----------------------

Manejo de despligue y consulta a bases de datos

~~~
# Cambiar conexión sqlite para el manejo de los mapas tipo vector
db.connect driver=sqlite database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
db.connect -p
db.tables -p

# Inicio del monitor para despliegue
d.mon x0

# Despliegue de los municipios de Antioquia.
g.region vect=muniantioq
d.mon sel=x0
d.erase
d.vect muniantioq

# Despliegue de los municipios de Antioquia (solo el croquis)
d.mon sel=x0
d.erase
d.vect muniantioq type=boundary

# Despliegue de los municipios de Antioquia (solo las areas)
d.mon sel=x0
d.erase
d.vect muniantioq type=area

# Despliegue de los municipios de Antioquia (solo los centroides)
d.mon sel=x0
d.erase
d.vect muniantioq type=centroid

# Despliegue de los municipios de Antioquia (solo las categorías o
# los identificadores)
d.mon sel=x0
d.erase
d.vect muniantioq display=cat


# Despliegue de los municipios de Antioquia (despliega el polígono y su topología)
d.mon sel=x0
d.erase
d.vect muniantioq display=shape,topo

# Despliegue los nombres de las variables y sus tipos
db.describe -c muniantioq
# Despliegue de los municipios de Antioquia (despliega un atributo,
# en este caso el nombre del municipio)
d.mon sel=x0
d.erase
d.vect muniantioq display=shape,attr attrcol=MUNICIPIO

# Despliegue condicional para mostrar los municipios con
# mayor porcentaje de NBI
d.mon sel=x0
d.erase
d.vect muniantioq type=boundary
d.vect muniantioq display=shape,attr attrcol=MUNICIPIO where="NBI2 > 50" \
       fcolor=red lcolor=blue

# Despliegue condicional para mostrar los municipios con
# mayor porcentaje de NBI y menor NBI
d.mon sel=x0
d.erase
d.vect muniantioq type=boundary
d.vect muniantioq display=shape,attr attrcol=MUNICIPIO where="NBI2 > 50" \
       fcolor=red lcolor=blue
d.vect muniantioq display=shape,attr attrcol=MUNICIPIO where="NBI2 < 20" \
       fcolor=green lcolor=magenta

# Despliegue de cabeceras municipales y sus nombres
d.mon sel=x0
d.erase
d.vect muniantioq type=boundary
d.vect puntos where="PLACE='town'" col=grey display=attr,shape attrcol=NAME


# Despliegue de cabeceras municipales y sus nombres, con cambio de símbolo
d.mon sel=x0
d.erase
d.vect muniantioq type=boundary
d.vect puntos where="PLACE='town'" col=blue display=attr,shape attrcol=NAME \
       icon=basic/triangle size=7

# Despliegue de cabeceras municipales y sus nombres, con cambio de símbolo
d.mon sel=x0
d.erase
d.vect muniantioq type=boundary
d.vect carreteras display=dir,shape where="TYPE='primary'" col=red
d.vect puntos where="PLACE='town'"
~~~

Consulta de tablas como base de datos       

~~~
# Selección de filas
v.db.select map=muniantioq where="NBI2<10 OR NBI2>70"
# Selección de columnas
v.db.select map=muniantioq where="NBI2<10 OR NBI2>70" columns=cat,MUNICIPIO,NBI2

# Consulta de tablas y mapas vector con tablas asociadas
# Consulta de una tabla
echo "SELECT * FROM NBI WHERE NBI>90" | db.select
# Sólo algunas columnas
echo "SELECT Cod_Depto,Nombre_Departamento,NBI FROM NBI WHERE NBI>90" | db.select

# Consulta de los niveles de una variable
echo "SELECT TYPE,count(TYPE) from carreteras GROUP BY TYPE" | db.select
# Excluir lo niveles nulos
echo "SELECT TYPE,count(TYPE) from carreteras WHERE TYPE IS NOT NULL GROUP BY TYPE" | db.select

# Otra forma de utlilizar el comando db.select
db.select sql="SELECT TYPE,count(TYPE) from carreteras WHERE TYPE IS NOT NULL GROUP BY TYPE"
~~~

### Links útiles {#links-utiles}

* [Tutorial de SQL](http://www.1keydata.com/es/sql/){:target="blank"}

* [Comandos soportados por el sqlite](http://www.sqlite.org/lang.html){:target="blank"}

Despliegue
----------

Manipulación y consulta a bases de datos

~~~
# Cambiar conexión sqlite para el manejo de los mapas tipo vector
db.connect driver=sqlite database='$GISDBASE/$LOCATION_NAME/$MAPSET/sqlite.db'
db.connect -p
db.tables -p
# Despliegue de los municipios de Antioquia.
g.region vect=muniantioq
d.mon x0
d.erase
d.vect muniantioq
# Seleccionar solo dos columnas para ver valores
echo "select MUNICIP,NBI2 from muniantioq" | db.select
# Calcular estadísticos por aparte
echo "select AVG(NBI2) from muniantioq" | db.select
echo "select MIN(NBI2) from muniantioq" | db.select
echo "select MAX(NBI2) from muniantioq" | db.select
# Calcular estadísticos en una sola línea
echo "select AVG(NBI2),MIN(NBI2),MAX(NBI2) from muniantioq" | db.select
# Identificar el municipio que tiene el NBI2 mínimo
echo "select NBI2 from muniantioq where NBI2=(select min(NBI2) from muniantioq)" | db.select
# Adicioinar una columna de tipo entero a la tabla
echo "ALTER TABLE muniantioq ADD COLUMN nivel1 integer" | db.execute
echo "ALTER TABLE muniantioq ADD COLUMN nivel2 integer" | db.execute
# Calcular un valor entre 0 y 255 para cada nivel de color
echo "UPDATE muniantioq SET nivel1=round(NBI2*255/(select max(NBI2) from muniantioq))" | db.execute
echo "UPDATE muniantioq SET nivel2=round(255-(NBI2)*255/(select max(NBI2) from muniantioq))" | db.execute
# Crear una columna que irá a contener el valor RGB para colorear el mapa
echo "ALTER TABLE muniantioq ADD COLUMN GRASSRGB character" | db.execute
# Desplegar las columnas
db.describe -c muniantioq
# Borrar una columna de la base de datos
v.db.dropcol muniantioq column=GRASSRGB
# Desplegar de nuevo las columnas
db.describe -c muniantioq
# Crear de nuevo la columna RGB pero con śolo 20 espacios
echo "ALTER TABLE muniantioq ADD COLUMN GRASSRGB character(20)" | db.execute
# Crear la sarta o el "string" que tiene el color en formato "RRR:GGG:BBB"
# para colorear el mapa.
echo "UPDATE muniantioq SET GRASSRGB=nivel1||':'||nivel2||':0'" | db.execute
# Despliegue del mapa final
g.region vect=muniantioq
d.mon sel=x0
d.erase
d.vect -a muniantioq

# Crear una nueva variable para llevar valores vectoriales a la table correspondiente
echo "ALTER TABLE carreteras ADD COLUMN long_lin double precision" | db.execute
# Llevar valores a la tabla correspondiente
v.to.db map=carreteras option=length type=line col=long_lin units=me

# Obtener estadísticos por grupo
echo "select TYPE,AVG(long_lin),MIN(long_lin),MAX(long_lin) from carreteras WHERE TYPE IS NOT NULL GROUP BY TYPE" | db.select
~~~
