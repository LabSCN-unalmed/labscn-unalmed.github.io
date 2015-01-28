---
layout: curso
title: 'Guía de Clases'
curso: 'cartografia-digital'
order: 01
---

{% assign guia_clases = site.pages | sort: 'clase' %}
{% for clase in guia_clases %}
{% if clase.clase %}
* [Clase {{ clase.clase }}: {{ clase.title }}]({{ site.baseurl }}{{ clase.url }})
{% endif %}
{% endfor %}
