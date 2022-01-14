#!/usr/bin/perl
#read the datafile and giving it a file handle
open ($firstData, $ARGV[0])or die "$ARGV[0]not  found\n";
	
#make an array from the textfile
@info1 = <$firstData>;

#remove new lines "\n"
chomp @info1;

#make a new array which includes all the States
for ($x=4; $x < @info1; $x=$x+3)
{
	push @infoState1, (@info1[$x]);
}

#make another array which includes all the populations
for ($y=5; $y < @info1; $y=$y+3)
{
	push @infoPop, (@info1[$y]);
}

#remove the commas between numbers
for $infoPop (@infoPop){
$infoPop =~ tr/ ,//d;              
}

#make a hash with these two arrays
%statePop; 
@statePop{@infoState1}= @infoPop;

#sorting the keys of %statePop alphabetically
foreach $state (sort (keys (%statePop))) {
print "<$state>  <$statePop{$state}>\n";
}



