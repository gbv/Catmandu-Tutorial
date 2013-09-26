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


