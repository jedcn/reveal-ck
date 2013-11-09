
[![Build Status][travis]](https://travis-ci.org/jedcn/reveal-ck)
[![Code Climate][code-climate]](https://codeclimate.com/github/jedcn/reveal-ck)

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
* If the tests don't pass, you likely need to update how the
  `FileSplicer` is invoked in the `SliderBuilder`. It has hard-coded
  begin/end line numbers for where the default reveal.js slides are
  found. This commit is a good example of such a change: `b29b050`.

[code-climate]: https://codeclimate.com/github/jedcn/reveal-ck.png
[travis]:       https://travis-ci.org/jedcn/reveal-ck.png
