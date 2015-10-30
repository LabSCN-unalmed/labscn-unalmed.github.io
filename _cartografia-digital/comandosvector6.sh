################################################################################
# Manipulación y consulta a bases de datos
# Miércoles de 30 de octubre de 2015
################################################################################
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




