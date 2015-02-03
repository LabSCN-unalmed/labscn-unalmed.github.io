---
layout: clase
title: 'Manejo de distintos mapas vectoriales'
curso: 'cartografia-digital'
clase: 14
---

Obtener un listado de las tablas disponibles.

{% highlight bash linenos=table %}
db.tables -p
{% endhighlight %}

Mostrar la estructura de la base de datos asociada al mapa vectorial de municipios.

{% highlight bash linenos=table %}
db.describe -c muniantioq
{% endhighlight %}

Lectura de una base de datos externa
------------------------------------

Abrir el directorio `04UsoVector` con el navegador de archivos, en su interior se encuentran dos archivos en formato CSV: `NBI.csv` y `poblacion_col.csv`. Abrir una terminal desde allí y ejecutar GRASS.

Se abre el archivo `NBI.csv` con LibreOffice Calc. [^1]

En el diálogo que aparece, se debe indicar que el archivo se encuentra separado por **Punto y coma** como lo muestra la siguiente imágen.

![](/cartografia-digital/images/NBI_import.png){: .img-responsive .img-rounded}

Para incorporar la tabla a GRASS, se emplea el comando `db.in.ogr`.

{% highlight bash linenos=table %}
db.in.ogr dsn=NBI.csv output=NBI
{% endhighlight %}

Obtener una descripción de la nueva tabla generada.

{% highlight bash linenos=table %}
db.describe -c NBI
{% endhighlight %}

La columna del NBI se encuentra en formato de texto, por lo cual más adelante se debe convertir a formato numérico para poder realizar consultas a la base de datos sin inconvenientes.

Para incorporar esta información a la tabla existente y asociada al mapa vectorial de los municipios, ambas tablas deben tener una columna común que permita unir la tabla nueva a la taba de atributos del mapa vectorial, en este caso, las columnas son `COD_DANE` en la tabla de atributos asociada al mapa vectorial `muniantioq`, y `Cod_MpioCompleto` en la nueva tabla **NBI**.

El comando que permite esto es el `v.db.join`.

{% highlight bash linenos=table %}
v.db.join map=muniantioq column=COD_DANE otable=NBI ocolumn=Cod_MpioCompleto
{% endhighlight %}

**`map`** Mapa vectorial al que se va a unir otra tabla.  
**`column`** Columna a unir en la tabla del mapa.  
**`otable`** Nombre de la otra tabla.  
**`ocolumn`** Columna a unir en la otra tabla.  

### Consultar cuáles municipios tienen un NBI por encima del 80%

{% highlight bash linenos=table %}
db.select sql="select cat,AREA,PERIMETER,MUNICIPIO,NBI from muniantioq where NBI>80"
{% endhighlight %}

Se observa que la consulta arrojó un resultado que no cumple con las condiciones impuestas, esto debido al hecho que la columna NBI se encuentra en formato de texto y debe ser convertida a formato numérico.

### Transformar una columna de tipo texto a numérico

- Se reemplaza la coma por un punto para separar los decimales correctamente.

{% highlight bash linenos=table %}
v.db.update map=muniantioq col=NBI qcol="replace(NBI,',','.')"
{% endhighlight %}

- Se crea una nueva columna de tipo real para realizar la conversión.

{% highlight bash linenos=table %}
v.db.addcol map=muniantioq col='NBI2 DOUBLE PRECISION'
{% endhighlight %}

- Se realiza la conversión hacia la nueva columna.

{% highlight bash linenos=table %}
v.db.update map=muniantioq col=NBI2 qcol="cast(NBI as DOUBLE PRECISION)"
{% endhighlight %}

- Se realiza la consulta nuevamente, y en este caso el resultado obtenido si cumple con la condición.

{% highlight bash linenos=table %}
v.db.select map=muniantioq columns=cat,AREA,PERIMETER,MUNICIPIO,NBI2 where='NBI2>80'
{% endhighlight %}

### Consultar los municipios de Antioquia con población mayor a 50.000 habitantes y NBI mayor al 60%

- Se abre el archivo `poblacion_col.csv` con LibreOffice Calc. En el diálogo que aparece, se debe indicar que el archivo se encuentra separado por *Punto y coma*.

![](/cartografia-digital/images/poblacion_col_import.png){: .img-responsive .img-rounded}

- Se importa la tabla `poblacion_col.csv` a GRASS con el comando `db.in.ogr`.

{% highlight bash linenos=table %}
db.in.ogr dsn=poblacion_col.csv output=pob_col
{% endhighlight %}

- Se consultan el nombre y el tipo de las columnas de la tabla recién importada.

{% highlight bash linenos=table %}
db.describe -c pob_col
{% endhighlight %}

Observar que los nombres de las columnas no son los más adecuados, puesto que los nombres de las columnas se encuentran duplicados en la tabla de atributos del mapa vectorial, por lo que se recomienda cambiarlos desde LibreOffice antes de importarlo nuevamente a GRASS.

{% highlight bash linenos=table %}
db.in.ogr dsn=poblacion_col.csv output=pob_col --o
db.describe -c pob_col
{% endhighlight %}

- Se incorpora la nueva tabla a la tabla de atributos existente asociada al mapa vectorial `muniantioq`. En este caso, la columna común de la tabla `pob_col` es `COD_POB`.

{% highlight bash linenos=table %}
v.db.join map=muniantioq column=COD_DANE otable=pob_col ocolumn=COD_POB
{% endhighlight %}

- Se transforma la columna `Total_2011` a tipo de datos enteros.

{% highlight bash linenos=table %}
v.db.addcol map=muniantioq col='POBLACION INT'
v.db.update map=muniantioq col=POBLACION qcol="cast(Total_2011 as INT)"
{% endhighlight %}

- Realizar la consulta de los municipios que cumplen las condiciones planteadas.

{% highlight bash linenos=table %}
v.db.select map=muniantioq columns=cat,MUNICIPIO,NBI2,POBLACION where="NBI2>60 and POBLACION>50000"
db.select sql='select cat,MUNICIPIO,NBI2,POBLACION from muniantioq where NBI2>60 and POBLACION>50000'
{% endhighlight %}

[^1]: NBI: Necesidades básicas insatisfechas.
