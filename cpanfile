requires 'Search::Fulltext', '1.00';
requires 'Text::MeCab';
requires 'Encode';
requires 'File::Basename';
requires 'Cwd';

on 'test' => sub {
    requires 'Test::More';
};
