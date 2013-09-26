Cheatsheet

## Path

    $append   - Add a new item at the end of an array
    $prepend  - Add a new item at the start of an array
    $first    - Syntactic sugar for index '0' (the head of the array)
    $last     - Syntactic sugar for index '-1' (the tail of the array)

## Modifying fields

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


    # {format => 'print'}                    
    # Copy field
    copy_field('format','dc.format');

    # Delete field
    remove_field('format');

    # Move field
    move_field('format','dc.format');

    # Delete every field except named field
    retain_field('dc.format')


    # {ddc => ['000', '004', '600']}
    # Join elements of a field
    join_field('ddc',',');  # {ddc => '001,004,600'}
    
    # Split string to array
    split_field('ddc', ',')  # {ddc => ['000', '004', '600']}
    
    # Count elements in array
    count('ddc');  # 3


## Strings

    # {format => 'marc'}
    # Capitalize a value
    capitalize('format');  # {format => 'Marc'}

    # Uppercase a value
    upcase('format');  # {format => 'MARC'}

    # Downcase a value
    downcase('format');  # {format => 'marc'}   

    # {foo => '   abc   '}
    # Trim whitespace
    trim('foo');  # {foo => 'abc'}
    trim('foo', 'whitespace');  # {foo => 'abc'};

    # trim non-word characters
    # {foo => '   abc  / : .'}
    trim('foo', 'nonword');  # {foo => 'abc'};

## Search and replace

    # {format => 'MAB'}
    # Search and replace using regex expressions
    # Replace characters in string
    replace_all('format', 'a', 'x')  # {format => 'MxB'}    

    # {id => ['123-4', '567-X']}
    # Search and replace in array
    replace_all('identifier.*', '-[0-9xX]$', '') # {id => ['123', '567']}

## Lookup

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

## Conditionals

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

## Helper fixes

    # Collapse deep nested hash to a flat hash
    collapse();

    # Expand flat hash to deep nested hash
    expand();               

    # Clone the perl hash and work on the clone
    clone();

## External programs

    # Use an external program that can read JSON 
    # from stdin and write JSON to stdout
    cmd("java MyClass");


