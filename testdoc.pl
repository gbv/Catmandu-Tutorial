#!/usr/bin/perl
#ABSTRACT: Executes ```{.cmd} code sections as shell commands

use v5.14.1;
use Test::More;
use JSON qw(from_json);
use autodie;

# TODO: test on perl 5.18
local $ENV{PERL_HASH_SEED} = '0x123456789';

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

    note "\$ $cmd";
    $got = `$cmd`;
    $got =~ s/\s+$//m;

    note $got;

    say $out "\$ $cmd";
    say $out $got;
    say $out '```';

    #if ($got =~ /^{.*}$/m and $expect =~ /^{.*}$/m) {
    #    $got    = from_json($got),
    #    $expect = from_json($expect);
    #}
    is $got, $expect, $cmd;

    if ($next_cmd) {
        $cmd = $next_cmd;
        goto NEXT_CMD;
    }
}
