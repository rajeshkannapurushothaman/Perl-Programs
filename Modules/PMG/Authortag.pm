##########################################################################
#
#     Tool Name    :   Authortag.pm
#     Version      :   Version 1.0
#     Purpose      :   Author tagging between Authorgroup
#     Copyrights   :   Premedia Global (P) Ltd.
#     Developed By :   Rajeshkanna (Software Team)
#     Started on   :   21-05-2013
#
##########################################################################

# Module Declarations...

package Authortag;

use strict;

my $prefix = "(?:Al|Di|De|La|Le|Van de|Van Den|Van Der|Van den|Van der|Van|Vi|da|das|de|del|dell|della|delli|den|der|des|di|du|el|la|Mc|las|le|les|lo|los|ten|van|van de|van den|van der|Van eck|van eck|van Eck|von|vorn|xia Han|Xia Han)";

my $surname = "([A-Z][a-z&;\#]+[A-Z][a-z&;\#]+|[A-Z][a-z&;\#0-9]+|[A-Z][a-z&;\#]+\-[A-Z][a-z&;\#]+|Mc[A-Z][a-z&\#;]+|$prefix [A-Z][a-z&;\#]+|[A-Z][a-z&;\#]+ $prefix|[A-Z]XXXrsquoXXX[A-Z][a-z&\#;]+|&[A-Z][a-z]+\;[a-z&\#;]+|[A-Z][a-z]+XXXrsquoXXX[a-z&\#;]+|(?:de|De|Mc|Mac|[A-Z]\')[A-Z][a-z&;\#]+|[A-Z][a-z&;\#]+ [A-Z][a-z]+)";

#my $Agivenname = "([A-Z]\.\\-?\\s*[A-Z]\.\\-?\\s*[A-Z]\.\\-?\\s*[A-Z]\.\\-?\\s*[A-Z]\.|
#[A-Z]\.\\-?\\s*[A-Z]\.\\-?\\s*[A-Z]\.\\-?\\s*[A-Z]\.|
#[A-Z]\.\\-?\\s*[A-Z]\.\\-?\\s*[A-Z]\.|
#[A-Z]\.\\-?\\s*[A-Z]\.|
#[A-Z]\-?[A-Z]\.|
#[A-Z]\-[A-Z]|
#[A-Z]\.|
#[A-Z])";

my $Agivenname = "([A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\-[A-Z][A-Z]\\.|[A-Z]\\-[A-Z][A-Z]|[A-Z][A-Z][A-Z]|[A-Z]\\.\\s*\\-?[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\b|[A-Z]\\.\\s*\\-?[A-Z]\b|[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\. [A-Z]\\.|[A-Z]\\. [A-Z] |[A-Z]\-?[A-Z]\\.|[A-Z]\-[A-Z]|[A-Z] [A-Z]\\.|[A-Z] [A-Z]|[A-Z]\\. [A-Z]|[A-Z][A-Z]|\&\#[0-9]{3,}\;\\.\\s*[A-Z]\\.|\&[A-z]{3,}\;\\.\\s*[A-Z]\\.|[A-Z]\\.[A-Z]|\&\#[0-9]{3,}\;\\.|\&[A-z]{3,}\;\\.|[A-Z]\\.|[A-Z])";

my $Lstgivenname = "([A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\. [A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]|[A-Z]\-?[A-Z]\\.|[A-Z] [A-Z]\\.|[A-Z]\-[A-Z]|[A-Z] [B-Z]|[A-Z]\\.|[B-Z])";


#my $givenname = "([A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\. [A-Z]\\.|[A-Z]\\-[A-Z][A-Z]\\.|[A-Z]\\-[A-Z][A-Z]|[A-Z][A-Z][A-Z]|[A-Z]\\.\\s*\\-?[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\b|[A-Z]\\.\\s*\\-?[A-Z]\b|[A-Z]\-?[A-Z]\\.|[A-Z] [A-Z]\\.|[A-Z]\-[A-Z]|[A-Z] [A-Z]|[A-Z][A-Z]|\&\#[0-9]{3,}\;\\.\\s*[A-Z]\\.|\&[A-z]{3,}\;\\.\\s*[A-Z]\\.|[A-Z]|\&\#[0-9]{3,}\;\\.|[A-Z]\\.[A-Z]|[A-Z]\\. [A-Z] \\(|\&[A-z]{3,}\;\\.|[A-Z]\\.|[A-Z])";
my $givenname = "([A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\-[A-Z][A-Z]\\.|[A-Z]\\-[A-Z][A-Z]|[A-Z][A-Z][A-Z]|[A-Z]\\.\\s*\\-?[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\b|[A-Z]\\.\\s*\\-?[A-Z]\b|[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\. [A-Z]\\.|[A-Z]\\. [A-Z] |[A-Z]\-?[A-Z]\\.|[A-Z]\-[A-Z]|[A-Z] [A-Z]\\.|[A-Z] [A-Z]|[A-Z]\\. [A-Z]|[A-Z][A-Z]|\&\#[0-9]{3,}\;\\.\\s*[A-Z]\\.|\&[A-z]{3,}\;\\.\\s*[A-Z]\\.|[A-Z]\\.[A-Z]|\&\#[0-9]{3,}\;\\.|\&[A-z]{3,}\;\\.|[A-Z]\\.|[A-Z])";


#my $givenname = "([A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\-[A-Z][A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]\\.|[A-Z]\\. [A-Z]\\.|[A-Z] [A-Z]\\.|[A-Z]\\.\\s*\\-?[A-Z]\\.|[A-Z]\-?[A-Z]\\.|[A-Z]\\.\\-?\\s*[A-Z]|[A-Z] [A-Z]\\.|[A-Z]\-[A-Z]|[A-Z] [A-Z]|[A-Z][A-Z]|[A-Z]\\.|[A-Z]|\&[0-9]{3,}\;\\.|\&[A-z]{3,}\;\\.)";

my $suffix = "(Jr\\.?|Sr\\.?|II\\.?|III\\.?|IV\\.?|V\\.?|VI\\.?|VII\\.?|2nd)";

sub AuGroupIdentification {
my $line = shift;
my $debug = 1;
#print $line,"\n";
  $line =~ s/XXXampXXX/&amp;/g;
  if($line !~ m/<Authorgroup>/ && $line !~ m/^<Editorgroup>/) {
 	  $line =~ s/(<em>et al)<\/em>\./$1\.<\/em>/gi;
 	  $line =~ s/\b([A-Z]\.)\.([\, ])/$1$2/g;
 	  $line =~ s/\b([A-Z]\. )([a-z]{2,})(\, [A-Z]\.)/$1.ucfirst($2).$3/eg;
 	  #$line =~ s/( and [A-Z]\.( [A-Z]\.)? [A-Z][a-z]+\,)&rdquo;/$1 &rdquo;/g;
 	  $line =~ s/\,(&ldquo;[A-Z])/\, $1/;
 	  $line =~ s/([A-Z]\.) &ndash;([A-Za-z]\.)/$1&ndash;$2/gi;
 	  $line =~ s/\b([A-Z]\.?)&ndash;([A-Za-z]\.)( [A-Z][a-z]+\,)/"$1\-".uc($2).$3/eg;
 	  $line =~ s/(\,? and $Agivenname\,? $surname\,)\&rdquo\; ?/$1 \&ldquo\;/;
 	  
 	  #print $line,"\n\n";
  	if ($line =~ m/(.*?)\|/i) {  	 
  		$line =~ s/(.*?)\|/<Authorgroup>$1<\/Authorgroup>/;
  	} elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\:]?(?: $suffix[\,\:]?)? )/) {
  	  print "Author Count 16\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\:]?(?: $suffix[\,\:]?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\:]?(?: $suffix[\,\:]?)? )/) {
  	  print "Author Count 15\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\:]?(?: $suffix[\,\:]?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\:]?(?: $suffix[\,\:]?)? )/) {
  	  print "Author Count 14\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\:]?(?: $suffix[\,\:]?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 13\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 13\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 12\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 12\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 11\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 11\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\.]?(?: $suffix\,?)? )/) {
  	  print "Author Count 11-1\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\.]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 10(aa)\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 10\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    }
    
     elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 10a\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    }
    
     elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 9a\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 9b\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 9c\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^((?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 8a\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 8b\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 8c\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 7a\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 7b\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 7c\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? )/) {
      print "Author Count 6-1\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 6-2\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 6-3\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\:]?(?: $suffix\,?)? )/<Authorgroup>$1<\/Authorgroup> /;
		}
		
#		 elsif ($line =~ m/^($surname\,? $Agivenname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
#  	  print "Author Count 6\n" if ($debug);
#  	  # GNM SNM, GNM SNM, GNM SNM...
#          $line =~ s/^($surname\,? $Agivenname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/<Authorgroup>$1<\/Authorgroup> /;
#		}
		
		
		 elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? )/) {
      print "Author Count 5\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
      print "Author Count 5\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? )/) {
  	  print "Author Count 5\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 5\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname[\,\.\:]? )/) {
      print "Hai6\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname[\,\.\:]?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 4-1\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $surname\,? $Agivenname\,?(?: $suffix\,?)? $surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 4-2\n" if ($debug);
          print $line,"\n\n";
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $surname\,? $Agivenname\,?(?: $suffix\,?)? $surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 4-3\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,(?: $suffix\,?)? $Agivenname\,? (?:$prefix )?$surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? (?:$prefix )?$surname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 3 Format 1\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,(?: $suffix\,?)? (?:$prefix )?$Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($surname\,? $Agivenname\,? $surname\,? $Agivenname\,? $surname\,? $Agivenname )/) {
  	  print "Author Count 3 Format 2-1\n" if ($debug);
			$line =~ s/^($surname\,? $Agivenname\,? $surname\,? $Agivenname\,? $surname\,? $Agivenname)/<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 3 Format 2\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:and |&amp; )?(?:$prefix )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)?&ldquo;)/) {
  	  print "Author Count 3 Format 3\n" if ($debug);
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:and |&amp; )?(?:$prefix )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)?)&ldquo;/<Authorgroup>$1<\/Authorgroup>&ldquo;/;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 4-4\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?$surname\,? $Agivenname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 3\n" if ($debug);
  	  # GNM SNM, GNM SNM, GNM SNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? $Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? $surname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname(?:\,? $suffix\,?)?(\, |\,? and | &amp; )$Agivenname\,? (?:$prefix )?$surname[\,\.\:]?(?: $suffix\,?)? )/) {
      print "Author Count 2 Format 1\n" if ($debug);
  	  # Doukaa, E., and L. Hadjileontiadisb
  	  # Doukaa, E., L. Hadjileontiadisb
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname(?:\,? $suffix\,?)?(\, |\,? and | &amp; )$Agivenname\,? (?:$prefix )?$surname[\,\.\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname(?:\,? $suffix\,?)?(\, |\,? and | &amp; )(?:$prefix )?$surname\,? $Agivenname[\,\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 2 Format 2\n" if ($debug);
  	  # Doukaa, E., and Hadjileontiadisb, L.
  	  # Doukaa, E., Hadjileontiadisb, L.
          $line =~ s/^((?:$prefix )?$surname\,? $Agivenname(?:\,? $suffix\,?)?(\, |\,? and | &amp; )(?:$prefix )?$surname\,? $Agivenname[\,\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($Agivenname\,? (?:$prefix )?$surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? (?:$prefix )?$surname[\,\:]?(?: $suffix[\,\:]?)? )/) {
  	  print "Author Count 2 Format 3\n" if ($debug);
  	  
  	  # GNM SNM, and GNM SNM...
          $line =~ s/^($Agivenname\,? (?:$prefix )?$surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$Agivenname\,? (?:$prefix )?$surname[\,\:]?(?: $suffix[\,\:]?)?) /<Authorgroup>$1<\/Authorgroup> /;
          
          #print $line,"\n";
		} elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$surname\,? $Agivenname[\,\:]?(?: $suffix\,?)? )/) {
  	  print "Author Count 2 Format 4\n" if ($debug);
  	  # GNM SNM, and SNM GNM...
          $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)? (and |&amp; |\& )?$surname\,? $Agivenname[\,\:]?(?: $suffix\,?)?) /<Authorgroup>$1<\/Authorgroup> /;
		} elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname )/) {
      print "Hai7\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname[\,\:]? )/) {
      print "Hai8\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)? (and |&amp; |\& )?(?:$prefix )?$surname\,? $Agivenname[\,\:]?) /<Authorgroup>$1<\/Authorgroup> /;
    } elsif ($line =~ m/^($surname\,? $Agivenname\,? (and |&amp; |\& )$Agivenname $surname)\, /) {
      print "Hai9\n" if ($debug);
      $line =~ s/^($surname\,? $Agivenname\,? (and |&amp; |\& )$Agivenname $surname)\, /<Authorgroup>$1<\/Authorgroup>\, /;
    } elsif ($line =~ m/(.*?)<em>et al.?<\/em>/i) {
      print "Hai12\n" if ($debug);
  		$line =~ s/(.*?)(<em>et al.?<\/em>)/<Authorgroup>$1$2<\/Authorgroup>/;
  	} elsif ($line =~ m/(.*?) et al.?/i) {
  		$line =~ s/(.*?)( et al.?)(\,? )/<Authorgroup>$1$2<\/Authorgroup>$3/;
    } elsif ($line =~ m/(.*?) and $Agivenname\,? [A-z\-]{3,}/) {
      print "Hai-1\n" if ($debug);
      my $test = $1;
      print $line,"\n\n";
      $line =~ s/^((.*?) and $Agivenname\,? [A-z\-]{3,})/<Authorgroup>$1<\/Authorgroup>/ if($test !~ m/(19|20)[0-9]{2}/i && $test !~ m/[><]+/i);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname)\b/<Authorgroup>$1<\/Authorgroup>/ if($line !~ m/<Authorgroup>/ && $line !~ m/^<Editorgroup>/);
      $line =~ s/^($Agivenname (?:$prefix )?$surname\, )/<Authorgroup>$1<\/Authorgroup>/ if($line !~ m/<Authorgroup>/ && $line !~ m/^<Editorgroup>/);
      
    } elsif ($line =~ m/(.*?) and $Agivenname\,? $surname\,/) {
      print "Hai-2\n" if ($debug);
      my $test = $1;
      $line =~ s/^((.*?) and $Agivenname\,? $surname\,)/<Authorgroup>$1<\/Authorgroup>/ if($test !~ m/(19|20)[0-9]{2}/i && $test !~ m/[><]+/i);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname)\b/<Authorgroup>$1<\/Authorgroup>/ if($line !~ m/<Authorgroup>/ && $line !~ m/^<Editorgroup>/);
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname\,? )[A-z\-\&\#\;]{2,} [a-z]{2,}/) {
      print "Hai-11\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?)( [A-z\-\&\#\;]{2,} [a-z]{2,})/<Authorgroup>$1<\/Authorgroup>$4/;
    } elsif ($line =~ m/^($Agivenname\,? $surname\,?(?: $suffix\,?)?)/) {
      my $test = $1;
      print "Hai3\n" if ($debug);
      $line =~ s/^($Agivenname\,? $surname\,?(?: $suffix\,?)?)/<Authorgroup>$1<\/Authorgroup>/ if($test !~ m/(19|20)[0-9]{2}/i && $test !~ m/[><]+/i);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname\,?(?: $suffix\,?)?)/<Authorgroup>$1<\/Authorgroup>/ if($line !~ m/<Authorgroup>/ && $line !~ m/^<Editorgroup>/);
    } elsif ($line =~ m/^($surname\,? $Agivenname\,? )<em>/) {
      print "Hai6\n" if ($debug);
      $line =~ s/^($surname\,? $Agivenname\,?)( <em>)/<Authorgroup>$1<\/Authorgroup>$4/;
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ((?:Mc|Mac)?[A-Z][a-z]+)(\, and )([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ((?:Mc|Mac)?[A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$4<\/Surname>$5<Forename>$6<\/Forename> <Surname>$7<\/Surname><\/Authorgroup>$8/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., FullGNM GNM. SNM, and FullGNM GNM. SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname) ((?:Mc|Mac)?[A-Z][a-z]+)(\,? and )([A-Z][a-z]+\-[A-Z][a-z]+) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$5<\/Surname>$6<Forename>$7<\/Forename> <Surname>$8<\/Surname><\/Authorgroup>$9/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM, FullGNM GNM. SNM, and FullGNM\-FullGNM SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))\, ([A-Z][a-z]+) ((?:Mc|Mac)?[A-Z][a-z]+)(\,? and )([A-Z][a-z]+\-[A-Z][a-z]+) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$4<\/Surname>$5<Forename>$6<\/Forename> <Surname>$7<\/Surname><\/Authorgroup>$8/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., FullGNM SNM, and FullGNM\-FullGNM SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ((?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.) [A-Z][a-z]+)\, ([A-Z][a-z]+) ((?:Mc|Mac)?[A-Z][a-z]+)(\,? and )([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$4<\/Surname>$5<Forename>$6<\/Forename> <Surname>$7<\/Surname><\/Authorgroup>$8/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., FullGNM SNM, and FullGNM GNM. SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname) ((?:Mc|Mac)?[A-Z][a-z]+)(\,? and )([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$5<\/Surname>$6<Forename>$7<\/Forename> <Surname>$8<\/Surname><\/Authorgroup>$9/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM, FullGNM GNM. SNM, and FullGNM GNM. SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ((?:Mc|Mac)?[A-Z][a-z]+)(\, and )([A-Z][a-z]+) ((?:Mc|Mac)?[A-Z][a-z]+\-[A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$4<\/Surname>$5<Forename>$6<\/Forename> <Surname>$7<\/Surname><\/Authorgroup>$8/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., FullGNM GNM. SNM, and FullGNM SNM-SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+\-[A-Z][a-z]+)\, ([A-Z][a-z]+)\, ((?:Mc|Mac)?[A-Z][a-z]+) ([A-Z][a-z]+)(\, and )([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Forename>$3<\/Forename> <Surname>$4<\/Surname>$5<Forename>$6<\/Forename> <Surname>$7<\/Surname><\/Authorgroup>$8/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM, FullGNM SNM, and FullGNM GNM. SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)\, ((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)(\,? and )([A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Surname>$4<\/Surname>\, <Forename>$5<\/Forename>$7<Surname>$8<\/Surname>\, <Forename>$9<\/Forename><\/Authorgroup>$10/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., SNM FullGNM GNM., and SNM FullGNM GNM.\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)\, ((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)\, ([A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Surname>$4<\/Surname>\, <Forename>$5<\/Forename>\, <Surname>$7<\/Surname>\, <Forename>$8<\/Forename><\/Authorgroup>$9/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., SNM FullGNM GNM., SNM FullGNM GNM.\n" if ($debug);
    } elsif($line =~ s/^([A-Z][a-z]+) ([A-Z][a-z]+)\, ([A-Z][a-z]+) ([A-Z][a-z]+)\, ([A-Z][a-z]+) ([A-Z][a-z]+)\, /<Authorgroup><Forename>$1<\/Forename> <Surname>$2<\/Surname>\, <Forename>$3<\/Forename> <Surname>$4<\/Surname>\, <Forename>$5<\/Forename> <Surname>$6<\/Surname><\/Authorgroup>\, /) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "FullGNM SNM, FullGNM SNM, FullGNM SNM\,\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)(\,? and )([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3<Forename>$4<\/Forename> <Surname>$5<\/Surname><\/Authorgroup>$6/) {
    	print "Author Count 3\n" if ($debug);
    	
  	  print "SNM FullGNM, and FullGNM GNM. SNM \n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)(\,? and )([A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$4<Surname>$5<\/Surname>\, <Forename>$6<\/Forename><\/Authorgroup>$7/) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., and SNM FullGNM GNM.\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)(\,? and )([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) ([A-Z][a-z]+)(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$4<Forename>$5<\/Forename><Surname>$6<\/Surname><\/Authorgroup>$7/) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., and FullGNM GNM. SNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)(\,? and )([A-Z][a-z]+)\, ((?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.))(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$4<Surname>$5<\/Surname>\, <Forename>$6<\/Forename><\/Authorgroup>$7/) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., and SNM GNM.\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)(\,? and )((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.)) /<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3<Surname>$4<\/Surname>\, <Forename>$5<\/Forename><\/Authorgroup> /) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM, FullGNM, and SNM, FullGNM GNM. \&ldquo\;\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)(\,? and )((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+\.) \&ldquo\;/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3<Surname>$4<\/Surname>\, <Forename>$5<\/Forename><\/Authorgroup> \&ldquo\;/) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM, FullGNM, and SNM, FullGNM. \&ldquo\;\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)(\,? and )((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+\.) /<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3<Surname>$4<\/Surname>\, <Forename>$5<\/Forename><\/Authorgroup> /) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM, FullGNM, and SNM, FullGNM. \n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ $Agivenname)(\,? and )([A-Z][a-z]+) ((?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\.[A-Z]\.|[A-Z][a-z]))(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$4<Surname>$5<\/Surname> <Forename>$6<\/Forename><\/Authorgroup>$7/) {
    	print "Author Count 2\n" if ($debug);
    	
  	  print "SNM FullGNM GNM., and SNM GNM\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+ (?:[A-Z]\.|[A-Z]\.\-[A-Z]\.|[A-Z]\. ?[A-Z]\.))(\,? )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename><\/Authorgroup>$3/) {
    	print "Author Count 1\n" if ($debug);
    	
  	  print "SNM FullGNM GNM.\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)( [Ee]t a[lL]\. )/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename><\/Authorgroup>$3/) {
    	print "Author Count 1\n" if ($debug);
    	
  	  print "SNM FullGNM. Etal\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z]\. [A-Z][a-z]+\.) \&ldquo\;/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename><\/Authorgroup> \&ldquo\;/) {
    	print "Author Count 1\n" if ($debug);
    	
  	  print "SNM GNM. FullGNM.\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)\, \&ldquo\;/<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename><\/Authorgroup>\, \&ldquo\;/) {
    	print "Author Count 1\n" if ($debug);
    	
  	  print "SNM FullGNM, \&ldquo\;\n" if ($debug);
    } elsif($line =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+\.) /<Authorgroup><Surname>$1<\/Surname>\, <Forename>$2<\/Forename><\/Authorgroup> /) {
    	print "Author Count 1\n" if ($debug);
    	
  	  print "SNM FullGNM.\n" if ($debug);
    } elsif($line =~ s/^([A-Z][a-z]+ [A-Z][a-z]+[\.\,])/<Authorgroup>$1<\/Authorgroup>/) {
    	print "Author Count 1\n" if ($debug);
    	
  	  print "SNM FullGNM.\n" if ($debug);
    } elsif ($line =~ m/^($surname\,? $Agivenname[\,\;\:]?(?: $suffix\,?)?) /) {
      print "Author Count 1\n" if ($debug);
      $line =~ s/^($surname\,? $Agivenname[\,\;\:]?(?: $suffix\,?)? )/<Authorgroup>$1<\/Authorgroup>/;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $Agivenname[\,\;\:]?) /) {
      print "Author Count 1\n" if ($debug);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname)([\,\;\:]? )/<Authorgroup>$1<\/Authorgroup>$4/;
    } elsif($line =~ s/^([A-Z]{3}[^\.\,]+)/<Authorgroup>$1<\/Authorgroup>/) {
    } elsif($line =~ s/^([A-Z]{2,3}[0-9][\.\,]+)/<Authorgroup>$1<\/Authorgroup>/) {
    } elsif($line =~ s/^([A-Z]{2}[0-9][A-Z][\.\,]+)/<Authorgroup>$1<\/Authorgroup>/) {
    } elsif($line =~ s/^([A-Z][0-9][A-Z]{2}[\.\,]+)/<Authorgroup>$1<\/Authorgroup>/) {
    } elsif ($line =~ m/(.*?) and $surname\,? $Agivenname\,? /) {
      my $test = $1;
      print "Hai4\n" if ($debug);
      $line =~ s/^((.*?) and $surname\,? $Agivenname\,?) /<Authorgroup>$1<\/Authorgroup> / if($test !~ m/(19|20)[0-9]{2}/i && $test !~ m/[><]+/i);
      $line =~ s/^((?:$prefix )?$surname\,? $Agivenname)\b/<Authorgroup>$1<\/Authorgroup>/ if($line !~ m/<Authorgroup>/ && $line !~ m/^<Editorgroup>/);
    } elsif($line =~ s/^([A-Z][a-z]+ [A-Z][a-z]+ [A-Z][a-z]+ [A-Z][a-z]+[\.\,])/<Authorgroup>$1<\/Authorgroup>/) {
    } elsif($line =~ s/^([A-Z][a-z]+ [A-Z][a-z]+ [A-Z][a-z]+[\.\,])/<Authorgroup>$1<\/Authorgroup>/) {
    } elsif($line =~ s/^([A-Za-z ]+\([A-Z]+\))/<Authorgroup>$1<\/Authorgroup>/) {
    }
  }
  $line =~ s/<\/Authorgroup>((?:\, )et al\.)/$1<\/Authorgroup>/;
  #print $line,"\n\n";
  $line =~ s/([\,\;\:] ?)<\/Authorgroup>/<\/Authorgroup>$1/;
  $line =~ s/( ?[\,\;\:])<\/Authorgroup>/<\/Authorgroup>$1/;
  $line =~ s/ <\/Authorgroup>/<\/Authorgroup> /;
  $line =~ s/<\/Authorgroup> ([Ee]t\.? a[lL]\.?)\b/<\/Authorgroup> <Etal>$1<\/Etal>/;
  $line =~ s/&amp;/XXXampXXX/g;
  $line =~ s/(<\/Authorgroup>)( [A-Z])( [^A-Z])/$2$1$3/;

  $line =~ s/ (The|in|An)<\/Authorgroup>/<\/Authorgroup> $1/;
  
  $line =~ s/([A-Z]\.)( A)(<\/Authorgroup>)( [A-Za-z]+)\b/$1$3$2$4/;
  
  #print $line,"\n";

return $line;
}

sub BookEdGroupIdentification {
my $line = shift;
#print $line,"\n\n";
  if($line !~ m/<Editorgroup>/) {
		if ($line =~ m/\&rdquo\;\, in ($surname\,? $givenname)\,/) {
    	$line =~ s/(\&rdquo\;\, in )($surname\,? $givenname)\,/$1<Editorgroup>$2<\/Editorgroup>\,/;
    }
	}
	return $line;
}

sub EdGroupIdentification {
my $line = shift;
#print $line,"\n\n";
  if($line !~ m/<Editorgroup>/) {
    if ($line =~ m/ ((?:$prefix )?$surname\,? $givenname\, (?:$prefix )?$surname\,? $givenname\, (?:$prefix )?$surname\,? $givenname)\, ((?:$prefix )?$surname\,? $givenname)(\,? and )((?:$prefix )?$surname\,? $givenname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {
    	#print "Hai1\n";
      $line =~ s/ ((?:$prefix )?$surname\,? $givenname\, (?:$prefix )?$surname\,? $givenname\, (?:$prefix )?$surname\,? $givenname\, (?:$prefix )?$surname\,? $givenname(?:\,? and )(?:$prefix )?$surname\,? $givenname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$12/;
    } elsif ($line =~ m/ ($surname\,? $givenname\, $surname\,? $givenname)\, ($surname\,? $givenname)(\,? and )($surname\,? $givenname)\, (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {
    	#print "Hai2\n";
      $line =~ s/ ($surname\,? $givenname\, $surname\,? $givenname\, $surname\,? $givenname(?:\,? and )$surname\,? $givenname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$10/;

    } elsif ($line =~ m/ ((?:$prefix )?$surname\,? $givenname)\, ((?:$prefix )?$surname\,? $givenname)(\,? and )((?:$prefix )?$surname\,? $givenname)\, (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {
    	#print "Hai3\n";
      $line =~ s/ ((?:$prefix )?$surname\,? $givenname\, (?:$prefix )?$surname\,? $givenname(?:\,? and )(?:$prefix )?$surname\,? $givenname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$8/;
    } elsif ($line =~ m/ (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?(?: and )(?:$prefix )?$givenname $surname\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai7\n";
      $line =~ s/ ((?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?(?: and )(?:$prefix )?$givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$14/;
    } elsif ($line =~ m/ (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?(?: and )(?:$prefix )?$givenname $surname\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai8\n";
      $line =~ s/ ((?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?(?: and )(?:$prefix )?$givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$12/;
    } elsif ($line =~ m/ ((?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?) ((?:$prefix )?$givenname $surname\,?)(?: and )((?:$prefix )?$givenname $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {

      $line =~ s/ ((?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?(?: and )(?:$prefix )?$givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$10/;

    } elsif ($line =~ m/ ($givenname $surname\,? $givenname $surname\,? $givenname $surname\,?)(?: and | &amp; )($givenname $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {

      $line =~ s/ ($givenname $surname\,? $givenname $surname\,? $givenname $surname\,?(?: and | &amp; )$givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$10/;

    } elsif ($line =~ m/ ((?:$prefix )?$givenname $surname\,?) ((?:$prefix )?$givenname $surname\,?)(?: and | &amp; | XXXampXXX )((?:$prefix )?$givenname $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai9\n";
    	# 3 Authors
      $line =~ s/ ((?:$prefix )?$givenname $surname\,? (?:$prefix )?$givenname $surname\,?(?: and | &amp; | XXXampXXX )(?:$prefix )?$givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$8/;
    }
    
    elsif ($line =~ m/ ($surname\,? $givenname\,? $surname\,? $givenname\,?)(?: and | &amp; | XXXampXXX )($surname\,? $givenname\,?) (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai9\n";
    	# 3 Authors
      $line =~ s/ ($surname\,? $givenname\,? $surname\,? $givenname\,?(?: and | &amp; | XXXampXXX )$surname\,? $givenname\,?)( (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$8/;

    } elsif ($line =~ m/ ((?:$prefix )?$givenname $surname\,?)(?: and )((?:$prefix )?$givenname $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {
    	#print "Hai10\n";
      $line =~ s/ ((?:$prefix )?$givenname $surname\,?(?: and )(?:$prefix )?$givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$6/;
    } elsif ($line =~ m/ ((?:$prefix )?$givenname $surname)\,?(?: $suffix\,? )?(?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai11\n";
      $line =~ s/ ((?:$prefix )?$givenname $surname\,?(?: $suffix\,?)?)( (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$5/;
    } elsif ($line =~ m/^((?:$prefix )?$surname\,? $givenname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/) {
    	#print "Hai12\n";
      $line =~ s/^((?:$prefix )?$surname\,? $givenname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/<Editorgroup>$1<\/Editorgroup>$4/;
    } elsif ($line =~ m/ (($prefix )?$surname\,? $givenname)(\,? (?:and|&amp;) )($surname\,? $givenname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {
    	#print "Hai4\n";
      $line =~ s/ ((?:$prefix )?$surname\,? $givenname(\,? (?:and|&amp;) )($surname\,? $givenname))(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$8/;
      
    } elsif ($line =~ m/ ($givenname $surname)(\,? (?:and|&amp;|XXXampXXX) )($givenname $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/) {
    	#print "Hai4\n";
      $line =~ s/ ($givenname $surname(\,? (?:and|&amp;|XXXampXXX) )($givenname $surname))(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ <Editorgroup>$1<\/Editorgroup>$8/;
    } elsif ($line =~ m/(?: and | &amp; | XXXampXXX )($givenname\,? $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)/i) {
    	#print "Hai6\n";
  		$line =~ s/(?: and | &amp; | XXXampXXX )($givenname\,? $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))/ and <Editorgroup>$1<\/Editorgroup>$4/;
    } elsif ($line =~ m/ ($surname\,? $givenname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai5\n";

      $line =~ s/ ($surname\,? $givenname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$4/;

    } elsif ($line =~ m/ ($givenname $surname)\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?)\b/) {
    	#print "Hai5\n";
      $line =~ s/ ($givenname $surname)(\,? (?:[Ee]ditors|\([Ee]ds?\.?\)|\([Ee]ds\.?\)|\([Ee]ds?\.\)|\(?[Ee]ds?\.?\)?))\b/ <Editorgroup>$1<\/Editorgroup>$4/;
    }
  }
  $line =~ s/<Editorgroup>In /In <Editorgroup>/;
  #print $line,"\n";

  return $line;
}

sub nameConvert
{
	 	my $line = shift;
	 	my $debug = 0;
	 	#print $line,"\n";
	 	if ($line =~ m/<Authorgroup>(.*?)<\/Authorgroup>/) {
	 	  my $autGrp = $&;
	 	  if ($autGrp =~m/<Year>/){
	 	    $autGrp =~s/(\s*\(?<Year>.*?)(<\/Authorgroup>)/$2$1/si;
	 	  }
	 	  $line =~ s/<Authorgroup>(.*?)<\/Authorgroup>/$autGrp/;
	 	}
	 	$line =~ s/\,<\/Authorgroup>/<\/Authorgroup>\,/;
    if ($line =~ m/<Authorgroup>(.*?)<\/Authorgroup>/ && $line !~ m/<Surname>/) {
      my $authorgroup = $1;
      #print $authorgroup,"\n\n";
      #$authorgroup =~ s/($givenname $surname|$givenname $surname $suffix) et al\./$1, et al./gi;
      #$authorgroup =~ s/($givenname $surname|$givenname $surname $suffix) et al$/$1, et al./gi;
      #$authorgroup =~ s/([^\,]) ([Aa]nd|&amp;|XXXampXXX) /${1}, and /g;
      #print $authorgroup,"\n\n";
	    #print $authorgroup,"\n";
      if ($authorgroup =~ m/^$surname\, $givenname$/) {
      	print "Individual Aut 1\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>/;
        #print $authorgroup,"\n";
      } elsif ($authorgroup =~ m/^$surname $givenname$/) {
      	print "Individual Aut 2\n" if($debug);
        $authorgroup =~ s/^$surname $givenname$/<Surname>$1<\/Surname> <Forename>$2<\/Forename>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname\,? $suffix$/) {
      	print "Individual Aut 3\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname(\,? )$suffix$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3<Suffix>$4<\/Suffix>/;
      } elsif ($authorgroup =~ m/^$surname\, $suffix\, $givenname$/) {
      	print "Individual Aut 4\n" if($debug);
        $authorgroup =~ s/^$surname\, $suffix\, $givenname$/<Surname>$1<\/Surname>\, <Suffix>$2<\/Suffix>\, <Forename>$3<\/Forename>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname (et\.? al\.)$/) {
      	print "Individual Aut 5\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname (et\.? al\.)$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename> <Etal>$3<\/Etal>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname\, (et\.? al\.)$/) {
      	print "Individual Aut 6\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname\, (et\.? al\.)$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Etal>$3<\/Etal>/;
      } elsif ($authorgroup =~ m/^$givenname $surname (et\.? al\.)$/) {
      	print "Individual Aut 7\n" if($debug);
        $authorgroup =~ s/^$givenname $surname (et\.? al\.)$/<Forename>$1<\/Forename> <Surname>$2<\/Surname> <Etal>$3<\/Etal>/;
      } elsif ($authorgroup =~ m/^$surname $givenname\, (et\.? al\.)$/) {
      	print "Individual Aut 8\n" if($debug);
        $authorgroup =~ s/^$surname $givenname\, (et\.? al\.)$/<Surname>$1<\/Surname> <Forename>$2<\/Forename>\, <Etal>$3<\/Etal>/;
      } elsif ($authorgroup =~ m/^$surname $givenname (et\.? al\.)$/) {
      	print "Individual Aut 9\n" if($debug);
        $authorgroup =~ s/^$surname $givenname (et\.? al\.)$/<Surname>$1<\/Surname> <Forename>$2<\/Forename> <Etal>$3<\/Etal>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname (et\.? al\.)$/) {
      	print "Individual Aut 10\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname (et\.? al\.)$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename> <Etal>$3<\/Etal>/;
      } elsif ($authorgroup =~ m/^$surname\,? $givenname([\,]?) (?:[Aa]nd|XXXampXXX) $surname\,? $givenname\,? $suffix$/) {
      	print "Individual Aut 11\n" if($debug);
        $authorgroup =~ s/^$surname(\,? )$givenname([\,]? (?:[Aa]nd|XXXampXXX) )$surname(\,? )$givenname(\,? )$suffix$/<Surname>$1<\/Surname>$2<Forename>$3<\/Forename>$4<Surname>$5<\/Surname>$6<Forename>$7<\/Forename>$8<Suffix>$9<\/Suffix>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname([\,]?) (?:[Aa]nd|XXXampXXX) $surname $suffix\, $givenname$/) {
      	print "Individual Aut 12\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname([\,]?) ([Aa]nd|XXXampXXX) $surname $suffix\, $givenname$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3 $4 <Surname>$5<\/Surname> <Suffix>$6<\/Suffix>\, <Forename>$7<\/Forename>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname([\,]?) (?:[Aa]nd|XXXampXXX) $surname\, $givenname$/) {
      	print "Individual Aut 13\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname([\,]?) ([Aa]nd|XXXampXXX) $surname\, $givenname$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3 $4 <Surname>$5<\/Surname>\, <Forename>$6<\/Forename>/;
      } elsif ($authorgroup =~ m/^$surname $givenname\, ([Aa]nd|XXXampXXX) $surname\, $givenname$/) {
      	print "Individual Aut 14\n" if($debug);
        $authorgroup =~ s/^$surname $givenname\, ([Aa]nd|XXXampXXX) $surname\, $givenname$/<Surname>$1<\/Surname> <Forename>$2<\/Forename>\, $3 <Surname>$4<\/Surname>\, <Forename>$5<\/Forename>/;
      } elsif ($authorgroup =~ m/^$surname $givenname\, ([Aa]nd|XXXampXXX) $surname $givenname$/) {
      	print "Individual Aut 15\n" if($debug);
        $authorgroup =~ s/^$surname $givenname\, ([Aa]nd|XXXampXXX) $surname $givenname$/<Surname>$1<\/Surname> <Forename>$2<\/Forename>\, $3 <Surname>$4<\/Surname> <Forename>$5<\/Forename>/;
      } elsif ($authorgroup =~ m/^$surname\, $givenname\, $surname $givenname$/) {
      	print "Individual Aut 16\n" if($debug);
        $authorgroup =~ s/^$surname\, $givenname\, $surname $givenname$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, and <Surname>$3<\/Surname>\, <Forename>$4<\/Forename>/;
      } elsif($authorgroup =~ s/^((?:Mc|Mac)?[A-Z][a-z]+)\, ([A-Z][a-z]+)( [Ee]t a[lL]\.?)/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>$3/) {
    	} elsif ($authorgroup !~ m/\,/ && $authorgroup !~ m/ and / && $authorgroup =~ m/[A-Za-z&;\#]+ [A-Za-z&;\#]+ [A-Za-z&;\#]+ [A-Za-z&;\#]+/) {
        print "Individual Aut 17\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup !~ m/\,/ && $authorgroup !~ m/ and / && $authorgroup =~ m/[A-Za-z&;\#]+ [A-Za-z&;\#]+ [A-Za-z&;\#]+/) {
      	print "Individual Aut 18\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup !~ m/\,/ && $authorgroup !~ m/ and / && $authorgroup =~ m/[A-Za-z&;\#]+ [A-Za-z&;\#]+/) {
      	print "Individual Aut 19\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup !~ m/\,/ && $authorgroup =~ m/^[A-Z][A-Z]+/) {
      	print "Individual Aut 20\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup =~ m/^[A-Za-z&;\#]+ [A-Za-z&;\#]+ [A-Za-z&;\#]+/) {
      	print "Individual Aut collab1\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup =~ m/^[A-Z]\.[A-Z]\.[A-Z]\./) {
      	print "Individual Aut collab2\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup =~ m/^[A-Z]\.[A-Z]\./ && $authorgroup !~ m/^[A-Z]\.[A-Z]\. [A-z\-&;]+\,/) {
      	print "Individual Aut collab3\n" if($debug);
        $authorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($authorgroup =~ m/^($surname\, $givenname[\,\;] |[A-Z]\-[A-Z][a-z]+\-[A-Z][a-z]+\, $givenname[\,\;] |$surname\,? $suffix\, $givenname\, |$surname\,? $givenname |$surname $givenname\, |$surname\,? $suffix\, $givenname|$surname\, $givenname&comma; $suffix\, )/) {
        my $temp = '';
        print "Individual Aut 21\n" if($debug);
        $authorgroup =~ s/\, [Aa]nd /&comma; and /;
        $authorgroup =~ s/\, XXXampXXX /&comma; XXXampXXX /;
        $authorgroup =~ s/\, $suffix\, /&comma; $1\, /;
        #print $authorgroup,"\n";
        while ($authorgroup =~ m/^$surname $suffix\,? $givenname\, /
              || $authorgroup =~ m/^$surname\, $givenname [Aa]nd /
              || $authorgroup =~ m/^$surname $suffix\,? $givenname [Aa]nd /
              || $authorgroup =~ m/^$surname\, $givenname&comma; [Aa]nd /
              || $authorgroup =~ m/^$surname $suffix\,? $givenname&comma; [Aa]nd /
              || $authorgroup =~ m/^$surname\, $givenname&comma; XXXampXXX /
              || $authorgroup =~ m/^$surname\, $givenname\, XXXampXXX /
              || $authorgroup =~ m/^$surname\, $givenname XXXampXXX /
              || $authorgroup =~ m/^$surname\, $givenname\,$/
              || $authorgroup =~ m/^$surname $suffix\,? $givenname\,$/
              || $authorgroup =~ m/^$surname\, $givenname$/
              || $authorgroup =~ m/^$surname $suffix\,? $givenname$/
              || $authorgroup =~ m/^$surname\, $givenname&comma; $suffix\, /
              || $authorgroup =~ m/^$surname\, $givenname&comma; $suffix/
              || $authorgroup =~ m/^$surname\, $givenname\, $suffix&comma; [Aa]nd /
              || $authorgroup =~ m/^$surname\, $givenname\, $suffix\b/
              || $authorgroup =~ m/^$surname\, $givenname\, /
              || $authorgroup =~ m/^$surname $givenname\, /
              || $authorgroup =~ m/^$surname&comma; $givenname\, /
              || $authorgroup =~ m/^$surname $givenname$/
              || $authorgroup =~ m/^$givenname $surname$/
              || $authorgroup =~ m/^$givenname [A-Z][a-z] $surname\,? ?/
              || $authorgroup =~ m/^$givenname $surname\, /
              || $authorgroup =~ m/^$givenname $surname\.$/
              || $authorgroup =~ m/^$givenname $surname&comma; [Aa]nd /
              || $authorgroup =~ m/^$surname $givenname&comma; [Aa]nd /
              || $authorgroup =~ m/^$givenname $surname [Aa]nd /
              || $authorgroup =~ m/&comma; [Aa]nd $surname\, $givenname$/
              || $authorgroup =~ m/\& $surname\, $givenname$/
              || $authorgroup =~ m/^$surname\, [A-Z]\. [A-Z]$/
              || $authorgroup =~ m/[A-Z]\-[A-Z][a-z]+\-[A-Z][a-z]+\, $givenname[\,\;] ?/
              ) {
          my ($before, $match, $after) = ($`, $&, $');
          $temp .= $before . "<author>$match<\/author>";
          $authorgroup = $after;
          #print $authorgroup,"\n";
        }
        $temp .= $authorgroup;
        $authorgroup = $temp;
        #print $authorgroup,"\n";
        $authorgroup =~ s/($surname\,? $givenname&comma; [Aa]nd )(?!<\/author>)/<author>$1<\/author>/;
        #print $authorgroup,"\n";
        while ($authorgroup =~ s/( $surname\, $givenname\,? ?|^$surname $givenname\, ?)<author>/<author>$1<\/author><author>/g){}
        #print $authorgroup,"\n";
      } elsif ($authorgroup =~ m/^($givenname\, $surname\, |$givenname $surname\, |$givenname $surname $suffix\, |$givenname $surname |$givenname $prefix $surname |$givenname $surname$)/) {
        my $temp = '';
        $authorgroup =~ s/\, [Aa]nd /&comma; and /;
        #print $authorgroup,"\n";
        print "Individual Aut 22\n" if($debug);
        while (  $authorgroup =~ m/^$givenname $surname\, $suffix [Aa]nd /
        			|| $authorgroup =~ m/^$givenname $surname $suffix&comma; [Aa]nd /
        			|| $authorgroup =~ m/^$givenname\, $surname\, $suffix&comma; [Aa]nd /
        			|| $authorgroup =~ m/^$givenname\, $surname&comma; [Aa]nd /
        			|| $authorgroup =~ m/^$givenname\, $surname\, $suffix\, /
              || $authorgroup =~ m/^$givenname $surname\,? $suffix\, /
              || $authorgroup =~ m/^$givenname $surname\,? $suffix$/
              || $authorgroup =~ m/^$givenname $surname $suffix\.$/
              || $authorgroup =~ m/^$givenname $surname $suffix\,$/
              || $authorgroup =~ m/^$givenname $surname $suffix$/
              || $authorgroup =~ m/^$givenname $surname\, [Aa]nd /
              || $authorgroup =~ m/^$givenname $surname [Aa]nd /
              || $authorgroup =~ m/^$givenname\, $surname$/
              || $authorgroup =~ m/^$givenname $surname$/
              || $authorgroup =~ m/^$givenname $surname\, /
              || $authorgroup =~ m/^$givenname\, $surname\, /
              || $authorgroup =~ m/ [Aa]nd $givenname $surname$/
              || $authorgroup =~ m/^$surname\, $givenname\, /
              || $authorgroup =~ m/^$surname\, $givenname&comma;/
              || $authorgroup =~ m/^$surname\, $givenname$/
              || $authorgroup =~ m/ [Aa]nd $surname\, $givenname$/
              || $authorgroup =~ m/\& $surname\, $givenname$/
              ) {
          my ($before, $match, $after) = ($`, $&, $');
          #print "$givenname $surname\n";
          $temp .= $before . "<author>$match<\/author>";
          $authorgroup = $after;
          #print $authorgroup,"\n";
        }
        $temp .= $authorgroup;
        $authorgroup = $temp;
        #print $authorgroup,"\n";
      } elsif ($authorgroup =~ m/( $surname\, $givenname\, [Aa]nd |\, [Aa]nd $surname\, $givenname$|$surname $givenname\, |$surname\,? $suffix\, $givenname$)/) {
        my $temp = '';
        $authorgroup =~ s/\, [Aa]nd /&comma; and /;
        #print $authorgroup,"\n";
        while ( $authorgroup =~ m/^$surname $givenname\, /
        			|| $authorgroup =~ m/^$surname\, $givenname\, /
        			|| $authorgroup =~ m/^$surname\, $givenname [A-Z]\, /
        			|| $authorgroup =~ m/^$surname\, $givenname $suffix/
        			|| $authorgroup =~ m/^$surname\, $givenname /
        			|| $authorgroup =~ m/$surname\, $givenname&comma; [Aa]nd /
        			|| $authorgroup =~ m/$surname $givenname&comma; [Aa]nd /
        			|| $authorgroup =~ m/$surname $givenname XXXampXXX /
              || $authorgroup =~ m/&comma; [Aa]nd $surname\, $givenname$/
              || $authorgroup =~ m/\& $surname\, $givenname$/
              || $authorgroup =~ m/&comma; [Aa]nd $surname\, $suffix\, $givenname$/
              || $authorgroup =~ m/&comma; [Aa]nd $surname $suffix\, $givenname$/
              || $authorgroup =~ m/^$surname\, $givenname$/
              || $authorgroup =~ m/^$surname $givenname$/
              
               ) {
          my ($before, $match, $after) = ($`, $&, $');
          $temp .= $before . "<author>$match<\/author>";
          $authorgroup = $after;
          #print $authorgroup,"\n";
        }
        $temp .= $authorgroup;
        $authorgroup = $temp;
        #print $authorgroup,"\n";
        while ($authorgroup =~ s/( $surname\, $givenname\, ?|^$surname $givenname\, ?)<author>/<author>$1<\/author><author>/g){}
        #print $authorgroup,"\n";exit;
      } else {
        #print $authorgroup,"\n";
        $authorgroup =~ s/(.*)/<error>$1<\/error>/;
      }
      #print $authorgroup,"\n";
      $authorgroup =~ s/([\,\;] | [Aa]nd |&comma; [Aa]nd |\,|&comma; XXXampXXX | XXXampXXX )<\/author>/<\/author>$1/g;
      $authorgroup =~ s/<author>([\,\;] | [Aa]nd |&comma; [Aa]nd |\&[^A-Za-z0-9]|\,)/$1<author>/g;
      $authorgroup =~ s/<author> / <author>/g;
      $authorgroup =~ s/(\&comma\; ?)<\/author>/<\/author>$1/g;
      $authorgroup =~ s/&comma; [Aa]nd /\, and /;
      $authorgroup =~ s/&comma; $suffix/\, $1/;
      $authorgroup =~ s/&comma;/\,/;
      $authorgroup =~ s/<author>($givenname $surname)\.<\/author>/<author>$1<\/author>\./g;
      $authorgroup =~ s/ <\/author>/<\/author> /g;
      #print $authorgroup,"\n";

      $authorgroup =~ s{<author>(.*?)<\/author>}
      {
        my $author = $1;
        if ($author =~ m/^$surname\, $givenname$/) {
        	
          $author =~ s/^$surname\, $givenname$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>/;
          
        } elsif ($author =~ m/^$surname\, [A-Z]\. ?[A-Z]$/) {
        	
          $author =~ s/^$surname\, ([A-Z]\. ?[A-Z])$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>/;
          
        } elsif ($author =~ m/^$surname $givenname$/) {
        	
          $author =~ s/^$surname $givenname$/<Surname>$1<\/Surname> <Forename>$2<\/Forename>/;
          
        } elsif ($author =~ m/^$surname\,? $suffix\, $givenname$/) {
        	
          $author =~ s/^$surname([\,]?) $suffix\, $givenname$/<Surname>$1<\/Surname>$2 <Suffix>$3<\/Suffix>\, <Forename>$4<\/Forename>/;
          
        } elsif ($author =~ m/$surname\,? $suffix\, $givenname$/) {
        	
          $author =~ s/$surname([\,]?) $suffix\, $givenname$/<Surname>$1<\/Surname>$2 <Suffix>$3<\/Suffix>\, <Forename>$4<\/Forename>/;
          
        } elsif ($author =~ m/^$givenname\, $surname$/) {
        	
          $author =~ s/^$givenname\, $surname$/<Forename>$1<\/Forename>\, <Surname>$2<\/Surname>/;
          
        } elsif ($author =~ m/^$givenname $surname$/) {
        	
          $author =~ s/^$givenname $surname$/<Forename>$1<\/Forename> <Surname>$2<\/Surname>/;
          
        } elsif ($author =~ m/^$givenname $surname $suffix$/) {
          
          $author =~ s/^$givenname $surname $suffix$/<Forename>$1<\/Forename> <Surname>$2<\/Surname> <Suffix>$3<\/Suffix>/;
          
        } elsif ($author =~ m/^$givenname $surname\, $suffix$/) {
          
          $author =~ s/^$givenname $surname\, $suffix$/<Forename>$1<\/Forename> <Surname>$2<\/Surname>\, <Suffix>$3<\/Suffix>/;
          
        } elsif ($author =~ m/^$surname\, $givenname\, $suffix$/) {
        	
          $author =~ s/^$surname\, $givenname\, $suffix$/<Surname>$1<\/Surname>\, <Forename>$2<\/Forename>\, <Suffix>$3<\/Suffix>/;
          
        } elsif ($author =~ m/^$givenname $surname $suffix\.$/) {
        	
          $author =~ s/^$givenname $surname $suffix\.$/<Forename>$1<\/Forename> <Surname>$2<\/Surname> <Suffix>$3<\/Suffix>\./;
          
        } else {
          $author =~ s/(.*)/<error>$1<\/error>/;
          
        }
        $author;
      }eg;
      $authorgroup =~ s/(<\/Forename>\,?) (et al\.)/$1 <Etal>$2<\/Etal>/gi;
      $authorgroup =~ s/(<\/surname>\,?) (et al\.)/$1 <Etal>$2<\/Etal>/gi;
      $authorgroup =~ s/(<\/Forename>\,?) (<em>et al\.<\/em>)/$1 <Etal>$2<\/Etal>/gi;
      $authorgroup =~ s/(<\/surname>\,?) (<em>et al\.<\/em>)/$1 <Etal>$2<\/Etal>/gi;
#print $line,"\n\n";
      #$line =~ s/<Authorgroup>(.*?)<\/Authorgroup>/$authorgroup/;
      $line =~ s/<Authorgroup>(.*?)<\/Authorgroup>/<Authorgroup>$authorgroup<\/Authorgroup>/;
    }


    if ($line =~ m/<Editorgroup>(.*?)<\/Editorgroup>/) {
      my $editorgroup = $1;
      $editorgroup =~ s/($givenname $surname|$givenname $surname $suffix) et al\./$1, et al./gi;
      $editorgroup =~ s/([^\,]) ([Aa]nd|&amp;|XXXampXXX) /${1}, and /g;
      $editorgroup =~ s/\, ([Aa]nd|&amp;|XXXampXXX) /\, and /g;
#	print $editorgroup,"\n";
      if ($editorgroup =~ m/^$surname\, $givenname$/) {
        $editorgroup =~ s/^$surname\, $givenname$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>/;
      } elsif ($editorgroup =~ m/^$surname $givenname$/) {
        $editorgroup =~ s/^$surname $givenname$/<ESurname>$1<\/ESurname> <EForename>$2<\/EForename>/;
      } elsif ($editorgroup =~ m/^$surname\, $givenname\,? $suffix$/) {
        $editorgroup =~ s/^$surname\, $givenname(\,? )$suffix$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>$3<Suffix>$4<\/Suffix>/;
      } elsif ($editorgroup =~ m/^$surname\, $suffix\, $givenname$/) {
        $editorgroup =~ s/^$surname\, $suffix\, $givenname$/<ESurname>$1<\/ESurname>\, <Suffix>$2<\/Suffix>\, <EForename>$3<\/EForename>/;
      } elsif ($editorgroup =~ m/^$surname\, $givenname\, (et\.? al\.)$/) {
        $editorgroup =~ s/^$surname\, $givenname\, (et\.? al\.)$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>\, <Etal>$3<\/Etal>/;
      } elsif ($editorgroup =~ m/^$surname $givenname\, (et\.? al\.)$/) {
        $editorgroup =~ s/^$surname $givenname\, (et\.? al\.)$/<ESurname>$1<\/ESurname> <EForename>$2<\/EForename>\, <Etal>$3<\/Etal>/;
      } elsif ($editorgroup =~ m/^$surname\, $givenname (et\.? al\.)$/) {
        $editorgroup =~ s/^$surname\, $givenname (et\.? al\.)$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename> <Etal>$3<\/Etal>/;
      } elsif ($editorgroup =~ m/^$surname\, $givenname([\,]?) [Aa]nd $surname $suffix\, $givenname$/) {
        $editorgroup =~ s/^$surname\, $givenname([\,]?) [Aa]nd $surname $suffix\, $givenname$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>$3 and <ESurname>$4<\/ESurname> <Suffix>$5<\/Suffix>\, <EForename>$6<\/EForename>/;
      } elsif ($editorgroup =~ m/^$surname\, $givenname([\,]?) [Aa]nd $surname\, $givenname$/) {
        $editorgroup =~ s/^$surname\, $givenname([\,]?) [Aa]nd $surname\, $givenname$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>$3 and <ESurname>$4<\/ESurname>\, <EForename>$5<\/EForename>/;
      } elsif ($editorgroup =~ m/^$surname $givenname\, [Aa]nd $surname\, $givenname$/) {
        $editorgroup =~ s/^$surname $givenname\, [Aa]nd $surname\, $givenname$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>\, and <ESurname>$3<\/ESurname>\, <EForename>$4<\/EForename>/;
      } elsif ($editorgroup !~ m/\,/ && $editorgroup =~ m/[A-Za-z&;\#]+ [A-Za-z&;\#]+ [A-Za-z&;\#]+/) {
        $editorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($editorgroup !~ m/\,/ && $editorgroup =~ m/^[A-Z][A-Z]+/) {
        $editorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($editorgroup =~ m/^[A-Za-z&;\#]+ [A-Za-z&;\#]+ [A-Za-z&;\#]+/) {
        $editorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($editorgroup =~ m/^[A-Z]\.[A-Z]\.[A-Z]\./) {
        $editorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($editorgroup =~ m/^[A-Z]\.[A-Z]\./ && $editorgroup !~ m/^[A-Z]\.[A-Z]\. [A-z\-&;]+\,/) {
        $editorgroup =~ s/(.*)/<Collab>$1<\/Collab>/;
      } elsif ($editorgroup =~ m/^($surname\, $givenname[\,\;] |$surname\,? $suffix\, $givenname\, |$surname\,? $suffix\, $givenname|$surname\, $givenname&comma; $suffix\, )/) {
        my $temp = '';
        $editorgroup =~ s/\, [Aa]nd /&comma; and /;
        $editorgroup =~ s/\, $suffix\, /&comma; $1\, /;
        while ($editorgroup =~ m/^$surname $suffix\,? $givenname\, /
              || $editorgroup =~ m/^$surname\, $givenname [Aa]nd /
              || $editorgroup =~ m/^$surname $suffix\,? $givenname [Aa]nd /
              || $editorgroup =~ m/^$surname\, $givenname&comma; [Aa]nd /
              || $editorgroup =~ m/^$surname $suffix\,? $givenname&comma; [Aa]nd /
              || $editorgroup =~ m/^$surname\, $givenname\,$/
              || $editorgroup =~ m/^$surname $suffix\,? $givenname\,$/
              || $editorgroup =~ m/^$surname\, $givenname$/
              || $editorgroup =~ m/^$surname $suffix\,? $givenname$/
              || $editorgroup =~ m/^$surname\, $givenname&comma; $suffix\, /
              || $editorgroup =~ m/^$surname\, $givenname&comma; $suffix/
              || $editorgroup =~ m/^$surname\, $givenname\, $suffix&comma; [Aa]nd /
              || $editorgroup =~ m/^$surname\, $givenname\, $suffix/
              || $editorgroup =~ m/^$surname\, $givenname\, /
              || $editorgroup =~ m/^$surname $givenname$/
              || $editorgroup =~ m/&comma; [Aa]nd $surname\, $givenname$/
              || $editorgroup =~ m/^$givenname $surname$/
              || $editorgroup =~ m/^$givenname $surname\, /
              || $editorgroup =~ m/^$givenname $surname\.$/
              || $editorgroup =~ m/^$givenname $surname&comma; [Aa]nd /
              ) {
          my ($before, $match, $after) = ($`, $&, $');
          $temp .= $before . "<editor>$match<\/editor>";
          $editorgroup = $after;
          #print $editorgroup,"\n";
        }
        $temp .= $editorgroup;
        $editorgroup = $temp;
        #print $editorgroup,"\n";
        $editorgroup =~ s/($surname\,? $givenname&comma; [Aa]nd )(?!<\/editor>)/<editor>$1<\/editor>/;
        #print $editorgroup,"\n";
        while ($editorgroup =~ s/( $surname\, $givenname\,? ?|^$surname $givenname\, ?)<editor>/<editor>$1<\/editor><editor>/g){}
        #print $editorgroup,"\n";
      } elsif ($editorgroup =~ m/^($givenname $surname\, |$givenname $surname $suffix\, |$givenname $surname$)/) {
        my $temp = '';
        $editorgroup =~ s/\, [Aa]nd /&comma; and /;
        #print $editorgroup,">>>>\n";
        while (  $editorgroup =~ m/^$givenname $surname\, $suffix [Aa]nd /
        			|| $editorgroup =~ m/^$givenname $surname $suffix&comma; [Aa]nd /
              || $editorgroup =~ m/^$givenname $surname\,? $suffix\, /
              || $editorgroup =~ m/^$givenname $surname\,? $suffix/
              || $editorgroup =~ m/^$givenname $surname $suffix\.$/
              || $editorgroup =~ m/^$givenname $surname $suffix\,$/
              || $editorgroup =~ m/^$givenname $surname $suffix$/
              || $editorgroup =~ m/^$givenname $surname\, [Aa]nd /
              || $editorgroup =~ m/^$givenname $surname [Aa]nd /
              || $editorgroup =~ m/^$givenname $surname$/
              || $editorgroup =~ m/^$givenname $surname\, /
              ) {
          my ($before, $match, $after) = ($`, $&, $');
          #print "$givenname $surname\n";
          $temp .= $before . "<editor>$match<\/editor>";
          $editorgroup = $after;
          #print $editorgroup,"\n";
        }
        $temp .= $editorgroup;
        $editorgroup = $temp;
        #print $editorgroup,"\n";
      } elsif ($editorgroup =~ m/( $surname\, $givenname\, [Aa]nd |\, [Aa]nd $surname\, $givenname$|$surname $givenname\, |$surname\,? $suffix\, $givenname$)/) {
        my $temp = '';
        $editorgroup =~ s/\, [Aa]nd /&comma; and /;
        while ( $editorgroup =~ m/^$surname $givenname\, /
        			|| $editorgroup =~ m/^$surname\, $givenname\, /
        			|| $editorgroup =~ m/^$surname\, $givenname [A-Z]\, /
        			|| $editorgroup =~ m/^$surname\, $givenname $suffix/
        			|| $editorgroup =~ m/$surname\, $givenname&comma; [Aa]nd /
        			|| $editorgroup =~ m/$surname $givenname&comma; [Aa]nd /
              || $editorgroup =~ m/&comma; [Aa]nd $surname\, $givenname$/
              || $editorgroup =~ m/&comma; [Aa]nd $surname\, $suffix\, $givenname$/
              || $editorgroup =~ m/&comma; [Aa]nd $surname $suffix\, $givenname$/
              || $editorgroup =~ m/^$surname\, $givenname$/
              || $editorgroup =~ m/^$surname $givenname$/
              
               ) {
          my ($before, $match, $after) = ($`, $&, $');
          $temp .= $before . "<editor>$match<\/editor>";
          $editorgroup = $after;
          #print $editorgroup,"\n";
        }
        $temp .= $editorgroup;
        $editorgroup = $temp;
        #print $editorgroup,"\n";
        while ($editorgroup =~ s/( $surname\, $givenname\, ?|^$surname $givenname\, ?)<editor>/<editor>$1<\/editor><editor>/g){}
        #print $editorgroup,"\n";
      } else {
        $editorgroup =~ s/(.*)/<error>$1<\/error>/;
      }
      $editorgroup =~ s/([\,\;] | [Aa]nd |&comma; [Aa]nd |\,)<\/editor>/<\/editor>$1/g;
      $editorgroup =~ s/<editor>([\,\;] | [Aa]nd |&comma; [Aa]nd |\,)/$1<editor>/g;
      $editorgroup =~ s/<editor> / <editor>/g;
      $editorgroup =~ s/&comma; [Aa]nd /\, and /;
      $editorgroup =~ s/&comma; $suffix/\, $1/;
      $editorgroup =~ s/<editor>($givenname $surname)\.<\/editor>/<editor>$1<\/editor>\./g;
      #print $editorgroup,"\n";
      
      $editorgroup =~ s{<editor>(.*?)<\/editor>}
      {
        my $author = $1;
         
        if ($author =~ m/^$surname\, $givenname$/) {
        	
          $author =~ s/^$surname\, $givenname$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>/;
          
        } elsif ($author =~ m/^$surname $givenname$/) {
        	
          $author =~ s/^$surname $givenname$/<ESurname>$1<\/ESurname> <EForename>$2<\/EForename>/;
          
        } elsif ($author =~ m/^$surname\,? $suffix\, $givenname$/) {
        	
          $author =~ s/^$surname([\,]?) $suffix\, $givenname$/<ESurname>$1<\/ESurname>$2 <Suffix>$3<\/Suffix>\, <EForename>$4<\/EForename>/;
          
        } elsif ($author =~ m/$surname\,? $suffix\, $givenname$/) {
        	
          $author =~ s/$surname([\,]?) $suffix\, $givenname$/<ESurname>$1<\/ESurname>$2 <Suffix>$3<\/Suffix>\, <EForename>$4<\/EForename>/;
          
        } elsif ($author =~ m/^$givenname\, $surname$/) {
        	
          $author =~ s/^$givenname\, $surname$/<EForename>$1<\/EForename>\, <ESurname>$2<\/ESurname>/;
          
        } elsif ($author =~ m/^$givenname $surname$/) {
        	
          $author =~ s/^$givenname $surname$/<EForename>$1<\/EForename> <ESurname>$2<\/ESurname>/;
          
        } elsif ($author =~ m/^$givenname $surname $suffix$/) {
          
          $author =~ s/^$givenname $surname $suffix$/<EForename>$1<\/EForename> <ESurname>$2<\/ESurname> <Suffix>$3<\/Suffix>/;
          
        } elsif ($author =~ m/^$givenname $surname\, $suffix$/) {
          
          $author =~ s/^$givenname $surname\, $suffix$/<EForename>$1<\/EForename> <ESurname>$2<\/ESurname>\, <Suffix>$3<\/Suffix>/;
          
        } elsif ($author =~ m/^$surname\, $givenname\, $suffix$/) {
        	
          $author =~ s/^$surname\, $givenname\, $suffix$/<ESurname>$1<\/ESurname>\, <EForename>$2<\/EForename>\, <Suffix>$3<\/Suffix>/;
          
        } elsif ($author =~ m/^$givenname $surname $suffix\.$/) {
        	
          $author =~ s/^$givenname $surname $suffix\.$/<EForename>$1<\/EForename> <ESurname>$2<\/ESurname> <Suffix>$3<\/Suffix>\./;
          
        } else {
        	
          $author =~ s/(.*)/<error>$1<\/error>/;
          
        }
        $author;
      }eg;
      $editorgroup =~ s/(<\/EForename>\,?) (et al\.)/$1 <Etal>$2<\/Etal>/gi;
      $editorgroup =~ s/(<\/surname>\,?) (et al\.)/$1 <Etal>$2<\/Etal>/gi;

      $line =~ s/<Editorgroup>(.*?)<\/Editorgroup>/$editorgroup/;
      #$line =~ s/<Editorgroup>(.*?)<\/Editorgroup>/<Editorgroup>$editorgroup<\/Editorgroup>/;
    }

    if ($line =~ m/<Collab>(.*?)<\/Collab>/) {
      my $collab = $1;
      if ($collab =~ m/\.$/) {
        my ($before, $match, $after) = ($`, $&, $');
        if ($before !~ m/\./) {
          $line =~ s/\.<\/Collab>/<\/Collab>\./;
        }
      }
    }
    $line =~ s/\.<\/LastPage>/<\/LastPage>\./;

   return $line; 
 }
1;	