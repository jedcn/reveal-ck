# Publishing Slides

The slides created by reveal-ck are static html.

Thankfully, static html is easily published and shared via
[Github Pages][github-pages].

What follows is an introduction and general approach for publishing
slides. If you'd prefer to see a working example, then you can jump to
[jedcn/publishing-reveal-ck-slides][publishing].

[publishing]: https://github.com/jedcn/publishing-reveal-ck-slides

## reveal-ck and `slides/`

reveal-ck generates slides in the `slides/` directory.

If you've added to `images/` or `css/` to support your presentation,
these files are *also* copied into `slides/images` or `slides/css`.

The simple idea of "putting everything in `slides/`" means that
`slides/` contains everything you need, and in turn this allows you
to:

* zip up the contents of `slides/` and SFTP it to the server of your
  choice.
* rsync the contents underneath `slides/` to the web server of your
  choice.
* commit the content in `slides/` and then publish and share it via
  [Github Pages][github-pages].

If you're zipping or rsyncing, I presume you'll handle the details.

However-- if you're using Github Pages we can all follow a common
approach.

## reveal-ck and Github Pages

And so, here's how I suggest you go forward:

* Track your main content (the `slides.md`, images, css) on the `master` branch.
* Add `slides/` to your `.gitignore` over on `master`.
* Create a `gh-pages` branch that's an "orphan" from your `master` branch
* Clone `gh-pages` into your `slides/` directory
* Generate slides as normal

If you do this, you'll commit changes to `master` and you'll commit
the generated slides to `gh-pages`.

When you push `gh-pages` up to origin, your slides will automatically
be published.

### Step 0: Create some Slides

* Use reveal-ck as you normally would to create slides.
* Start tracking these slides in git, but `.gitignore` the `slides/`
  directory
* Commit everything but the generated slides, create a repo for your
  talk, and push what you've got up to https://github.com.
* Let's imagine that your slides landed here:
  https://github.com/jedcn/publishing-reveal-ck-slides

### Step 1: Create a branch named `gh-pages`

Follow
[these directions provided by github][github-pages-manual-create] for
manually creating a `gh-pages` branch. **Pro Tip: `cd /tmp` before you
do the following**.

I usually start these directions with `cd /tmp`, meaning, I create a
temporary clone on my local machine in the tmp directory. This lets me
be sure that I won't impact my original slide presentation.

### Step 2: Clone the `gh-pages` branch to `./slides`

Once you've created a `gh-pages`, then return to the original location
where you cloned and built out your slides. Then..

* Add `slides` to your `.gitignore`
* Eliminate the generated `./slides` directory with `rm -rf ./slides`
* Clone the newly created `gh-pages` directory into `./slides` by
  cloning a single branch, like so: `git clone
  https://github.com/jedcn/publishing-reveal-ck-slides.git --branch
  gh-pages --single-branch ./slides`

### Step 3: Regenerate Slides, Commit, Push, Repeat

Now you've got the same repository cloned twice-- one version exists
in the present working directory and a second, `gh-pages` version,
exists underneath `./slides`.

To publish changes (and make future changes):

* Regenerate your slides with `reveal-ck generate`
* Change directory into `./slides`
* Look at what's in `index.html` with your browser
* Commit any changes and then push this branch back up to `gh-pages`,
  ala, `git push origin gh-pages:gh-pages`
* View what's at https://jedcn.github.io/publishing-reveal-ck-slides,
  and circulate this to your friends.

You're done!

[github-pages]: https://pages.github.com
[github-pages-manual-create]: https://help.github.com/articles/creating-project-pages-manually/
