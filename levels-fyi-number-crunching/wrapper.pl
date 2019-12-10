use warnings;
use strict;

my $OUTPUT_DIR = "output";
my $TEMP_DIR = "temp";

my @names = ("companyA-level1", "companyB-level1", "companyB-level2");
my @files = ("data/companyA-level1.txt", "data/companyB-level1.txt", "data/companyB-level2.txt");

if (@names != @files) {
    print("Error: names and files arrays are different lengths.");
    exit(1);
}

for (my $i = 0; $i < @names; $i++) {
    system("perl crunch.pl $names[$i] $files[$i] > $TEMP_DIR/$names[$i].csv");
}

my $combineArgs = "";
for my $name (@names) {
    $combineArgs = $combineArgs . " $TEMP_DIR/$name.csv";
}
print("$combineArgs\n");

system("perl combine-files.pl $combineArgs > $TEMP_DIR/combined.csv");
system("Rscript graph-data.R $TEMP_DIR/combined.csv output/graph");