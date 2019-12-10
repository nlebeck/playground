use warnings;
use strict;

my $usage = "usage: perl crunch.pl name text-file";

die $usage unless @ARGV == 2;
my $name = shift;
my $file = shift;

print("name,base,stock,bonus\n");

open(FILE, $file);
while(<FILE>) {
    if ($_ =~ /^\s*(\d+)k\s*\|\s*(\d+)k\s*\|\s*(\d+)k\s*$/) {
        print("$name,$1,$2,$3\n");
    }
}
close(FILE);