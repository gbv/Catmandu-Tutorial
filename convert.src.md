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


