This repository contains a user-oriented tutorial for the Catmandu data
processing framework. The tutorial is written in Pandoc Markdown syntax with
[makespec](https://github.com/jakobib/makespec) extensions. The primary source
file is `tutorial.md`.

Required CPAN modules to execute examples are listed in `cpanfile`:

    $ sudo cpanm --installdeps .

Code examples are automatically tested with script `testdoc.pl`. Markdown files
should have file extension `.src.md` in order to do so. One must run
`testdoc.pl` to generate `.md` files required to compile the full tutorial. 

To generate HTML and PDF output, make sure to have cloned the submodules and
use the Makefile. [Pandoc](http://johnmacfarlane.net/pandoc/) must be
installed:

    $ git submodule update --init
    $ make pdf
    $ make html

This will create result files `Catmandu-Tutorial.pdf` and
`Catmandu-Tutorial.html`. The current PDF layout is aligned with the
[GBV](http://www.gbv.de/) corporate design, but this can be changed.

[![Build Status](https://travis-ci.org/gbv/Catmandu-Tutorial.png)](https://travis-ci.org/gbv/Catmandu-Tutorial)
