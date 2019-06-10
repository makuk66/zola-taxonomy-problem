#!/bin/bash
set -exuo pipefail

zola --version

printf '\n\n\n\n' | zola init mysite
cd mysite

cat > config.toml <<'EOM'
# The URL the site will be built for
base_url = "https://example.com"

# Whether to automatically compile all Sass files in the sass directory
compile_sass = true

# Whether to do syntax highlighting
# Theme can be customised by setting the `highlight_theme` variable to a theme supported by Zola
highlight_code = false

# Whether to build a search index to be used later on by a JavaScript library
build_search_index = false

taxonomies = [
    {name = "categories", rss = true},
]

[extra]
# Put all your custom variables here
EOM

cat > templates/index.html <<'EOM'
 {% for page in section.pages  | reverse %}
 <li><a href="{{page.permalink}}">{{page.title}}</a></li>
 {% endfor %}
 </ul>
EOM
cat > templates/page.html <<'EOM'
{{ page.content | safe }}
EOM

mkdir templates/categories
cat >templates/categories/list.html <<'EOM'
{{ __tera_context }}
EOM

touch templates/categories/single.html

mkdir content/categories
cat >content/categories/index.md<<'EOM'
+++
template="categories/list.html"
+++
EOM

mkdir content/blog
for i in {1..9}; do printf '+++\ntitle="Post %s"\n[taxonomies]\ncategories=["tech"]\n+++\npost %s\n' "$i" "$i" > content/blog/2019-06-0$i-post-$i.md; done
