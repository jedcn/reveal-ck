---
layout: child
title: Installation
---

# Installation

reveal-ck is a ruby gem, and it can be installed with a `gem install
reveal-ck`. It requires Ruby 2.0 or greater.

## Latest Version

You should be using the latest version of the gem. You can see which
version you have by typing `reveal-ck --version`.

<p>
  The latest version is
  <a href="http://badge.fury.io/rb/reveal-ck">
    <img src="https://badge.fury.io/rb/reveal-ck.svg" alt="Gem Version" height="18">
  </a>
</p>

## First Slides

After you've got the latest version installed, you can verify that
things are working by creating a first set of slides:

1. Run the command `echo "# Slides" > slides.md`. This will create a
   slides file in Markdown that contains a single slide.
2. Run the command `reveal-ck generate`. This will generate a
   presentation in the slides directory.
3. Open the file `slides/index.html` in a web browser. If you're on
   MacOS, you can run the command `open slides/index.html`.

You should see a reveal.js presentation with "Slides" in big text.
