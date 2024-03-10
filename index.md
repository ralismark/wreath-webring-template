---
title: "Welcome to the webring!"
---

# {{ page.title }}

Currently, there are **{{ site.ring | size }}** members:

<!-- this is to support html in the descriptions -->
<ul>
{% for entry in site.ring %}
<li>
    <a href="{{ entry.href }}">{{ entry.name }}</a> &mdash; {{ entry.blurb }}
</li>
{% endfor %}
</ul>

For more information, see the [about page](about).

---

*{{ site.title }}* is hosted on github pages -- [source code here]({{ site.github.repository_url }}).
