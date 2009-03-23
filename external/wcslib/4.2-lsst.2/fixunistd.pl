#! /bin/env perl 
#
$addlines  = "#include <unistd.h>\n";

foreach $f (@ARGV) {
    open(IN, "$f") || die "$f: $!";
    open(OUT, ">$f.fixed") || die "$f.fixed: $!";

    while (<IN>) {
        print OUT $_;
        print OUT $addlines if (/\<stdio.h\>/);
    }

    close(IN);
    close(OUT);

    rename("$f", "$f.orig") || die "$f.orig: $!";
    rename("$f.fixed", "$f") || die "$f.fixed: $!";
    print STDOUT "Fixed unistd.h problem for $f (original moved to $f.orig)\n";
}
