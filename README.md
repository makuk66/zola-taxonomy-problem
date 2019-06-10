Setup with:

```
./create.sh
cd mysite
```

Then:

```
$ zola build
$ cat public/categories/index.html
```

That worked.

Now:

```
cat >templates/categories/list.html <<'EOM'
{{ __tera_context }}
<h2>{{taxonomy.name}}</h2>
{% for term in terms %}
<a href="{{term.permalink}}">{{ term.name }}</a>
{% endfor %}
EOM
sleep 2
cat public/categories/index.html
```

works, and shows the matching posts. But now, control-C the `zola serve` and re-run it.
This happens:

```
^C
$ zola serve
Building site...
-> Creating 10 pages (9 orphan), 0 sections, and processing 0 images
Error: Failed to render page '/Users/mak/projects/github/makuk66/zola-tag-problem/mysite/content/categories/index.md'
Reason: Failed to render 'categories/list.html'
Reason: Variable `taxonomy.name` not found in context while rendering 'categories/list.html'
```

It is like it does not know the taxonomy yet.


