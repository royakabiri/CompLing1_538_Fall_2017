#!/usr/bin/perl
#read the datafile 1 
open ($firstData, $ARGV[0])or die "$ARGV[0]not  found\n";

#make an array from the textfile
@info1 = <$firstData>;

#remove new lines
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

#sorting the keys of the %statePop alphabetically
foreach $state1 (sort (keys (%statePop))) {
};

#read the datafile 2
open ($secondData, $ARGV[1])or die "$ARGV[1]not found\n";

#make an array from the textfile
@info2 = <$secondData>;

#remove new lines
chomp @info2;

#make a new array which includes all the States
for ($z=3; $z < @info2; $z=$z+3)
{
	push @infoState2, (@info2[$z]);
};

#make another array which includes all the sq miles numbers
for ($w=5; $w < @info2; $w=$w+3)
{
	push @infoMile, (@info2[$w]);
};

#remove the commas between numbers
for $infoMile (@infoMile){
$infoMile =~ tr/ ,//d;              
};

#make a hash with these two arrays
%stateMile; 
@stateMile{@infoState2}=@infoMile;

#sorting the keys of the %stateMile in alphabetical order
foreach $state2 (sort (keys %stateMile)) {
};

#soritng two hashesh with keys and make two arrays, one including the population and the other sq miles numbers
foreach $state1 (sort (keys (%statePop))) {
	push @valuePop, ($statePop{$state1});
}
foreach $state2 (sort (keys %stateMile)) {
	push @valueMile, ($stateMile{$state2});
};
 
#getting the density 
@density;
for ($i=0; $i < @valuePop; $i=$i+1)
{
	$density[$i]= $valuePop[$i]/$valueMile[$i];
};

#sorting the states alphabetically in the array infoState1:
@sortedInfoState = sort {$a cmp $b} @infoState1;

#make a hash out of these two new arrays
%stateDensity; 
@stateDensity{@sortedInfoState}= @density;

#sorting the values of the hash in descending order
foreach $key (sort {$stateDensity{$b} <=> $stateDensity{$a} } keys %stateDensity) {
	print "<$key>   <$stateDensity{$key}>\n";
}




     


