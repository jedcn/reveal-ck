---
layout: child
title: Hosting
---

# Hosting

You can view the presentations that reveal-ck generates locally. To do
this, open the main `index.html` file in any browser. Most operating
systems provide shortcuts for this, for example, on MacOs, you can
type `open slides/index.html`.

That said, if you'd like to get the content online to share it, the
slides are just static html, and there are many ways to get
[static content online][host-static-content].

## Github Pages

Github Pages is a reasonable way to get online, especially if you're
already tracking your content on Github.

Let's say you've got new project to hold your slides, and you've made
a few commits on the `master` branch.

1. Keep going. Make progress and preview locally.

2. When you're ready to go online, commit the `slides/` directory as
   well, and push the result back up to the `master` and `gh-pages`
   branches.

3. Once Github sees a branch named `gh-pages`, your slides will
   momentarily be online. If you're github user is named $user and
   your project is named $project, you can find them at
   `http://$user.github.io/$project/slides/`.

If you haven't used Github Pages before, you should check out
[their documentation][github-pages].

Once you become practiced at this, you can get slide content up (or
update it) in less than a minute.

[host-static-content]: https://www.google.com/search?q=host+static+content
[github-pages]:        http://pages.github.com/
