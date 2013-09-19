## Processing XML data

To import and export XML data there is the module [Catmandu::XML]. The
following documentation requires at least version 0.03 of this module.

[Catmandu::XML]: https://metacpan.org/module/Catmandu::XML

### Importing XML

#### First steps

Let's start with the following XML file `input.xml`:

```{.cmd}
$ cat data/input.xml
<?xml version="1.0"?>
<doc>
  <id>1</id>
  <id>2</id>
  <xx>3</xx>
  <id>4</id>
</doc>
```

A simple conversion maps child elements of the root to hash elements:

```{.cmd}
$ catmandu convert XML to JSON < data/input.xml
{"id":["1","2","4"],"xx":"3"}
```

Option `--root` includes the root element:

```{.cmd}
$ catmandu convert XML --root 1 to JSON < data/input.xml
{"doc":{"id":["1","2","4"],"xx":"3"}}
```

To only convert selected XML elements, use option `--path`:

```{.cmd}
$ catmandu convert XML --path '/*/id' to JSON < data/input.xml
{"id":"1"}
{"id":"2"}
{"id":"4"}
```

By using option `--path` you virtually select new root elements (element `id`
in this example), so `--path` also enables `--root` by default. You can still
disable root elements or choose another name:

```{.cmd}
$ catmandu convert XML --path '/doc/*' --root a to JSON < data/input.xml
{"a":"1"}
{"a":"2"}
{"a":"3"}
{"a":"4"}
```

The default XML importer includes both, XML elements and XML attributes as key-value pairs:

```{.cmd}
$ echo '<doc x="1"><x>2</x></doc>' | catmandu convert XML to JSON
{"x":["1","2"]}
```

XML attributes can be disabled with option `--attributes`:

```{.cmd}
$ echo '<doc x="1"><x>2</x></doc>' | catmandu convert XML --attributes 0 to JSON
{"x":"2"}
```

#### Ordered XML

The default conversion is not suitable for so called "document-oriented" XML.
Let's take another example in file `doc.xml`:

```{.cmd}
$ cat data/doc.xml
<doc>
  <title>Welcome!</title>
  <p>
    Look at my <a href="http://example.org/">homepage</a>!
  </p>
</doc>
```

The default conversion ignores mixed content text nodes and element order:

```{.cmd}
$ catmandu convert XML to JSON --pretty 1 < data/doc.xml
{
   "p" : {
      "a" : {
         "href" : "http://example.org/"
      }
   },
   "title" : "Welcome!"
}
```

To better support ordered XML, the option `--type` can be used to select an
alternative representation of XML. The YAML exporter is used to better show the
imported array structure:

```{.cmd}
$ catmandu convert XML --type ordered to YAML < data/doc.xml
---
- doc
- {}
- - - title
    - {}
    - - Welcome!
  - - p
    - {}
    - - "\n    Look at my "
      - - a
        - href: http://example.org/
        - - homepage
      - "!\n  "
```

With `--type ordered` each XML element is represented as ternary array with
element name, attributes, and child elements. 

The option `--depth` can be used to create ordered XML first starting with some
nesting level:

```{.cmd}
$ catmandu convert XML --root doc --depth 2 to YAML < data/doc.xml
---
doc:
  p:
  - - p
    - {}
    - - "\n    Look at my "
      - - a
        - href: http://example.org/
        - - homepage
      - "!\n  "
  title:
  - - title
    - {}
    - - Welcome!
```

The record fields `doc.p` and `doc.title` at level 2 both contain an array of
elements just like returned with `--type ordered`. We can use this structure to
access and modify particular fields:

```{.cmd}
$ catmandu convert XML --root doc --depth 2 --fix 'move_field("doc.title.0.2","doc.title")' to YAML < data/doc.xml
---
doc:
  p:
  - - p
    - {}
    - - "\n    Look at my "
      - - a
        - href: http://example.org/
        - - homepage
      - "!\n  "
  title:
  - Welcome!
```

### Exporting XML

An XML exporter has not been implemented yet.

### Specific XML formats

The general XML importer and exporter can be difficult to use for more complex
XML formats. For this reason there are specialized importers and exporters for
particular XML-based formats.

...e.g. SRU, MODS, PICAXML...

