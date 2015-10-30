################################################################################
# Manejo de despligue y consulta a bases de datos
# Viernes 30 de Octubre de 2015
################################################################################

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
       
################################################################################
# Consulta de tablas como base de datos       
################################################################################
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

# Tutorial del SQL
# http://www.1keydata.com/es/sql/

# Comandos soportados por el sqlite
# http://www.sqlite.org/lang.html

       
       

