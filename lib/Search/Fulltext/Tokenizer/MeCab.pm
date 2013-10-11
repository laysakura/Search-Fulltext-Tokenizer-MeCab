package Search::Fulltext::Tokenizer::MeCab;
use strict;
use warnings;
use utf8;

our $VERSION = '1.00';
use Text::MeCab;

sub tokenizer {
    my $mecab = Text::MeCab->new({});

    return sub {
        my $string = shift;
        my ($term_index, $term_start) = (0, 0);
        my $node = $mecab->parse($string);

        return sub {
            my $term = $node->surface;
            my $len = length $term;
            $node = $node->next or return;
            my ($start, $end) = ($term_start, $term_start + $len);
            $term_start += $len;
            return ($term, $len, $start, $end, $term_index++);
        }
    };
}

1;
__END__

=encoding utf8

=head1 NAME

Search::Fulltext::Tokenizer::MeCab - Provides Japanese fulltext search for L<Search::Fulltext> module

=head1 SYNOPSIS

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

=head1 DESCRIPTION

L<Search::Fulltext::Tokenizer::MeCab> is a Japanse tokenizer working with fulltext search module L<Search::Fulltext>.
Only you have to do is specify C<perl 'Search::Fulltext::Tokenizer::MeCab::tokenizer'> as a C<tokenizer> of L<Search::Fulltext>.

    my $fts = Search::Fulltext->new({
        docs      => \@docs,
        tokenizer => "perl 'Search::Fulltext::Tokenizer::MeCab::tokenizer'",
    });

You are supposed to use UTF-8 strings for C<docs>.

=head1 SUPPORTS

Bug reports and pull requests are welcome at L<https://github.com/laysakura/Search-Fulltext-Tokenizer-MeCab> !

=head1 VERSION

Version 1.00

=head1 AUTHOR

Sho Nakatani <lay.sakura@gmail.com>, a.k.a. @laysakura
