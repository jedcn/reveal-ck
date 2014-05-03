# Upcoming Changes

The following changes are slated for the next release:

* Stop "slicing" and "splicing" and instead use a "filter" approach to
  modifying the index.html from reveal.js. Will try
  gch/html-pipeline. This should be more extensible / configurable.
* Will stop hard-coding rules for "building a presentation" and
  instead try to make this configurable via rake tasks.
* Upgrade the embedded reveal.js
* Upgraded Tooling. No More Cane. Start using
  Rubocop. RelishApp. Documentation, likely Yard.

This should make it so that you can:

* put emoji in your slides, and
* put font-awesome in your slides,
* without relying on reveal-ck to support these.

# Development

If you want to make changes to reveal-ck, you should first try the
following:

```
git submodule init
git submodule update
rake
```

The commands above get things online and verify basic functionality.

The submodule is necessary because reveal-ck relies on having a copy
of reveal.js (the original JavaScript based project) via a git
submodule.

## Testing

The testing strategy blends rspec and cucumber. There's not much going
on here (at a code level) so RSpec is straight forward. The
executable, reveal-ck, is verified as a command line tool with Aruba.

As you might expect, `rake spec` runs specs, `rake cucumber` runs
features, and `rake` runs both `spec` and `cucumber`.

## Travis

This project is setup within Travis. Here is the
[project page](https://travis-ci.org/jedcn/reveal-ck).

## Updating the embedded reveal.js

If you've got things checked out, and submodules inited, then you can
updated the embedded reveal.js as follows:

* cd into `reveal.js/`
* Run a `git fetch` and then merge/rebase/reset as is appropriate
* Run tests

[code-climate]: https://codeclimate.com/github/jedcn/reveal-ck.png
[travis]:       https://travis-ci.org/jedcn/reveal-ck.png
