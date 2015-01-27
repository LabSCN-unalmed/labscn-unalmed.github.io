---
layout: page
title: 'Cartografía Digital'
---

Guía de Clases
--------------

{% assign clases = site.pages | sort: 'clase' %}
{% for clase in clases %}
{% if clase.clase %}
* [Clase {{ clase.clase }}: {{ clase.title }}]({{ site.baseurl }}{{ clase.url }})
{% endif %}
{% endfor %}
