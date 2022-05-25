use strict;
use warnings;

my ($errcount, $errcol)=(0,"");
open(FILEIN, "$ARGV[0]")|| die $!;

while(<FILEIN>)
{

while($_=~m/(.)/gi)
 {
	my $temp1=$1;
	my $val = ord($temp1);
	if(($temp1 lt chr(32) && ($temp1 ne chr(9))) or $temp1 gt chr(126) ) {
		my $colno = pos ($_);
		$errcount++;
		$errcol.="$errcount\tJunk character found \"$temp1\" \($val\) at Lineno:\t$.\tColno:\t$colno\n";
	 }
 }
}
close FILEIN; 

if($errcol ne "")
{
 print $errcol;
}
else
{
	print "\n\n\tNo Junk found!!!\n\n";	
}