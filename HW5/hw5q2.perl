#!/usr/bin/perl
#read the datafile2 
open ($secondData, $ARGV[1])or die "$ARGV[1]not found\n";

#make an array from the textfile
@info2 = <$secondData>;

#remove new lines, "\n"
chomp @info2;

#make an array which includes all the States
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

#sorting the keys of %stateMile alphabetically-reverse order
foreach $state (reverse sort (keys %stateMile)) {
print"<$state>  <$stateMile{$state}>\n";
}





        