##########################################################################
#
#     Tool Name			:		newList.pm
#     Version				:		1.0
#     Purpose				:		multilist conversion module with different types of output
#     Started on		:   11-12-2007, Tuesday.
#     Completed on	:
#     Last Updation	:   
#
##########################################################################

# in any perl pl file using >> use newList; << for include subroutine  >> newList::Lists(txtcontent,levelsYesNo,labelYesNo,liEntryTxt,EntermarksYesNo);
# attributes  1. txtcontent->txtcontent which has to be listed.
#							2. levelsYesNo->if you want sublevels in list give 1 otherwise 0
#							3. labelYesNo->if you want labels for list give 1 otherwise 0
#							4. liEntryTxt->give list item value its mean instead of li given text will be replaced
#							4. EntermarksYesNo->if 1 put entermarks with in list otherwise 0

use strict;
use warnings;
use Roman;
package newList;

sub Lists
{
	my ($content,$levels,$lblflag,$entry,$entermark)=("",0,0,"",0);
	$content=shift if(@_);
	$levels=shift if(@_);
	$lblflag=shift if(@_);
	$entry=shift if(@_);
	$entermark=shift if(@_);
	
	if($content ne "")
	{
		my $list="<list ";
		while($content =~ m/\Q$list\E.*?<\/list>/is)
		{
			$list=$&;
			my $list1=$list;
			if(WordCount($list,"<list ") == WordCount($list,"</list>"))
			{
				if(WordCount($list,"<list ")>1)
				{
					while($list=~m/<list /i)
					{
						$list=~s/^.*?<\/list>/ListConv($&)/ise;
					}
				}
				else
				{
					$list=~s/<list /<list1 /i;
					$list=~s/<\/list>/<\/list1>/i;
					$list=~s/(<\/?)li>/${1}li1>/ig;
				}
				$content=~s/\Q$list1\E/$list/is;
				$list="<list ";
			}
		}
		
		if(int($lblflag) == 0)
		{
			$content=~s/(<li[0-9]+>)<label>.*?<\/label>/$1/ig;
		}
		else
		{
			$content=~s/(<li[0-9]+>)<token>(.*?)<\/token>/$1<label>$2<\/label>/ig;
		}
		
		if(int($levels) == 0)
		{
			$content=~s/list[0-9]+ /list /ig;
			$content=~s/<li[0-9]+>/<li>/ig;
			$content=~s/<\/li[0-9]+>/<\/li>/ig;
			$content=~s/<\/list[0-9]+>/<\/list>/ig;
		}
		
		if(int($entermark) == 1)
		{
			$content=~s/\s*(<list[0-9]* .*?>)\s*/\n$1\n/ig;
			$content=~s/(<\/li[0-9]*>)\s*/$1\n/ig;
			$content=~s/(<\/list[0-9]*>)\s*/$1\n/ig;
		}
		if($entry ne "")
		{
			$content=~s/(<\/?)li([0-9]*>)/$1$entry$2/ig;
		}
	}
	return $content;
}

sub WordCount
{
	my $MainText=shift;
	my $FindText=shift;
	my $Count=0;
	$Count++ while($MainText=~m/\Q$FindText\E/ig);
	return $Count;
}

sub ListConv
{
	my $cont=shift;

	my $listcount=WordCount($cont,"<list ");
	my ($least)=$cont=~m/^.*(<list .*?<\/list>)$/is;
	my $least1=$least;
	
	my $liststart=0;
	my ($listtype)=$least=~m/^<list type="([^"><]+)"/i;
	
	if(lc($listtype) eq "num")
	{
		$liststart=1;
		$least=~s/<li>/"<li$listcount><label>".($liststart++).".<\/label>"/ige;
	}
	elsif(lc($listtype) eq "numparen")
	{
		$liststart=1;
		$least=~s/<li>/"<li$listcount><label>\(".($liststart++)."\)<\/label>"/ige;
	}
	elsif(lc($listtype) eq "clett")
	{
		$liststart="A";
		$least=~s/<li>/"<li$listcount><label>".($liststart++).".<\/label>"/ige;
	}
	elsif(lc($listtype) eq "clettparen")
	{
		$liststart="A";
		$least=~s/<li>/"<li$listcount><label>\(".($liststart++)."\)<\/label>"/ige;
	}
	elsif(lc($listtype) eq "lett")
	{
		$liststart="a";
		$least=~s/<li>/"<li$listcount><label>".($liststart++).".<\/label>"/ige;
	}
	elsif(lc($listtype) eq "lettparen")
	{
		$liststart="a";
		$least=~s/<li>/"<li$listcount><label>\(".($liststart++)."\)<\/label>"/ige;
	}
	elsif(lc($listtype) eq "croman")
	{
		$liststart=1;
		$least=~s/<li>/"<li$listcount><label>".uc(Roman::Roman($liststart++)).".<\/label>"/ige;
	}
	elsif(lc($listtype) eq "cromanparen")
	{
		$liststart=1;
		$least=~s/<li>/"<li$listcount><label>\(".uc(Roman::Roman($liststart++))."\)<\/label>"/ige;
	}
	elsif(lc($listtype) eq "roman")
	{
		$liststart=1;
		$least=~s/<li>/"<li$listcount><label>".lc(Roman::Roman($liststart++)).".<\/label>"/ige;
	}
	elsif(lc($listtype) eq "romanparen")
	{
		$liststart=1;
		$least=~s/<li>/"<li$listcount><label>\(".lc(Roman::Roman($liststart++))."\)<\/label>"/ige;
	}
	elsif(lc($listtype) eq "bullet")
	{
		$least=~s/<li>/<li$listcount><label>&bull;<\/label>/ig;
	}
	elsif(lc($listtype) eq "dash")
	{
		$least=~s/<li>/<li$listcount><label>&ndash;<\/label>/ig;
	}
	elsif(lc($listtype) eq "token")
	{
		$least=~s/<li><token>(.*?)<\/token>/<li$listcount><token>$1<\/token>/ig;
	}
	else
	{
		$least=~s/<li>/<li$listcount>/ig;
	}
	
	$least=~s/<list /<list$listcount /i;
	$least=~s/<\/list>/<\/list$listcount>/i;
	$least=~s/<\/li>/<\/li$listcount>/ig;
	
	$cont=~s/\Q$least1\E/$least/is;
	return $cont;
}
1;