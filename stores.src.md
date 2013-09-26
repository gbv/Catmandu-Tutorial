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


