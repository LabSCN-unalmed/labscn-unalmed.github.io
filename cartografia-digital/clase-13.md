---
layout: clase
title: 'Trabajando con las tablas de atributos de un mapa vectorial'
curso: 'cartografia-digital'
clase: 13
---

Durante esta clase nos dedicaremos a realizar ejercicios en torno al manejo de las tablas de atributos asociadas a los mapas vectoriales.

Consultando información
-----------------------

- Consultar la lista de mapas vectoriales disponibles.

{% highlight bash linenos=table %}
g.list vect
{% endhighlight %}

- Consultar la lista de tablas disponibles en la conexión actual a la base de datos.

{% highlight bash linenos=table %}
db.tables -p
{% endhighlight %}

Ambas listas deben coincidir, de no ser así, en la parte final de la [Clase 11](./clase-11.html) se explica como migrar las tablas de una base de datos anterior.

- Obtener una descripción detallada de las columnas de la tabla de atributos `muniantioq`.

{% highlight bash linenos=table %}
db.describe table=muniantioq
{% endhighlight %}

Agregando la opción `-c` se obtiene una descripción resumida de las columnas, de manera similar a `v.info -c`, indicando el número de columnas y filas, luego describe cada columna indicando el nombre de la columna y el tipo de dato que contiene.

{% highlight bash linenos=table %}
db.describe -c table=muniantioq
{% endhighlight %}

Las **columnas** corresponden a los *atributos*, *campos* o *variables*.

Las **filas** son los *registros* o *casos*.

Describir también las tablas de los mapas `carreteras` y `puntos`.

{% highlight bash linenos=table %}
db.describe -c table=carreteras
db.describe -c table=puntos
{% endhighlight %}

Ejercicios de despliegue y consulta de información en el mapa
-------------------------------------------------------------

- Identificar una sola carretera y desplegarla.

{% highlight bash linenos=table %}
g.region vect=muniantioq 
d.vect map=muniantioq 
d.vect carreteras color=red 
d.vect carreteras where="cat=1" color=blue width=3
{% endhighlight %}

![](/cartografia-digital/images/muniantioq_carreteras_cat1.png){: .img-responsive .img-rounded}

- Para conocer los atributos de la línea resaltada en color azul.

{% highlight bash linenos=table %}
d.what.vect
{% endhighlight %}

- Para obtener información del segmento de carretera con `cat=1`, se utiliza el comando `db.select` y el parámetro `sql` para el filtro en lenguaje SQL.

{% highlight bash linenos=table %}
db.select sql="select * from carreteras where cat=1"
{% endhighlight %}

- Si no queremos conocer los valores de todas las columnas podemos especificar las que necesitamos.

{% highlight bash linenos=table %}
db.select sql='select TYPE,NAME from carreteras where cat=1'
{% endhighlight %}

**NOTA:** Observar que el parámetro `sql` admite ambos tipos de comillas.

- También se puede especificar el orden deseado.

{% highlight bash linenos=table %}
db.select sql='select NAME,TYPE from carreteras where cat=1'
{% endhighlight %}

### Sintaxis básica del lenguaje SQL

**select:** Indica las columnas a mostrar, para mostrarlas todas se utiliza \*.

**from:** Indica la tabla a consultar.

**where:** Indica qué filas se desea consultar.

### Realizar consultas directamente al mapa vectorial

Existe un comando similar al `db.connect`, pero que no consulta la información directamente de la tabla, sino a través del mapa vectorial al cual esté conectada. Este comando no requiere el uso de expresiones en lenguaje SQL de manera explícita, pero sus parámetros permiten la misma funcionalidad básica descrita anteriormente.

Consultar los nombres de las carreteras primarias del mapa carreteras.

{% highlight bash linenos=table %}
v.db.select map=carreteras columns=name where="type='primary'"
{% endhighlight %}

**NOTA:** Este comando no distingue entre mayúsculas y minúsculas para los nombres de las columnas.

Desplegar el mapa de municipios y las carreteras primarias y secundarias diferenciadas por color y espesor.

{% highlight bash linenos=table %}
g.region vect=muniantioq
d.vect map=muniantioq display=shape,attr icon=basic/star attrcol=MUNICIPIO lcolor=black bcolor=red lsize=6
d.vect carreteras where="TYPE='primary'" color=red width=4
d.vect carreteras where="TYPE='secondary'" color=blue width=3
{% endhighlight %}

![](/cartografia-digital/images/muniantioq_pri_sec.png){: .img-responsive .img-rounded}
