# Introduction

**Catmandu** is a data processing toolkit developed as part of the LibreCat
project. LibreCat is an open collaboration of the university libraries of Lund,
Ghent, and Bielefeld. See the project's website at <http://librecat.org/> for
more information.

![the LibreCat logo](./img/librecat.png "LibreCat Logo")

Although Catmandu is implemented in the Perl programming language, one can make
use of it without knowing Perl. The framework is shipped with a [command line
client] and it contains a simple domain-specific language.

## About this Tutorial

This tutorial is hosted in a public git repository at
<https://github.com/gbv/Catmandu-Tutorial>. Contributions are very welcome!
The tutorial is written in [Pandoc Markdown] with [makespec] extensions. Have a
look at file `README.md` in the tutorial repository for details.

[Pandoc Markdown]: http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html
[makespec]: http://jakobib.github.io/makespec/

# Overview

## The command line client

[command line client]: #the-command-line-client

The command line client `catmandu` is installed together with the Perl module
`Catmandu`. Calling it without any arguments list the available commands:

```{.cmd}
$ catmandu
    Available commands:

      commands: list the application's commands
          help: display a command's help screen

        config: print the Catmandu config as JSON
       convert: convert objects
         count: count the number of objects in a store
          data: store, index, search, import, export or convert objects
        delete: delete objects from a store
        export: export objects from a store
        import: import objects into a store
          move: move objects to another store
```

The command `help` can be used to show more information about some command, for
instance by calling `catmandu help convert`. A brief help message is shown with
option `--help`, `-h` or `-?`, for instance `catmandu convert -?`.


## Working with Data Objects

The basic unit of data processing in Catmandu is a *data object*, also known as
'record' or 'document'. Data objects may occur in many formats and be stored or
accessible from different sources. The easiest source of data is a file. For
instance the following JSON file contains one object with two fields:

```{.cmd}
$ cat data/object.json
{
  "author": "Goldman, Emma",
  "title": "Living My Life"
}
```

File may also contain multiple data objects. The default JSON importer expects
one JSON object on each line:

```
{ "author": "Gabriel, Mary", "title": "Notorious Victoria" }
{ "author": "Goldman, Emma", "title": "Living My Life" }
```

Catmandu supports stream-based processing, so one does not need to read the
whole file.

*...TODO: more about convert...*

See section on [Converting](#converting) for details.

## Storing data

*...TODO: brief introduction: import, export, delete...*

See section on [Stores](#stores) for details.

## Modifying data

*...TODO...*

... easy data manipulation by non programmers

... small Perl DSL language

See section on [Fixes](#fixes) for details.

## Configuration

*...TODO...*

    ---
    store:
      mo:
       package: MongoDB
       options:
        database_name: bibliographic
        bag: marc

# Converting

`convert.md`{.include}

# Stores

`stores.md`{.include}

# Fixes

`fixes.md`{.include}

# Data Formats

`xml-processing.md`{.include}

`marc-processing.md`{.include}

`pica-processing.md`{.include}

`mab-processing.md`{.include}

# Extending Catmandu

Requires some little knowledge of Perl. Example:

    package Catmandu::Fix::normalize_title;

    use Moo;

    sub fix {
        my ($self, $record) = @_;
        if ( $record->{dc}->{title} ) {
            $record->{dc}->{title} =~ s/[\x{98},\x{9c}]//g;
        }
        $record; 
    }

    1;

# Acknowledgement

This document contains parts and examples of a tutorial by Johann Rolschewski.

