## Processing MAB data

## MAB-specific fixes

    mab_map('001','identifier');
    mab_map('002[a]','date');
    mab_map('037[b]','language');
    mab_map('050[ ]','format');
    mab_map('052[ ]_/0-0','type');
    mab_map('331[ ]','title');
    mab_map('406jk','coverage.$append', -join => ' - ');
    mab_map('700[bc]','subject.$append');
    remove_field('record');


