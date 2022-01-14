#!/usr/bin/perl
#read the datafile 
open ($irregularverbs, $ARGV[0])or die "$ARGV[0] not found!\n";
$line = <$irregularverbs>;
while ($line = <$irregularverbs>) {
	print "@line";
	while ($line =~ /.+\t.+\t(\w+)\/?(\w+)?/g) {
		print "$1\n";
		if (length($2)>0) {
			print "$2\n"
		}
	}
}

