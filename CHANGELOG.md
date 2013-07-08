### Development
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.2...master)

#### Enhancements

* Support for a config.toml which can supply author, title, and theme
  ala:
```
author = "Your Name"
title = "Your Presentation's Name"
[presentation]
theme = "night"
```

### 0.1.2 / 2013-07-06
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.1...v0.1.2)

#### Bug Fixes

* Avoid 'desc is not a method' error when running reveal-ck generate.
  Prior versions should've called out haml ~> 3.1.x as a dependency
  and were not. Consequently, since haml 4.x was released, fresh
  bundles have resulted in `reveal-ck generate` failing.

#### Enhancements

* Additional Documentation

#### Infrastructure

* Swapped out .rvmrc for .ruby-version
* Moved from Jeweler to Bundler for Gem Management

### 0.1.1 / 2013-02-15
[full changelog](https://github.com/jedcn/reveal-ck/compare/v0.1.0...v0.1.1)

#### Enhancements

* Move generated slides.html to slides/slides.html
