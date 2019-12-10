use warnings;
use strict;

my $usage = "perl combine-files.pl file1 file2 ... fileN";

die $usage unless @ARGV >= 1;

my $skipHeader = 0;
while (@ARGV > 0) {
    my $file = shift;
    open(FILE, $file);
    my $shouldSkip = $skipHeader;
    while(<FILE>) {
        if ($shouldSkip) {
            $shouldSkip = 0;
        }
        else {
            print($_);
        }
    }
    close(FILE);
    $skipHeader = 1;
}