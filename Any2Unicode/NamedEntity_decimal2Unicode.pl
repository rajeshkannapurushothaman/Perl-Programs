#Named entity to unicode
########################################################################################################################################
use strict;
use utf8;
use Win32;
use File::Basename;
use HTML::Entities;
use Getopt::Long;
use File::Spec; 
use FindBin;

my $inputFile;
my $outputFile;
my $inputFilePath = '';
my $inputFileName = '';
my $verbose;

my $filepath = File::Spec->catfile($FindBin::Bin, $FindBin::Script);
my $script_dir = dirname($filepath);
#$script_dir =~ s/0$//si;
#print $script_dir,">>>\n";


&GetOptions('input=s' => \$inputFile,
						'output=s' => \$outputFile,
            'verbose' => \$verbose
           );
my $pathfileDir = dirname(File::Spec->rel2abs($inputFile));
$inputFile = File::Spec->rel2abs($inputFile);
my $outputFileName = '';
if (-f $inputFile) {
  $inputFilePath = dirname($inputFile);
  $inputFileName = basename($inputFile);
} else {
  Win32::MsgBox("Input XML file does not exist: $inputFile", MB_ICONSTOP, "Unicode Tool");
  exit;
}
my $xml = '';

# Input file

open(INPUT, "<:encoding(UTF-8)", $inputFile) or die Win32::Msgbox("Can't open $inputFile : $!", MB_ICONSTOP, "Unicode Tool");
undef $/;
$xml = <INPUT>;
close INPUT;
#my $supportFiles = $pathfileDir;
my $supportFiles = $script_dir;

my %entityMap;
my %entityToDecimal;

# Entity and respective Unicode collection

open(UNICODE, "${supportFiles}/Ent2Uni.txt")|| die "cannot open input file";
my (%unicodecol, %entcol);
while(<UNICODE>)
{
	while($_ =~ /\"(.*?)\"[\s\t]*\"(.*?)\"/gi){
		my $tmp = $1;
		my ($unic, $tunic) = ($2, $2);
		$unic =~ s/(\#x)0/$1/i;
		if(defined($unicodecol{$unic})){
			if($unic !~ /Advent3B2\:m/i){
		  	#print "\"$tunic\" Unicode already assinged to $unicodecol{$unic}\n";
			}
		}
		else{
			$unicodecol{$unic} = $tmp;
		}
		if(defined($entcol{$tmp})){
				#print "\"$tmp\" Entity already defined\n";
			}
		else{
			$entcol{$tmp} = $unic;
		}
	}
}
close UNICODE;

# Entity to Unicode Replacement

my $Stage = "EU";
	   while($xml=~m/\&([\#\w\.\-]+);/gi)
	   {
	   	my $inpunic = $&;
	   		$inpunic =~ s/(\#x)0+/$1/i;
	   		if($Stage =~ /^UE/i){
	   			if(defined($unicodecol{$inpunic})){
	   		 		$unicodecol{$inpunic} =~ s/\&/<amp>/i;
	   		  	$xml=~s/\&([\#\w\.\-]+);/$unicodecol{$inpunic}/i;
	   	   	}
	      	else
	   	  	{
	   		  	$xml=~s/\&([\#\w\.\-]+);/<amp>$1;/i;
	   		  	#print "No Entity found in DataBase for the \"$inpunic\" Unicode!!!\n";#<stdin>;
	   	  	}
	   	  }
	   	  elsif($Stage =~ /^EU/i){
	   	    if(defined($entcol{$inpunic})){
	   	    	$entcol{$inpunic} =~ s/\&/<amp>/i;
	   		  	$xml=~s/\&([\#\w\.\-]+);/$entcol{$inpunic}/i;
	   	   	}
	      	else
	   	  	{
	   		  	$xml=~s/\&([\#\w\.\-]+);/<amp>$1;/i;	
	   		  	#print "No Entity found in DataBase for the \"$inpunic\" Unicode!!!\n";#<stdin>;
	   	  	}
	   	  }
	   }
	   $xml=~s/<amp>/\&/gi;
$xml =~ s/&del;//gi;
$xml = HTML::Entities::encode_entities_numeric($xml, '^\n\x20-\x7e');
$xml =~ s/\&\#x/[[[\#x/gi;
$xml =~ s/\&\#(\d+)\;/"&#x" . hexdegit(dectohex($1)) . ";"/egi;
$xml =~ s/\[\[\[\#x/\&\#x/gi;
# Output file Creation


#my $xmlstart = q(<?xml version="1.0" encoding="UTF-8"?>
#<?dctm xml_app="Ignore"?>
#<!DOCTYPE exp-level-1 SYSTEM "http:\\\\support.luminad.com\\group-xml.dtd">
#);
#print $xml;

#$outputFileName = "New_" . $inputFileName;
#my $outputFile = $inputFilePath . "\\" . $outputFileName;
open(OUTPUT, ">$outputFile") or die Win32::Msgbox("Can't open $inputFile : $!", MB_ICONSTOP, "EERI");

#if($xml =~m/<\?xml version([^><]+)>\s*(<\?dctm ([^><]+)>\s*)?<\!DOCTYPE([^><]+)>/sig){
	print OUTPUT "$xml";
#}else{
#	print OUTPUT "$xmlstart$xml";
#}
close OUTPUT;



sub dectohex{
	  return uc(sprintf("%x", shift));
}

sub hexdegit{
	  my $hex_val = shift;
	  if(length($hex_val) == 3){$hex_val = "0" . $hex_val;}
	  elsif(length($hex_val) == 2){$hex_val = "00" . $hex_val;}
	  elsif(length($hex_val) == 1){$hex_val = "000" . $hex_val;}
	  return $hex_val;
}
sub replInTags{
	  my $tagtext = shift;
	  $tagtext =~ s/&quot;/\"/g;
	  $tagtext =~ s/&equals;/\=/g;
	  $tagtext =~ s/&\#x003D\;/\=/g;
	  return $tagtext;
}