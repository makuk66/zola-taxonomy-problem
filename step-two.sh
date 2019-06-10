#!/bin/bash
set -exu
cat >templates/categories/list.html <<'EOM'
{{ __tera_context }}
<h2>{{taxonomy.name}}</h2>
{% for term in terms %}
<a href="{{term.permalink}}">{{ term.name }}</a>
{% endfor %}
EOM
sleep 2
cat public/categories/index.html
