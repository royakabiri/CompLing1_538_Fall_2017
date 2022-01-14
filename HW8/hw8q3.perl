#!/usr/bin/perl
#read the datafile 

open ($irregularverbs, $ARGV[0])or die "$ARGV[0] not found!\n";
$myString= "";
$line = <$irregularverbs>;
while ($line = <$irregularverbs>) {
	print "@line";
	while ($line =~ /.+\t.+\t(\w+)\/?(\w+)?/g) {
		 $myString = $myString . $1 . "|";
		if (length($2)>0) {
			$myString = $myString . $2. "|";
		}
	}
}
#get rid of the last pipe
chop $myString;
#add parentheses to make them one group since I wanna use it in the regex
$myString = "(" . $myString . ")";
close ($irregularverbs); 
#print "$myString\n";
open ($wsjtext, $ARGV[1])or die "$ARGV[1] not found!\n";

$regularpassiveCount = 0;
$regularperfectiveCount = 0;
$regularnegPassiveCount = 0;
$regularnegPerfectiveCount = 0;
$irregularpassiveCount = 0;
$irregularperfectiveCount = 0;
$irregularnegPassiveCount = 0;
$irregularnegPerfectiveCount = 0;
while ($line = <$wsjtext>) {
	print "@line";
	
	while ($line =~ /\s((am|is|are|was|were|'re|'m|be|be(en|ing))\s[a-z]+en)\s/gi) {
		$regularpassiveCount++;
		#print "passive - $1\n"
	}
	while ($line =~ /\s((have|has|had|having)\s[a-z]+en)\s/gi) { 
		$regularperfectiveCount++;
		#print "perf - $1\n";
	}
	while ($line =~ /\s((am|is|are|was|were|'re|'m|be|be(en|ing))\s(not|n't)\s[a-z]+en)\s/gi) {
		$regularnegPassiveCount++;
		#print "neg passive - $1\n";
	}
	while ($line =~ /\s((have|has|had|having)\s(not|n't)\s[a-z]+en)\s/gi) {
		$regularnegPerfectiveCount++;
		#print "neg perf - $1\n"; 
	}
	
	while ($line =~ /\s((am|is|are|was|were|'re|'m|be|be(en|ing))\s$myString)\s/gi) {
		$irregularpassiveCount++;
		#print "irregpassive - $1\n"
	}
	while ($line =~ /\s((have|has|had|having)\s$myString)\s/gi) {
		$irregularperfectiveCount++;
		#print "irregperf - $1\n";
	}
	while ($line =~ /\s((am|is|are|was|were|'re|'m|be|be(en|ing))\s(not|n't)\s$myString)\s/gi) {
		$irregularnegPassiveCount++;
		#print "neg irregpassive - $1\n";
	}
	while ($line =~ /\s((have|has|had|having)\s(not|n't)\s$myString)\s/gi) {
		$irregularnegPerfectiveCount++;
		#print "neg irregperf - $1\n";
	}
}

print "regular passives: $regularpassiveCount\n";
print "irregular passives: $irregularpassiveCount\n";
print "regular perfectives: $regularperfectiveCount\n";
print "irregular perfectives: $irregularperfectiveCount\n";
print "negated regular passives: $regularnegPassiveCount\n";
print "negated irregular passives: $irregularnegPassiveCount\n";
print "negated regular perfectives: $regularnegPerfectiveCount\n";
print "negated irregular perfectives: $irregularnegPerfectiveCount\n";
close ($wsjtext);  