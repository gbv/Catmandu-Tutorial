## Processing MAB2 data

MAB2 (Maschinelles Austauschformat für Bibliotheken) is a library exchange data format used in Germany. The module [Catmandu::MAB2]
provides Catmandu importer, exporter and fixes to work with MAB2 data.

The importer expects UTF-8 encoded files as input. Otherwise provide a filehande with a specified I/O layer.

[Catmandu::MAB2]: https://metacpan.org/module/Catmandu::MAB2

## command-line interface (CLI)

    $ catmandu convert MAB2 to YAML < ./data/journals_mab2.dat

    $ catmandu convert MAB2 --type XML to JSON < ./data/journals_mab2.xml

    $ catmandu convert MAB2 --fix "mab_map('331', 'title'); remove_field('record');" to JSON < ./data/journals_mab2.dat

    $ catmandu convert MAB2 --fix ./fix/mab2.fix to YAML < ./data/journals_mab2.dat

    $ catmandu convert MAB2 --fix ./fix/mab2.fix to CSV --file mab2.csv --fields identifier,title,language  < ./data/journals_mab2.dat

    $ catmandu convert MAB2 --fix ./fix/mab2.fix to XLS --file mab2.xls --fields identifier,title,language  < ./data/journals_mab2.dat

    $ catmandu import MAB2 --fix ./fix/mab2.fix to MongoDB --database_name mab2 --bag mab2 < ./data/journals_mab2.dat

    $ catmandu import MAB2 --fix ./fix/mab2.fix to ElasticSearch --index_name mab2 --bag mab2 < ./data/journals_mab2.dat

See also [catmandu](https://metacpan.org/module/NICS/Catmandu-0.7002/bin/catmandu).

## Importer

Import MAB2 data as HASH with two keys: '_id' containing the system identifier of the record and 'record' containing the record fields as an ARRAY of ARRAYs:

    use Catmandu;
    use Catmandu::Importer::MAB2;

    my $importer = Catmandu::Importer::MAB2->new(file => "./t/mab2.dat", type=> "RAW");
    my @records;
    $importer->each(
        sub {
            push( @records, $_[0] );
        }
    );

Import MAB2 data with Catmandu::Fix:

    use Catmandu;
    use Catmandu::Fix;
    use Catmandu::Importer::MAB2;

    my $fixer = Catmandu::Fix->new(fixes => [
        'mab_map("LDR", "leader")',
        'mab_map("001", "id")',
        'mab_map("004", "date")',
        'mab_map("406[b]j", "coverage")',
        'remove_field("record")',
        'remove_field("_id")'
        ]);
    my $importer = Catmandu::Importer::MAB2->new(file => "./t/mab2.dat", type=> "RAW");
    my @records;
    $fixer->fix($importer)->each(
        sub {
            push( @records, $_[0] );
        }
    );

See also [Catmandu::Importer::MAB2](https://metacpan.org/module/Catmandu::Importer::MAB2) and [Catmandu::Fix](https://metacpan.org/module/Catmandu::Fix).

## Exporter

Serialize parsed MAB2 data:

    use Catmandu::Exporter::MAB2;
 
    my $exporter = Catmandu::Exporter::MAB2->new(file => "mab2.dat", type => "RAW");
    my $data = {
     record => [
        ...
        [245, '1', 'a', 'Cross-platform Perl /', 'c', 'Eric F. Johnson.'],
        ...
        ],
    };
    $exporter->add($data);
    $exporter->commit;

See also [Catmandu::Exporter::MAB2](https://metacpan.org/module/Catmandu::Importer::MAB2) and [Catmandu::Exporter](https://metacpan.org/module/Catmandu::Exporter).

## MAB2-specific fixes

    mab_map('001','identifier');
    mab_map('002[a]','date');
    mab_map('037[b]','language');
    mab_map('050[ ]','format');
    mab_map('052[ ]_/0-0','type');
    mab_map('331[ ]','title');
    mab_map('406jk','coverage.$append', -join => ' - ');
    mab_map('700[bc]','subject.$append');
    remove_field('record');

See [Catmandu::Fix::mab_map](https://metacpan.org/module/Catmandu::Fix::mab_map) and also [Catmandu::Fix](https://metacpan.org/search?q=distribution:Catmandu+Catmandu::Fix).
