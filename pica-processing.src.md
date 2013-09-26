## Processing PICA data

PICA+ is an internal data format of legacy library automation systems produced
by the Dutch company PICA (now aquired by OCLC). The module [Catmandu::PICA]
provides Catmandu importer, exporter and fixes to work with PICA data.

[Catmandu::PICA]: https://metacpan.org/module/Catmandu::PICA


    $ catmandu convert PICA to YAML < ./data/pica.xml

    $ catmandu convert PICA to JSON < ./data/pica.xml

### Fixes

    pica_map('001A0','date');
    pica_map('010@a','language');
    pica_map('009Qa','primaryTopicOf.$append');
    pica_map('027A[01]a','furtherTitle');
    remove_field('record');

