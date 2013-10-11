# NAME

Search::Fulltext::Tokenizer::MeCab - Provides Japanese fulltext search for Search::Fulltext module

# SYNOPSIS

    use Search::Fulltext;
    use Search::Fulltext::Tokenizer::MeCab;
    

    my $query = '猫';
    my @docs = (
        '我輩は猫である',
        '犬も歩けば棒に当る',
        '実家でてんちゃんって猫を飼ってまして，ものすっごい可愛いんですよほんと',
    );
    

    my $fts = Search::Fulltext->new({
        docs      => \@docs,
        tokenizer => "perl 'Search::Fulltext::Tokenizer::MeCab::tokenizer'",
    });
    my $results = $fts->search($query);
    is_deeply($results, [0, 2]);        # 1st & 3rd include '猫'

# DESCRIPTION

Search::Fulltext::Tokenizer::MeCab is a Japanse tokenizer working with fulltext search module Search::Fulltext
Only you have to do is specify `perl 'Search::Fulltext::Tokenizer::MeCab::tokenizer'` as a `tokenizer` of `Search::Fulltext`.

    my $fts = Search::Fulltext->new({
        docs      => \@docs,
        tokenizer => "perl 'Search::Fulltext::Tokenizer::MeCab::tokenizer'",
    });

You are supposed to use UTF-8 strings for `docs`.

# SUPPORTS

Bug reports and pull requests are welcome at [https://github.com/laysakura/Search-Fulltext-Tokenizer-MeCab](https://github.com/laysakura/Search-Fulltext-Tokenizer-MeCab) !

# VERSION

Version 1.00

# AUTHOR

Sho Nakatani <lay.sakura@gmail.com>, a.k.a. @laysakura
