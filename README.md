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

That worked, and shows e.g.:

```
  "taxonomy": {
    "name": "categories",
    "paginate_by": null,
    "paginate_path": null,
    "rss": true,
    "lang": "en"
  },
  "terms": [
    {
      "name": "tech",
      "slug": "tech",
      "permalink": "http://127.0.0.1:1111/categories/tech/",
      "pages": [
        {
          "relative_path": "blog/2019-06-09-post-9.md",
```

Now:

```
../step-two.sh
```

works (no errors by `zola serve`), and shows the matching posts.
It shows the same context output as before, and as expected:
```
<h2>categories</h2>

<a href="http:&#x2f;&#x2f;127.0.0.1:1111&#x2f;categories&#x2f;tech&#x2f;">tech</a>
```

But now, control-C the `zola serve` and re-run it.
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
