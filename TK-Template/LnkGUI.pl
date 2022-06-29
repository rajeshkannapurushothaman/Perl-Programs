use Tk;
use Tk::FileDialog;


my $mw = MainWindow->new;
$mw->minsize(600, 300);
$mw->title("Website Link Validation");


my $types = [
    ['Excel Files',       ['.xls', '.xlsx']],
    ['All Files',        '*',             ],
];
my $File1;

my $fr1 = $mw->Frame->pack(-side => 'top');
my $label = $fr1->Label(-text => "Website Link Validation", -pady => 10, -font => 'Helvetica', -foreground => "#03A9F4")->pack(-side => 'left');


my $entryp = $mw->Entry(-width => 60)->place(-x =>90, -y =>120);

my $buttonbrws = $mw->Button(-width => 10, -fg => "#03A9F4", -text => "Browse", -command => sub{
	$File1 = $mw->getOpenFile(-filetypes=>$types);
	$entryp->delete('0', "end");
	if(defined $File1){$entryp->insert("end", "$File1");}
	})->place(-x =>465, -y =>116);

$mw->Button(-width => 10, -fg => "#03A9F4", -text => "Validate", -command => sub { exit })->place(-x =>195, -y =>186);

$mw->Button(-width => 10, -fg => "#03A9F4", -text => "Close", -command => sub { exit })->place(-x =>310, -y =>186);

$mw->Label(-text => "Version: 1.0.0", -fg => "#03A9F4")->place(-x =>480, -y =>275);


MainLoop;