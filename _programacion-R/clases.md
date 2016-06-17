---
layout: curso
title: 'Temas'
curso: 'programacion-R'
order: 2
---

{% for clase in site.programacion-R %}
{% if clase.clase and clase.curso == page.curso %}
## Tema {{ clase.clase }}
[{{ clase.title }}]({{ clase.url }})
{% endif %}
{% endfor %}
