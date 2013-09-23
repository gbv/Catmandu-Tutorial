![LibreCat](./img/librecat.png "Logo LibreCat")

# LibreCat

### Open Tools for Library and Research Services

## CLI

...


## CLI - convert()

    catmandu convert [-?hLv] [long options...]

    examples:

    cat books.json | catmandu convert JSON to CSV --fields id,title

    options:

            -? -h --help        this usage screen
            -L --load_path
            -v --verbose

## CLI - convert()

    $ cat ./data/journals_mab2.dat | catmandu convert MAB to JSON

    $ catmandu convert MAB to JSON < ./data/journals_mab2.dat

    $ catmandu convert MAB --type MABxml to JSON < ./data/journals_mab2.xml

## CLI - convert()

    $ catmandu convert MARC to JSON < ./data/camel.mrc

    $ catmandu convert MARC --type XML to JSON < ./data/camel.xml

## CLI - convert()

    $ catmandu convert PICA to YAML < ./data/pica.xml

    $ catmandu convert PICA to JSON < ./data/pica.xml

## CLI - convert()

    $ catmandu convert CSV to JSON < ./data/journals.csv

    $ catmandu convert YAML to JSON < ./data/journals.yml

## CLI - convert()

    $ catmandu convert MAB --fix ./fix/mab2.fix 
        to CSV --file mab2.csv --fields identifier,title,language  
        < ./data/journals_mab2.dat

    $ catmandu convert MAB --fix ./fix/mab2.fix
        to XLS --file mab2.xls --fields identifier,title,language  
        < ./data/journals_mab2.dat

## CLI - convert()

    $ cat ./template/test.tt
    [%- FOREACH f IN record %]
    [% _id %] [% f.shift %][% f.shift %][% f.shift %][% f.join(":") %]
    [%- END %]

    $ catmandu convert MARC to Template 
        --template D:\Workspace\Catmandu-Workshop2013\template\test.tt 
        < ./data/camel.mrc

    $ cat ./template/marc.tt
    [% _id %] [% authors.0 %]: [% title %]

    $ catmandu convert MARC --fix ./fix/marc.fix to Template
        --template D:\Workspace\Catmandu-Workshop2013\template\marc.tt 
        < ./data/camel.mrc

## CLI - import()

    catmandu import [-?hLv] [long options...]

    examples:

    catmandu import YAML --file books.yml to MongoDB 
        --database_name items --bag book

    options:

            -? -h --help        this usage screen
            -L --load_path
            -v --verbose

## CLI - import()

    $ catmandu import MARC --type USMARC
        to CouchDB --database_name marc --bag marc 
        < ./data/camel.mrc

    $ catmandu import MAB --fix ./fix/zdb_bibliographic.fix
        to MongoDB --database_name mab --bag mab 
        < ./data/journals_mab2.dat

    $ catmandu import MAB --fix ./fix/zdb_bibliographic.fix
         to ElasticSearch --index_name mab --bag mab
         < ./data/journals_mab2.dat

## CLI - export()

    catmandu export [-?hLqv] [long options...]

    examples:

    catmandu export MongoDB --database_name items --bag book to YAML

    options:

            -? -h --help        this usage screen
            -L --load_path
            -v --verbose
            -q --query
            --limit

## CLI - export()

    $ catmandu export CouchDB --database_name marc --bag marc to JSON

    $ catmandu export MongoDB --database_name mab --bag mab to JSON

    $ catmandu export ElasticSearch --index_name mab --bag mab to JSON

## CLI - count()

    catmandu count [-?hLq] [long options...]

    examples:

    catmandu count ElasticSearch --index_name shop --bag products 
        --query 'brand:Acme'

    options:

            -? -h --help        this usage screen
            -L --load_path
            -q --query

## CLI - count()

    $ catmandu count CouchDB --database_name marc --bag marc

    $ catmandu count MongoDB --database_name mab --bag mab

    $ catmandu count MongoDB --database_name mab --bag mab 
        --query "{\"dc.publisher\": \"Heise\"}"

    $ catmandu count ElasticSearch --index_name mab --bag mab

    $ catmandu count ElasticSearch --index_name mab --bag mab 
        --query 'dc.publisher:"Heise"'

## CLI - delete()

    catmandu delete [-?hLq] [long options...]

    examples:

    catmandu delete ElasticSearch --index_name items 
        --bag book -q 'title:"Programming Perl"'

    options:

            -? -h --help        this usage screen
            -L --load_path
            -q --query

## CLI - delete()

    $ catmandu delete CouchDB --database_name marc --bag marc

    $ catmandu delete MongoDB --database_name mab --bag mab

    $ catmandu delete ElasticSearch --index_name mab --bag mab

    $ catmandu delete MongoDB --database_name mab --bag mab 
        --q '{"_id":"1262750"}'

    $ catmandu delete ElasticSearch --index_name mab --bag mab 
        --q '_id:"1262750"'

## CLI - move()

    catmandu move [-?hLqv] [long options...]

    examples:

    catmandu move MongoDB --database_name items --bag book 
        to ElasticSearch --index_name items --bag book

    options:

            -? -h --help        this usage screen
            -L --load_path
            -v --verbose
            -q --query
            --limit

## CLI - move()

    $ catmandu move MongoDB --database_name mab --bag mab 
        to ElasticSearch --index_name mab --bag mab
    
    $ catmandu move MongoDB --database_name mab --bag mab 
        to CouchDB --database_name mab --bag mab
    
    $ catmandu move CouchDB --database_name marc --bag marc
        to MongoDB --database_name marc --bag marc
    
    $ catmandu move MongoDB --database_name mab --bag mab 
        --query "{\"dcterms.spatial\": \"XA-DE\"}" 
        to ElasticSearch --index_name moved --bag moved
    
    $ catmandu move ElasticSearch --index_name moved --bag moved 
        --query "dc.identifier:\"47918-4\"" 
        to ElasticSearch --index_name selected --bag selected

## CLI - data()

    catmandu data [-?hLqv] [long options...]

            -? -h --help         this usage screen
            -L --load_path
            --from-store
            --from-importer
            --from-bag
            --count
            --into-exporter
            --into-store
            --into-bag
            --start
            --limit
            --total
            -q --cql-query
            --query
            --fix                fix expression(s) or fix file(s)
            --replace
            -v --verbose

## CLI - data()

    $ catmandu data --from-store MongoDB --from-database_name mab
        --from-bag mab --query "{\"dc.identifier\": \"47918-4\"}"

    $ catmandu data --from-store ElasticSearch --from-index_name mab
        --from-bag mab --query "dc.identifier:\"47918-4\""

    $ catmandu data --from-store ElasticSearch --from-index_name mab
        --from-bag mab --cql-query "publisher exact Heise"

    $ catmandu data --from-store ElasticSearch --from-index_name mab
        --from-bag mab --cql-query "issued > 2009" --into-exporter YAML

    $ catmandu data --from-store ElasticSearch --from-index_name mab
        --from-bag mab --cql-query "issued > 2009" 
        --into-exporter CSV --fix 'retain_field("_id")'

## Catmandu::Fix

... easy data manipulation by non programmers

... small Perl DSL language

## Catmandu::Fix -  Docs

Catmandu::Fix::*

Cheatsheet

## Catmandu::Fix - Path

    $append   - Add a new item at the end of an array
    $prepend  - Add a new item at the start of an array
    $first    - Syntactic sugar for index '0' (the head of the array)
    $last     - Syntactic sugar for index '-1' (the tail of the array)

## Catmandu::Fix::marc_map

    marc_map('008_/35-38','language');
    marc_map('100','authors.$append');
    marc_map('245[10]a','title');
    marc_map('500a','publisher');
    marc_map('650a','subject', -join => '; ');
    remove_field('record');

## Catmandu::Fix::mab_map

    mab_map('001','identifier');
    mab_map('002[a]','date');
    mab_map('037[b]','language');
    mab_map('050[ ]','format');
    mab_map('052[ ]_/0-0','type');
    mab_map('331[ ]','title');
    mab_map('406jk','coverage.$append', -join => ' - ');
    mab_map('700[bc]','subject.$append');
    remove_field('record');

## Catmandu::Fix::pica_map

    pica_map('001A0','date');
    pica_map('010@a','language');
    pica_map('009Qa','primaryTopicOf.$append');
    pica_map('027A[01]a','furtherTitle');
    remove_field('record');

## Catmandu::Fix

    # Add a new field
    add_field('name','Smith');  # {name => 'Smith'}

    # Change a value
    set_field('name','Doe');  # {name => 'Doe'}

    # Append to a value
    append('name', ', John');  # {name => 'Doe, John'}

    # Prepend to a value
    prepend('name', ', Mr. ');  # {name => 'Mr. Doe, John'}

    # Extract a substring from the value
    substring('name',0,3);  # {name => 'Mr.'}   

## Catmandu::Fix

    # {format => 'print'}                    
    # Copy field
    copy_field('format','dc.format');

    # Delete field
    remove_field('format');

    # Move field
    move_field('format','dc.format');

    # Delete every field except named field
    retain_field('dc.format')

## Catmandu::Fix

    # {format => 'marc'}
    # Capitalize a value
    capitalize('format');  # {format => 'Marc'}

    # Uppercase a value
    upcase('format');  # {format => 'MARC'}

    # Downcase a value
    downcase('format');  # {format => 'marc'}   

## Catmandu::Fix

    # {foo => '   abc   '}
    # Trim whitespace
    trim('foo');  # {foo => 'abc'}
    trim('foo', 'whitespace');  # {foo => 'abc'};

    # trim non-word characters
    # {foo => '   abc  / : .'}
    trim('foo', 'nonword');  # {foo => 'abc'};

## Catmandu::Fix

    # {ddc => ['000', '004', '600']}
    # Join elements of a field
    join_field('ddc',',');  # {ddc => '001,004,600'}
    
    # Split string to array
    split_field('ddc', ',')  # {ddc => ['000', '004', '600']}
    
    # Count elements in array
    count('ddc');  # 3

## Catmandu::Fix

    # {format => 'MAB'}
    # Search and replace using regex expressions
    # Replace characters in string
    replace_all('format', 'a', 'x')  # {format => 'MxB'}    

    # {id => ['123-4', '567-X']}
    # Search and replace in array
    replace_all('identifier.*', '-[0-9xX]$', '') # {id => ['123', '567']}

## Catmandu::Fix

    # lookup value of 'ddc' in dict.csv and 
    # replace the value or set it to '000'
    lookup('ddc', 'dict.csv', -default=>'000');

    # lookup value of 'ddc' in dict.csv and 
    # replace the value or delete nothing found
    lookup('ddc', 'dict.csv', -delete=>'1');   
    
    # lookup value of 'ddc' in MongoDB and
    # replace it with the data found
    lookup_in_store('ddc', 'MongoDB', -database_name => 'lookups'); 
    lookup_in_store('ddc', 'MongoDB', -delete => 1);

## Catmandu::Fix

    # set value of field 'ddc' to 'Informatik' 
    # if field 'ddc' has the value '004'
    if_any_match('ddc', '004');
      set_field('ddc', 'Informatik');
    end();
    # inverted
    unless_any_match('ddc', '000');
      lookup('ddc', 'dict.csv',  -delete=>'1');
    end();
    # lookup 'ddc' value in dict.csv
    if_exists('ddc');
      lookup('ddc', 'dict.csv',  -delete=>'1');
    end();
    # inverted
    unless_exists('ddc');
      add_field('ddc', '000');
    end();

## Catmandu::Fix

    # Collapse deep nested hash to a flat hash
    collapse();

    # Expand flat hash to deep nested hash
    expand();               

    # Clone the perl hash and work on the clone
    clone();

## Catmandu::Fix

    # Use an external program that can read JSON 
    # from stdin and write JSON to stdout
    cmd("java MyClass");

## config

    ---
    store:
      mo:
       package: MongoDB
       options:
        database_name: bibliographic
        bag: marc
        

## Catmandu::Importer
    
* Parser
* Importer
* Fix

## Catmandu::Importer
    
    D:\WORKSPACE\DIST\CATMANDU-PICA
    │   ...
    │
    ├───lib
    │   └───Catmandu
    │       │   PICA.pm
    │       │
    │       ├───Fix
    │       │       pica_map.pm
    │       │
    │       └───Importer
    │               PICA.pm
    │
    └───t
            ...

## Catmandu::Fix

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


