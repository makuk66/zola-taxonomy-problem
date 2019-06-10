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
../step-two.sh
```

works (no errors by `zola serve`, and shows the matching posts. But now, control-C the `zola serve` and re-run it.
This happens:

```
^C
$ zola serve
Building site...
-> Creating 10 pages (9 orphan), 0 sections, and processing 0 images
Error: Failed to render page '/Users/mak/projects/github/makuk66/zola-taxonomy-problem/mysite/content/categories/index.md'
Reason: Failed to render 'categories/list.html'
Reason: Variable `taxonomy.name` not found in context while rendering 'categories/list.html'
```

It is like it does not know the taxonomy yet.

I thought I came across a related github issue, but I now cannot find it.

How can I get past this?



