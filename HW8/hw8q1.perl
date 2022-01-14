#!/usr/bin/perl
#read the datafile
open ($wsjtext, $ARGV[0])or die "$ARGV[0] not found!\n";
$passiveCount = 0;
$perfectiveCount = 0;
$negPassiveCount = 0;
$negPerfectiveCount = 0;
while ($line = <$wsjtext>) {
	print "@line";
	
	while ($line =~ /\s((am|is|are|was|were|'re|'m|be|be(en|ing))\s[a-z]+en)\s/gi) {
		$passiveCount++;
		#print "passive - $1\n"
	}
	while ($line =~ /\s((have|has|had|having)\s[a-z]+en)\s/gi) { 
		$perfectiveCount++;
		#print "perf - $1\n";
	}
	while ($line =~ /\s((am|is|are|was|were|'re|'m|be|be(en|ing))\s(not|n't)\s[a-z]+en)\s/gi) {
		$negPassiveCount++;
		#print "neg passive - $1\n";
	}
	while ($line =~ /\s((have|has|had|having)\s(not|n't)\s[a-z]+en)\s/gi) {
		$negPerfectiveCount++;
		#print "neg perf - $1\n"; 
	}
}
print "passives: $passiveCount\n";
print "perfectives: $perfectiveCount\n";
print "negated passives: $negPassiveCount\n";
print "negated perfectives: $negPerfectiveCount\n";
close ($wsjtext); 

