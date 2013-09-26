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

