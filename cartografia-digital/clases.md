---
layout: curso
title: 'Guía de Clases'
curso: 'cartografia-digital'
order: 1
---

{% for clase in site.pages %}
{% if clase.clase and clase.curso == page.curso %}
## Clase {{ clase.clase }}
[{{ clase.title }}]({{ clase.url }})
{% endif %}
{% endfor %}
