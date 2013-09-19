#!/usr/bin/perl
#ABSTRACT: Executes ```{.cmd} code sections as shell commands

use v5.14.1;
use Test::More;
use autodie;

# TODO: test on perl 5.18
local $ENV{PERL_HASH_SEED} = '0x123456789';

my $verbose = grep { $_ =~ /^--?v/ } @ARGV;

@ARGV = glob q{*.src.md} unless @ARGV;

foreach my $src (@ARGV) {
    next unless $src =~ /(.+)\.src\.md$/;

    diag "$src => $1.md";
    open my $out, '>', "$1.md";
    open my $in, '<', $src;

    while (readline $in) {
        print $out $_;
        if ($_ =~ /^```{\.cmd}/) {
            handle_cmd( $src, $in, $out );
        }
    }

    close $in;
    close $out;
}

done_testing;

sub handle_cmd {
    my ($src, $in, $out) = @_;

    my ($cmd, $next_cmd, $expect, $got);

    $_ = readline $in;
    if ($_ !~ /^\$ (.+)/) {
        die "shell command must start with '\$ ' in $src line $.: $_\n"
    }
    $cmd = $1;

  NEXT_CMD:
    $expect = "";

    while (readline $in) {
        last if $_ =~ /^```/;
        if ($_ =~ /^\$ (.+)/) {
            $next_cmd = $1;
            last;
        }
        $expect .= $_;
    }
    $expect =~ s/\s+$//m;

    note "\$ $cmd" if $verbose;
    $got = `$cmd`;
    $got =~ s/\s+$//m;

    note $got if $verbose;

    say $out "\$ $cmd";
    say $out $got;
    say $out '```';

    # this may fail when data contains hashes
    is $got, $expect, $cmd;

    if ($next_cmd) {
        $cmd = $next_cmd;
        goto NEXT_CMD;
    }
}
