# Introduction

**Catmandu** is a data processing toolkit developed as part of the LibreCat
project. LibreCat is an open collaboration of the university libraries of Lund,
Ghent, and Bielefeld. See the project's website at <http://librecat.org/> for
more information.

![the LibreCat logo](./img/librecat.png "LibreCat Logo")

Although Catmandu is implemented in the Perl programming language, one can make
use of it without knowing Perl. The framework is shipped with a [command line
client] and it contains a simple domain-specific language.

# First steps

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

# Processing data

`xml-processing.md`{.include}

`pica-processing.md`{.include}

# Acknowledgement

...
