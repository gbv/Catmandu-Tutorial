# Catmandu-Tutorial [![Build Status](https://travis-ci.org/gbv/Catmandu-Tutorial.svg)](https://travis-ci.org/gbv/Catmandu-Tutorial)

This repository contains a user-oriented tutorial for the
[LibreCat](http://librecat.org) data processing framework
**[Catmandu](https://metacpan.org/module/Catmandu)**. The tutorial is written
in Pandoc Markdown syntax with [makespec](https://github.com/jakobib/makespec)
extensions. The primary source file is `tutorial.md`.

## Getting started

First clone the repository, including submodules

    $ git clone --recursive git@github.com:gbv/Catmandu-Tutorial.git

If already working on a clone, get submodules with `git submodule update --init`.
Then install required CPAN modules as listed in `cpanfile`:

    $ sudo cpanm --installdeps .

Also install [Pandoc](http://johnmacfarlane.net/pandoc/), for instance via your
system's package manager.

Finally call `make test`, `make html`, and/or `make pdf` to build the tutorial
document.

## How this works 

Code examples are automatically tested with script `testdoc.pl`. Markdown files
should have file extension `.src.md` in order to do so. One must run
`testdoc.pl` to generate `.md` files required to compile the full tutorial. 

To generate HTML and PDF output, make sure to have cloned the submodules and
use the Makefile. 

    $ make pdf
    $ make html

This will create result files `Catmandu-Tutorial.pdf` and
`Catmandu-Tutorial.html`. The current PDF layout is aligned with the
[GBV](http://www.gbv.de/) corporate design, but this can be changed.

Snapshots of the PDF and HTML tutorial files are made available at
<https://github.com/gbv/Catmandu-Tutorial/releases/>.

