---
layout: curso
title: 'Clases'
curso: 'geomorfometria'
order: 1
---

{% for clase in site.geomorfometria %}
{% if clase.clase and clase.curso == page.curso %}
## Clase {{ clase.clase }}
[{{ clase.title }}]({{ clase.url }})
{% endif %}
{% endfor %}
