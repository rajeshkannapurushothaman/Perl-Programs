##########################################################################
#
#     Tool Name    :   Reftagging.pm
#     Version      :   Version 1.0
#     Purpose      :   Author tagging between Authorgroup
#     Copyrights   :   Premedia Global (P) Ltd.
#     Developed By :   Rajeshkanna (Software Team)
#     Started on   :   16-07-2013
#
##########################################################################

# Module Declarations...

package Reftagging;

use strict;
use PMG::Authortag;
use Win32;
use Cwd;
use File::Basename;
use Cwd 'abs_path';

# Global Hash declaration
my $month = "Jan\.?|Feb\.?|Mar\.?|Apr\.?|May\.?|Jun\.?|Jul\.?|Aug\.?|Sep\.?|Oct\.?|Nov\.?|Dec\.?|January|February|March|April|June|July|August|September|October|November|December|Summer|Winter|Fall|Spring";
my $months = "(January|February|March|April|May|June|July|August|September|October|November|December)";

my $journalList = "Optics and Laser Technology|Applied Physics B\-Lasers and Optics|Applied Optics|Appl\. Opt\.|Applied Physics Letters|Optics Letters|Sensors and Actuators B\-Chemical";


# Locations
my %stateandCntryAbb = map { $_ => 1 } ("AB","AD","AE","AF","AG","AI","AK","AL","AM","AN","AO","AQ","AR","AS","AT","AU","AW","AZ","BA","BB","BC","BD","BE","BF","BG","BH","BI","BJ","BL","BM","BN","BO","BR","BS","BT","BW","BY","BZ","CA","CC","CD","CF","CG","CH","CI","CK","CL","CM","CN","CO","CR","CT","CU","CV","CX","CY","CZ","DC","DE","DJ","DK","DM","DO","DZ","EC","EE","EG","EH","ER","ES","ET","FI","FJ","FK","FL","FM","FO","FR","GA","GB","GD","GE","GH","GI","GL","GM","GN","GQ","GR","GT","GU","GW","GY","HI","HK","HN","HR","HT","HU","IA","ID","IE","IL","IM","IN","IO","IQ","IR","IS","IT","JE","JM","JO","JP","KE","KG","KH","KI","KM","KN","KP","KR","KS","KW","KY","KZ","LA","LB","LC","LI","LK","LR","LS","LT","LU","LV","LY","MA","MB","MC","MD","ME","MF","MG","MH","MI","MK","ML","MM","MN","MO","MP","MR","MS","MT","MU","MV","MW","MX","MY","MZ","NA","NB","NC","ND","NE","NF","NG","NH","NI","NJ","NL","NM","NO","NP","NR","NS","NT","NU","NV","NY","NZ","OH","OK","OM","ON","OR","PA","PE","PF","PG","PH","PK","PL","PM","PN","PQ","PR","PT","PW","PY","QA","RI","RO","RS","RU","RW","SA","SB","SC","SD","SE","SG","SH","SI","SJ","SK","SL","SM","SN","SO","SR","ST","SV","SY","SZ","TC","TD","TG","TH","TJ","TK","TL","TM","TN","TO","TR","TT","TV","TW","TX","TZ","UA","UG","UK","US","UT","UY","UZ","VA","VC","VE","VG","VI","VN","VT","VU","WA","WF","WI","WS","WV","WY","YE","YT","ZA","ZM","ZW");

my %states = ("Alabama" => "AL","Alaska" => "AK","Arizona" => "AZ","Arkansas" => "AR","California" => "CA","Colorado" => "CO","Connecticut" => "CT","Delaware" => "DE","Florida" => "FL","Georgia" => "GA","Hawaii" => "HI","Idaho" => "ID","Illinois" => "IL","Indiana" => "IN","Iowa" => "IA","Kansas" => "KS","Kentucky" => "KY","Louisiana" => "LA","Maine" => "ME","Maryland" => "MD","Massachusetts" => "MA","Michigan" => "MI","Minnesota" => "MN","Mississippi" => "MS","Missouri" => "MO","Montana" => "MT","Nebraska" => "NE","Nevada" => "NV","Hampshire" => "NH","New Hampshire" => "NH","New Jersey" => "NJ","New Mexico" => "NM","New York" => "NY","NewYork" => "NY","North Carolina" => "NC","North Dakota" => "ND","Ohio" => "OH","Oklahoma" => "OK","Oregon" => "OR","Pennsylvania" => "PA","Rhode Island" => "RI","South Carolina" => "SC","South Dakota" => "SD","Tennessee" => "TN","Texas" => "TX","Utah" => "UT","Vermont" => "VT","Virginia" => "VA","Washington" => "WA","West Virginia" => "WV","Wisconsin" => "WI","Wyoming" => "WY","American Samoa" => "AS","District of Columbia" => "DC","Federated States of Micronesia" => "FM","Guam" => "GU","Marshall Islands" => "MH","Northern Mariana Islands" => "MP","Palau" => "PW","Puerto Rico" => "PR","Virgin Islands" => "VI","Armed Forces Africa" => "AE","Armed Forces Americas" => "AA","Armed Forces Canada" => "AE","Armed Forces Europe" => "AE","Armed Forces Middle East" => "AE","Armed Forces Pacific" => "AP", "USA" => "US", "San Diego" => "CA", "Salt Lake City", => "UT");

my %cities = map { $_ => 1 } ('Abilene','Akron','Albuquerque','Alexandria','Allentown','Amarillo','Anaheim','Anchorage','Ann Arbor','Antioch','Arlington','Arvada','Athens','Atlanta','Augusta','Auburn','Aurora','Aurora','Austin','Bakersfield','Baltimore','Baton Rouge','Bangalore','Beaumont','Bellevue','Berkeley','Berlin','Billings','Birmingham','Bloomington','Boise','Boston','Boulder','Bridgeport','Broken Arrow','Brownsville','Brighton','Brest','Buffalo','Burbank','Cambridge','Cape Coral','Carlsbad','Carrollton','Cary','Cedar Rapids','Centennial','Chandler','Charleston','Charlotte','Chattanooga','Chesapeake','Chicago','Chula Vista','Cincinnati','Clarksville','Clearwater','Cleveland','Colorado Springs','Columbia','Columbus','Columbus','Concord','Coral Springs','Corona','Corpus Christi','Costa Mesa','Dallas','Daly City','Davenport','Dayton','New Delhi','Delhi','Denton','Denver','Des Moines','Detroit','Downey','Durham','El Cajon','El Monte','El Paso','Elgin','Elizabeth','Elk Grove','Englewood Cliffs','Erie','Escondido','Eugene','Evansville','Everett','Fairfield','Fargo','Fayetteville','Flint','Fontana','Fort Collins','Fort Lauderdale','Fort Wayne','Fort Worth','Fremont','Fresno','Frisco','Fullerton','Gainesville','Garden Grove','Garland','Gilbert','Glendale','Glendale','Grand Prairie','Grand Rapids','Green Bay','Greensboro','Gresham','Hampton','Hartford','Hayward','Henderson','Hertfordshire','Hialeah','High Point','Hollywood','Honolulu','Houston','Huntington Beach','Huntsville','Independence','Indianapolis','Inglewood','Iowa','Iowa City','Irvine','Irving','Jackson','Jacksonville','Jersey City','Joliet','Kansas City','Kenosha','Kent','Killeen','Karnataka','Knoxville','Lafayette','Lakewood','Lancaster','Lansing','Laredo','Las Cruces','Las Vegas','Lexington','Lincoln','Little Rock','London','Long Beach','Los Angeles','Louisville','Lowell','Lubbock','Madison','Malden','Manchester','McAllen','McKinney','Memphis','Mesa','Mesquite','Miami','Miami Gardens','Midland','Milwaukee','Minneapolis','Miramar','Mobile','Modesto','Montgomery','Moreno Valley','Murfreesboro','Murrieta','Naperville','Nashua','Nashville','New Haven','New Orleans','New York','NewYork','Newark','Newport News','New Brunswick','Norfolk','Norman','North Charleston','North Las Vegas','Norwalk','Oakland','Oceanside','Odessa','Oklahoma City','Olathe','Omaha','Ontario','Orange','Orlando','Overland Park','Oxnard','Palm Bay','Palmdale','Pasadena','Pasadena','Princeton','Paterson','Pembroke Pines','Peoria','Peoria','Philadelphia','Phoenix','Pittsburgh','Plano','Pomona','Pompano Beach','Port St. Lucie','Portland','Providence','Provo','Pueblo','Raleigh','Rancho Cucamonga','Reno','Rialto','Richardson','Richmond','Richmond','Riverside','Rochester','Rochester','Rockford','Roseville','Round Rock','Sacramento','Saint Paul','Salem','Salinas','Salt Lake City','San Antonio','San Bernardino','San Buenaventura (Ventura)','San Diego','San Francisco','San Jose','Santa Ana','Santa Clara','Santa Clarita','Santa Maria','Santa Rosa','Savannah','Scottsdale','Seattle','Shreveport','Simi Valley','Sioux Falls','South Bend','Spokane','Stanford','Springfield','Springfield','Springfield','St. Louis','St. Petersburg','Stamford','Sterling Heights','Stockton','Sunnyvale','Surprise','Syracuse','Tacoma','Tallahassee','Tampa','Temecula','Tempe','Thornton','Thousand Oaks','Toledo','Topeka','Torrance','Tucson','Tulsa','Vallejo','Vancouver','Victorville','Virginia Beach','Visalia','Waco','Warren','Washington','Waterbury','West Covina','West Jordan','West Palm Beach','West Valley City','Westminster','Wichita','Wichita Falls','Wilmington','Winston–Salem','Worcester','Yonkers','Aberdeen','Armagh','Bangor','Bath','Belfast','Birmingham','Bradford','Brighton and Hove','Bristol','Cambridge','Canterbury','Cardiff','Carlisle','Chester','Chichester','City of London','Coventry','Derby','Dundee','Durham','Edinburgh','Ely','Exeter','Glasgow','Gloucester','Hereford','Inverness','Kingston upon Hull','Lancaster','Leeds','Leicester','Lichfield','Lincoln','Lisburn','Liverpool','Londonderry','Manchester','Newcastle upon Tyne','Newport','Newry','Norwich','Nottingham','Oxford','Peterborough','Plymouth','Portsmouth','Preston','Ripon','Salford','Salisbury','Sheffield','Southampton','St Albans','St Davids','Stirling','Stoke-on-Trent','Sunderland','Swansea','Truro','Wakefield','Wells','Westminster','Winchester','Wolverhampton','Worcester','York','Canberra','New South Wales','Sydney','Albury','Armidale','Bathurst','Broken Hill','Cessnock','Coffs Harbour','Dubbo','Gosford','Goulburn','Grafton','Griffith','Lake Macquarie','Lismore','Maitland','Newcastle','Nowra','Orange','Port Macquarie','Queanbeyan','Tamworth','Tweed Heads','Wagga Wagga','Wollongong','Wyong','Northern Territory','Darwin','Alice Springs','Katherine','Palmerston','Queensland','Brisbane','Bundaberg','Cairns','Charters Towers','Gladstone','Gold Coast','Gympie','Hervey Bay','Ipswich','Logan City','Mackay','Maryborough','Mount Isa','Nambour','Redcliffe','Rockhampton','Sunshine Coast','Thuringowa','Toowoomba','Townsville','South Australia','Adelaide','Gladstone','Mount Gambier','Murray Bridge','Port Augusta','Port Pirie','Port Lincoln','Victor Harbor','Whyalla','Tasmania','Hobart','Burnie','Clarence','Devonport','Glenorchy','Launceston','Victoria','Melbourne','Benalla','Ballarat','Bendigo','Geelong','Latrobe City','Mildura','Shepparton','Swan Hill','Wangaratta','Warrnambool','Wodonga','Western Australia','Perth','Albany','Broome','Bunbury','Geraldton','Fremantle','Kalgoorlie','Mandurah','Port Hedland','Abashiri','Aizu-Wakamatsu','Akita','Aomori','Asahikawa','Beppu','Dazaifu','Fujiyoshida','Fukui','Fukuoka','Furano','Hagi','Hakodate','Hakone','Hikone','Himeji','Hiraizumi','Hiroshima','Hirosaki','Iga','Inuyama','Ise','Iwaki','Iwakuni','Kagoshima','Kakunodate','Kamakura','Kanazawa','Kawagoe','Kawasaki','Kitakyushu','Kobe','Kochi','Komatsu','Kotohira','Kumamoto','Kurashiki','Kyoto','Matsue','Matsumoto','Matsushima','Matsuyama','Minamata','Miyazaki','Nagano','Nagasaki','Nagoya','Naha','Nara','Narita','Naruto','Nikko','Noboribetsu','Okayama','Onomichi','Osaka','Otaru','Saitama','Sapporo','Sendai','Shimoda','Shizuoka','Takamatsu','Takayama','Tokushima','Tokyo','Tottori','Yamaguchi','Yarmouth','Yokohama');

my %Countrycode = ("Afghanistan" => "AF","Albania" => "AL","Algeria" => "DZ","American Samoa" => "AS","Andorra" => "AD","Angola" => "AO","Anguilla" => "AI","Antarctica" => "AQ","Antigua and Barbuda" => "AG","Argentina" => "AR","Armenia" => "AM","Aruba" => "AW","Australia" => "AU","Austria" => "AT","Azerbaijan" => "AZ","Bahamas" => "BS","Bahrain" => "BH","Bangladesh" => "BD","Barbados" => "BB","Belarus" => "BY","Belgium" => "BE","Belize" => "BZ","Benin" => "BJ","Bermuda" => "BM","Bhutan" => "BT","Bolivia" => "BO","Bosnia and Herzegovina" => "BA","Botswana" => "BW","Brazil" => "BR","British Indian Ocean Territory" => "IO","British Virgin Islands" => "VG","Brunei" => "BN","Bulgaria" => "BG","Burkina Faso" => "BF","Burma" => "MM","Myanmar" => "MM","Burundi" => "BI","Cambodia" => "KH","Cameroon" => "CM","Canada" => "CA","Cape Verde" => "CV","Cayman Islands" => "KY","Central African Republic" => "CF","Chad" => "TD","Chile" => "CL","China" => "CN","Christmas Island" => "CX","Cocos Islands" => "CC","Colombia" => "CO","Comoros" => "KM","Cook Islands" => "CK","Costa Rica" => "CR","Croatia" => "HR","Cuba" => "CU","Cyprus" => "CY","Czech Republic" => "CZ","Democratic Republic of the Congo" => "CD","Denmark" => "DK","Djibouti" => "DJ","Dominica" => "DM","Dominican Republic" => "DO","England" => "UK","Ecuador" => "EC","Egypt" => "EG","El Salvador" => "SV","Equatorial Guinea" => "GQ","Eritrea" => "ER","Estonia" => "EE","Ethiopia" => "ET","Falkland Islands" => "FK","Faroe Islands" => "FO","Fiji" => "FJ","Finland" => "FI","France" => "FR","French Polynesia" => "PF","Gabon" => "GA","Gambia" => "GM","Gaza Strip" => "","Georgia" => "GE","Germany" => "DE","Ghana" => "GH","Gibraltar" => "GI","Greece" => "GR","Greenland" => "GL","Grenada" => "GD","Guam" => "GU","Guatemala" => "GT","Guinea" => "GN","Guinea-Bissau" => "GW","Guyana" => "GY","Haiti" => "HT","Vatican City" => "VA","Holy See" => "VA","Honduras" => "HN","Hong Kong" => "HK","Hungary" => "HU","Iceland" => "IS","India" => "IN","Indonesia" => "ID","Iran" => "IR","Iraq" => "IQ","Ireland" => "IE","Isle of Man" => "IM","Israel" => "IL","Italy" => "IT","Ivory Coast" => "CI","Jamaica" => "JM","Japan" => "JP","Jersey" => "JE","Jordan" => "JO","Kazakhstan" => "KZ","Kenya" => "KE","Kiribati" => "KI","Kosovo" => "","Kuwait" => "KW","Kyrgyzstan" => "KG","Laos" => "LA","Latvia" => "LV","Lebanon" => "LB","Lesotho" => "LS","Liberia" => "LR","Libya" => "LY","Liechtenstein" => "LI","Lithuania" => "LT","Luxembourg" => "LU","Macau" => "MO","Macedonia" => "MK","Madagascar" => "MG","Malawi" => "MW","Malaysia" => "MY","Maldives" => "MV","Mali" => "ML","Malta" => "MT","Marshall Islands" => "MH","Mauritania" => "MR","Mauritius" => "MU","Mayotte" => "YT","Mexico" => "MX","Micronesia" => "FM","Moldova" => "MD","Monaco" => "MC","Mongolia" => "MN","Montenegro" => "ME","Montserrat" => "MS","Morocco" => "MA","Mozambique" => "MZ","Namibia" => "NA","Nauru" => "NR","Nepal" => "NP","Netherlands" => "NL","The Netherlands" => "NL","Netherlands Antilles" => "AN","New Caledonia" => "NC","New Zealand" => "NZ","Nicaragua" => "NI","Niger" => "NE","Nigeria" => "NG","Niue" => "NU","Norfolk Island" =>"","North Korea" => "KP","Northern Mariana Islands" => "MP","Norway" => "NO","Oman" => "OM","Pakistan" => "PK","Palau" => "PW","Panama" => "PA","Papua New Guinea" => "PG","Paraguay" => "PY","Peru" => "PE","Philippines" => "PH","Pitcairn Islands" => "PN","Poland" => "PL","Portugal" => "PT","Puerto Rico" => "PR","Qatar" => "QA","Republic of the Congo" => "CG","Romania" => "RO","Russia" => "RU","Rwanda" => "RW","Saint Barthelemy" => "BL","Saint Helena" => "SH","Saint Kitts and Nevis" => "KN","Saint Lucia" => "LC","Saint Martin" => "MF","Saint Pierre and Miquelon" => "PM","Saint Vincent and the Grenadines" => "VC","Samoa" => "WS","San Marino" => "SM","Sao Tome and Principe" => "ST","Saudi Arabia" => "SA","Senegal" => "SN","Serbia" => "RS","Seychelles" => "SC","Sierra Leone" => "SL","Singapore" => "SG","Slovakia" => "SK","Slovenia" => "SI","Solomon Islands" => "SB","Somalia" => "SO","South Africa" => "ZA","South Korea" => "KR","Spain" => "ES","Sri Lanka" => "LK","Sudan" => "SD","Suriname" => "SR","Svalbard" => "SJ","Swaziland" => "SZ","Sweden" => "SE","Switzerland" => "CH","Syria" => "SY","Taiwan" => "TW","Tajikistan" => "TJ","Tanzania" => "TZ","Thailand" => "TH","Timor-Leste" => "TL","Togo" => "TG","Tokelau" => "TK","Tonga" => "TO","Trinidad and Tobago" => "TT","Tunisia" => "TN","Turkey" => "TR","Turkmenistan" => "TM","Turks and Caicos Islands" => "TC","Tuvalu" => "TV","Uganda" => "UG","Ukraine" => "UA","United Arab Emirates" => "AE","United Kingdom" => "GB","United States" => "US","Uruguay" => "UY","US Virgin Islands" => "VI","Uzbekistan" => "UZ","USA" => "US","Vanuatu" => "VU","Venezuela" => "VE","Vietnam" => "VN","Wallis and Futuna" => "WF","Western Sahara" => "EH","Yemen" => "YE","Zambia" => "ZM","Zimbabwe" => "ZW"
);

my %publishersList;
#my $supportFiles = "D:\\PMGWord2XML";
# my $filepath = abs_path($0);
 my $supportFiles = cwd;

 # my $supportFiles = ( $ENV{'SCRIPT_FILENAME'} || $ENV{'PATH_TRANSLATED'} || $0 );
 # $supportFiles = dirname($supportFiles);
 # if($supportFiles =~ m/^\.$/) {
   # $supportFiles = cwd;
 # }
#print $supportFiles;exit;

#print $supportFiles;

my $debug = 0;

if(!-f "${supportFiles}\\Publisher.txt") {
	die("\! Publisherlist file not found in $supportFiles");
} else {
#  $/ = "\n";
	open(PUB, "${supportFiles}\\Publisher.txt")|| die "cannot open input file";
	while(<PUB>) {
	  chomp;
	  $publishersList{$_} = 1;
#		while($_ =~ /\"(.*?)\"/gi) {
#			$publishersList{$1} = 1;
#		}
	}
	close PUB;
}

open(INI, "${supportFiles}\\Refstyles\.txt") or die ("Refstyles.txt file not found");
undef $/;
my $Refstyles = <INI>;
close INI;

sub partial_tagging {
	my $content = shift;
	$content = general_cleanup($content);
	$content = year_conversion($content);
	#$content = year_after_month($content);
	$content = firstpage_conversion($content);
	$content = year_aftr_page_conversion($content);
	$content = volIss_conversion($content);
	#print $content,"\n\n";
	$content = vol_after_iss($content);
	$content = year_after_vol($content);
	$content = journaltitle_conversion($content);
	$content = arttitle_conversion($content);
	$content = Website_conversion($content);
	$content = InsertDoi($content);
	$content = publoc_at_end($content);
  $content = final_vol_conversion($content);
  $content = final_cleanup($content);
  #print $content,"\n";
	return $content;
	
}

sub general_cleanup {
	my $content = shift;
	#print $content,"\n\n";
	$content =~ s/ ?\,(pdf|html?|org|com)\b/\.$1/g;
	$content =~ s/\,([^ ])/\, $1/gi;
	$content =~ s/ (\&rdquo\;)/$1 /gi;
	$content =~ s/\, (\&rdquo\;)/\,$1/gi;
	$content =~ s/[ ]+/ /gi;
	$content =~ s/(\, p?p\.)([0-9])/$1 $2/gi;
	$content =~ s/ &ndash;/&ndash;/gi;
	$content =~ s/( [Nn]o\.)([0-9]+)/$1 $2/g;
	$content =~ s/([\,\.])( [0-9]+)<\/em>(\([0-9]+\))/$1<\/em>$2$3/g;
	$content =~ s/<a[^>]+>(.*?)<\/a>/$1/gi;
	$content =~ s/www\. /www./gi;
	$content =~ s/www3\. /www3./gi;
	$content =~ s/\b(https?:\/\/) /$1/sgi;
	$content =~ s/\. (html( |\/))/\.$1/sgi;
	$content =~ s/\. (org|com|net|edu|pdf|htm)\b/\.$1/sgi;
	$content =~ s/ (\_[a-z]+\.(org|com|net|edu|pdf))\b/$1/sgi;
	$content =~ s/(\, Vol\.)<\/em>/<\/em>$1/sgi;
	$content =~ s/(\, Vol)<\/em>\./<\/em>$1\./sgi;
	$content =~ s/( [0-9]+[A-Z])(?:&ndash;|\-|\-\-| \- )([0-9]+) ([A-Z]\.)$/$1&ndash;$2$3/s;
	$content =~ s/ Jume(\, (18|19|20)[0-9]{2})/ June$1/;
	$content =~ s/([\,\.] [Vv]ol\.)([0-9]+\,)/$1 $2/;
	$content =~ s/(\, )(<\/Journal_Title>)/$2$1/;
	$content =~ s/[ ]+/ /gi;
	$content =~ s/\b(pp\.? ([0-9]+)) ?(\-|\-\-|&ndash;|&mdash;) ?<strong>([0-9]+)<\/strong>/$1&ndash;$4/;
	$content =~ s/<i>\.<\/i>/\./g;
	$content =~ s/ \. (DOI|doi)/\. $1/g;
	#print $content,"\n\n";
	
	
	return $content;
}

sub final_cleanup {
	my $content = shift;
	$content =~ s/\b(https?\:\/\/)<Website>/<Website>$1/gi;
	$content =~ s/\&comma<\/Website>\;/<\/Website>\,/gi;
	$content =~ s/\&comma\;<\/Website>/<\/Website>\,/gi;
	$content =~ s/(\, )<\/Website>/<\/Website>$1/gi;
	$content =~ s/(\.)<\/LastPage>/<\/LastPage>$1/gi;
	$content =~ s/ ([A-Za-z]+\.(com|edu|org))\b/ <Website>$1<\/Website>/gi;
	$content =~ s/([A-Za-z]+\, (?:$month)\,? )<FirstPage>([0-9]{1,2})<\/FirstPage>\.$/$1$2\./i;
	$content =~ s/([A-Za-z]+\, (?:$month)\,? )<FirstPage>([0-9]{1,2})<\/FirstPage>&ndash;<LastPage>([0-9]{1,2})<\/LastPage>\.$/$1$2\&ndash\;$3\./i;
	$content =~ s/<Article_Title>(\)\,?\s*)/$1<Article_Title>/i;
	$content =~ s/([Vv]ol\.? <Vol_No>(?:[0-9]+)<\/Vol_No>\,? [Nn]o\.? )<FirstPage>([A-Z0-9]+)<\/FirstPage>/$1<Issue_No>$2<\/Issue_No>/;
	$content =~ s/(\,? [Vv]ol\.?)(<\/Journal_Title>)/$2$1/;
	$content =~ s/<\/?error>//gi;
	$content =~ s/\&comma(<\/[a-z]+>)\;/$1\,/gi;
	$content =~ s/\&([a-z]+)(<\/[a-z]+>)\;/\&$1\;$2/gi;
	$content =~ s/\b(vol\. )([A-Z]?[0-9]+(?:\-?[A-Z])?)(\, no\. )<Vol_No>([0-9]+)<\/Vol_No>/$1<Vol_No>$2<\/Vol_No>$3<Issue_No>$4<\/Issue_No>/;
	
	$content =~ s/ ($month) <FirstPage>([0-9]{1,2})<\/FirstPage>/ $1 $2/i;
	
	if($content =~ m/<Article_Title>(.*?)<\/Article_Title>/i) {
	  my $Art_Tit = $&;
	  $Art_Tit =~ s/<Journal_Title>(.*?)<\/Journal_Title>/<i>$1<\/i>/isg;
	  if ($Art_Tit =~ s/<Journal_Title>//i){
	    my $jrn_Tit = $&;
      $content =~s/<Article_Title>(.*?)<\/Article_Title>/$Art_Tit.$jrn_Tit/isg;
	  }elsif($Art_Tit =~ s/<\/Journal_Title>//i){
	    my $jrn_Title = $&;
	    $content =~s/<Article_Title>(.*?)<\/Article_Title>/$jrn_Title.$Art_Tit/isg;
	  }else{
	    $content =~s/<Article_Title>(.*?)<\/Article_Title>/$Art_Tit/isg;
	  }
	}
	if($content =~ m/<Journal_Title>(.*?)<\/Journal_Title>/i) {
	  my $Jrt_Tit = $&;
	  $Jrt_Tit =~ s/<PublisherName>(.*?)<\/PublisherName>/<i>$1<\/i>/isg;
	  if ($Jrt_Tit =~ s/<PublisherName>//i){
	    my $pub_name = $&;
      $content =~s/<Journal_Title>(.*?)<\/Journal_Title>/$Jrt_Tit.$pub_name/isg;
	  }elsif($Jrt_Tit =~ s/<\/PublisherName>//i){
	    my $pub_name = $&;
	    $content =~s/<Journal_Title>(.*?)<\/Journal_Title>/$pub_name.$Jrt_Tit/isg;
	  }else{
	    $content =~s/<Journal_Title>(.*?)<\/Journal_Title>/$Jrt_Tit/isg;
	  }
	}
	if($content !~ m/<Journal_Title>/ && $content !~ m/<ConferenceName>/) {
		if($content =~ s/\b([Ii]n )<em>(.*?)<\/em>/$1<Journal_Title>$2<\/Journal_Title>/){
		}
		elsif($content =~ s/([\,\.\;] )([A-Za-z\-\(\) ]+\b[jJ]ournal\b[^\,><]*)([\,\.] )/$1<Journal_Title>$2<\/Journal_Title>$3/){
		}
		elsif($content =~ s/([\,\.\;] )(\b[jJ]ournal\b[^\,><]*)([\,\.] )/$1<Journal_Title>$2<\/Journal_Title>$3/){
		}
		elsif($content =~ s/([\,\.\;] )($journalList)([\,\.] )/$1<Journal_Title>$2<\/Journal_Title>$3/){
		}
		elsif($content =~ s/([\,\.\;] )([A-Za-z\- ]+\b[cC]onference\b[^\,><]*)([\,\.] )/$1<Journal_Title>$2<\/Journal_Title>$3/){
		}
	}
	$content =~ s/(<Journal_Title>)\, /\, $1/;
	$content =~ s/\)<\/Doi>/<\/Doi>\)/g;
	$content =~ s/<Doi>\(/\(<Doi>/g;
	$content =~s/\:<\/Article_Title>/<\/Article_Title>\:/g;
	#print $content,"<<<<<<<<<<<\n";
	return $content;
}

sub final_vol_conversion {
	my $content = shift;
		#print $content,"\n\n";
		$content =~ s/([\.\,\>] )([0-9]+)(\, pp?\. )<FirstPage>/$1<Vol_No>$2<\/Vol_No>$3<FirstPage>/ if($content !~ m/<Vol_No>/);
		$content =~ s/([\.\,\>] )([0-9]+\/[0-9]+)( ?\: )<FirstPage>/$1<Vol_No>$2<\/Vol_No>$3<FirstPage>/ if($content !~ m/<Vol_No>/);
		
		$content =~ s/([\.\,\>] )([0-9]+)\.([0-9]+)\, <FirstPage>/$1<Vol_No>$2<\/Vol_No>\.<Issue_No>$3<\/Issue_No>\, <FirstPage>/ if($content !~ m/<Vol_No>/);
		
		$content =~ s/([\.\,\>] )([0-9]+)\.([0-9]+)(\,? \((?:$month) <Year>(?:18|19|20)[0-9][0-9][a-z]?<\/Year>\)[\.\,] <FirstPage>)/$1<Vol_No>$2<\/Vol_No>\.<Issue_No>$3<\/Issue_No>$4/ if($content !~ m/<Vol_No>/);
		
		$content =~ s/([\.\,\>] )([0-9]+)\.([0-9]+)(\,? \(<Year>(?:18|19|20)[0-9][0-9][a-z]?<\/Year>\)[\.\,] <FirstPage>)/$1<Vol_No>$2<\/Vol_No>\.<Issue_No>$3<\/Issue_No>$4/ if($content !~ m/<Vol_No>/);
	
		# Volume based Journal title conversion
		#print $content,"\n";
		$content =~ s/<Authorgroup>(.*?)<\/Authorgroup>([\,\.] <Vol_No>)/<Journal_Title>$1<\/Journal_Title>$2/;
		return $content;
}

sub year_conversion {
	my $content = shift;
	#print $content,"\n";
		# Year checking and tagging...
	if($content !~ m/<Year>/) {
		if($content =~ m/ \(((18|19|20)[0-9][0-9][a-z]?)\)\.$/) {
			$content =~ s/ \(((18|19|20)[0-9][0-9][a-z]?)\)\.$/ \(<Year>$1<\/Year>\)\./;
		} elsif($content =~ m/\(((18|19|20)[0-9][0-9][a-z]?)\) /) {
			$content =~ s/\(((18|19|20)[0-9][0-9][a-z]?)\) /\(<Year>$1<\/Year>\) /;
		} elsif($content =~ m/ \(((18|19|20)[0-9][0-9][a-z]?(?:\-\-?|&ndash;|&minus;|&mdash;)(18|19|20)[0-9][0-9][a-z]?)\)\.$/) {
			$content =~ s/ \(((18|19|20)[0-9][0-9][a-z]?(?:\-\-?|&ndash;|&minus;|&mdash;)(18|19|20)[0-9][0-9][a-z]?)\)\.$/ \(<Year>$1<\/Year>\)\./;
		} elsif($content =~ m/ ((18|19|20)[0-9][0-9][a-z]?)\.$/) {
			$content =~ s/ ((18|19|20)[0-9][0-9][a-z]?)\.$/ <Year>$1<\/Year>\./;
		} elsif($content =~ m/ \(((18|19|20)[0-9][0-9][a-z]?)\)[\.\,]? &ldquo;/) {
			$content =~ s/( \()((18|19|20)[0-9][0-9][a-z]?)(\)[\.\,]? &ldquo;)/$1<Year>$2<\/Year>$4/;
		} elsif($content =~ m/ \(((18|19|20)[0-9][0-9][a-z]?)\)[\.\,]? <em>/) {
			$content =~ s/( \()((18|19|20)[0-9][0-9][a-z]?)(\)[\.\,]? <em>)/$1<Year>$2<\/Year>$4/;
		} elsif($content =~ m/ \(((18|19|20)[0-9][0-9][a-z]?)\)[\.\,] /) {
			$content =~ s/( \()((18|19|20)[0-9][0-9][a-z]?)(\)[\.\,] )/$1<Year>$2<\/Year>$4/;
		} elsif($content =~ m/ \(($month(?:(?:\-\-?|&ndash;|&minus;|&mdash;)$month)?) [0-9]{1,2}\,?\s((18|19|20)[0-9][0-9][a-z]?)\)[\.\,\;] /) {
			$content =~ s/( \((?:$month(?:(?:\-\-?|&ndash;|&minus;|&mdash;)$month)?) [0-9]{1,2}\,?\s)((18|19|20)[0-9][0-9][a-z]?)(\)[\.\,\;] )/$1<Year>$2<\/Year>$4/;
		} elsif($content =~ m/ \(($month(?:(?:\-\-?|&ndash;|&minus;|&mdash;)$month)?)\,?\s((18|19|20)[0-9][0-9][a-z]?)\)[\.\,\;] /) {
			$content =~ s/( \((?:$month(?:(?:\-\-?|&ndash;|&minus;|&mdash;)$month)?)\,?\s)((18|19|20)[0-9][0-9][a-z]?)(\)[\.\,\;] )/$1<Year>$2<\/Year>$4/;
		} elsif($content =~ m/ ((:?18|19|20)[0-9]{2}[a-z]?)\)/) {
			$content =~ s/ ((?:18|19|20)[0-9]{2}[a-z]?)\)/ <Year>$1<\/Year>\)/;
		} elsif($content =~ m/ ((:?18|19|20)[0-9]{2}[a-z]?)[\;\:\,]/) {
			$content =~ s/ ((?:18|19|20)[0-9]{2}[a-z]?)([\;\:\,])/ <Year>$1<\/Year>$2/;
		} elsif($content =~ m/ $months ((:?18|19|20)[0-9]{2}[a-z]?)\.?$/) {
			$content =~ s/ $months ((?:18|19|20)[0-9]{2}[a-z]?)(\.?)$/ $1 <Year>$2<\/Year>$3/;
		} elsif($content =~ m/\(((18|19|20)[0-9][0-9][a-z]?)\)\.$/) {
			$content =~ s/\(((18|19|20)[0-9][0-9][a-z]?)\)\.$/\(<Year>$1<\/Year>\)\./;
		} elsif($content =~ m/\(((18|19|20)[0-9][0-9][a-z]?)\,? (?:$month)/) {
			$content =~ s/\(((?:18|19|20)[0-9][0-9][a-z]?)(\,? )($month)/\(<Year>$1<\/Year>$2$3/;
		} elsif($content =~ m/ ((18|19|20)[0-9][0-9])\. /) {
			$content =~ s/ ((18|19|20)[0-9][0-9])\. / <Year>$1<\/Year>\. /;
		} elsif($content =~ m/ ((18|19|20)[0-9][0-9][a-z]?)$/) {
			$content =~ s/ ((18|19|20)[0-9][0-9][a-z]?)$/ <Year>$1<\/Year>\./;
		} elsif($content =~ m/ ((18|19|20)[0-9][0-9][a-z])\. /) {
			$content =~ s/ ((18|19|20)[0-9][0-9][a-z])\. / <Year>$1<\/Year>\. /;
		} 
	}

	return $content;
}

sub year_after_month {
	my $content = shift;
	
	if($content =~ m/ \(($month) <Year>/) {
		$content =~ s/ \(($month) <Year>/ \(<month>$1<\/month> <Year>/;
	}
	return $content;
}

sub firstpage_conversion {
	my $content = shift;
	#print $content,"\n";
		# First page and lastpage checking and tagging...
		
		$content =~ s/\b([A-Z]?[0-9]+[A-Z]?)(\(<Year>)/$1 $2/;
	if($content !~ m/<FirstPage>/) {

		$content =~ s/(<(strong|b)>[0-9A-Z]+<\/\2>\,)(((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\.? \(?<Year>[0-9]+<\/Year>\)?)/$1 $3/;
		if($content =~ m/ [Pp]p\. ?((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,?/) {
#print "page1,\n";
			$content =~ s/( [Pp]p\. ?)([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,?)/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		} elsif($content =~ m/ pp\.?((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,?/) {
#print "page2","\n";
			$content =~ s/( [Pp]p\.?)([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,?)/$1 <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		} elsif($content =~ m/ [Pp]\. ?((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,?\b/) {
#print "page3,\n";
			$content =~ s/( [Pp]\. ?)([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,?)\b/$1 <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		} elsif($content =~ m/ [Pp]p\.? ((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,?\b/) {
#print "page4,\n";
			$content =~ s/( [Pp]p\.? )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,?)\b/$1 <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		} elsif($content =~ m/ [Pp][\.p]+ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,? \(?<Year>/) {
#print "page5,\n";
			$content =~ s/( [Pp][\.p]+ )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/$1<FirstPage>$2<\/FirstPage>$3/;
		} elsif($content =~ m/ [Pp][\.p]+ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,|\.$)/) {
#print "page6,\n";
			$content =~ s/( [Pp][\.p]+ )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,|\.$)/$1<FirstPage>$2<\/FirstPage>$3/;
		} elsif($content =~ m/ [Pp]p\.?([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,|\.$)/) {
#print "page7,\n";
			$content =~ s/( [Pp]p\.?)([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,|\.$)/$1 <FirstPage>$2<\/FirstPage>$3/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,? ($month(?:\-$month)?) \(?<Year>/) {
#print "page8,\n";
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? ($month(?:\-$month)?) \(?<Year>)/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)[\,\.] [A-z]+[\,\.]? \(?<Year>/) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)([\,\.] [A-z]+[\,\.]? \(?<Year>)/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+\-[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+\-[0-9]+[A-Za-z]?|XXX)\,? \(?<Year>/) {
			$content =~ s/ ([A-Za-z]?[0-9]+\-[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+\-[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
		} 
		elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|\&\#x2013\;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,? \(?<Year>/) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|\&\#x2013\;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
		}
		 elsif($content =~ m/ ([xivdcXIVDC]+)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([xivdcXIVDC]+)\.$/) {
			$content =~ s/ ([xivdcXIVDC]+)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([xivdcXIVDC]+)\.$/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>\./;
		}
		
		 elsif($content =~ m/<strong><em>[A-Z]?[0-9]+[A-Z]?<\/em><\/strong>\(([A-Z]?[0-9\-]+[A-Z]?)\)[\,\:]?\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/) {
			$content =~ s/(<strong><em>[A-Z]?[0-9]+[A-Z]?<\/em><\/strong>\([A-Z]?[0-9\-]+[A-Z]?\)[\,\:]?\s*)([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/$1<FirstPage>$2<\/FirstPage>$3/;
		}
		
		 elsif($content =~ m/<strong><em>[A-Z]?[0-9]+[A-Z]?<\/em><\/strong>[\,\:]?\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/) {
			$content =~ s/(<strong><em>[A-Z]?[0-9]+[A-Z]?<\/em><\/strong>[\,\:]?\s*)([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/$1<FirstPage>$2<\/FirstPage>$3/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( ?\-\-? ?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( [pP]{1,2}\.$)/) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( ?\-\-? ?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( [pP]{1,2}\.$)/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?)( [pP]{1,2}\.$)/) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?)( [pP]{1,2}\.$)/ <FirstPage>$1<\/FirstPage>$2/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( [pP]{1,2}[\.\;]+ )/) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( [pP]{1,2}[\.\;]+ )/ <FirstPage>$1<\/FirstPage>$2/;
		} elsif($content =~ m/ ((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\.(PMGQ[0-9]+)?$/) {
			$content =~ s/( )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\.(PMGQ[0-9]+)?)$/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)[\.\;]$/) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)([\.\;])$/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)[\.\;] /) {
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)([\.\;]) / <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4 /;
		}
		
		elsif($content =~ m/\b([A-Za-z]?[0-9]+[A-Za-z]?)\:([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\.$/) {
			$content =~ s/\b([A-Za-z]?[0-9]+[A-Za-z]?)\:([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\.$/<Vol_No>$1<\/Vol_No>:<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>\./;
		}
		
		elsif($content =~ m/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\./) {
			$content =~ s/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\./$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>\./;
		}
		
		elsif($content =~ m/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX) ?\(<Year>/) {
			$content =~ s/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)( ?\(<Year>)/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		}
		
		elsif($content =~ m/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\. (?:doi|DOI)\:)/) {
			$content =~ s/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\. (?:doi|DOI)\:)/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		} elsif($content =~ m/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\.$)/) {
			$content =~ s/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\.$)/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
		}
		
		elsif($content =~ m/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\. (?:doi|DOI)\:)/) {
			$content =~ s/(\: ?| )([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\. (?:doi|DOI)\:)/$1<FirstPage>$2<\/FirstPage>$3/;
		}
		
		
		elsif($content =~ m/ \(pp.? ((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\)/) {
			$content =~ s/( \(pp.? )((?:[A-Z])?[0-9]+[A-Za-z]?|XXX)\s*(\-\-?|&ndash;|&minus;|&mdash;|&\#x2013;)\s*([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\)/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>\)/;
		} elsif($content =~ m/ \([0-9]+ [pP]p\.?\)/) {
			$content =~ s/ \(([0-9]+)( [pP]p\.?)\)/ \(<FirstPage>$1<\/FirstPage>$2\)/;
		} elsif($content =~ m/[\,\:] ([0-9]+)\.$/) {
			$content =~ s/([\,\:] )([0-9]+)\.$/$1<FirstPage>$2<\/FirstPage>\./;
		} elsif($content =~ m/\b([0-9]+)\:([0-9]+)\.$/) {
			$content =~ s/\b([0-9]+)\:([0-9]+)\.$/<Vol_No>$1<\/Vol_No>:<FirstPage>$2<\/FirstPage>\./;
		} elsif($content =~ m/[\,\:] ?([0-9]+)$/) {
			$content =~ s/([\,\:] ?)([0-9]+)$/$1<FirstPage>$2<\/FirstPage>/;
		} elsif($content =~ m/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)\,? \(?<Year>/) {
#print "pageLAst,\n";
			$content =~ s/ ([A-Za-z]?[0-9]+[A-Za-z]?|XXX)(\,? \(?<Year>)/ <FirstPage>$1<\/FirstPage>$2/;
		} elsif($content =~ m/[\,\;\:]([a-z][0-9]+)\.$/) {
			$content =~ s/([\,\;\:])([a-z][0-9]+)\.$/$1<FirstPage>$2<\/FirstPage>\./;
		} elsif($content =~ m/[\,\;\:]([0-9]+)\.$/) {
			$content =~ s/([\,\;\:])([0-9]+)\.$/$1<FirstPage>$2<\/FirstPage>\./;
		}
		
		 $content =~ s/<FirstPage>((?:18|19|20)[0-9][0-9])<\/FirstPage>( pp?. )([0-9]+)/$1$2<FirstPage>$3<\/FirstPage>/;
	}
	return $content;
}

sub volIss_conversion {
	my $content = shift;
	#print $content,"\n";
	# Volume and Issue number checking and tagging...
	if($content !~ m/<Vol_No>/ && $content !~ m/<Issue_No>/) {
		if ($content =~ m/[\.\,] [Vv]ol\. ?([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\.] (?:[Nn]o|Is)\.? ?([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;|XXXampXXX)[0-9]+)?)\b/) {
      $content =~ s/([\.\,] [Vv]ol\. ?)([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.)( (?:[Nn]o|Is)\.? ?)([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;|XXXampXXX)[0-9]+)?)\b/$1<Vol_No>$2<\/Vol_No>$3$4<Issue_No>$5<\/Issue_No>/;
    } elsif ($content =~ m/[\.\,] [Vv]ol\. ?([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\.] (?:[Nn]o|Is)\. ?([0-9]+)\b/) {
      $content =~ s/([\.\,] [Vv]ol\. ?)([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.)( (?:[Nn]o|Is)\. ?)([0-9]+)\b/$1<Vol_No>$2<\/Vol_No>$3$4<Issue_No>$5<\/Issue_No>/;
    } elsif ($content =~ m/[\.\,] [Vv]\. ?([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\.] (?:[Nn]o|Is)\. ?([0-9]+)\b/) {
      $content =~ s/([\.\,] [Vv]\. ?)([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.)( (?:[Nn]o|Is)\. ?)([0-9]+)\b/$1<Vol_No>$2<\/Vol_No>$3$4<Issue_No>$5<\/Issue_No>/;
    } elsif ($content =~ m/[\.\,] [Vv]olume ?([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\.] (?:[Nn]o|Is)\. ?([0-9]+)\b/) {
      $content =~ s/([\.\,] [Vv]olume ?)([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.)( (?:[Nn]o|Is)\. ?)([0-9]+)\b/$1<Vol_No>$2<\/Vol_No>$3$4<Issue_No>$5<\/Issue_No>/;
    } elsif ($content =~ m/[\.\,] [Vv]olume ([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\. ]/) {
      $content =~ s/([\.\,] [Vv]olume )([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.| )/$1<Vol_No>$2<\/Vol_No>$3/;
    } elsif ($content =~ m/ ([Vv]ol\.?) ([0-9]+)\, (No\.?|Is\.?) ([0-9]+)[\,\;]/i) {
      $content =~ s/ ([Vv]ol\.?) ([0-9]+)\, (No\.?|Is\.?) ([0-9]+)([\,\;])/ $1 <Vol_No>$2<\/Vol_No>\, $3 <Issue_No>$4<\/Issue_No>$5/i;
		} elsif ($content =~ m/ ([Vv]ol\.?) ([0-9]+) (No\.?|Is\.?) ([0-9]+)[\,\;]/i) {
      $content =~ s/ ([Vv]ol\.?) ([0-9]+) (No\.?|Is\.?) ([0-9]+)([\,\;])/ $1 <Vol_No>$2<\/Vol_No> $3 <Issue_No>$4<\/Issue_No>$5/i;
		} elsif ($content =~ m/ ([Vv]ol\.?) ([A-Z]+\-?[0-9]+)\, ([Nn]o\.?) ([0-9]+)[\,\;]/i) {
			$content =~ s/ ([Vv]ol\.?) ([A-Z]+\-?[0-9]+)\, ([Nn]o\.?) ([0-9]+)([\,\;])/ $1 <Vol_No>$2<\/Vol_No>\, $3 <Issue_No>$4<\/Issue_No>$5/i;
		} elsif ($content =~ m/ ([Vv]ol\.?) ([A-Z]+\-?[0-9]+) ([Nn]o\.?) ([0-9]+)[\,\;]/i) {
			$content =~ s/ ([Vv]ol\.?) ([A-Z]+\-?[0-9]+) ([Nn]o\.?) ([0-9]+)([\,\;])/ $1 <Vol_No>$2<\/Vol_No> $3 <Issue_No>$4<\/Issue_No>$5/i;
		} elsif ($content =~ m/ ([Vv]ol\.?) ([XVI]+)\, (No\.?|Is\.?) ([0-9]+)[\,\;]/i) {
      $content =~ s/ ([Vv]ol\.?) ([XVI]+)\, (No\.?|Is\.?) ([0-9]+)([\,\;])/ $1 <Vol_No>$2<\/Vol_No>\, $3 <Issue_No>$4<\/Issue_No>$5/i;
		} elsif ($content =~ m/ ([Vv]ol\.?) ([XVI]+) (No\.?|Is\.?) ([0-9]+)[\,\;]/i) {
      $content =~ s/ ([Vv]ol\.?) ([XVI]+) (No\.?|Is\.?) ([0-9]+)([\,\;])/ $1 <Vol_No>$2<\/Vol_No> $3 <Issue_No>$4<\/Issue_No>$5/i;
		} elsif ($content =~ m/[\.\,] [Vv]\. ?([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?) ?\(([0-9]+)\)\,/) {
      $content =~ s/([\.\,] [Vv]\. ?)([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?) ?\(([0-9]+)\)\,/$1<Vol_No>$2<\/Vol_No> \(<Issue_No>$3<\/Issue_No>\)/;
    } elsif ($content =~ m/[\.\,] [Vv]ol\. ([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\.]/) {
      $content =~ s/([\.\,] [Vv]ol\. )([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.)/$1<Vol_No>$2<\/Vol_No>$3/;
    } elsif ($content =~ m/[\.\,] [Vv]\. ([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)[\,\.\:]/) {
      $content =~ s/([\.\,] [Vv]\. )([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\,|\.|\:)/$1<Vol_No>$2<\/Vol_No>$3/;
    } elsif($content =~ m/<strong><em>[A-Z]?[0-9]+[A-Z]?<\/em><\/strong>(\s*\()([A-Z]?[0-9\-]+[A-Z]?)\)[\,\:]?\s*<FirstPage>/) {
			$content =~ s/<strong><em>([A-Z]?[0-9]+[A-Z]?)<\/em><\/strong>(\s*\()([A-Z]?[0-9\-]+[A-Z]?)(\)[\,\:]?\s*<FirstPage>)/<Vol_No>$1<\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4/;
		}	elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>(\,\s*no\. )([0-9\-]+)\,\s*<FirstPage>/) {
			$content =~ s/<strong>([A-Z]?[0-9]+[A-Z]?)<\/strong>(\,\s*no\. )([0-9\-]+)(\,\s*<FirstPage>)/<Vol_No><strong>$1<\/strong><\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4/;
		}	elsif($content =~ m/ [A-Z]?[0-9]+[A-Z]?(\,\s*no\. )([0-9\-]+)\,\s*<FirstPage>/) {
			$content =~ s/ ([A-Z]?[0-9]+[A-Z]?)(\,\s*no\. )([0-9\-]+)(\,\s*<FirstPage>)/<Vol_No>$1<\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4/;
		} elsif($content =~ m/<strong><em>[A-Z]?[0-9]+[A-Z]?<\/em><\/strong>(\,? |\:)<FirstPage>/) {
			$content =~ s/<strong><em>([A-Z]?[0-9]+[A-Z]?)<\/em><\/strong>((\,? |\:)<FirstPage>)/<Vol_No>$1<\/Vol_No>$2/;
		} elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>(\s*\()([A-Z]?[0-9\-]+[A-Z]?)\)[\,\:]?\s*<FirstPage>/) {
			$content =~ s/(<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>)(\s*\()([A-Z]?[0-9\-]+[A-Z]?)(\)[\,\:]?\s*<FirstPage>)/<Vol_No>$1<\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4/;
		} elsif($content =~ m/ [A-Z]?[0-9]+[A-Z]?(\s*\()([A-Z]?[0-9\-]+[A-Z]?)\)[\,\:]?\s*<FirstPage>/) {
			$content =~ s/ ([A-Z]?[0-9]+[A-Z]?)(\s*\()([A-Z]?[0-9\-]+[A-Z]?)(\)[\,\:]?\s*<FirstPage>)/ <Vol_No>$1<\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4/;
		} elsif($content =~ m/ [A-Z]?[0-9]+[A-Z]?(\s*\()([A-Z]?[0-9\-]+[A-Z]?)\)[\,\:]?\s*/) {
			$content =~ s/ ([A-Z]?[0-9]+[A-Z]?)(\s*\()([A-Z]?[0-9\-]+[A-Z]?)(\)[\,\:]?\s*)/ <Vol_No>$1<\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4/;
		} elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>\(([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)\)\: [Pp]p?\./) {
			$content =~ s/<strong>([A-Z]?[0-9]+[A-Z]?)<\/strong>\(([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)\)(\: [Pp]p?\.)/<Vol_No>$1<\/Vol_No>\(<Issue_No>$2<\/Issue_No>\)$3/;
		} elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>(\s*\()([A-Z]?[0-9\-]+[A-Z]?)\)[\,\:]?\s*(?:$month)(\s*\(?<Year>)/) {
			$content =~ s/(<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>)(\s*\()([A-Z]?[0-9\-]+[A-Z]?)(\)[\,\:]?\s*)((?:$month)\s*\(?<Year>)/<Vol_No>$1<\/Vol_No>$2<Issue_No>$3<\/Issue_No>$4$5/;
		} elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>\,? [0-9]+ \(?<FirstPage>/) {
			$content =~ s/<strong>([A-Z]?[0-9]+[A-Z]?)<\/strong>(\,? [0-9]+ \(?<FirstPage>)/<Vol_No>$1<\/Vol_No>$2/;
		} elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>[\,\:]? <FirstPage>/) {
			$content =~ s/<strong>([A-Z]?[0-9]+[A-Z]?)<\/strong>([\,\:]? <FirstPage>)/<Vol_No>$1<\/Vol_No>$2/;
		}
		
		 elsif($content =~ m/ [A-Z]?[0-9]+[A-Z]? \(<Year>([^><]+)<\/Year>\) <FirstPage>/) {
			$content =~ s/ ([A-Z]?[0-9]+[A-Z]?)( \(<Year>([^><]+)<\/Year>\) <FirstPage>)/ <Vol_No>$1<\/Vol_No>$2/;
		}
		
		
		elsif($content =~ m/<strong>[A-Z]?[0-9]+[A-Z]?<\/strong>[\,\:]? \(?<Year>/) {
			$content =~ s/<strong>([A-Z]?[0-9]+[A-Z]?)<\/strong>([\,\:]? \(?<Year>)/<Vol_No>$1<\/Vol_No>$2/;
		}	elsif($content =~ m/( \()([0-9]+)( ?\: ?)([0-9]+)(\)\, <Year>[0-9]+<\/Year>\, (?:pp|<FirstPage>))/) {
			$content =~ s/( \()([0-9]+)( ?\: ?)([0-9]+)(\)\, <Year>[0-9]+<\/Year>\, (?:pp|<FirstPage>))/$1<Vol_No>$2<\/Vol_No>$3<Issue_No>$4<\/Issue_No>$5/;
    } elsif($content =~ m/ ([XIVCDLMHUET]+)(\,? \(?(?:$month) and (?:$month)\, <Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([XIVCDLMHUET]+)(\,? \(?(?:$month) and (?:$month)\, <Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    } elsif($content =~ m/ ([XIVCDLMHUET]+)(\,? \(?(?:$month) [0-9]{1,2}\, <Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([XIVCDLMHUET]+)(\,? \(?(?:$month) [0-9]{1,2}\, <Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    } elsif($content =~ m/ ([XIVCDLMHUET]+)(\,? \(?(?:$month)\,? <Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([XIVCDLMHUET]+)(\,? \(?(?:$month)\,? <Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    } elsif($content =~ m/ ([XIVCDLMHUET]+)(\,? \(?<Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([XIVCDLMHUET]+)(\,? \(?<Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    }	elsif($content =~ m/ ([A-Z]{2,3})(\,? \(?(?:$month) [0-9]{1,2}\, <Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([A-Z]{2,3})(\,? \(?(?:$month) [0-9]{1,2}\, <Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    } elsif($content =~ m/ ([A-Z]{2,3})(\,? \(?(?:$month)\,? <Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([A-Z]{2,3})(\,? \(?(?:$month)\,? <Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    } elsif($content =~ m/ ([A-Z]{2,3})(\,? \(?<Year>[0-9]+<\/Year>)/) {
			$content =~ s/ ([A-Z]{2,3})(\,? \(?<Year>[0-9]+<\/Year>)/ <Vol_No>$1<\/Vol_No>$2/;
    }	elsif($content =~ m/( \()([0-9]+)( ?\: ?)([0-9]+)(\)\, <Year>[0-9]+<\/Year>\.?)$/) {
			$content =~ s/( \()([0-9]+)( ?\: ?)([0-9]+)(\)\, <Year>[0-9]+<\/Year>\.?)$/$1<Vol_No>$2<\/Vol_No>$3<Issue_No>$4<\/Issue_No>$5/;
    } elsif($content =~ m/ ([0-9]+)\:([0-9]+)(\, <FirstPage>)/) {
			$content =~ s/ ([0-9]+)\:([0-9]+)(\, <FirstPage>)/ <Vol_No>$1<\/Vol_No>\:<Issue_No>$2<\/Issue_No>$3/;
    } elsif ($content =~ m/\b([Vv]ol\.?) ([XVI]+)[\,\;\.]/i) {
      $content =~ s/\b([Vv]ol\.?) ([XVI]+)([\,\;\.])/$1 <Vol_No>$2<\/Vol_No>$3/i;
		} elsif ($content =~ m/\b([Vv]ol\.?) ([XVI]+) /i) {
      $content =~ s/\b([Vv]ol\.?) ([XVI]+) /$1 <Vol_No>$2<\/Vol_No> /i;
		} elsif($content =~ m/(\; ?| )([0-9]+\([0-9]+(?:\/[0-9]+|(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?\))(\, |\: ?)<FirstPage>/) {
			$content =~ s/(\; ?| )([0-9]+)\(([0-9]+(?:\/[0-9]+|(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)\)((\, |\: ?)<FirstPage>)/$1<Vol_No>$2<\/Vol_No>\(<Issue_No>$3<\/Issue_No>\)$4/;
    }
     elsif($content =~ m/(\; ?| )([0-9]+)(\, |\: ?)<FirstPage>/) {
			$content =~ s/(\; ?| )([0-9]+)((\, |\: ?)<FirstPage>)/$1<Vol_No>$2<\/Vol_No>$3/;
    }
    
    elsif($content =~ m/(\; ?| )([0-9]+)( ?\()(Suppl\.? [0-9]+)\)( ?\: ?)(<FirstPage>)/) {
			$content =~ s/(\; ?| )([0-9]+)( ?\()(Suppl\.? [0-9]+)(\) ?\: ?<FirstPage>)/$1<Vol_No>$2<\/Vol_No>$3<Issue_No>$4<\/Issue_No>$5/;
    }
    	elsif($content =~ m/(\; ?| )([0-9]+) (Suppl)( ?\: ?)(<FirstPage>)/) {
			$content =~ s/(\; ?| )([0-9]+) (Suppl)( ?\: ?<FirstPage>)/$1<Vol_No>$2<\/Vol_No> <Issue_No>$3<\/Issue_No>$4/;
    }	elsif($content =~ m/(\; ?| )[0-9]+\([0-9]+ Suppl\) ?\: ?<FirstPage>/) {
			$content =~ s/(\; ?| )([0-9]+)\(([0-9]+ Suppl)\)( ?\: ?<FirstPage>)/$1<Vol_No>$2<\/Vol_No>\(<Issue_No>$3<\/Issue_No>\)$4/;
    }
    
    
     elsif($content =~ m/ ([0-9]{1,3})\, ([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)\, <FirstPage>/) {
			$content =~ s/ ([0-9]{1,3})\, ([0-9]+(?:(?:\-\-?|&ndash;|&minus;|&mdash;)[0-9]+)?)(\, <FirstPage>)/ <Vol_No>$1<\/Vol_No>\, <Issue_No>$2<\/Issue_No>$3/;
    } elsif($content =~ m/ ([0-9]+)(\, |\:)<FirstPage>/) {
			$content =~ s/ ([0-9]+)((\, |\:)<FirstPage>)/ <Vol_No>$1<\/Vol_No>$2/;
    }	elsif($content =~ m/ [A-Z]?[0-9]+[A-Z]?[\,\:] <FirstPage>/) {
			$content =~ s/ ([A-Z]?[0-9]+[A-Z]?)([\,\:] <FirstPage>)/ <Vol_No>$1<\/Vol_No>$2/;
		} elsif($content =~ m/ ([0-9]+) [vV]ols\./) {
			$content =~ s/ ([0-9]+)( [vV]ols\.)/ <Vol_No>$1<\/Vol_No>$2/;
    }

	}
	#print $content,"\n";
	if($content !~ m/<Issue_No>/) {
		if($content =~ m/<\/Vol_No>, (?:[Nn]o|Is)\. [0-9]+/i) {
			$content =~ s/(<\/Vol_No>, (?:[Nn]o|Is)\. )([0-9]+)/$1<Issue_No>$2<\/Issue_No>/i;
		}
		$content =~ s/([0-9]+) (Suppl\.? )<Vol_No>([0-9]+)<\/Vol_No>/<Vol_No>$1<\/Vol_No> <Issue_No>$2$3<\/Issue_No>/;
	}
	
	$content =~ s/\b([Vv]ol\.)(<Vol_No>)/$1 $2/;
	#print $content,"\n";
	return $content;
}

sub vol_after_iss {
	my $content = shift;
	# issue checking and tagging...
	if($content !~ m/<Issue_No>/) {
		 if ($content =~ m/<\/Vol_No>\, ([0-9]+)([\,\;\.])/i) {
      $content =~ s/<\/Vol_No>\, ([0-9]+)([\,\;\.])/<\/Vol_No>\, <Issue_No>$1<\/Issue_No>$2/i;
		}
	}
	return $content;
}

sub year_after_vol {
	my $content = shift;
		# issue checking and tagging...
	if($content !~ m/<Year>/) {
		if ($content =~ m/((18|19|20)[0-9][0-9][a-z]?) ($month)( [0-9]+)\;<Vol_No>/i) {
      $content =~ s/((?:18|19|20)[0-9][0-9][a-z]?) ($month)( [0-9]+)\;<Vol_No>/<Year>$1<\/Year> <month>$2<month>$3\;<Vol_No>/i;
		} elsif ($content =~ m/((18|19|20)[0-9][0-9][a-z]?) ($month)\;<Vol_No>/i) {
      $content =~ s/((?:18|19|20)[0-9][0-9][a-z]?) ($month)\;<Vol_No>/<Year>$1<\/Year> <month>$2<month>\;<Vol_No>/i;
		}
	}
	return $content;
}

sub journaltitle_conversion {
	my $content = shift;
	# Journal title checking and tagging...
	#print $content,"\n\n";

	if($content !~ m/<Journal_Title>/) {
		if($content =~ m/ <em>(.*?)<\/em>[\,\.]?\s*/) {
		  my $space = $1;
		  $content =~ s/ <em>(.*?)<\/em>([\,\.]?\s*)/ <Journal_Title>$1<\/Journal_Title>$2/ if($space =~m/ /);
		} elsif($content =~ m/ in <em>(.*?)<\/em>[\,\.]? /) {
			$content =~ s/ in <em>(.*?)<\/em>([\,\.]? )/ in <Journal_Title>$1<\/Journal_Title>$2/;			
		} elsif($content =~ m/ In Proceedings? (.*?)[\,\.]/) {
			$content =~ s/ In (Proceedings? .*?)([\,\.])/ In <Journal_Title>$1<\/Journal_Title>$2/;			
		} elsif($content =~ m/ In Proc\. (.*?)[\,\.]/) {
			$content =~ s/ In (Proc\. .*?)([\,\.])/ In <Journal_Title>$1<\/Journal_Title>$2/;
		} elsif($content =~ m/<\/Article_Title>\,?&rdquo; Proc\. [^\(\)\,]+[\(\)\,]/) {
			$content =~ s/(<\/Article_Title>\,?&rdquo; )(Proc\. [^\(\)\,]+)([\(\)\,])/$1<Journal_Title>$2<\/Journal_Title>$3/;
		} elsif($content =~ m/<\/Article_Title>\,?&rdquo; [A-z \.]+[\(\)\,]/) {
			$content =~ s/(<\/Article_Title>\,?&rdquo; )([A-z \.]+)([\(\)\,])/$1<Journal_Title>$2<\/Journal_Title>$3/;
		} elsif($content =~ m/<em>(.*?)<\/em>[\,\.]?\s*/) {
		  my $space = $1;
			$content =~ s/<em>(.*?)<\/em>([\,\.]?\s*)/<Journal_Title>$1<\/Journal_Title>$2/ if ($content !~ m/<ConferenceName>/ && $space =~m/ /);
		}
#		elsif($content =~ m/\: [A-Z][^\:\,\>\<]+[\(\)\,]? <Vol_No>/) {
#			$content =~ s/\: ([A-Z][^\:\,\>\<]+)([\(\)\,]? <Vol_No>)/\: <Journal_Title>$1<\/Journal_Title>$2/;
#		}
#		 elsif($content !~ m/<Vol_No>/ && $content =~ m/\: [^\:\,\>\<]+[\(\)\,]? <FirstPage>/) {
#			$content =~ s/\: ([^\:\,\>\<]+)([\(\)\,]? <FirstPage>)/\: <Journal_Title>$1<\/Journal_Title>$2/;
#		}
	}
	$content =~ s/(&rdquo;)([iI]n <Journal_Title>)/$1 $2/;
	return $content;
}

sub arttitle_conversion {
	my $content = shift;
	$content =~ s/XXXrsquoXXXs/[[rsquo]]s/sgi;
	$content =~ s/sXXXrsquoXXX /s[[rsquo]] /sgi;
		#print $content,"\n";

	# Article title checking and tagging...

	if($content !~ m/<Article_Title>/) {
		if($content =~ m/\&ldquo\;(.*?)\&rdquo\;/) {
			$content =~ s/\&ldquo\;(.*?)\&rdquo\;/\&ldquo\;<Article_Title>$1<\/Article_Title>\&rdquo\;/;
		}elsif($content =~ m/\&lsquo\;(.*?)\&rsquo\;/) {
			$content =~ s/\&lsquo\;(.*?)\&rsquo\;/\&lsquo\;<Article_Title>$1<\/Article_Title>\&rsquo\;/;
		}elsif($content =~ m/\&lsquo\;(.*?)XXXrsquoXXX/) {
			$content =~ s/\&lsquo\;(.*?)XXXrsquoXXX/\&lsquo\;<Article_Title>$1<\/Article_Title>\&rsquo\;/;
		}
	}
	$content =~ s/\[\[rsquo\]\]/XXXrsquoXXX/sgi;
	$content =~ s/([\.\,])(&ldquo;<Article_Title>)/$1 $2/;
	$content =~ s/(<\/Article_Title>[\,\.]\&rdquo\;)([A-Za-z])/$1 $2/;
	
	if($content !~ m/<Journal_Title>/) {
		if($content =~ m/<\/Article_Title>[\,\.]?(\&rdquo\;|\&rsquo\;)[\,\.]? ((?:The )?Journal [A-Za-z ]+)([\.\,])/i) {
			$content =~ s/(<\/Article_Title>[\,\.]?(?:\&rdquo\;|\&rsquo\;)[\,\.]?) ((?:The )?Journal [A-Za-z ]+)([\.\,])/$1 <Journal_Title>$2<\/Journal_Title>$3/i;
		} elsif($content =~ m/<\/Article_Title>[\,\.]?(\&rdquo\;|\&rsquo\;)[\,\.]? ((?:The )?Proceedings [A-Za-z 0-9]+)([\.\,])/i) {
			$content =~ s/(<\/Article_Title>[\,\.]?(?:\&rdquo\;|\&rsquo\;)[\,\.]?) ((?:The )?Proceedings [A-Za-z 0-9]+)([\.\,])/$1 <Journal_Title>$2<\/Journal_Title>$3/i;
		} elsif($content =~ m/<\/Article_Title>[\,\.]?(\&rdquo\;|\&rsquo\;)[\,\.]? ([A-Za-z\- ]+)([\.\,]? <Vol_No>)/i) {
			$content =~ s/(<\/Article_Title>[\,\.]?(?:\&rdquo\;|\&rsquo\;)[\,\.]?) ([A-Za-z\- ]+)([\.\,]? <Vol_No>)/$1 <Journal_Title>$2<\/Journal_Title>$3/i;
		} elsif($content =~ m/[\,\.]? ((?:The )?Journal [A-Za-z ]+)([\.\,])/i) {
			$content =~ s/([\,\.] )((?:The )?Journal [A-Za-z ]+)([\.\,])/$1<Journal_Title>$2<\/Journal_Title>$3/i;
		} elsif($content =~ m/<\/Article_Title>\,?&rdquo; [A-z \.]+[\(\)\,\<]/) {
			$content =~ s/(<\/Article_Title>\,?&rdquo; )([A-z \.]+)([\(\)\,\<])/$1<Journal_Title>$2<\/Journal_Title>$3/;
		}
	}
	$content =~ s/ <\/Journal_Title>/<\/Journal_Title> /sgi;
			#print $content,"\n";
	
	return $content;
}

sub confname_update {
	my $content = shift;
	if($content !~ m/<ConferenceName>/) {
	 	if($content =~ m/[\,\.]? ((?:The )?Proceedings of [A-Za-z ]+)([\.\,])/i) {
			$content =~ s/([\,\.] )((?:The )?Proceedings of [A-Za-z ]+)([\.\,])/$1<ConferenceName>$2<\/ConferenceName>$3/i;
		}
	}
	return $content;
}


sub Website_conversion {
	my $content = shift;
	# Website checking and tagging...
	if($content !~ m/<Website>/) {
		if ($content =~ m/&(\#60|lt|\#9001|\#706|lang)\;(<em>)?(http|www)(.*?)(<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/i) {
	    $content =~ s/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/\&lt\;<Website>$2$3<\/Website>\&gt\;/i;
	  }	elsif($content !~ m/<Website>/) {
			$content = Insertlink($content);
		}
	}
	return $content;
}

sub Insertlink 
{
  my $text = shift;
  while($text =~ m/((.)?(.))(http|WWW)(.+?)(\s|\)|\]|\.\s|\,\s|\;\s|\,<|\;<|\.<|<\/|>|$)/msgi)
   {
     my $fpre = $2;
     my $spre = $3;
     my $pre = $1;
     my $wtmp = "$4$5";
     $wtmp =~ s/(ht|ww)(tp|w)/$1<del>$2/gi;
     if($spre =~ m/([a-z]|\=\"|\">)/gi) 
     {
       $text =~ s/([a-z]|\=\"|\">)(http|WWW)(.+?)(\s|\)|\]|\.\s|\;\s|\;<|\.<|<\/|>|$)/$1$wtmp$3$4/msi;
     }
     else
     {
       $text =~ s/((.)?(.))(http|WWW)(.+?)(\s|\)|\]|\.\s|\,\s|\;\s|\,<|\;<|\.<|<\/|>|$)/$1<webaddress>$wtmp<\/webaddress>$6/msi;
     }
  }
   $text =~ s/<del>//gis;
   $text =~ s/<email url="([^\"]*)\"\/>/<email>$1<\/email>/gis;
   $text =~ s/<\/?Hyperlink(\s[^>]*)?>//gis;
   $text =~ s/(<webaddress(\s[^>]*)?)(\">(?:(?!<\/webaddress>).)*?&[a-z\#0-9]+)(<\/webaddress>)(\;)/$1$5$3$5$4/gis;
   $text =~ s/<webaddress/<Website/i;
   $text =~ s/<\/webaddress>/<\/Website>/i;
   return $text;
}

sub InsertDoi {
	my $text = shift;
  if ($text =~ m/(<\/Journal_Title>|<\/LastPage>)\, 10\.\d{4}\/([\S\.]+)/){
  	
    $text =~ s/(<\/Journal_Title>|<\/LastPage>)\, (10\.\d{4}\/[\S\.]+)/$1\, <Doi>$2<\/Doi>/;
    
  } elsif ($text =~ m/((?:doi|Doi|DOI)[\: ]+)\(10\.\d{4}\/[\/0-9a-zA-Z\.\-]+\)/) {
  	
  	$text =~ s/((?:doi|Doi|DOI)[\: ]+)\((10\.\d{4}\/[\/0-9a-zA-Z\.\-]+)\)/$1\(<Doi>$2<\/Doi>\)/;
  	
  } elsif ($text =~ m/((?:doi|Doi|DOI)[\: ]+)(10\.\d{4}\/[\/A-Za-z\(\)0-9\:\.\-]+)( |$)/) {
  	
  	$text =~ s/((?:doi|Doi|DOI)[\: ]+)(10\.\d{4}\/[\/A-Za-z\(\)0-9\:\.\-\.]+)( |$)/$1<Doi>$2<\/Doi>/i;
  	
  } elsif ($text =~ m/((?:doi|Doi|DOI)[\: ]+)(10[\S\.]+)/) {
  	
  	$text =~ s/((?:doi|Doi|DOI)[\: ]+)(10[\S\.]+)/$1<Doi>$2<\/Doi>/;
  	
  } elsif ($text =~ m/(http\:\/\/dx\.doi\.org\/)(10\.\d{4}\/[\/\w\.\-]+)/) {
  	
  	$text =~ s/(http\:\/\/dx\.doi\.org\/)(10\.\d{4}\/[\/\w\.\-]+)/$1<Doi>$2<\/Doi>/i;
  	
  } elsif ($text =~ m/ (10\.\d{4}\/[\/\w\.\-]+)/) {
  	
  	$text =~ s/ (10\.\d{4}\/[\/\w\.\-]+)/ <Doi>$1<\/Doi>/i;
  	
  }
  $text =~ s/([\.\,] ?)<\/Doi>/<\/Doi>$1/gi;
 	return $text;
}

sub year_aftr_page_conversion {
	my $content = shift;
	if($content !~ m/<Year>/) {
		if($content =~ m/(\,| )((18|19|20)[0-9][0-9][a-z]?)[\.\,] (pp?.? )?<FirstPage>/) {
			$content =~ s/(\,| )((18|19|20)[0-9][0-9][a-z]?)([\.\,] (pp?.? )?<FirstPage>)/$1<Year>$2<\/Year>$4/;
		}
	}
	return $content;
}

sub year_aftr_Publoc_conversion {
	my $content = shift;
	my $tagname = shift;
	if($content !~ m/<PublisherLocation>/) {
		if ($content =~ m/[\,\.] Washington\, D\.?C\.?\, USA([\.\,]?) \(?<$tagname>/) {
			$content =~ s/([\,:\.]) (Washington\, D\.?C\.?\,? USA)((?:[\.\,]?) \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/;
		} elsif ($content =~ m/[\,\.] U\.?S\.?A([\.\,]?) \(?<$tagname>/) {
			$content =~ s/([\,:\.]) (U\.?S\.?A)((?:[\.\,]?) \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/;
		} elsif ($content =~ m/[\,\:\.] ([A-Z][a-z]+(?: [A-Z][a-z]+)?)\, \(?<$tagname>/) {
    	my $country = $1;

    	if(exists $Countrycode{$country}) {
    		if($content =~ m/([\,:\.]) $country\, $Countrycode{$country}\, \(?<$tagname>/i) {
      		$content =~ s/([\,:\.]) ($country\, $Countrycode{$country})(\, \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/;
      	} elsif ($content =~ m/([\,:\.]) $country\, \(?<$tagname>/) {
      		$content =~ s/([\,:\.]) $country(\, \(?<$tagname>)/$1 <PublisherLocation>$country<\/PublisherLocation>$2/;
      	} 
      } elsif (exists $states{$country} or exists $stateandCntryAbb{$country} or exists $cities{$country}) {
    		if($content =~ m/([\,:\.]) $country\, $states{$country}\, \(?<$tagname>/i) {
      		$content =~ s/([\,:\.]) ($country\, $states{$country})(\, \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/;
      	} elsif ($content =~ m/([\,:\.]) $country\, \(?<$tagname>/) {
      		$content =~ s/([\,:\.]) $country(\, \(?<$tagname>)/$1 <PublisherLocation>$country<\/PublisherLocation>$2/;
      	} 
      }
    } elsif ($content =~ m/[\,\:\.] ([A-Z]{2,})\, \(?<$tagname>/) {
    	my $country = $1;

      if(exists $Countrycode{$country}) {
    		if($content =~ m/([\,:\.]) $country\, $Countrycode{$country}\, \(?<$tagname>/i) {
      		$content =~ s/([\,:\.]) ($country\, $Countrycode{$country})(\, \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/;
      	} elsif ($content =~ m/([\,:\.]) $country\, \(?<$tagname>/) {
      		$content =~ s/([\,:\.]) $country(\, \(?<$tagname>)/$1 <PublisherLocation>$country<\/PublisherLocation>$2/;
      	}
      } elsif (exists $states{$country} or exists $stateandCntryAbb{$country} or exists $cities{$country}) {
      	foreach my $stateinfo (keys %states) {
	    		if($content =~ m/([\,:\.]) $stateinfo\, $country\, \(?<$tagname>/i) {
	      		$content =~ s/([\,:\.]) ($stateinfo\, $country)(\, \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/i;
		      	last;
	      	}
      	}
      	if($content !~ m/<PublisherLocation>/) {
	      	if ($content =~ m/([\,:\.]) $country\, \(?<$tagname>/) {
	      		$content =~ s/([\,:\.]) $country(\, \(?<$tagname>)/$1 <PublisherLocation>$country<\/PublisherLocation>$2/i;
	      	} elsif($content =~ m/([\,:\.]) $country((?:[\.\,]?) \(?<$tagname>)/i) {
	      		$content =~ s/([\,:\.]) $country((?:[\.\,]?) \(?<$tagname>)/$1 <PublisherLocation>$2<\/PublisherLocation>$3/i;
	      	}
	      }
      }
			
		}
		if ($content =~ m/[\,\:\.] ([A-Z]{2,})\, <PublisherLocation>/) {
			my $infostate = $1;
			if(exists $stateandCntryAbb{$infostate}) {
				$content =~ s/([\,:\.]) ($infostate\, )<PublisherLocation>/$1 <PublisherLocation>$2/i;
			}
		}
  }
  return $content;
}

sub Publoc_aftr_Pubname_conversion {
	my $content = shift;
  foreach my $tagName ('PublisherLocation','FirstPage','Year') {
  	if($content !~ m/<PublisherName>/) {
      	foreach my $publistName (keys %publishersList) {
  		    if ($content =~ m/ \Q$publistName\E[\,\:\.] <$tagName>/i) {
  	    		$content =~ s/ ($publistName)([\,\:\.] )<$tagName>/ <PublisherName>$1<\/PublisherName>$2<$tagName>/i;
  	    		last;
  		    }
  		 }
    }
  }

  return $content;
}

sub restrict_book_conversion {
	my $content = shift;
	if($content !~ m/<Edition>/) {
    if ($content =~ m/([\( \, ]+)(([0-9]+(<sup>)?([\, ]|rd|nd|st|th)*(<\/sup>)?|First|Second|Third|Fourth)[ \,\.]+[Ee]dn?(?:itions?)?\.?)\b/) {
   		$content =~ s/([\( \, ]+)(([0-9]+(<sup>)?([\, ]|rd|nd|st|th)*(<\/sup>)?|First|Second|Third|Fourth)[ \,\.]+[Ee]dn?(?:itions?)?\.?)\b/$1<Edition>$2<\/Edition>/is;
   		$content =~ s/(Eds?)<\/Edition>\.\,/$1\.<\/Edition>\,/i;
    }
  }
  
  if($content !~ m/<chapter-title>/ && $content !~ m/<Article_Title>/ && $content !~ m/<Journal_Title>/) {
  	if($content =~ m/(\> ?)([^><]+)([\,\.] <PublisherLocation>)/i) {
  		#print $content,"\n";
  		my $tmp = $2;
  		$content =~ s/(\>)([^><]+)([\,\.] <PublisherLocation>)/$1<chapter-title>$2<\/chapter-title>$3/ if($tmp =~ m/ /);
  	}
	  $content =~ s/(<chapter-title>)([\)\,\. ]+)/$2$1/;
  }
  return $content;
}

sub publoc_at_end {
  my $content = shift;
  #print $content,"\n\n";
  if($content !~ m/<PublisherLocation>/ && $content !~ m/<PublisherName>/) {
    my %statesReverse = reverse %states;
    my $cityRegex = "((?:St. )?(?:[A-z]+|[A-z]+ [A-z]+|[A-z]+ [A-z]+ [A-z]+))";
    my $stateRegex = "([A-z]+|[A-z]+ [A-z]+|[A-z]+ [A-z]+ [A-z]+)";
    my $countryRegex = "([A-z]+|[A-z]+ [A-z]+|[A-z]+ [A-z]+ [A-z]+)";
    if ($content =~ m/ $cityRegex\, $stateRegex\, $countryRegex\.?$/) {
      my ($city, $state, $country) = ($1, $2, $3);
      if(exists $Countrycode{$country} && exists $states{$state} && exists $cities{$city}) {
        $content =~ s/ $cityRegex\, $stateRegex\, $countryRegex([\.]?)$/ <PublisherLocation>$1, $2, $3<\/PublisherLocation>$4/;
      } elsif(exists $Countrycode{$country} && exists $statesReverse{$state} && exists $cities{$city}) {
        $content =~ s/ $cityRegex\, $stateRegex\, $countryRegex([\.]?)$/ <PublisherLocation>$1, $2, $3<\/PublisherLocation>$4/;
      } else {
        if ($content =~ m/ $cityRegex\, $countryRegex\.?$/) {
          my ($city_or_state, $country) = ($1, $2);
          if(exists $Countrycode{$country} && exists $states{$city_or_state}) {
            $content =~ s/ $cityRegex\, $countryRegex([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          } elsif(exists $Countrycode{$country} && exists $cities{$city_or_state}) {
            $content =~ s/ $cityRegex\, $countryRegex([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          } elsif(exists $Countrycode{$country} && exists $statesReverse{$city_or_state}) {
            $content =~ s/ $cityRegex\, $countryRegex([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          } elsif(exists $cities{$city_or_state} && exists $states{$country}) {
            $content =~ s/ $cityRegex\, $countryRegex([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          } elsif ($content =~ m/ ([A-Za-z]+)\, ([A-Za-z\s]+)\.?$/) {
            my ($city_or_state, $country) = ($1, $2);
            if(exists $Countrycode{$country} && exists $states{$city_or_state}) {
              $content =~ s/ ([A-z]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
            } elsif(exists $Countrycode{$country} && exists $cities{$city_or_state}) {
              $content =~ s/ ([A-z]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
            } elsif(exists $Countrycode{$country} && exists $statesReverse{$city_or_state}) {
              $content =~ s/ ([A-z]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
            } elsif ($content =~ m/\, ([A-Za-z\s]+)\.?$/) {
              my $country = $1;
              if(exists $Countrycode{$country}) {
                $content =~ s/\, ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
              } elsif(exists $states{$country}) {
                $content =~ s/\, ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
              }
            }

          }
        } elsif ($content =~ m/\, ([A-Za-z\s]+)\.?$/) {
          my $country = $1;
          if(exists $Countrycode{$country}) {
            $content =~ s/\, ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
          } elsif(exists $states{$country}) {
            $content =~ s/\, ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
          }
        }
      }
    } else {
      if ($content =~ m/ ([A-z\s]+)\, ([A-Za-z\s]+)\.?$/) {
        my ($city_or_state, $country) = ($1, $2);
        if(exists $Countrycode{$country} && exists $states{$city_or_state}) {
          $content =~ s/ ([A-z\s]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
        } elsif(exists $Countrycode{$country} && exists $cities{$city_or_state}) {
          $content =~ s/ ([A-z\s]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
        } elsif(exists $Countrycode{$country} && exists $statesReverse{$city_or_state}) {
          $content =~ s/ ([A-z\s]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
        } elsif(exists $cities{$city_or_state} && exists $states{$country}) {
          $content =~ s/ ([A-z\s]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
        } elsif ($content =~ m/ ([A-Za-z]+)\, ([A-Za-z\s]+)\.?$/) {
          my ($city_or_state, $country) = ($1, $2);
          if(exists $Countrycode{$country} && exists $states{$city_or_state}) {
            $content =~ s/ ([A-z]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          } elsif(exists $Countrycode{$country} && exists $cities{$city_or_state}) {
            $content =~ s/ ([A-z]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          } elsif(exists $Countrycode{$country} && exists $statesReverse{$city_or_state}) {
            $content =~ s/ ([A-z]+)\, ([A-Z][A-z\s]+)([\.]?)$/ <PublisherLocation>$1, $2<\/PublisherLocation>$3/;
          }
        }
      } elsif ($content =~ m/[\,\.] ([A-Za-z\s]+)\.?$/) {
        my $country = $1;
        if(exists $Countrycode{$country}) {
          $content =~ s/[\,\.] ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
        } elsif(exists $states{$country}) {
          $content =~ s/[\,\.] ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
        } elsif(exists $cities{$country}) {
          $content =~ s/[\,\.] ([A-Za-z\s]+)([\.]?)$/\, <PublisherLocation>$1<\/PublisherLocation>$2/;
        }
      }
    }
    if($content !~ m/<PublisherLocation>/ && $content !~ m/<PublisherName>/) {
    	if($content =~ m/([\,\;\.] | and |\()(Washington\, D\.?C\.?|Hong Kong|London\, UK|New Delhi|New York|San Francisco)\:([A-Za-z\- ]+)[\)\,\.]/i) {
    		$content =~ s/([\,\;\.] | and |\()(Washington\, D\.?C\.?|Hong Kong|London\, UK|New Delhi|New York|San Francisco|U\.K\.)( ?\: ?)([A-Za-z\- ]+)([\)\,\.])/$1<PublisherLocation>$2<\/PublisherLocation>$3<PublisherName>$4<\/PublisherName>$5/i;
    	}
    	my $whilecount = 0;
    	while($content =~ m/(?:[\,\;\.] | and |\()([A-Za-z]+)( ?\: ?)([A-Za-z\-\&\; ]+)(\)|[\,\.])/i
			&& $content !~ m/<PublisherLocation>/
			&& $content !~ m/<PublisherName>/) {
				my $country = $1;
										#print $country,"\n";
										#print $&,"\n";										
				my $flag = 0;
        if(exists $Countrycode{$country}) {
          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)([A-Za-z\-\&\; ]+)(\)|[\,\.])/$1<PublisherLocation>$2<\/PublisherLocation>$3<PublisherName>$4<\/PublisherName>$5/i;
          $flag = 1;
        } elsif(exists $states{$country}) {
          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)([A-Za-z\-\&\; ]+)(\)|[\,\.])/$1<PublisherLocation>$2<\/PublisherLocation>$3<PublisherName>$4<\/PublisherName>$5/i;
          $flag = 1;
        } elsif(exists $cities{$country}) {
        	#print $content,"\n";
          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)([A-Za-z\-\&\; ]+)(\)|[\,\.])/$1<PublisherLocation>$2<\/PublisherLocation>$3<PublisherName>$4<\/PublisherName>$5/i;
          $flag = 1;
        } elsif(exists $stateandCntryAbb{$country}) {
          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)([A-Za-z\-\&\; ]+)(\)|[\,\.])/$1<PublisherLocation>$2<\/PublisherLocation>$3<PublisherName>$4<\/PublisherName>$5/i;
          $flag = 1;
        }
        if($content !~ m/<PublisherLocation>/
					&& $content !~ m/<PublisherName>/) {
	        if(exists $Countrycode{$country}) {
	          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)/$1<PublisherLocation>$2<\/PublisherLocation>$3/i;
	          $flag = 1;
	        } elsif(exists $states{$country}) {
	          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)/$1<PublisherLocation>$2<\/PublisherLocation>$3/i;
	          $flag = 1;
	        } elsif(exists $cities{$country}) {
	          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)/$1<PublisherLocation>$2<\/PublisherLocation>$3/i;
	          $flag = 1;
	        } elsif(exists $stateandCntryAbb{$country}) {
	          $content =~ s/([\,\;\.] | and |\()($country)( ?\: ?)/$1<PublisherLocation>$2<\/PublisherLocation>$3/i;
	          $flag = 1;
	        }
      	}

### Need to create as subroutine
				if ($content =~ m/[\,\:\;\.] ([A-Za-z]+ [A-Za-z]+) and <PublisherLocation>/) {
					my $subloc = $1;
					 if(exists $cities{$subloc}) {
					 	$content =~ s/([\,:\;\.]) ($subloc and )<PublisherLocation>/$1 <PublisherLocation>$2/i;
					 	$flag = 1;
					}
				} elsif ($content =~ m/[\,\:\;\.] ([A-Za-z]+ [A-Za-z]+)\, <PublisherLocation>/) {
					my $subloc = $1;
					 if(exists $cities{$subloc}) {
					 	$content =~ s/([\,:\;\.]) ($subloc\, )<PublisherLocation>/$1 <PublisherLocation>$2/i;
					 	$flag = 1;
					}
				} elsif ($content =~ m/[\,\:\.\;] ([A-Z]{2,})\, <PublisherLocation>/) {
					my $infostate = $1;
					if(exists $stateandCntryAbb{$infostate}) {
						$content =~ s/([\,:\.\;]) ($infostate\, )<PublisherLocation>/$1 <PublisherLocation>$2/i;
						$flag = 1;
					}
				} elsif ($content =~ m/[\,\:\;\.] ([A-Za-z]+)\, <PublisherLocation>/) {
					my $subloc = $1;
					 if(exists $cities{$subloc}) {
					 	$content =~ s/([\,:\;\.]) ($subloc\, )<PublisherLocation>/$1 <PublisherLocation>$2/i;
					 	$flag = 1;
					} elsif(exists $states{$subloc}) {
					 	$content =~ s/([\,:\;\.]) ($subloc\, )<PublisherLocation>/$1 <PublisherLocation>$2/i;
					 	$flag = 1;
					}
				} elsif ($content =~ m/[\,\:\;\.] (Salt Lake City|Washington\, D\.?C\.?|London\, UK|New York|New Delhi|London|U\.K\.)\, <PublisherLocation>/) {
					 	$content =~ s/([\,\:\;\.]) (Salt Lake City|Washington\, D\.?C\.?|London\, UK|New York|New Delhi|London|U\.K\.)\, <PublisherLocation>/$1 <PublisherLocation>$2\, /i;
					 	$flag = 1;
				} elsif ($content =~ m/[\,\:\;\.] ([A-Za-z]+) and <PublisherLocation>/) {
					my $subloc = $1;
					 if(exists $cities{$subloc}) {
					 	$content =~ s/([\,:\;\.]) ($subloc and )<PublisherLocation>/$1 <PublisherLocation>$2/i;
					 	$flag = 1;
					}
				} elsif ($content =~ m/\b([A-Za-z]+ [A-Za-z]+)\, <PublisherLocation>/) {
					my $subloc = $1;
					 if(exists $cities{$subloc}) {
					 	$content =~ s/\b($subloc\, )<PublisherLocation>/<PublisherLocation>$1/i;
					 	$flag = 1;
					} elsif(exists $states{$subloc}) {
					 	$content =~ s/\b($subloc\, )<PublisherLocation>/<PublisherLocation>$1/i;
					 	$flag = 1;
					}
				} elsif ($content =~ m/\b([A-Za-z]+)\, <PublisherLocation>/) {
					my $subloc = $1;
					 if(exists $cities{$subloc}) {
					 	$content =~ s/\b($subloc\, )<PublisherLocation>/<PublisherLocation>$1/i;
					 	$flag = 1;
					} elsif(exists $states{$subloc}) {
					 	$content =~ s/\b($subloc\, )<PublisherLocation>/<PublisherLocation>$1/i;
					 	$flag = 1;
					}
				}
				if($flag == 0) {
					$content =~ s/((?:[\,\;\.] | and )(?:[A-Za-z]+) ?)\:( ?[A-Za-z\-\&\; ]+[\,\.])/$1\&colon\;$2/i;
				}
				if($whilecount == 100) {
					last;
				}
				$whilecount++;
			}
			$content =~ s/&colon;/\:/gi;
		}
  }
  if($content !~ m/<PublisherName>/) {
  	if($content =~ s/([\,\.\:\(] ?)([^\,\.\>\:\(]+\b([Pp]ress))\.$/$1<PublisherName>$2<\/PublisherName>\./i){
  	} elsif($content =~ s/([\,\.\:\(] ?)([^\,\.\>\:\(]+\b([Pp]ress))\,/$1<PublisherName>$2<\/PublisherName>\,/i){
  	}
  }
  #print $content,"\n";
  $content =~ s/<PublisherName><\/Article_Title>/<\/Article_Title><PublisherName>/g;
  $content =~ s/<PublisherName>(&rdquo; )/$1<PublisherName>/g;
  
  if($content !~ m/<PublisherLocation>/) {
 		if($content =~ m/([\,\;\.] )(Washington\, D\.?C\.?|London\, UK|New Delhi|New York|San Francisco|Los Angeles|U\.K\.)\./) {
 			$content =~ s/([\,\;\.] )(Washington\, D\.?C\.?|London\, UK|New Delhi|New York|San Francisco|Los Angeles|U\.K\.)\./$1<PublisherLocation>$2<\/PublisherLocation>\./;
 		} elsif($content =~ m/([\,\;\.] )(USA|U\.K\.), pp\. <FirstPage>/) {
 			$content =~ s/([\,\;\.] )(USA|U\.K\.), pp\. <FirstPage>/$1<PublisherLocation>$2<\/PublisherLocation>, pp. <FirstPage>/;
 		} elsif($content =~ m/([\,\;\.] )(U\.K\.)$/) {
 			$content =~ s/([\,\;\.] )(U\.K\.)$/$1<PublisherLocation>$2<\/PublisherLocation>/;
 		} elsif($content =~ m/([\,\;\.] )([A-Za-z]+)\, pp\. <FirstPage>/) {
 			my $country = $2;
 			my $testf = 0;
 			$testf = 1 if(exists $cities{$country});
 			$testf = 1 if(exists $states{$country});
 			$testf = 1 if(exists $Countrycode{$country});
 			
 			if($testf == 1) {
 				$content =~ s/([\,\;\.] )($country)\, pp\. <FirstPage>/$1<PublisherLocation>$2<\/PublisherLocation>, pp\. <FirstPage>/;
 			}
 			
 		} elsif($content =~ m/([\,\;\.] )([A-Za-z]+)$/) {
 			my $country = $2;
 			my $testf = 0;
 			$testf = 1 if(exists $cities{$country});
 			$testf = 1 if(exists $states{$country});
 			$testf = 1 if(exists $Countrycode{$country});
 			
 			if($testf == 1) {
 				$content =~ s/([\,\;\.] )($country)$/$1<PublisherLocation>$2<\/PublisherLocation>/;
 			}
 		}
 		
 		$content = &prev_publisherloc($content);
 		
  }
  
  if($content =~ m/<PublisherName>/ && $content !~ m/<PublisherLocation>/) {
  	if($content =~ m/([\,\;\.] )(Washington\, D\.?C\.?|London\, UK|New Delhi|New York|San Francisco|Los Angeles|U\.K\.)( ?\: ?<PublisherName>)/) {
  		$content =~ s/([\,\;\.] )(Washington\, D\.?C\.?|London\, UK|New Delhi|New York|San Francisco|Los Angeles|U\.K\.)( ?\: ?<PublisherName>)/$1<PublisherLocation>$2<\/PublisherLocation>$3/;
  	}
  }
  if($content !~ m/<PublisherName>/ && $content =~ m/<PublisherLocation>/) {
  	if($content =~ m/([\,\;\.] )([A-Za-z ]+)( ?\: ?<PublisherLocation>)/) {
  		$content =~ s/([\,\;\.] )([A-Za-z ]+)( ?\: ?<PublisherLocation>)/$1<PublisherName>$2<\/PublisherName>$3/;
  	}
  }
  
  if($content !~ m/<PublisherName>/ && $content !~ m/<PublisherLocation>/) {
  	if($content =~ m/[\.\,\(] ?[A-Za-z ]+( [Pp]ress)( ?\: ?)([A-Za-z]+)\, ([A-Z]{2})[\.\,]/i) {
  		$content =~ s/([\.\,\(] ?)([A-Za-z ]+ [Pp]ress)( ?\: ?)([A-Za-z]+\, [A-Z]{2})([\.\,])/$1<PublisherName>$2<\/PublisherName>$3<PublisherLocation>$4<\/PublisherLocation>/i;
  	} elsif($content =~ m/[\.\,] [A-Z][a-z]+ [A-Z][a-z]+( ?\: ?)([A-Z][a-z]+ [A-Z][a-z]+)\, ([A-Z]{2})[\.\,]/) {
  		my $country = $2;
  		if(exists $cities{$country}) {
  			$content =~ s/([\.\,] )([A-Z][a-z]+ [A-Z][a-z]+)( ?\: ?)($country\, [A-Z]{2})([\.\,])/$1<PublisherName>$2<\/PublisherName>$3<PublisherLocation>$4<\/PublisherLocation>/;
  		}
  	} elsif($content =~ m/[\.\,] [A-Z][a-z]+ [A-Z][a-z]+( ?\: ?)([A-Z][a-z]+)\, ([A-Z]{2})[\.\,]/) {
  		my $country = $2;
  		if(exists $cities{$country}) {
  			$content =~ s/([\.\,] )([A-Z][a-z]+ [A-Z][a-z]+)( ?\: ?)($country\, [A-Z]{2})([\.\,])/$1<PublisherName>$2<\/PublisherName>$3<PublisherLocation>$4<\/PublisherLocation>/;
  		}
  	} elsif($content =~ m/\: ?([A-Z][a-z]+ [A-Z][a-z]+)\, ([A-Z]{2})([\.\,]|\b)/) {
  		my $country = $1;
  		if(exists $cities{$country}) {
  			$content =~ s/(\: ?)($country\, [A-Z]{2})([\.\,]|\b)/$1<PublisherLocation>$2<\/PublisherLocation>$3/;
  		}
  	} elsif($content =~ m/\: ?([A-Z][a-z]+)\, ([A-Z]{2})([\.\,]|\b)/) {
  		my $country = $1;
  		if(exists $cities{$country}) {
  			$content =~ s/(\: ?)($country\, [A-Z]{2})([\.\,]|\b)/$1<PublisherLocation>$2<\/PublisherLocation>$3/;
  		}
  	} elsif($content =~ m/\([A-Za-z ]+( [Pp]ress)[\,\.]/) {
  		$content =~ s/\(([A-Za-z ]+(?: [Pp]ress))([\,\.])/\(<PublisherName>$1<\/PublisherName>$2/;
  	}
  }
  $content =~ s/(<\/PublisherName>)(\, [A-z]+ and Co\.)\,/$2$1\,/i;
  $content =~ s/\b(London and )(<PublisherLocation>)/$2$1/;
	return $content;
}

sub prev_publisherloc {
	my $content = shift;
	 if($content =~ m/([\,\;\.] )([A-Z][a-z]+ [A-Z][a-z]+)\, <PublisherLocation>/) {
 			my $country = $2;
 			my $testf = 0;
 			$testf = 1 if(exists $cities{$country});
 			$testf = 1 if(exists $states{$country});
 			$testf = 1 if(exists $Countrycode{$country});
 			
 			if($testf == 1) {
 				$content =~ s/([\,\;\.] )($country\, )<PublisherLocation>/$1<PublisherLocation>$2/;
 			}
 		} elsif($content =~ m/([\,\;\.] )([A-Z][a-z]+)\, <PublisherLocation>/) {
 			my $country = $2;
 			my $testf = 0;
 			$testf = 1 if(exists $cities{$country});
 			$testf = 1 if(exists $states{$country});
 			$testf = 1 if(exists $Countrycode{$country});
 			
 			if($testf == 1) {
 				$content =~ s/([\,\;\.] )($country\, )<PublisherLocation>/$1<PublisherLocation>$2/;
 			}
 		} elsif($content =~ m/([\,\;\.] )([A-Z]{2})\, <PublisherLocation>/) {
 			my $country = $2;
 			my $testf = 0;
 			#print $country,"\n";
 			$testf = 1 if(exists $stateandCntryAbb{$country});
 			if($testf == 1) {
 				$content =~ s/([\,\;\.] )($country\, )<PublisherLocation>/$1<PublisherLocation>$2/;
 			}
 		}
	return $content;
}

sub publisherloc_tagging {
  my $content = shift;
  $content = &Reftagging::year_aftr_Publoc_conversion($content, "Year");
  $content = &Reftagging::year_aftr_Publoc_conversion($content, "Edition");
  $content = &Reftagging::year_aftr_Publoc_conversion($content, "FirstPage");
  return $content;
}

sub publishername_tagging {
  my $content = shift;
  $content = &Reftagging::Publoc_aftr_Pubname_conversion($content);
  return $content;
}


sub missing_Journaltitle {
	my $content = shift;
	if($content !~ m/<Journal_Title>/) {
		$content =~ s/(<\/Article_Title>[\,\.](?:\&rdquo\;)? )([A-Z][^><]+)((?:Vol\.)? <Vol_No>)/$1<Journal_Title>$2<\/Journal_Title>$3/i;
	}
	if($content !~ m/<Journal_Title>/) {
		$content =~ s/(<\/Article_Title>(?:\&rdquo\;)[\,\.] )([A-Z][^><]+)((?:Vol\.)? <Vol_No>)/$1<Journal_Title>$2<\/Journal_Title>$3/i;
	}
	#print $content,"\n";
	if($content !~ m/<Journal_Title>/) {
		$content =~ s/(<\/Article_Title>(?:\,?\&rdquo\;)[\,\.]* )(<I>[A-Z][^><]+<\/I>[\.\, ]*)((?:Vol\.)? <Vol_No>)/$1<Journal_Title>$2<\/Journal_Title>$3/i;
	}
	if($content !~ m/<Journal_Title>/) {
		$content =~ s/(<I>[A-Z][^><]+<\/I>[\.\, ]*)((?:Vol\.)? <Vol_No>)/<Journal_Title>$1<\/Journal_Title>$2/i;
	}
	return $content;
}


sub reftype_conversion {
	my $content = shift;

		if($content =~ m/ \(?(ed\.|eds\.|ed\).)/i)
    {
       $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/<\/em>\, ([A-z\s\-]+): ([A-z\s\-]+)([\.])/) {
       $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/ Symposium? /i && $content =~ m/ Pp?\. /i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/ conf(erence|\.)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/International Symposium (of|on)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/\b(meeting|congress|in Proceedings)\b/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif(($content =~ m/in Proceedings/i || $content =~ m/in Proc\. /i || $content =~ m/Proceeding of /) && $content !~ m/[0-9\/+](\([0-9]+\))\, [A-Z]?[0-9+][A-Z]?[0-9+]/)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/&\#8221; <em>(Rep\. No\. |Technical Report|Technical\. Rep\. |Report no[\.\:] |Rep[ort]*\.? [A-Z]+\-[0-9]+)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Report>$1<\/Report><\/p>/i;
    }
    elsif($content =~ m/\b(Technical Report|Technical\. Rep\. |Report no)\b/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Report>$1<\/Report><\/p>/i;
    }
    elsif($content =~ m/<em>.*?Thesis/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Thesis>$1<\/Thesis><\/p>/i;
    }
    elsif($content =~ m/Ph\.D\.? Thesis/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Thesis>$1<\/Thesis><\/p>/i;
    }
    elsif($content =~ m/(PhD-Thesis|M\.S\. Thesis|Ph\.D\. Dissertation|Ph\.D\.? Thesis)\,/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Thesis>$1<\/Thesis><\/p>/i;
    }
    elsif($content =~ m/ \(eds\.?\)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/([^0-9]+)\, ([^0-9]+)\,? (\([0-9][A-Za-z]?\))/)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/&\#8221; <em>Proc\./i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/&\#8221; Proceedings? of/i && $content !~ m/[0-9\/+](\([0-9]+\))\, [A-Z]?[0-9+][A-Z]?[0-9+]/)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/\, Proceedings? of/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Conference>$1<\/Conference><\/p>/i;
    }
    elsif($content =~ m/&\#8221; <em>([A-z\.\s]+ Rep\. No\.)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Report>$1<\/Report><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* <em>(.*?)<\/em>\, ([A-Za-z\-]+)\, ([A-Za-z\-]+)\, /i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/<em>(.*?)<\/em>\,? ([A-Za-z\-]+)\, ([A-Za-z\-]+)\,? \(([0-9]{4}[a-z]?)\)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* <em>(.*?)<\/em>\, ([A-Za-z\-]+)\, ([A-Za-z\-]+) \(in ([A-Za-z\-\s]+)\)\.<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* <em>(.*?)<\/em>\,?\.? Trans. /i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/<em>(.*?)<\/em>\,?\.? Trans. /i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/[0-9]th Ed/ && $content =~ m/USA\.?<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/<em>Handbook of .*?<\/em>\, ([A-Za-z\-]+)\, ([A-Za-z\-]+|[A-Za-z\-]+ [A-Za-z\-]+)\, /i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/<em>.*?Handbook.*?<\/em>/i && $content =~ m/Chapter [0-9]+\,?/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? <em>(.*?)<\/em>\, ([A-Za-z\s]+)\, ([A-Za-z]+)\, ([A-Za-z]+)\.?<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* <em>(.*?)<\/em>\,? ([A-Za-z\s]+): ([A-Za-z\s]+)\.?<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/[0-9](th|nd) Ed&\#8221;\./i || $content =~ m/[0-9](th|nd) Ed\.&\#8221;/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/ (MIT Press|The Macmillan Press|Joseph Henry Press)\b/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Book>$1<\/Book><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? <em>(.*?)<\/em>\.?\,? ([0-9]+)[\,:\(]/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* (.*?)(\.|\,) <em>(.*?)<\/em>\.?\,? ([0-9]+)[\,:\(]/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/((?:19|20)[0-9]{2}[a-z]?)[\.\,]* (.*?)(\.|\,) <em>(.*?)<\/em>\.?\,? ([0-9]+)[\,:\(]/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/[\?\.\,] <em>(.*?)<\/em>\.?\,? ([0-9]+)\(([0-9]+)\)[\,:] [0-9]+(\-|\&\#8211\;)[0-9]+\.?<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/[\?\.\,] <em>(.*?)<\/em>\.?\,? ([0-9]+)\(([0-9]+)\)[\,:] [0-9]+\.<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/[\?\.\,] <em>(.*?)<\/em>\.?\,? ([0-9]+)[\,:\(] [0-9]+(\-|\&\#8211\;)[0-9]+\.?$<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? <em>(.*?)<\/em>\.?\,? Vol ([0-9]+)\, pp ([0-9]+)(-|&ndash;|&mdash;|&\#8211;)([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? <em>J\. (.*?)<\/em>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)\,? ([0-9]+)\s*\:([0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/<strong>([0-9]+)<\/strong>\, pp\.? ([A-Z]?[0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([A-Z]?[0-9]+)\,? \(((?:18|19|20)[0-9][0-9])\)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/<strong>([0-9]+)<\/strong>\,\s([A-Z]?[0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([A-Z]?[0-9]+)\,? \(((?:18|19|20)[0-9][0-9])\)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/<strong>([0-9]+)<\/strong>\,\s([A-Z]?[0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([A-Z]?[0-9]+)\,? \(((?:$month) (?:18|19|20)[0-9][0-9])\)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/<\/em>[\,\.]? ([0-9]+)\,?\s([A-Z]?[0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([A-Z]?[0-9]+)\,? \(((?:18|19|20)[0-9][0-9])\)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/[\,\.] ([0-9]+)\,?\s([A-Z]?[0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([A-Z]?[0-9]+)\,? \(((?:18|19|20)[0-9][0-9])\)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/[\,\.] [Vv]ol\. ([0-9]+)\,? pp\.? ([A-Z]?[0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;|&\#173;)\s*([A-Z]?[0-9]+)\,? \(((?:18|19|20)[0-9][0-9])\)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)\,? ([0-9]+)\s*\:([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;[\.\,]* ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)[\.\,]* ([0-9]+)\, (pp\. )?([0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;)\s*([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)\,?\s*(Vo?l?\. )?([0-9]+)\s*(\([0-9\-]+\))?\s*[\,\:]\s*(pp?\. )?([A-Z]?[0-9]+)?\s*(-|&ndash;|&mdash;|&\#8211;)?\s*([0-9]+)?(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    
    elsif($content =~ m/([0-9]{4}[a-z]?)[\.\,\;] ([0-9]+)\s*\: ([0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;)\s*([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)\,?\s*([A-Z]?[a-z]?[0-9]+)\s*(\([0-9\-]+\))?\s*[\,\:]\s*([A-Z0-9]+)?\s*(-|&ndash;|&mdash;|&\#8211;)?\s*([0-9]+)?(\,?\.?\s*)doi:/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? ([A-Za-z0-9\&\;\:\#\-\.\s]+)\,? doi:\s*([\S]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.? (J. |J Trans.)/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* &\#8220;(.*?)&\#8221;\.?/i && $content =~ m/in press/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* ([A-Za-z0-9\(\)\&\;\:\?\#\-\s]+)[\.\,] ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)[\,\.] \s*([A-Z]?[a-z]?[0-9\/]+)(\([0-9\-\/]+\))?\s*[\,\:]\s*([0-9]+)?\s*(-|&ndash;|&mdash;|&\#8211;)?\s*([0-9]+)?(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* ([A-Za-z0-9\(\)\&\;\:\?\#\-\s]+)[\.\,] ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)[\,\.]* (Vo?l?\. )?([A-Z]?[a-z]?[0-9\/]+)(\([0-9\-\/]+\))?\s*[\,\:]\s*(pp?\. )?([0-9]+)?\s*(-|&ndash;|&mdash;|&\#8211;)\s*([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* ([A-Za-z0-9\(\)\&\;\:\?\#\-\s]+)[\.\,] ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)[\,\.] \s*([A-Z]?[a-z]?[0-9]+)(\([0-9\-\/]+\))?\s*[\,\:]\s*([A-Z]?[0-9]+)?\s*(-|&ndash;|&mdash;|&\#8211;)?\s*([0-9]+)?\, doi:\s*(\S+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/\(([0-9]{4}[a-z]?)\)[\.\,]* ([A-Za-z0-9\(\)\&\;\:\?\#\-\s]+)\. ([A-Za-z0-9\(\)\&\;\:\#\-\.\s]+)\, doi:\s*(\S+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/&\#8220;(.*?)&\#8221; ([A-Za-z0-9\(\)\&\;\:\#\-\s]+)\. ([0-9]+)\, ($month)?\s*((18|19|20)[0-9]{2}[a-z]?)\, (pp\. )?([0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;)\s*([0-9]+)(\.?)<\/p>/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/(?:<i>)?(.*?)(?:<\/i>)?\,? (?:<strong>)?([0-9]+(?:\-?[a-zA-Z0-9]+)?(?:\/[0-9]+)?|[A-Z]+\-[0-9]+(?:\-?[a-zA-Z0-9]+)?(?:\/[0-9]+)?)(?:<\/strong>)?\,? ?((\(e?[0-9]+\))\,? )?([eA-Z0-9\,]+) ?(([\-]+|&ndash;) ?([A-Z0-9\,]+))?\,? (\(?([0-9]{4}[a-z]?)\)?)/)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    elsif($content =~ m/<em>(.*?)<\/em>/ && $content =~ m/( doi([\:]? )|(http:\/\/dx\.doi\.org\/|10\.\d{4}\/\d{2,}))/i)
    {
      $content =~ s/<p>(.*?)<\/p>/<p><Journal>$1<\/Journal><\/p>/i;
    }
    else
    {
      $content =~ s/<p>(.*?)<\/p>/<p><References>$1<\/References><\/p>/i;
    }
    $content =~ s/(<p>)<(Journal|Book|Conference|Thesis|Report|Paper|Patent|References)>(\. ?)/$1$3<$2>/sgi;
    
    $content =~ s/(<p>)<(Journal|Book|Conference|Thesis|Report|Paper|Patent|References)>(\([0-9]+\) ?)/$1$3<$2>/sgi;
    #print $content,"\n\n";
    return $content;
}

sub journal_conversion {
  my $journal = shift;
  $journal =~ s/\, (China)\. /\&comma; $1\. /i;
  $journal =~ s/\, (Wales)\)/\&comma; $1\)/i;
  print "$journal\n" if ($debug);
  # year conversion
  if ($journal =~ m/ \(([0-9]{4}[a-z]?)\)/) {
    $journal =~ s/ \(([0-9]{4}[a-z]?)\)/ \(<Year>$1<\/Year>\)/;
  } elsif ($journal =~ m/ ((?:19|20)[0-9]{2}[a-z]?)[\.\,]* (.*?)(\.|\,) <em>(.*?)<\/em>/) {
    $journal =~ s/ ((?:19|20)[0-9]{2}[a-z]?)([\.\,]*) (.*?)(\.|\,) <em>(.*?)<\/em>/ <Year>$1<\/Year>$2 <Article_Title>$3<\/Article_Title>$4 <Journal_Title><em>$5<\/em><\/Journal_Title>/;
  } elsif ($journal =~ m/ ((18|19|20)[0-9]{2}[a-z]?)/) {
    if ($journal =~ m/&ldquo;(.*?)&rdquo; ([A-Za-z0-9\(\)\&\;\:\#\-\s]+)[\.\,] ([0-9]+)\, ($month)?\s*((?:18|19|20)[0-9]{2}[a-z]?)\, (pp?\. )?([0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;)\s*([0-9]+)(\.?)$/) {
      $journal =~ s/&ldquo;(.*?)&rdquo; ([A-Za-z0-9\(\)\&\;\:\#\-\s]+)([\.\,]) ([0-9]+)\, ($month)?(\s*)?((?:18|19|20)[0-9]{2}[a-z]?)\, (pp?\. )?([0-9]+)\s*(-|&ndash;|&mdash;|&\#8211;)\s*([0-9]+)(\.?)$/&ldquo;<Article_Title>$1<\/Article_Title>&rdquo; <Journal_Title>$2<\/Journal_Title>$3 <Vol_No>$4<\/Vol_No>\, <Year>$5$6$7<\/Year>\, $8<FirstPage>$9<\/FirstPage>&ndash;<LastPage>$11<\/LastPage>$12/;
    } elsif ($journal =~ m/ ((18|19|20)[0-9]{2}[a-z]?)(\.?)$/) {
      $journal =~ s/ ((?:18|19|20)[0-9]{2}[a-z]?)(\.?)$/ <Year>$1<\/Year>$2/;
    }
  }

  print "$journal\n" if ($debug);
  # article-title conversion
  if ($journal =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/) {
    $journal =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; <em>/;
  } elsif ($journal =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; ASCE\, <em>/) {
    $journal =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; ASCE\, <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; ASCE\, <em>/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (Vo?l?\. )?([0-9]+)\,/) {
    $journal =~ s/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, ([0-9]+)\,/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3 <Journal_Title>$4<\/Journal_Title>\, <Vol_No>$5<\/Vol_No>\,/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (([D|d]oi|DOI):)/) {
    $journal =~ s/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (([D|d]oi|DOI):)/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3 <Journal_Title>$4<\/Journal_Title>\, $5/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*\s*)&ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,(\s*[0-9]+)/) {
    $journal =~ s/<\/Year>\)([\,\.]*\s*)&ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,(\s*[0-9]+)/<\/Year>\)$1&ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3$4\,$5/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*\s*)&ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+)/) {
    $journal =~ s/<\/Year>\)([\,\.]*\s*)&ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+)/<\/Year>\)$1&ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3$4 $5/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.\s]*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, <Vol_No>/) {
    $journal =~ s/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)&rdquo;([\,\.\s]*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, <Vol_No>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3 $4\, <Vol_No>/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (Vo?l?\. )?<Vol_No>/) {
    $journal =~ s/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (Vo?l?\. )?<Vol_No>/<\/Year>\)$1 <Article_Title>$2<\/Article_Title>$3 $4\, $5<Vol_No>/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.] ([0-9\/]+|[0-9]+\([0-9\/]+\))\,/) {
    $journal =~ s/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]) ([0-9\/]+|[0-9]+\([0-9\/]+\))\,/<\/Year>\)$1 <Article_Title>$2<\/Article_Title>$3 $4$5 $6\,/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.] ([0-9\/]+|[0-9]+\([0-9\/]+\)) ([0-9]+)/) {
    $journal =~ s/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]) ([0-9\/]+|[0-9]+\([0-9\/]+\)) ([0-9]+)/<\/Year>\)$1 <Article_Title>$2<\/Article_Title>$3 $4$5 $6 $7/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.]* ([0-9\/]+|[0-9]+\([0-9]+\))\: ([0-9]+)/) {
    $journal =~ s/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]?) ([0-9\/]+|[0-9]+\([0-9]+\))\: ([0-9]+)/<\/Year>\)$1 <Article_Title>$2<\/Article_Title>$3 $4$5 $6\: $7/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.]* ([0-9\/]+|[0-9]+\([0-9]+\))\, ([0-9]+)/) {
    $journal =~ s/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\#\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]?) ([0-9\/]+|[0-9]+\([0-9]+\))\, ([0-9]+)/<\/Year>\)$1 <Article_Title>$2<\/Article_Title>$3 $4$5 $6\, $7/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.] (([D|d]oi|DOI):)/) {
    $journal =~ s/<\/Year>\)([\,\.]*) ([A-Za-z0-9\(\)\?\:\&\;\-\.\s]+)([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]) ((?:Doi|doi|DOI):)/<\/Year>\)$1 <Article_Title>$2<\/Article_Title>$3 $4$5 $6/;
  }
  print "$journal\n" if ($debug);
  # journal title conversion
  if ($journal =~ m/<\/Article_Title>&rdquo; <em>(.*?)<\/em>/) {
    $journal =~ s/<\/Article_Title>&rdquo; <em>(.*?)<\/em>/<\/Article_Title>&rdquo; <Journal_Title><em>$1<\/em><\/Journal_Title>/;
  } elsif ($journal =~ m/<\/Article_Title>&rdquo; ASCE\, <em>(.*?)<\/em>/) {
    $journal =~ s/<\/Article_Title>&rdquo; ASCE\, <em>(.*?)<\/em>/  &rdquo; ASCE\, <Journal_Title><em>$1<\/em><\/Journal_Title>/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.]*\s*([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,\s*([0-9]+)/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,(\s*[0-9]+)/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title>\,$3/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.]*\s*([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+)\, ([0-9]+)/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+)\, ([0-9]+)/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title> $3\, $4/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.]*\s*([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+)[\,\:] ([A-Z]?[0-9]+)\,/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+)([\,\:]) ([A-Z]?[0-9]+)\,/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title> $3$4 $5\,/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.]*\s*([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+\([0-9]+\))[\,\:]/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+) ([0-9]+\([0-9]+\))([\,\:])/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title> $3$4/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.]*\s*([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.]* ([0-9]+)[\,\:]/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.]*\s*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]*) ([0-9]+)([\,\:])/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title>$3 $4$5/;
  } elsif ($journal =~ m/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\:\&\;\-\.\s]+)&rdquo;([\,\.]*) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,/ && $journal=~ m/in press/i) {
    $journal =~ s/<\/Year>\)([\,\.]*) &ldquo;([A-Za-z0-9\(\)\#\:\&\;\-\.\s]+)&rdquo;([\,\.]*) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3 <Journal_Title>$4<\/Journal_Title>\,/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.\s]*([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.]? <Vol_No>/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.\s]*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]?) <Vol_No>/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title>$3 <Vol_No>/;
  } elsif ($journal =~ m/<\/Article_Title>\&rdquo\;[\,\.\s]*([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.\s]*)(doi:\s*[\S]+\.?)$/) {
    $journal =~ s/<\/Article_Title>\&rdquo\;([\,\.\s]*)([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]*) (doi:\s*[\S]+\.?)/<\/Article_Title>\&rdquo\;$1<Journal_Title>$2<\/Journal_Title>$3 $4/;
  } elsif ($journal =~ m/<\/Article_Title>[\,\.] ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (Vo?l?\. )?<Vol_No>/) {
    $journal =~ s/<\/Article_Title>([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, (Vo?l?\. )?<Vol_No>/<\/Article_Title>$1 <Journal_Title>$2<\/Journal_Title>\, $3<Vol_No>/;
  } elsif ($journal =~ m/<\/Article_Title>[\,\.] ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]) ((?:Doi|doi|DOI):\s*[\S]+\.?)$/) {
    $journal =~ s/<\/Article_Title>([\,\.]) ([A-Za-z\(\)\#\:\&\;\-\.\s]+)([\,\.]) ((?:Doi|doi|DOI):\s*[\S]+\.?)$/<\/Article_Title>$1 <Journal_Title>$2<\/Journal_Title>$3 $4/;
  } elsif ($journal =~ m/<\/Article_Title>[\,\.] ([A-Za-z\(\)\:\&\;\-\.\s]+)\, ([0-9\/]+|[0-9\/]+\([0-9\/]+\))\,/) {
    $journal =~ s/<\/Article_Title>([\,\.]) ([A-Za-z\(\)\:\&\;\-\.\s]+)\, ([0-9\/]+|[0-9\/]+\([0-9\/]+\))\,/<\/Article_Title>$1 <Journal_Title>$2<\/Journal_Title>\, $3,/;
  } elsif ($journal =~ m/<\/Article_Title>[\,\.] ([A-Za-z\(\)\:\&\;\-\.\s]+)[\,\.]? ([0-9\/]+|[0-9\/]+\([0-9\/]+\))\: ([0-9]+)/) {
    $journal =~ s/<\/Article_Title>([\,\.]) ([A-Za-z\(\)\:\&\;\-\.\s]+)([\,\.]?) ([0-9\/]+|[0-9\/]+\([0-9\/]+\))\: ([0-9]+)/<\/Article_Title>$1 <Journal_Title>$2<\/Journal_Title>$3 $4\: $5/;
  }
  print "$journal\n" if ($debug);

  $journal =~ s/&comma;/\,/;

  if ($journal =~ m/<Journal_Title><em>(.*?)<\/em><\/Journal_Title>\./) {
    my $jtext = $1;
    if ($jtext =~ m/\./) {
      $journal =~ s/<Journal_Title><em>(.*?)<\/em><\/Journal_Title>\./<Journal_Title><em>$1\.<\/em><\/Journal_Title>/;
    }
  }


  $journal = Authortag::AuGroupIdentification($journal);

  if ($journal !~ m/<Article_Title>/ && $journal !~ m/<Journal_Title>/) {
    $journal =~ s/&ldquo;(.+)(,|\.\?)&rdquo;/&ldquo;<Article_Title>$1<\/Article_Title>${2}&rdquo;/g;
    $journal =~ s/&rdquo; <em>(.*?)<\/em>/&rdquo; <Journal_Title><em>$1<\/em><\/Journal_Title>/;
    #$journal =~ s/^(.*?) &ldquo;/<Authorgroup>$1<\/Authorgroup> &ldquo;/ if($journal !~ m/<Authorgroup>/);
  }

  $journal =~ s/<\/Journal_Title>\.(\,| )/\.<\/Journal_Title>$1/;

  # volume issue conversion
  if ($journal =~ m/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong> ?\(((?:[A-Z])?[0-9]+|[0-9]+(?:&ndash;|\-|&minus;|&mdash;)[0-9]+)\)([\,\:])/) {
    $journal =~ s/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong> ?\(((?:[A-Z])?[0-9]+)\)([\,\:])/<\/Journal_Title>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>\(<Issue_No>$3<\/Issue_No>\)$4/;
    $journal =~ s/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong> ?\(([0-9]+)(&ndash;|\-|&minus;|&mdash;)([0-9]+)\)([\,\:])/<\/Journal_Title>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>\(<Issue_No>$3&ndash;$5<\/Issue_No>\)$6/;
  } elsif ($journal =~ m/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\: ])/) {
    $journal =~ s/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\: \(])/<\/Journal_Title>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>$3/;
  } elsif ($journal =~ m/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\:\(])/) {
    $journal =~ s/<\/Journal_Title>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\: \(])/<\/Journal_Title>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>$3/;
  }

  if ($journal =~ m/<\/Journal_Title>([\,\.]?\s*)([0-9\/]+)\(((?:[A-Z])?[0-9\/]+|[0-9]+(?:&ndash;|\-|&minus;|&mdash;)[0-9]+)\)([\,\:])/) {
    $journal =~ s/<\/Journal_Title>([\,\.]?\s*)([0-9\/]+)\(((?:[A-Z])?[0-9\/]+)\)([\,\:])/<\/Journal_Title>$1<Vol_No>$2<\/Vol_No>\(<Issue_No>$3<\/Issue_No>\)$4/;
    $journal =~ s/<\/Journal_Title>([\,\.]?\s*)([0-9\/]+)\(([0-9]+)(&ndash;|\-|&minus;|&mdash;)([0-9]+)\)([\,\:])/<\/Journal_Title>$1<Vol_No>$2<\/Vol_No>\(<Issue_No>$3&ndash;$5<\/Issue_No>\)$6/;
  } elsif ($journal =~ m/<\/Journal_Title>([\,\.]) ([0-9\/]+|[0-9]+(?:&ndash;|\-|&minus;|&mdash;)[0-9]+)([\,\:])/) {
    $journal =~ s/<\/Journal_Title>([\,\.]) ([0-9\/]+|[0-9]+(?:&ndash;|\-|&minus;|&mdash;)[0-9]+)([\,\:])/<\/Journal_Title>$1 <Vol_No>$2<\/Vol_No>$3/;
  } elsif ($journal =~ m/<\/Journal_Title>([\,\.]) Vol ([0-9]+)([\,\:])/) {
    $journal =~ s/<\/Journal_Title>([\,\.]) Vol ([0-9]+)([\,\:])/<\/Journal_Title>$1 Vol <Vol_No>$2<\/Vol_No>$3/;
  } elsif ($journal =~ m/<\/Journal_Title>[\.\,]? ([0-9]+)\, ([A-Z][0-9]+)\, doi:/) {
    $journal =~ s/<\/Journal_Title>([\.\,]?) ([0-9]+)\, ([A-Z]?[0-9]+)\, doi:/<\/Journal_Title>$1 <Vol_No>$2<\/Vol_No>\, <FirstPage>$3<\/FirstPage>\, doi:/;
  } elsif ($journal =~ m/<\/Journal_Title>[\.\,]? ([0-9]+)\, doi:/) {
    $journal =~ s/<\/Journal_Title>([\.\,]?) ([0-9]+)\, doi:/<\/Journal_Title>$1 <Vol_No>$2<\/Vol_No>\, doi:/;
  } elsif ($journal =~ m/<\/Journal_Title> ([0-9]+)\, ([A-Z]?[0-9]+)(?:&ndash;|\-|&minus;|&mdash;)([A-Z]?[0-9]+)\, (doi:)/i) {
    $journal =~ s/<\/Journal_Title> ([0-9]+)\, ([A-Z]?[0-9]+)(?:&ndash;|\-|&minus;|&mdash;)([A-Z]?[0-9]+)\, (doi:)/<\/Journal_Title> <Vol_No>$1<\/Vol_No>\, <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>\, $4/i;
  }
#print $journal,"\n";

  if ($journal =~ m/ ([0-9]+)(\s*)\([0-9]+[a-zA-Z]?\)(\,? )([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)(\.?)$/) {
    $journal =~ s/ ([0-9]+)(\s*)\(([0-9]+[a-zA-Z]?)\)(\,? )([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)(\.?)$/ <Vol_No>$1<\/Vol_No>$2\(<Issue_No>$3<\/Issue_No>\)$4<FirstPage>$5<\/FirstPage>&ndash;<LastPage>$7<\/LastPage>$8/;
  } elsif ($journal =~ m/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)(\.?)$/) {
    $journal =~ s/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)(\.?)$/ <Vol_No>$1<\/Vol_No>\:<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  } elsif ($journal =~ m/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)[, ]+\(/) {
    $journal =~ s/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)([, ]+\()/ <Vol_No>$1<\/Vol_No>\:<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  } elsif ($journal =~ m/(<\/Vol_No>|<\/Issue_No>\)?)\,? ([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)[, ]+\(/) {
    $journal =~ s/(<\/Vol_No>|<\/Issue_No>\)?)\,? ([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)([, ]+\()/${1}, <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  } elsif ($journal =~ m/ ([A-Z]?[0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([A-Z]?[0-9]+|XXX)[, ]+\(/) {
    $journal =~ s/ ([A-Z]?[0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([A-Z]?[0-9]+|XXX)([, ]+\()/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
  }
#  elsif ($journal =~ m/ (e?[A-Z]?[0-9]+|XXX)[, ]+\(/) {
#    $journal =~ s/ (e?[A-Z]?[0-9]+|XXX)([, ]+\()/ <FirstPage>$1<\/FirstPage>$2/;
#  }


  if ($journal =~ m/ ([0-9]+)(\:\s*)([0-9]+)(\.?)$/) {
    $journal =~ s/ ([0-9]+)(\:\s*)([0-9]+)(\.?)$/ <Vol_No>$1<\/Vol_No>$2<FirstPage>$3<\/FirstPage>/;
  }
    
  if ($journal =~ m/<\/Vol_No>(: ?)([0-9]+)\.$/) {
    $journal =~ s/<\/Vol_No>(: ?)([0-9]+)\.$/<\/Vol_No>$1<FirstPage>$2<\/FirstPage>\./;
  }
  if ($journal =~ m/<\/Vol_No>\, ([A-Z]?[0-9]+)\.$/) {
    $journal =~ s/<\/Vol_No>\, ([A-Z]?[0-9]+)\.$/<\/Vol_No>\, <FirstPage>$1<\/FirstPage>\./;
  }

  if ($journal =~ m/<\/Issue_No>\): ([0-9]+)\.$/) {
    $journal =~ s/<\/Issue_No>\): ([0-9]+)\.$/<\/Issue_No>\): <FirstPage>$1<\/FirstPage>\./;
  }
  
  if ($journal =~ m/<\/Issue_No>\)\, ([0-9]+) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+)\,/) {
    $journal =~ s/<\/Issue_No>\)\, ([0-9]+) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+)\,/<\/Issue_No>\)\, <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>\,/;
  }

  if ($journal =~ m/(\:| )([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)(\.?)$/) {
    $journal =~ s/(\:| )([0-9]+|XXX) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+|XXX)(\.?)$/$1<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  }
  
  if ($journal =~ m/<\/Journal_Title>\, [0-9]+(?:[A-Z])?\([0-9]+((\-|&minus;|&ndash;|&mdash;)[0-9]+)?\)\.$/) {
    $journal =~ s/<\/Journal_Title>\, ([0-9]+(?:[A-Z])?)\(([0-9]+((\-|&minus;|&ndash;|&mdash;)[0-9]+)?)\)\.$/<\/Journal_Title>\, <Vol_No>$1<\/Vol_No>\(<Issue_No>$2<\/Issue_No>\)\./;
  }

  if ($journal =~ m/<\/Vol_No>\, ([A-Z]?[0-9]+[A-Z]?[0-9]+)\, doi:/) {
    $journal =~ s/<\/Vol_No>\, ([A-Z]?[0-9]+[A-Z]?[0-9]+)\, doi:/<\/Vol_No>\, <FirstPage>$1<\/FirstPage>\, doi:/;
  }

  if ($journal =~ m/<\/Vol_No>\, ([0-9]+) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+) /) {
    $journal =~ s/<\/Vol_No>\, ([0-9]+) ?(-|&ndash;|&minus;|&mdash;) ?([0-9]+) /<\/Vol_No>, <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage> /;
  }

  if ($journal =~ m/&(\#60|lt|\#9001|\#706|lang)\;(<em>)?(http|www)(.*?)(<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/i) {
    $journal =~ s/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/\&lt\;<Website>$2$3<\/Website>\&gt\;/i;
  }
  
  $journal =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Authorgroup>/<\/Authorgroup>$1/i;
  $journal =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Collab>/<\/Collab>$1/i;
  
  if ($journal !~ m/<Article_Title>/) {
    if ($journal =~ m/<\/Year>\)\.? \&ldquo\;(.*?)\&rdquo\;/) {
      $journal =~ s/(<\/Year>\)\.? )\&ldquo\;(.*?)\&rdquo\;/$1\&ldquo\;<Article_Title>$2<\/Article_Title>\&rdquo\;/i;
    }
  }

  if ($journal =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/) {
    $journal =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; <em>/;
  }

  if ($journal =~ m/<\/Year>\)(\.?) <em>(.*?)<\/em>/) {
    $journal =~ s/<\/Year>\)(\.?) <em>(.*?)<\/em>/<\/Year>\)$1 <Journal_Title><em>$2<\/em><\/Journal_Title>/;
  }

  if($journal !~ m/<Website>/) {
    $journal = &Insertlink($journal);
  }

  if ($journal =~ m/<Article_Title>(.*?)<\/Article_Title>/) {
    my $articletitle = $1;
    if ($articletitle =~ m/\.$/) {
      my ($before, $match, $after) = ($`, $&, $');
      if ($before !~ m/\./) {
        $journal =~ s/\.<\/Article_Title>/<\/Article_Title>\./;
      }
    }
  }

  $journal =~ s/([\;\,])<\/Authorgroup>/<\/Authorgroup>$1/;
  $journal = partial_tagging($journal);

  if ($journal !~ m/<Vol_No>/) {
    if ($journal =~ m/ ([0-9]+)(\:\s*)<FirstPage>/) {
      $journal =~ s/ ([0-9]+)(\:\s*)<FirstPage>/ <Vol_No>$1<\/Vol_No>$2<FirstPage>/;
    } elsif ($journal =~ m/ ([0-9]+)\(<Issue_No>/) {
      $journal =~ s/ ([0-9]+)\(<Issue_No>/ <Vol_No>$1<\/Vol_No>\(<Issue_No>/;
    }
  }
  #print $journal,"\n\n";

  if ($journal !~ m/<Journal_Title>/) {
    if ($journal =~ m/<\/Article_Title>\.?\&rdquo\;\.?\,? ([A-Za-z\(\)\#\:\&\;\-\.\s\,]+)\,\.?? ([V|v]ol. )?<Vol_No>/) {
      $journal =~ s/<\/Article_Title>\&rdquo\;([\.\,]) ([A-Za-z\(\)\:\#\&\;\-\.\,\s]+)([\,\.]?) ([V|v]ol. )?<Vol_No>/<\/Article_Title>\&rdquo\;$1 <Journal_Title>$2<\/Journal_Title>$3 $4<Vol_No>/;
      $journal =~ s/ ([V|v]ol\.)<\/Journal_Title>/<\/Journal_Title> $1/;
      $journal =~ s/<\/Article_Title>\.\&rdquo\; ([A-Za-z\(\)\:\#\&\;\-\.\,\s]+)\, ([V|v]ol. )?<Vol_No>/<\/Article_Title>\.\&rdquo\; <Journal_Title>$1<\/Journal_Title>\, $2<Vol_No>/;
      $journal =~ s/<\/Article_Title>\.\&rdquo\; ([A-Za-z\(\)\:\#\&\;\-\.\,\s]+) ([V|v]ol. )?<Vol_No>/<\/Article_Title>\.\&rdquo\; <Journal_Title>$1<\/Journal_Title> $2<Vol_No>/;
      $journal =~ s/<\/Article_Title>\&rdquo\; ([A-Za-z\(\)\:\#\&\;\-\.\,\s]+)\, ([V|v]ol. )?<Vol_No>/<\/Article_Title>\&rdquo\; <Journal_Title>$1<\/Journal_Title>\, $2<Vol_No>/;
    }
    if ($journal =~ m/<\/Article_Title>\. ([A-Za-z\(\)\#\:\&\;\-\.\s]+)[\,\.]? <Vol_No>/) {
      $journal =~ s/<\/Article_Title>\. ([A-Za-z\(\)\:\#\&\;\-\.\s]+)([\,\.]) <Vol_No>/<\/Article_Title>\. <Journal_Title>$1<\/Journal_Title>$2 <Vol_No>/;
      $journal =~ s/<\/Article_Title>\. ([A-Za-z\(\)\:\#\&\;\-\.\s]+)([\,\.]?) <Vol_No>/<\/Article_Title>\. <Journal_Title>$1<\/Journal_Title>$2 <Vol_No>/;
    }
    if ($journal =~ m/<\/Article_Title>\&rdquo\;\.? ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\,? doi:/) {
      $journal =~ s/<\/Article_Title>\&rdquo\;\. ([A-Za-z\(\)\#\:\&\;\-\.\s]+)\, doi:/<\/Article_Title>\&rdquo\;\. <Journal_Title>$1<\/Journal_Title>\, doi:/;
      $journal =~ s/<\/Article_Title>\&rdquo\;\. ([A-Za-z\(\)\#\:\&\;\-\.\s]+) doi:/<\/Article_Title>\&rdquo\;\. <Journal_Title>$1<\/Journal_Title> doi:/;
    }
  }
  
  if ($journal =~ m/<Journal_Title>(.*?)<\/Journal_Title>/) {
    my $jtext = $1;
    my @matches = ($jtext =~ m/\./g);
    if (scalar(@matches) == 1) {
      $journal =~ s/<Journal_Title>(.*?)\.<\/Journal_Title>/<Journal_Title>$1<\/Journal_Title>\./;
    }
  }
  $journal =~ s/<\/Journal_Title>\.\,/\.<\/Journal_Title>\,/;
  
  return $journal;
}

sub book_conversion {
  my $book = shift;
  if ($book =~ m/ \(([0-9]{4}[a-z]?)\)/) {
    $book =~ s/ \(([0-9]{4}[a-z]?)\)/ \(<Year>$1<\/Year>\)/;
  }

  if ($book =~ m/ \(([0-9]{4}[a-z]?)(\, ([0-9]{4}[a-z]?))+\)/) {
    $book =~ s/ \((([0-9]{4}[a-z]?)(\, ([0-9]{4}[a-z]?))+)\)/ \(<Year>$1<\/Year>\)/;
  }
  $book = &Authortag::EdGroupIdentification($book);
  $book = Authortag::AuGroupIdentification($book);

  $book =~ s/([\;\,])<\/Authorgroup>/<\/Authorgroup>$1/;


  if ($book =~ m/<\/Year>\)\. <em>(.*?)<\/em>[\,\.]/) {
    $book =~ s/<\/Year>\)\. <em>(.*?)<\/em>([\,\.])/<\/Year>\)\. <Journal_Title><em>$1<\/em><\/Journal_Title>$2/;
  } elsif ($book =~ m/<\/Year>\)\. <em>(.*?)<\/em>\,?\.? ([A-Za-z\s]+): ([A-Za-z\s]+)([\.]?)$/) {
    $book =~ s/<\/Year>\)\. <em>(.*?)<\/em>([\,\.]?) ([A-Za-z\s]+): ([A-Za-z\s]+)([\.]?)$/<\/Year>\)\. <Journal_Title><em>$1<\/em><\/Journal_Title>$2 <PublisherName>$3<\/PublisherName>: <PublisherLocation>$4<\/PublisherLocation>$5/;
  } elsif ($book =~ m/<\/Journal_Title>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/) {
    $book =~ s/<\/Journal_Title>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/<\/Journal_Title>$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3, $4<\/PublisherLocation> (<Year>/i;
  } elsif ($book =~ m/<\/Journal_Title>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/) {
    $book =~ s/<\/Journal_Title>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/<\/Journal_Title>$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3<\/PublisherLocation> (<Year>/i;
  } elsif ($book =~ m/<\/Journal_Title>([,\.:])? ([A-Za-z\-\s]+),? \(<Year>/) {
    $book =~ s/<\/Journal_Title>([,\.:]) ([A-Za-z\-\s]+),? \(<Year>/<\/Journal_Title>$1 <PublisherName>$2<\/PublisherName>  (<Year>/i;
  }

  if ($book =~ m/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo;( in | |\, |\, chapter [0-9]+ in )<em>(.*?)<\/em>\,/) {
    $book =~ s/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo;( in | |\, |\, chapter [0-9]+ in )<em>(.*?)<\/em>\,/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3<Journal_Title><em>$4<\/em><\/Journal_Title>\,/;
  }

  if ($book =~ m/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo; Chapter ([0-9]+)\, <em>(.*?)<\/em>\,/) {
    $book =~ s/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo; Chapter ([0-9]+)\, <em>(.*?)<\/em>\,/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; Chapter $3\, <Journal_Title><em>$4<\/em><\/Journal_Title>\,/;
  }

  if ($book =~ m/<\/Journal_Title>\, [0-9]+(nd|rd|st|th) Ed.\,/) {
    $book =~ s/<\/Journal_Title>\, ([0-9]+)(nd|rd|st|th) Ed.\,/<\/Journal_Title>\, <Edition>$1$2 Ed.<\/Edition>\,/;
  }

  if ($book =~ m/<\/Journal_Title>\, Vol\. ([0-9]+)\,/) {
    $book =~ s/<\/Journal_Title>\, Vol\. ([0-9]+)\,/<\/Journal_Title>\, Vol\. <Vol_No>$1<\/Vol_No>\,/;
  }

  if ($book =~ m/ ed\.\, Vol\. ([0-9]+)\,/) {
    $book =~ s/ ed\.\, Vol\. ([0-9]+)\,/ ed\.\, Vol\. <Vol_No>$1<\/Vol_No>\,/;
  }

#  if ($book =~ m/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)\.?$/) {
#    $book =~ s/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)([\.]?)$/ $1\, <PublisherName>$2<\/PublisherName>$3/;
#  }

  if ($book =~ m/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $book =~ s/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/Vol_No>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>\, <FirstPage>$3<\/FirstPage>&ndash;<LastPage>$5<\/LastPage>$6/;
  }

  if ($book =~ m/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $book =~ s/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Vol_No>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>$3/;
  }

  if ($book =~ m/ (\(Eds\.?\)|eds\.|ed\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+|[A-z\.]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $book =~ s/ (\(Eds\.?\)|eds\.|ed\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+|[A-z\.]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/ $1\, <PublisherName>$2<\/PublisherName>\, <PublisherLocation>$3\, $4<\/PublisherLocation>\, <FirstPage>$5<\/FirstPage>&ndash;<LastPage>$7<\/LastPage>$8/;
  }

  if ($book =~ m/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $book =~ s/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/ $1\, <PublisherName>$2<\/PublisherName>\, <PublisherLocation>$3<\/PublisherLocation>\, <FirstPage>$4<\/FirstPage>&ndash;<LastPage>$6<\/LastPage>$7/;
  }

  if ($book =~ m/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/)     {
    $book =~ s/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Edition>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($book =~ m/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $book =~ s/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Edition>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>$3/;
  }

  if ($book =~ m/ ed. in chief\.([\,]?) ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $book =~ s/ ed. in chief\.([\,]?) ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/ ed. in chief\.$1 <PublisherName>$2<\/PublisherName>\, <PublisherLocation>$3<\/PublisherLocation>$4/;
  }

  if ($book =~ m/<\/Edition>\, (.*?)\, ed. in chief\./) {
    $book =~ s/<\/Edition>\, (.*?)\, ed. in chief\./<\/Edition>\, <Editorgroup>$1<\/Editorgroup>\, ed. in chief\./ if($book !~ m/<Editorgroup>/);
  }

  if ($book =~ m/<\/Journal_Title>\, (.*?)[\,\;] (ed|eds)\.\,/) {
    $book =~ s/<\/Journal_Title>\, (.*?)([\,\;]) (ed|eds)\.\,/<\/Journal_Title>\, <Editorgroup>$1<\/Editorgroup>$2 $3\.\,/ if($book !~ m/<Editorgroup>/);
  }

  if ($book =~ m/<\/Journal_Title>\, ([A-z\s\-\,\.]+) (\(Eds?\.?\))\,/) {
    $book =~ s/<\/Journal_Title>\, ([A-z\s\-\,\.]+) (\(Eds?\.?\))\,/<\/Journal_Title>\, <Editorgroup>$1<\/Editorgroup> $2\,/ if($book !~ m/<Editorgroup>/);
  } elsif ($book =~ m/<\/Journal_Title>\, ([A-Za-z\s\-\,\.]+)\, (Eds?\.?)\,/)
  {
    $book =~ s/<\/Journal_Title>\, ([A-Za-z\s\-\,\.]+)\, (Eds?\.?)\,/<\/Journal_Title>\, <Editorgroup>$1<\/Editorgroup> $2\,/ if($book !~ m/<Editorgroup>/);
  }
  

  if ($book =~ m/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, U.?K.?$/) {
    $book =~ s/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, (U.K.|UK)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($book =~ m/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $book =~ s/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($book =~ m/<\/em>\, ([A-z\s\-]+): ([A-z\s\-]+)([\.])/) {
    $book =~ s/<\/em>\, ([A-z\s\-]+): ([A-z\s\-]+)([\.])/<\/em>\, <PublisherLocation>$1<\/PublisherLocation>: <PublisherName>$2<\/PublisherName>$3/;
  }
  
  if ($book =~ m/<\/em>\, ([A-z\s\-]+): ([A-z\s\-]+)([\.])/) {
    $book =~ s/<\/em>\, ([A-z\s\-]+): ([A-z\s\-]+)([\.])/<\/em>\, <PublisherLocation>$1<\/PublisherLocation>: <PublisherName>$2<\/PublisherName>$3/;
  }

  if ($book =~ m/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $book =~ s/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>\, <FirstPage>$3<\/FirstPage>&ndash;<LastPage>$5<\/LastPage>$6/;
  }

  if ($book =~ m/ ([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)\.$/) {
    $book =~ s/ ([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)\.$/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>\./;
  }

  if ($book =~ m/ ([0-9\.]+) pp([\.]?)$/) {
    $book =~ s/ ([0-9\.]+) pp([\.]?)$/ <FirstPage>$1<\/FirstPage> pp$2/;
  }

  if ($book =~ m/ ([0-9]+)\.$/) {
    $book =~ s/ ([0-9\.]+)\.$/ <FirstPage>$1<\/FirstPage>\./;
  }
# Partial country identification
  if ($book =~ m/[\,\:\.] ((?:The )?[A-Z][a-z]+)\.$/) {
    my $country = $1;
    if(exists $Countrycode{$country}) {
        $book =~ s/([\,:\.]) $country\.$/$1 <PublisherLocation>$country<\/PublisherLocation>\./;
      }
  }
  
#  if ($book =~ m/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/) {
#    $book =~ s/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3, $4<\/PublisherLocation> (<Year>/i;
#  } elsif ($book =~ m/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/) {
#    $book =~ s/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3<\/PublisherLocation> (<Year>/i;
#  } elsif ($book =~ m/([,\.:])? ([A-Za-z\-\s]+),? \(<Year>/) {
#    $book =~ s/([,\.:]) ([A-Za-z\-\s]+),? \(<Year>/$1 <PublisherName>$2<\/PublisherName>  (<Year>/i;
#  }
  

  if ($book =~ m/\, ([A-z\s\-]+)[\,\:\.] <PublisherLocation>/ && $book !~ m/<PublisherName>/) {
    $book =~ s/\, ([A-z\s\-]+)([\,\:\.]) <PublisherLocation>/\, <PublisherName>$1<\/PublisherName>$2 <PublisherLocation>/;
  }
  
  if ($book !~ m/<PublisherName>/) {
    if ($book =~ m/\, ([A-z\s\-]+)[\,\:\.] <PublisherLocation>/) {
      my $publishname = $1;
      if(exists $publishersList{$publishname}) {
          $book =~ s/\, $publishname([\,\:\.] )<PublisherLocation>/\, <PublisherName>$publishname<\/PublisherName>$1<PublisherLocation>/;
        }
    }
  }
  
  $book = Reftagging::partial_tagging($book);
  $book = &Reftagging::restrict_book_conversion($book);
  $book = &publisherloc_tagging($book);
  $book = &publishername_tagging($book);

  if ($book =~ m/<\/Year>\)\. ([A-z\:\-\s]+)[\.\,] (<PublisherName>|<PublisherLocation>)/) {
    $book =~ s/<\/Year>\)\. ([A-z\:\-\s]+)([\.\,]) (<PublisherName>|<PublisherLocation>)/<\/Year>\)\. <Journal_Title>$1<\/Journal_Title>$2 $3/;
  }

  if ($book =~ m/<\/Year>\)\. ([A-z\:\-\s]+) \(<Edition>/) {
    $book =~ s/<\/Year>\)\. ([A-z\:\-\s]+) \(<Edition>/<\/Year>\)\. <Journal_Title>$1<\/Journal_Title> \(<Edition>/;
  }

  if ($book !~ m/<Vol_No>/) {
    if ($book =~ m/\, Vol\. ([0-9]+)\,/) {
      $book =~ s/\, Vol\. ([0-9]+)\,/\, Vol\. <Vol_No>$1<\/Vol_No>\,/;
    }
  }

  if ($book =~ m/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/i) {
    $book =~ s/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/\&lt\;<Website>$2$3<\/Website>\&gt\;/i;
  }

#Inserting Chapter title..    
  $book =~ s/<Article_Title>(.*?)<\/Article_Title>/<chapter-title>$1<\/chapter-title>/;
  return $book;
}

sub conference_conversion {
  my $conference = shift;
  if ($conference =~ m/ \(([0-9]{4}[a-z]?)\)/) {
    $conference =~ s/ \(([0-9]{4}[a-z]?)\)/ \(<Year>$1<\/Year>\)/;
  }
  $conference = &Authortag::EdGroupIdentification($conference);
  $conference = Authortag::AuGroupIdentification($conference);
  if ($conference =~ m/<\/Year>\)\. <em>(.*?)<\/em>[\,\.]/ || $conference =~ m/<\/Year>\)\.? (&ldquo;|<em>)/) {
#    if($conference !~ m/<Authorgroup>/ && $conference !~ m/^<Editorgroup>/) {
#      if ($conference =~ m/<\/Year>\)/) {
#        $conference =~ s/^(.*?) \(<Year>/<Authorgroup>$1<\/Authorgroup> \(<Year>/;
#      } elsif ($conference =~ m/<\/Year>.*?<Article_Title>/) {
#        $conference =~ s/^(.*?) <Year>/<Authorgroup>$1<\/Authorgroup> <Year>/;
#      }
#    }
  } else {
    $conference =~ s/&ldquo;(.+),&rdquo;/&ldquo;<Article_Title>$1<\/Article_Title>,&rdquo;/;
    $conference =~ s/(&rdquo;|in\:?|,) <em>(.*?)<\/em>/$1 <Journal_Title><em>$2<\/em><\/Journal_Title>/i;
#    if ($conference !~ m/<Authorgroup>/ && $conference !~ m/^<Editorgroup>/) {
#    $conference =~ s/^(.*?) &ldquo;/<Authorgroup>$1<\/Authorgroup> &ldquo;/;
#      $conference =~ s/^(.*?) <Journal_Title>/<Authorgroup>$1<\/Authorgroup> <Journal_Title>/ if($conference !~ m/<Authorgroup>/ && $conference !~ m/<Editorgroup>/);
#    }
  }

  if ($conference =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/) {
    $conference =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; <em>/;
  }
  if ($conference =~ m/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo; (Proceedings?)/) {
    $conference =~ s/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo; (Proceedings?)/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; $3/;
  }
  if ($conference =~ m/<\/Article_Title>&rdquo; <em>(.*?)<\/em>/) {
    $conference =~ s/<\/Article_Title>&rdquo; <em>(.*?)<\/em>/<\/Article_Title>&rdquo; <ConferenceName><em>$1<\/em><\/ConferenceName>/;
  }
  if ($conference =~ m/<\/Article_Title>&rdquo; (Proceedings? of) ([A-Za-z0-9\&\;\#\?\s]+)\,/) {
    $conference =~ s/<\/Article_Title>&rdquo; (Proceedings? of) ([A-Za-z0-9\&\;\#\?\s]+)\,/<\/Article_Title>&rdquo; <ConferenceName>$1 $2<\/ConferenceName>\,/;
  }

  $conference =~ s/<\/ConferenceName>\.\,/\.<\/ConferenceName>\,/;

  if ($conference =~ m/\, $months([\.]?)$/) {
    $conference =~ s/\, $months([\.]?)$/\, <ConferenceDate>$1<\/ConferenceDate>$2/i;
  }

  if ($conference =~ m/<\/ConferenceName>[\,\.] Washington\, D\.?C\.?\, USA([\.]?)$/) {
    $conference =~ s/<\/ConferenceName>([\,\.]) (Washington\, D\.?C\.?\, USA)([\.]?)$/<\/ConferenceName>$1 <ConferenceLocation>$2<\/ConferenceLocation>$3/;
  }

  if ($conference =~ m/<\/ConferenceName>\, ([A-z\s\-\,]+)\, <ConferenceDate>/) {
    $conference =~ s/<\/ConferenceName>\, ([A-z\s\-\,]+)\, <ConferenceDate>/<\/ConferenceName>\, <ConferenceLocation>$1<\/ConferenceLocation>\, <ConferenceDate>/;
  }
      
  if ($conference =~ m/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $conference =~ s/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/ConferenceName>\, <ConferenceLocation>$1\, $2<\/ConferenceLocation>\, <FirstPage>$3<\/FirstPage>&ndash;<LastPage>$5<\/LastPage>$6/;
  } elsif ($conference =~ m/ ([A-Z]?[0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([A-Z]?[0-9]+|XXX)[, ]+\(/) {
    $conference =~ s/ ([A-Z]?[0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([A-Z]?[0-9]+|XXX)([, ]+\()/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
  }

  if ($conference =~ m/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $conference =~ s/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/ConferenceName>\, <ConferenceLocation>$1\, $2<\/ConferenceLocation>\, <FirstPage>$3<\/FirstPage>&ndash;<LastPage>$5<\/LastPage>$6/;
  }

  if ($conference =~ m/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $conference =~ s/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/ConferenceName>\, <ConferenceLocation>$1\, $2\, $3<\/ConferenceLocation>\, <FirstPage>$4<\/FirstPage>&ndash;<LastPage>$6<\/LastPage>$7/;
  }

  if ($conference =~ m/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\-]+)([\.]?)$/) {
    $conference =~ s/<\/ConferenceName>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\-]+)([\.]?)$/<\/ConferenceName>\, <ConferenceLocation>$1\, $2\, $3<\/ConferenceLocation>$4/;
  }


  $conference =~ s/<\/ConferenceName>\.(\,| )/\.<\/ConferenceName>$1/;
  
  if ($conference =~ m/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong> ?\(((?:[A-Z])?[0-9]+|[0-9]+(?:&ndash;|\-|&minus;|&mdash;)[0-9]+)\)([\,\:])/) {
    $conference =~ s/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong> ?\(((?:[A-Z])?[0-9]+)\)([\,\:])/<\/ConferenceName>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>\(<Issue_No>$3<\/Issue_No>\)$4/;
    $conference =~ s/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong> ?\(([0-9]+)(&ndash;|\-|&minus;|&mdash;)([0-9]+)\)([\,\:])/<\/ConferenceName>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>\(<Issue_No>$3&ndash;$5<\/Issue_No>\)$6/;
  } elsif ($conference =~ m/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\: ])/) {
    $conference =~ s/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\: \(])/<\/ConferenceName>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>$3/;
  } elsif ($conference =~ m/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\:\(])/) {
    $conference =~ s/<\/ConferenceName>([\,\.]?) <strong>([0-9]+)<\/strong>([\,\: \(])/<\/ConferenceName>$1 <Vol_No><strong>$2<\/strong><\/Vol_No>$3/;
  }
        
  if ($conference =~ m/<\/ConferenceName>([\,\.]?) ([0-9]+)\(((?:[A-Z])?[0-9]+|[0-9]+(?:&ndash;|\-|&minus;|&mdash;)[0-9]+)\)([\,\:])/) {
    $conference =~ s/<\/ConferenceName>([\,\.]?) ([0-9]+)\(((?:[A-Z])?[0-9]+)\)([\,\:])/<\/ConferenceName>$1 <Vol_No>$2<\/Vol_No>\(<Issue_No>$3<\/Issue_No>\)$4/;
    $conference =~ s/<\/ConferenceName>([\,\.]?) ([0-9]+)\(([0-9]+)(&ndash;|\-|&minus;|&mdash;)([0-9]+)\)([\,\:])/<\/ConferenceName>$1 <Vol_No>$2<\/Vol_No>\(<Issue_No>$3&ndash;$5<\/Issue_No>\)$6/;
  } elsif ($conference =~ m/<\/ConferenceName>([\,\.]) ([0-9]+)([\,\:])/) {
    $conference =~ s/<\/ConferenceName>([\,\.]) ([0-9]+)([\,\:])/<\/ConferenceName>$1 <Vol_No>$2<\/Vol_No>$3/;
  } elsif ($conference =~ m/<\/ConferenceName>([\,\.]) Vol ([0-9]+)([\,\:])/) {
    $conference =~ s/<\/ConferenceName>([\,\.]) Vol ([0-9]+)([\,\:])/<\/ConferenceName>$1 Vol <Vol_No>$2<\/Vol_No>$3/;
  }

  if ($conference =~ m/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)(\.?)$/) {
    $conference =~ s/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)(\.?)$/ <Vol_No>$1<\/Vol_No>\:<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  } elsif ($conference =~ m/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)[, ]+\(/) {
    $conference =~ s/ ([0-9]+)\:([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)([, ]+\()/ <Vol_No>$1<\/Vol_No>\:<FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  } elsif ($conference =~ m/(<\/Vol_No>|<\/Issue_No>\)?)\,? ([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)[, ]+\(/) {
    $conference =~ s/(<\/Vol_No>|<\/Issue_No>\)?)\,? ([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)([, ]+\()/${1}, <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage>$5/;
  } elsif ($conference =~ m/ ([A-Z]?[0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([A-Z]?[0-9]+|XXX)[, ]+\(/) {
    $conference =~ s/ ([A-Z]?[0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([A-Z]?[0-9]+|XXX)([, ]+\()/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
  }
  
  if ($conference =~ m/ ([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)\.$/) {
    $conference =~ s/ ([0-9]+|XXX) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+|XXX)\.$/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>\./;
  }

  if ($conference =~ m/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/i) {
    $conference =~ s/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/\&lt\;<Website>$2$3<\/Website>\&gt\;/i;
  }
  
  $conference =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Authorgroup>/<\/Authorgroup>$1/i;
  $conference =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Collab>/<\/Collab>$1/i;

  $conference =~ s/([\;\,])<\/Authorgroup>/<\/Authorgroup>$1/;
  $conference = Reftagging::partial_tagging($conference);
  #$conference = &Reftagging::restrict_book_conversion($conference);
  $conference = &publisherloc_tagging($conference);
  $conference = &publishername_tagging($conference);

  if ($conference !~ m/<ConferenceName>/) {
    if ($conference =~ m/<\/Article_Title>&rdquo;\.? ([A-Za-z0-9\(\)\&\;\#\.\/\?\s]+)\,/) {
      my $confNameText = $1;
      if ($confNameText =~ m/(International Technical Meeting|Proceeding of|International Symposium of|Congress|International Symposium on)/i) {
        $conference =~ s/<\/Article_Title>&rdquo;\. ([A-Za-z0-9\(\)\&\;\#\.\/\?\s]+)\,/<\/Article_Title>&rdquo;\. <ConferenceName>$1<\/ConferenceName>\,/i;
      }
    }
  }
  return $conference;
}

sub thesis_conversion {
  my $thesis = shift;
  if ($thesis =~ m/ \(([0-9]{4}[a-z]?)\)/) {
    $thesis =~ s/ \(([0-9]{4}[a-z]?)\)/ \(<Year>$1<\/Year>\)/;
  }

  if ($thesis =~ m/ \(([0-9]{4}[a-z]?)(\, ([0-9]{4}[a-z]?))+\)/) {
    $thesis =~ s/ \((([0-9]{4}[a-z]?)(\, ([0-9]{4}[a-z]?))+)\)/ \(<Year>$1<\/Year>\)/;
  }
  $thesis = Authortag::AuGroupIdentification($thesis);
  # SPIE style
  if ($thesis =~ m/<\/Year>\)\. <em>(.*?)<\/em>[\,\.]/ || $thesis =~ m/<\/Year>\)\.? (&ldquo;|<em>)/) {
#    if ($thesis =~ m/<\/Year>\)/) {
#      $thesis =~ s/^(.*?) \(<Year>/<Authorgroup>$1<\/Authorgroup> \(<Year>/ if($thesis !~ m/<Authorgroup>/);
#    } elsif ($thesis =~ m/<\/Year>.*?<Article_Title>/) {
#      $thesis =~ s/^(.*?) <Year>/<Authorgroup>$1<\/Authorgroup> <Year>/ if($thesis !~ m/<Authorgroup>/);
#    }
  }
  else
  {
    $thesis =~ s/&ldquo;(.+),&rdquo;/&ldquo;<Article_Title>$1<\/Article_Title>,&rdquo;/;
    #$thesis =~ s/(&rdquo;|in\:?|,) <em>(.*?( Thesis | deg[er]*\.? ).*?)<\/em>/$1 <institution><em>$2<\/em><\/institution>/i;
#    $thesis =~ s/^(.*?) &ldquo;/<Authorgroup>$1<\/Authorgroup> &ldquo;/;
#    if ($thesis !~ m/<Authorgroup>/) {
#      $thesis =~ s/^(.*?) <Journal_Title>/<Authorgroup>$1<\/Authorgroup> <Journal_Title>/;
#    }
  }
  
  $thesis =~ s/([\;\,])<\/Authorgroup>/<\/Authorgroup>$1/;

  if ($thesis =~ m/<\/Year>\)\. <em>(.*?)<\/em>[\,\.]/) {
    $thesis =~ s/<\/Year>\)\. <em>(.*?)<\/em>([\,\.])/<\/Year>\)\. <Journal_Title><em>$1<\/em><\/Journal_Title>$2/;
  } elsif ($thesis =~ m/<\/Year>\)\. <em>(.*?)<\/em>\,?\.? ([A-Za-z\s]+): ([A-Za-z\s]+)([\.]?)$/) {
    $thesis =~ s/<\/Year>\)\. <em>(.*?)<\/em>([\,\.]?) ([A-Za-z\s]+): ([A-Za-z\s]+)([\.]?)$/<\/Year>\)\. <Journal_Title><em>$1<\/em><\/Journal_Title>$2 <PublisherName>$3<\/PublisherName>: <PublisherLocation>$4<\/PublisherLocation>$5/;
  } elsif ($thesis =~ m/<\/em>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? /) {
    $thesis =~ s/<\/em>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), /<\/Journal_Title>$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3, $4<\/PublisherLocation>, /i;
  } elsif ($thesis =~ m/<\/em>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), /) {
    $thesis =~ s/<\/em>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), /<\/em>$1 <institution>$2<\/institution>, $3, /i;
  } elsif ($thesis =~ m/<\/em>([,\.:])? ([A-Za-z\-\s]+),? /) {
    $thesis =~ s/<\/em>([,\.:]) ([A-Za-z\-\s]+),? /<\/em>$1 <institution>$2<\/institution>, /i;
  }

  if ($thesis =~ m/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo;( in | |\, |\, chapter [0-9]+ in )<em>(.*?)<\/em>\,/) {
    $thesis =~ s/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo;( in | |\, |\, chapter [0-9]+ in )<em>(.*?)<\/em>\,/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo;$3<Journal_Title><em>$4<\/em><\/Journal_Title>\,/;
  }

  if ($thesis =~ m/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo; Chapter ([0-9]+)\, <em>(.*?)<\/em>\,/) {
    $thesis =~ s/<\/Year>\)([\.]?) &ldquo;(.*?)&rdquo; Chapter ([0-9]+)\, <em>(.*?)<\/em>\,/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; Chapter $3\, <Journal_Title><em>$4<\/em><\/Journal_Title>\,/;
  }

  if ($thesis =~ m/<\/Journal_Title>\, [0-9]+(nd|rd|st|th) Ed.\,/) {
    $thesis =~ s/<\/Journal_Title>\, ([0-9]+)(nd|rd|st|th) Ed.\,/<\/Journal_Title>\, <Edition>$1$2 Ed.<\/Edition>\,/;
  }

  if ($thesis =~ m/<\/Journal_Title>\, Vol\. ([0-9]+)\,/) {
    $thesis =~ s/<\/Journal_Title>\, Vol\. ([0-9]+)\,/<\/Journal_Title>\, Vol\. <Vol_No>$1<\/Vol_No>\,/;
  }

  if ($thesis =~ m/ ed\.\, Vol\. ([0-9]+)\,/) {
    $thesis =~ s/ ed\.\, Vol\. ([0-9]+)\,/ ed\.\, Vol\. <Vol_No>$1<\/Vol_No>\,/;
  }

  if ($thesis =~ m/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)\.?$/) {
    $thesis =~ s/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)([\.]?)$/ $1\, <PublisherName>$2<\/PublisherName>$3/;
  }

  if ($thesis =~ m/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $thesis =~ s/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/Vol_No>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>\, <FirstPage>$3<\/FirstPage>&ndash;<LastPage>$5<\/LastPage>$6/;
  }

  if ($thesis =~ m/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $thesis =~ s/<\/Vol_No>\, ([A-z\s\&\;\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Vol_No>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>$3/;
  }
   
  if ($thesis =~ m/ (\(Eds\.?\)|eds\.|ed\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+|[A-z\.]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $thesis =~ s/ (\(Eds\.?\)|eds\.|ed\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-Z]+|[A-z\.]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/ $1\, <PublisherName>$2<\/PublisherName>\, <PublisherLocation>$3\, $4<\/PublisherLocation>\, <FirstPage>$5<\/FirstPage>&ndash;<LastPage>$7<\/LastPage>$8/;
  }

  if ($thesis =~ m/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $thesis =~ s/ (\(Eds\.?\)|eds\.)\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/ $1\, <PublisherName>$2<\/PublisherName>\, <PublisherLocation>$3<\/PublisherLocation>\, <FirstPage>$4<\/FirstPage>&ndash;<LastPage>$6<\/LastPage>$7/;
  }

  if ($thesis =~ m/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/)     {
    $thesis =~ s/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Edition>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($thesis =~ m/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $thesis =~ s/<\/Edition>\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Edition>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>$3/;
  }

  if ($thesis =~ m/ ed. in chief\.([\,]?) ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $thesis =~ s/ ed. in chief\.([\,]?) ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/ ed. in chief\.$1 <PublisherName>$2<\/PublisherName>\, <PublisherLocation>$3<\/PublisherLocation>$4/;
  }

  if ($thesis =~ m/<\/Edition>\, (.*?)\, ed. in chief\./) {
    $thesis =~ s/<\/Edition>\, (.*?)\, ed. in chief\./<\/Edition>\, <Editorgroup>$1<\/Editorgroup>\, ed. in chief\./ if($thesis !~ m/<Editorgroup>/);
  }

  if ($thesis =~ m/<\/Journal_Title>\, (.*?)[\,\;] (ed|eds)\.\,/) {
    $thesis =~ s/<\/Journal_Title>\, (.*?)([\,\;]) (ed|eds)\.\,/<\/Journal_Title>\, <Editorgroup>$1<\/Editorgroup>$2 $3\.\,/ if($thesis !~ m/<Editorgroup>/);
  }

  if ($thesis =~ m/<\/Journal_Title>\, ([A-z\s\-\,\.]+) (\(Eds?\.?\))\,/) {
    $thesis =~ s/<\/Journal_Title>\, ([A-z\s\-\,\.]+) (\(Eds?\.?\))\,/<\/Journal_Title>\, <Editorgroup>$1<\/Editorgroup> $2\,/ if($thesis !~ m/<Editorgroup>/);
  } elsif ($thesis =~ m/<\/Journal_Title>\, ([A-Za-z\s\-\,\.]+)\, (Eds?\.?)\,/)
  {
    $thesis =~ s/<\/Journal_Title>\, ([A-Za-z\s\-\,\.]+)\, (Eds?\.?)\,/<\/Journal_Title>\, <Editorgroup>$1<\/Editorgroup> $2\,/ if($thesis !~ m/<Editorgroup>/);
  }
  

  if ($thesis =~ m/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, U.?K.?$/) {
    $thesis =~ s/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, (U.K.|UK)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($thesis =~ m/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $thesis =~ s/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([A-z\s\-]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($thesis =~ m/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
    $thesis =~ s/<\/Journal_Title>\, ([A-z\s\-]+)\, ([A-z\s\-]+)\, ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>\, <FirstPage>$3<\/FirstPage>&ndash;<LastPage>$5<\/LastPage>$6/;
  }
  

  if ($thesis =~ m/[\,\:\.] (Washington\, D\.?C\.?|London\, UK|New York|London)([\.]?)$/) {
    $thesis =~ s/([\,:\.]) (Washington\, D\.?C\.?|London\, UK|New York|London)([\.]?)$/$1 <PublisherLocation>$2<\/PublisherLocation>$3/;
  }

  if ($thesis =~ m/ ([0-9\.]+) pp([\.]?)$/) {
    $thesis =~ s/ ([0-9\.]+) pp([\.]?)$/ <FirstPage>$1<\/FirstPage> pp$2/;
  }

  if ($thesis =~ m/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/) {
    $thesis =~ s/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3, $4<\/PublisherLocation> (<Year>/i;
  } elsif ($thesis =~ m/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/) {
    $thesis =~ s/([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+),? \(<Year>/$1 <PublisherName>$2<\/PublisherName>, <PublisherLocation>$3<\/PublisherLocation> (<Year>/i;
  } elsif ($thesis =~ m/([,\.:])? ([A-Za-z\-\s]+),? \(<Year>/) {
    $thesis =~ s/([,\.:]) ([A-Za-z\-\s]+),? \(<Year>/$1 <PublisherName>$2<\/PublisherName>  (<Year>/i;
  }

  if ($thesis !~ m/<institution>/) {
    if ($thesis =~ m/(PhD-Thesis|M\.S\. Thesis|Ph\.D\. Dissertation|Ph\.D\.? Thesis)\, ([A-Za-z\-\s]+)\,/i) {
      my $inst = $2;
      if ($inst =~ m/(University|Institute|Institution|School)/i) {
        $thesis =~ s/(PhD-Thesis|M\.S\. Thesis|Ph\.D\. Dissertation|Ph\.D\.? Thesis)\, ([A-Za-z\-\s]+)\,/$1\, <institution>$2<\/institution>\,/i;
      }
    }
    if ($thesis =~ m/<\/institution>\, ([A-Za-z\-\s]+)\,/) {
      my $inst = $1;
      if ($inst =~ m/(University of|Institute of|Department of)/i) {
        $thesis =~ s/<\/institution>\, ([A-Za-z\-\s]+)\,/\, $1<\/institution>\,/i;
      }
    }
  }
  
  if ($thesis !~ m/<Article_Title>/) {
    if ($thesis =~ m/<\/Year>\)\.? \&ldquo\;(.*?)\&rdquo\;/) {
      $thesis =~ s/(<\/Year>\)\.? )\&ldquo\;(.*?)\&rdquo\;/$1\&ldquo\;<Article_Title>$2<\/Article_Title>\&rdquo\;/i;
    }
  }

  $thesis =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Authorgroup>/<\/Authorgroup>$1/i;
  $thesis =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Collab>/<\/Collab>$1/i;
  
  $thesis = Reftagging::partial_tagging($thesis);
  return $thesis;
}

sub report_conversion {
  my $report = shift;
  if ($report =~ m/ \(([0-9]{4}[a-z]?)\)/) {
    $report =~ s/ \(([0-9]{4}[a-z]?)\)/ \(<Year>$1<\/Year>\)/;
  }
  
  $report = Authortag::AuGroupIdentification($report);
  if ($report !~ m/<\/Year>\)[.,]? &ldquo;/ && $report =~ m/<\/Year>\)\.?$/) {
    $report =~ s/&ldquo;(.+)(,|\.\?)&rdquo;/&ldquo;<Article_Title>$1<\/Article_Title>${2}&rdquo;/g;
    #$report =~ s/&rdquo; <em>(.*?)<\/em>/&rdquo; <Journal_Title><em>$1<\/em><\/Journal_Title>/;
    #$report =~ s/^(.*?) (&ldquo;|<em>)/<Authorgroup>$1<\/Authorgroup> $2/ if($report !~ m/<Authorgroup>/);
    
    $report =~ s/<\/em>([,\.:]) ([A-Za-z\-\s]+), ([A-Za-z\-\s]+), /<\/em>$1 <institution>$2<\/institution>, $3, /i;
    $report =~ s/<\/em>([,\.:]) ([A-Za-z\-\s]+),? /<\/em>$1 <institution>$2<\/institution>, /i;
  } else {
    #$report =~ s/^(.*?) \(<Year>/<Authorgroup>$1<\/Authorgroup> \(<Year>/ if($report !~ m/<Authorgroup>/);
  }

  if ($report =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/) {
    $report =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; <em>/;
  }

  if ($report =~ m/<\/Article_Title>&rdquo; <em>(.*?)<\/em>/) {
    $report =~ s/<\/Article_Title>&rdquo; <em>(.*?)<\/em>/<\/Article_Title>&rdquo; <Journal_Title><em>$1<\/em><\/Journal_Title>/;
  }

  if ($report =~ m/<\/Journal_Title>\, ([A-z\s\-]+)([\.]?)$/) {
    $report =~ s/<\/Journal_Title>\, ([A-z\s\-]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>$2/;
  }
  
  if ($report =~ m/<\/Journal_Title>\, ([A-z\s\-\.]+)\, ([A-z\s\-]+)([\.]?)$/) {
    $report =~ s/<\/Journal_Title>\, ([A-z\s\-\.]+)\, ([A-z\s\-]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2<\/PublisherLocation>$3/;
  }

  if ($report =~ m/<\/Journal_Title>\, ([A-z\s\-\.]+)\, ([A-z\s\-]+)\, ([A-Z]+)([\.]?)$/) {
    $report =~ s/<\/Journal_Title>\, ([A-z\s\-\.]+)\, ([A-z\s\-]+)\, ([A-Z]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1<\/PublisherName>\, <PublisherLocation>$2\, $3<\/PublisherLocation>$4/;
  }

  if ($report =~ m/<\/Journal_Title>\, ([A-z\s\-\.]+)\, ([A-z\s\-\.]+)\, ([A-z\s\-]+)\, ([A-Z]+)([\.]?)$/) {
    $report =~ s/<\/Journal_Title>\, ([A-z\s\-\.]+)\, ([A-z\s\-\.]+)\, ([A-z\s\-]+)\, ([A-Z]+)([\.]?)$/<\/Journal_Title>\, <PublisherName>$1\, $2<\/PublisherName>\, <PublisherLocation>$3\, $4<\/PublisherLocation>$5/;
  }

  $report =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Authorgroup>/<\/Authorgroup>$1/i;
  $report =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Collab>/<\/Collab>$1/i;

# Partial country identification
  if ($report =~ m/[\,\:\.] ((?:The )?[A-Z][a-z]+)\.$/) {
    my $country = $1;
    if(exists $Countrycode{$country}) {
        $report =~ s/([\,:\.]) $country\.$/$1 <PublisherLocation>$country<\/PublisherLocation>\./;
      }
  }

  $report = Reftagging::partial_tagging($report);

  return $report;
}

sub other_conversion {
  my $references = shift;
     #print $references,"\n\n";

    if ($references =~ m/ \(([0-9]{4}[a-z]?)\)/) {
      $references =~ s/ \(([0-9]{4}[a-z]?)\)/ \(<Year>$1<\/Year>\)/;
    } elsif($references =~ m/ ((?:19|20)[0-9]{2}[a-z]?)[\.\,]? &ldquo;/) {
      $references =~ s/ ((?:19|20)[0-9]{2}[a-z]?)([\.\,]? &ldquo;)/ <Year>$1<\/Year>$2/;
    }
   	
   	$references = &Authortag::EdGroupIdentification($references);
    $references = Authortag::AuGroupIdentification($references);
    if ($references !~ m/<\/Year>\)[.,]? &ldquo;/ && $references =~ m/<\/Year>\)\.?$/) {
      $references =~ s/&ldquo;(.+)(,|\.\?)&rdquo;/&ldquo;<Article_Title>$1<\/Article_Title>${2}&rdquo;/g;
      $references =~ s/&rdquo; <em>(.*?)<\/em>/&rdquo; <Journal_Title><em>$1<\/em><\/Journal_Title>/;
      #$references =~ s/^(.*?) &ldquo;/<Authorgroup>$1<\/Authorgroup> &ldquo;/ if($references !~ m/<Authorgroup>/ && $references !~ m/^<Editorgroup>/);
    } else {
      #$references =~ s/^(.*?) \(<Year>/<Authorgroup>$1<\/Authorgroup> \(<Year>/ if($references !~ m/<Authorgroup>/ && $references !~ m/^<Editorgroup>/);
    }

    
    if ($references =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/) {
      $references =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; <em>/;
    } elsif ($references =~ m/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; ASCE\, <em>/) {
      $references =~ s/<\/Year>\)(\.?) &ldquo;(.*?)&rdquo; ASCE\, <em>/<\/Year>\)$1 &ldquo;<Article_Title>$2<\/Article_Title>&rdquo; ASCE\, <em>/;
    } elsif ($references =~ m/<\/Year>[\.\,]? &ldquo;(.*?)&rdquo;/ && $references !~ m/<Article_Title>/) {
      $references =~ s/(<\/Year>[\.\,\)]? )&ldquo;(.*?)&rdquo;/$1&ldquo;<Article_Title>$2<\/Article_Title>&rdquo;/;
    }

    if ($references =~ m/&rdquo; <em>(.*?)<\/em>/) {
      $references =~ s/&rdquo; <em>(.*?)<\/em>/&rdquo; <Journal_Title><em>$1<\/em><\/Journal_Title>/;
    } elsif ($references =~ m/<\/Article_Title>&rdquo; ASCE\, <em>(.*?)<\/em>/) {
      $references =~ s/<\/Article_Title>&rdquo; ASCE\, <em>(.*?)<\/em>/<\/Article_Title>&rdquo; ASCE\, <Journal_Title><em>$1<\/em><\/Journal_Title>/;
    }
    
    if ($references =~ m/<Journal_Title><em>(.*?)<\/em><\/Journal_Title>\./) {
      my $jtext = $1;
      if ($jtext =~ m/\./) {
        $references =~ s/<Journal_Title><em>(.*?)<\/em><\/Journal_Title>\./<Journal_Title><em>$1\.<\/em><\/Journal_Title>/;
      }
    }

    $references =~ s/<\/Journal_Title>\.\,/\.<\/Journal_Title>\,/;

    if ($references =~ m/[Dd]oi\: ?10\.\d{4}\/[\S]+\.?$/){
      $references =~ s/([Dd]oi\: ?)(10\.\d{4}\/[\S]+)(\.)$/$1 <Doi>$2<\/Doi>$3/;
      $references =~ s/([Dd]oi\: ?)(10\.\d{4}\/[\S]+)$/$1 <Doi>$2<\/Doi>/;
    }

    if ($references =~ m/p ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
      $references =~ s/p ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)/p <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
    }

    if ($references =~ m/ ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/) {
      $references =~ s/ ([0-9\.]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9\.]+)([\.]?)$/ <FirstPage>$1<\/FirstPage>&ndash;<LastPage>$3<\/LastPage>$4/;
    }

    if ($references =~ m/ ([0-9\.]+) pp([\.]?)$/) {
      $references =~ s/ ([0-9\.]+) pp([\.]?)$/ <FirstPage>$1<\/FirstPage> pp$2/;
    }

    
    if ($references =~ m/<strong>[0-9]+<\/strong>\, no\. <Issue_No>/) {
      $references =~ s/<strong>([0-9]+)<\/strong>\, no\. <Issue_No>/<Vol_No><strong>$1<\/strong><\/Vol_No>\, no\. <Issue_No>/;
    }
    if ($references =~ m/<strong>[0-9]+<\/strong>\, <FirstPage>/) {
      $references =~ s/<strong>([0-9]+)<\/strong>\, <FirstPage>/<Vol_No><strong>$1<\/strong><\/Vol_No>\, <FirstPage>/;
    }
#    if ($references =~ m/ [Nn]o\. [0-9]+\, <FirstPage>/) {
#      $references =~ s/ ([Nn]o\.) ([0-9]+)\, <FirstPage>/ $1 <Issue_No>$2<\/Issue_No>\, <FirstPage>/;
#    }

    if ($references =~ m/\b[Vv]ol\. [0-9]+\, <FirstPage>/) {
      $references =~ s/\b([Vv]ol\.) ([0-9]+)\, <FirstPage>/$1 <Vol_No>$2<\/Vol_No>\, <FirstPage>/;
    }

    if ($references =~ m/<em>([^\,]+)<\/em>\,? <Vol_No>/) {
      $references =~ s/<em>([^\,]+)<\/em>(\,)? <Vol_No>/<Journal_Title><em>$1<\/em><\/Journal_Title>$2 <Vol_No>/;
    }

    if ($references =~ m/<em>([^\,]+)<\/em>\. <Vol_No>/) {
      $references =~ s/<em>([^\,]+)<\/em>\. <Vol_No>/<Journal_Title><em>$1\.<\/em><\/Journal_Title> <Vol_No>/;
    }
    
    if ($references =~ m/<em>([^\,]+)<\/em>\.\, <Vol_No>/) {
      $references =~ s/<em>([^\,]+)<\/em>\.\, <Vol_No>/<Journal_Title><em>$1\.<\/em><\/Journal_Title>\, <Vol_No>/;
    }

    $references =~ s/([\;\,])<\/Authorgroup>/<\/Authorgroup>$1/;

    if ($references =~ m/<\/Year>\)(\.?) <em>(.*?)<\/em>/) {
      $references =~ s/<\/Year>\)(\.?) <em>(.*?)<\/em>/<\/Year>\)$1 <Journal_Title><em>$2<\/em><\/Journal_Title>/;
    }

    if ($references !~ m/<Article_Title>/) {
      if ($references =~ m/<\/Year>\)\.? \&ldquo\;(.*?)\&rdquo\;/) {
        $references =~ s/(<\/Year>\)\.? )\&ldquo\;(.*?)\&rdquo\;/$1\&ldquo\;<Article_Title>$2<\/Article_Title>\&rdquo\;/i;
      }
    }

    # Start Here
    if ($references !~ m/<PublisherName>/) {
      if ($references =~ m/\, ([A-z\s\-]+)[\,\:\.] <PublisherLocation>/) {
        my $publishname = $1;
        if(exists $publishersList{$publishname}) {
          $references =~ s/\, $publishname([\,\:\.] )<PublisherLocation>/\, <PublisherName>$publishname<\/PublisherName>$1<PublisherLocation>/;
        }
      }
    }


    if($references !~ m/<PublisherName>/i) {
      if ($references =~ m/\, ([A-z\s\-]+)[\,\:\.] <PublisherLocation>/) {
        my $cityname = $1;
        if(!exists $cities{$cityname}) {
          $references =~ s/\, ([A-z\s\-]+)([\,\:\.]) <PublisherLocation>/\, <PublisherName>$1<\/PublisherName>$2 <PublisherLocation>/;
        }
      }
    }
    if($references !~ m/<Journal_Title>/i) {
      if ($references =~ m/\, <em>([A-z\s\- ]+)<\/em>\, <PublisherName>/) {
        $references =~ s/\, (<em>([A-z\s\- ]+)<\/em>)(\,) <PublisherName>/\, <Journal_Title>$1<\/Journal_Title>\, <PublisherName>/;
      }
    }

    if ($references !~ m/<Vol_No>/) {
      if ($references =~ m/\, Vol\. ([0-9]+)\,/) {
        $references =~ s/\, Vol\. ([0-9]+)\,/\, Vol\. <Vol_No>$1<\/Vol_No>\,/;
      }
    }
    
    if ($references =~ m/ [0-9]+(?:[A-Z])?\([0-9]+((\-|&minus;|&ndash;|&mdash;)[0-9]+)?\)\, <FirstPage>/) {
      $references =~ s/ ([0-9]+(?:[A-Z])?)\(([0-9]+((\-|&minus;|&ndash;|&mdash;)[0-9]+)?)\)\, <FirstPage>/ <Vol_No>$1<\/Vol_No>(<Issue_No>$2<\/Issue_No>)\, <FirstPage>/;
    }
    
    if ($references =~ m/ \([0-9]+\)\, [0-9]+ ?(-|&ndash;|&mdash;|&minus;) ?[0-9]+ \(in/) {
      $references =~ s/ (\([0-9]+\))\, ([0-9]+) ?(-|&ndash;|&mdash;|&minus;) ?([0-9]+) \(in/ $1\, <FirstPage>$2<\/FirstPage>&ndash;<LastPage>$4<\/LastPage> \(in/;
    }
      
    if ($references !~ m/<institution>/) {
      if ($references =~ m/(Thesis)\, [A-z\ ]+ (Institution|Institute|University|School)( [A-z\ ]+)?[\,\.]/i) {
        $references =~ s/(Thesis)\, ([A-z\ ]+ (?:Institution|Institute|University|School)( [A-z\ ]+)?)([\,\.])/$1\, <institution>$2<\/institution>$4/i;
      }
    }

    if ($references =~ m/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/i) {
      $references =~ s/&(\#60|lt|\#9001|\#706|lang)\;(?:<em>)?(http|www)(.*?)(?:<\/em>)?&(\#62|gt|\#9002|\#707|rang)\;/\&lt\;<Website>$2$3<\/Website>\&gt\;/i;
    }

    $references =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Authorgroup>/<\/Authorgroup>$1/i;
    $references =~ s/(\s*\(<Year>[0-9]+(?:[a-z])?<\/Year>\)\.?)<\/Collab>/<\/Collab>$1/i;
    $references =~ s/(\(in (?:Chinese|[Pp]ress)\)\.?)$/<UnknownComment>$1<\/UnknownComment>/i;
    

    $references = &Reftagging::partial_tagging($references);
    	#print $references,"\n\n";

    $references = &Reftagging::restrict_book_conversion($references);
    $references = &Reftagging::publisherloc_tagging($references);

    $references = &Reftagging::publishername_tagging($references);
  return $references;
}
my $count = 0;
sub Cleanup {
  my $line = shift;
  $line =~ s/<p>\s*<\/p>//gi;
  $line =~ s/\s*<\/p>/<\/p>/gi;
  $line =~ s/<p>\s*/<p>/gi;
  $line =~ s/<a name=\"([^\"]*)\"><\/a>//gi;
  $line =~ s/<p>&lt;ref&gt;<\/p>//i;
  $line =~ s/<p>&lt;\/ref&gt;<\/p>//i;
  $line =~ s/\&\#8722\;/\&\#8211\;/gi;
  $line =~ s{<p>(.*?)<\/p>}
  {
      $count++;
      #print "Processing line: $count\n";
    my $content = $&;
    $content =~ s/  / /g;
    $content =~ s/  / /g;
    #$content =~ s/<\/?span>//gi;
    
    $content =~ s{<span class=\"Emphasis\">(.*?)<\/span>}
    {
      my $temp = $&;
      $temp =~ s/<span class=\"Emphasis\">//i;
      $temp =~ s/<\/span>//i;
      if($temp =~ m/<em>/i) {
        $temp =~ s/<\/?em>//gi;
      }
      $temp;
    }egi;
    $content =~ s/<italic>(.*?)<\/italic>/<em>$1<\/em>/gi;
    $content =~ s/<span class=\"Emphasis\">(.*?)<\/span>/<em>$1<\/em>/gi;
    $content =~ s/<span class=\"ITAL\">(.*?)<\/span>/<em>$1<\/em>/gi;
    $content =~ s/<span class=\"Hyperlink\">(.*?)<\/span>/$1/gi;
    $content =~ s/<font name=\"Arial Unicode MS\">\&\#8210;<\/font>/\&\#8211;/gi;
    $content =~ s/<\/strong><strong>//gi;
    $content =~ s/<\/strong> <strong>/ /gi;
    $content =~ s/ <\/strong>/<\/strong> /gi;
    $content =~ s/ <\/strong>/<\/strong> /gi;
    $content =~ s/<strong> / <strong>/gi;
    $content =~ s/<strong>([\.\,]\:?)<\/strong>/$1/gi;
    $content =~ s/, \"/, &\#8220;/g;
    $content =~ s/\&\#160\;/ /g;
    $content =~ s/\)\. \"/\)\. &\#8220;/g;
    $content =~ s/\) \"/\) &\#8220;/g;
    $content =~ s/\"\,/&\#8221;\,/g;
    $content =~ s/\"\. /&\#8221;\. /g;
    $content =~ s/(,|\?|\.)\"( |<em>)/${1}&\#8221;${2}/gi;
    $content =~ s/<em>(,|\?|\.)&\#8221; /${1}&\#8221; <em>/gi;
    $content =~ s/<em>&\#8221;(,|\?|\.)\s+/&\#8221;${1} <em>/gi;
   	$content =~ s/(\, Vol\.)<\/em>/<\/em>$1/sgi;
		$content =~ s/(\, Vol)<\/em>\./<\/em>$1\./sgi;
		$content =~ s/\,/\, /gi;
		$content =~ s/ \,/\, /gi;
		$content =~ s/\,[ ]+/\, /gi;


    $content =~ s/<\/em><em>//gi;
    $content =~ s/<\/em> <em>/ /gi;
    $content =~ s/ <\/em>/<\/em> /gi;
    $content =~ s/ <\/em>/<\/em> /gi;
    $content =~ s/<em> / <em>/gi;
    $content =~ s/<\/smallcaps><smallcaps>//gi;
    $content =~ s/<\/smallcaps> <smallcaps>/ /gi;
    $content =~ s/ <\/smallcaps>/<\/smallcaps> /gi;
    $content =~ s/ <\/smallcaps>/<\/smallcaps> /gi;
    $content =~ s/<smallcaps> / <smallcaps>/gi;
    $content =~ s/<\/strong><strong>//gi;
    $content =~ s/<\/strong> <strong>/ /gi;
    $content =~ s/ <\/strong>/<\/strong> /gi;
    $content =~ s/ <\/strong>/<\/strong> /gi;
    $content =~ s/\,<\/strong>/<\/strong>\,/gi;
    $content =~ s/<strong> / <strong>/gi;
    $content =~ s/<strong><\/strong>//gi;
    $content =~ s/<strong>\&\#8220\;<\/strong>/\&\#8220\;/gi;
    $content =~ s/<strong>\&\#8221\;<\/strong>/\&\#8221\;/gi;
    $content =~ s/<\/em><em>//gi;
    $content =~ s/<\/em> <em>/ /gi;
    $content =~ s/ <\/em>/<\/em> /gi;
    $content =~ s/ <\/em>/<\/em> /gi;
    $content =~ s/<em> / <em>/gi;
    $content =~ s/\.<\/em>/<\/em>\./gi;
    $content =~ s/\,<\/em>/<\/em>\,/gi;
    $content =~ s/<em><\/em>//gi;
    $content =~ s/<\/em>\, <em>/\, /gi;
    $content =~ s/<em>\. /\. <em>/gi;
    $content =~ s/<em>\, /\, <em>/gi;
    $content =~ s/<\/em> \&amp\; <em>/ \&amp\; /gi;
    $content =~ s/<\/em> \&\#8216\;<em>/ \&\#8216\;/gi;
    $content =~ s/\.<em>([a-z])/\. <em>$1/gi;
    $content =~ s/(\(\d{4}\))\.([A-Z])/$1\. $2/g;
    $content =~ s/\.(\(\d{4}\))\. /\. $1\. /g;
    $content =~ s/\.([A-Z][a-z]+)/\. $1/g;
    $content =~ s/<\/em>([\.\,\:]+ ?)<em>/$1/gi;
    $content =~ s/<\/em>\s+<em>/ /gi;
    $content =~ s/\s+<\/p>/<\/p>/gi;
    $content =~ s/  / /g;
    $content =~ s/  / /g;
    $content =~ s/\&\#160; / /g;
    $content =~ s/\&\#160;/ /g;
    $content =~ s/<a name=\"([^\"]*)\"><\/a>//gi;
    $content =~ s/<a href=\"([^\"]*)\">\1<\/a>/$1/gi;
    $content =~ s/<a href=\"([^\"]*)\">//gi;
    $content =~ s/<img src=\"([^\"]*)\">//gi;
    $content =~ s/<\/a>//gi;
    $content =~ s/\,\,/\,/gi;
    $content =~ s/\,\s*\,/\,/gi;
    $content =~ s/“/&ldquo;/gi;
    $content =~ s/”/&rdquo;/gi;
    $content =~ s/<p>(\[?[0-9\.]+\]? ?)/$1<p>/gi;
    $content =~ s/<p><strong>(\[?[0-9\.]+\]? ?)<\/strong>/$1<p>/gi;
    $content =~ s/<p><sup>(\[?[0-9\.]+\]? ?)<\/sup>/$1<p>/gi;
    $content =~ s/<p><(strong|b)>(.*?)<\/\1>/<p>$2/gi;
    $content =~ s/<strong>(\d+.*?)<\/strong>/<&del;strong>$1<&del;\/strong>/gi;
    $content =~ s/<smallcaps>//sgi;
    $content =~ s/<\/smallcaps>//sgi;
    $content =~ s/( [Ii]n [A-Z][a-z]+, [A-Z]\.[A-Z])\:\, /$1\.\, /;
    $content =~ s/<\/em><sup>([^><]+)<\/sup><em>/<sup>$1<\/sup>/g;
    $content =~ s/<\/?(strong|b)>//sgi;
    $content =~ s/<p><sup> ?<\/sup>/<p>/gi;
    $content =~ s/<\&del;/</g;
    $content =~ s/\,and /\, and /g;
 		$content =~ s/ <\/sup>/<\/sup> /g;
    #special cases for article title Ex. BIM: innovation in design management, influence and challenges of implementation
    $content =~ s/\b([a-z]+)\, ([a-z]+)/$1&comma; $2/g;
    $content =~ s/([a-z]+)\? ([a-z]+)/$1&questionmark; $2/gi;
    $content =~ s/<p> /<p>/gi;
		#print $content,"\n\n";
		if($content =~ m/^(.*?)\&\#8221\;/) {
			my $tmpcheck = $1;
			if($tmpcheck !~ m/\&\#8220\;/) {
				$content =~ s/^(.*?)\&\#8221\;/$1\&\#8220\;/;
			}
		}
		
		if($content =~ m/\&\#8220\;(.*?)\&\#8220\;/) {
			my $tmpcheck = $1;
			if($tmpcheck !~ m/\&\#8221\;/) {
				$content =~ s/\&\#8220\;(.*?)\&\#8220\;/\&\#8220\;$1\&\#8221\;/;
			}
		}
    #####
    $content = &reftype_conversion($content);
    $content = &PatternMatching($content);
    #print $content,"\n";
    $content;
   }ei;
   
  return $line;
}

sub PatternMatching {
	my $patCont = shift;

	my (@jrnl, @book, @edbk, @other, @jrnlpat, @bookpat, @edbkpat, @otherpat) = ("", "", "", "", "", "", "", "");
	my $patauthors = "(.+)";
	my $pateditors = "(.+)";
	my $patyear = "([0-9]{4}[a-z]?)";
	my $patpubdate = "([a-zA-Z0-9\\s\\,\\/]+)";
	my $patattitle = "(.+)";
	my $patchaptitle = "(.+)";
	my $patjrnltitle = "([a-zA-Z:\\(\\)\\/\\&\\;\\-\\s\\.\\,\\?]+)";
	my $patbooktitle = "([a-zA-Z:\\(\\)\\/\\&\\;\\-\\s\\.\\,\\?]+)";
	my $patextrainfo = "(.*?)";
	my $patvolume = "([0-9]+(?:\-?[a-zA-Z0-9]+)?(?:\/[0-9]+)?)";
	my $patissue = "([0-9]+(?:\-[a-zA-Z0-9]+)?(?:\/[0-9]+)?)";
	my $patsupplement = "(Suppl\.? [0-9]+|[0-9]+ Suppl\.?)";
	my $patfpage = "([A-Z0-9\,\\s]+)";
	my $patlpage = "([A-Z0-9\,\\s]+)";
	my $patcomment = "(.*?)";
	my $patpublocation = "(.*?)";
	my $patpubname = "((?:St\\.)?(?:W\\. W\\.)?(?:F\\. E\\.)?(?:U\\. S\\.)?[A-Za-z\\&\\;\\'\\,\\/\\-\\s]+)";
	my $patcity = "([A-Za-z\\s]+)";
	my $patstate = "(D\\.\\s*C\\.|[A-Za-z\\s]+)";
	my $patmonth = "([A-Za-z\\/]+)";
	my $patdate = "(.*?)";
	my $patother = "(.*?)";
	my $pateds = "(eds?\\.?|Eds?\\.?)";
	my $patedition = "([A-Za-z0-9]+|rev\\.)";
	my $patvolumetext = "(\\s*vols?\\.?\\s*|\\s*Vols?\\.?\\s*)";




	my ($dbtext, $text);
	
	if($Refstyles =~ m/\[REFS\](.*?\n)\s*\[[A-Z]+\]/si)	{
			$dbtext = $1;
	}
	
		$dbtext =~ s/<\/?x>//gi;
		$dbtext =~ s/(\?|\.|\,|\(|\)|\[|\]|\&|\#|\|)/\\$1/gi;
		$dbtext =~ s/<Authorgroup>/$patauthors/gi;
		$dbtext =~ s/<ETCgroup>/$pateditors/gi;
		$dbtext =~ s/<Year>/$patyear/gi;
		$dbtext =~ s/<Article_Title>/$patattitle/gi;
		$dbtext =~ s/<Chap_Title>/$patchaptitle/gi;
		$dbtext =~ s/<Journal_Title>/$patjrnltitle/gi;
		$dbtext =~ s/<Extra_Info>/$patextrainfo/gi;
		$dbtext =~ s/<Vol_No>/$patvolume/gi;
		$dbtext =~ s/<Issue_No>/$patissue/gi;
		$dbtext =~ s/<Suppl_No>/$patsupplement/gi;
		$dbtext =~ s/<FirstPage>/$patfpage/gi;
		$dbtext =~ s/<LastPage>/$patlpage/gi;
		$dbtext =~ s/<PubDate>/$patpubdate/gi;
		$dbtext =~ s/<Month>/$patmonth/gi;
		$dbtext =~ s/<Other>/$patother/gi;
		$dbtext =~ s/<Book_Title>/$patbooktitle/gi;
		$dbtext =~ s/<City>/$patcity/gi;
		$dbtext =~ s/<State>/$patstate/gi;
		$dbtext =~ s/<Name>/$patpubname/gi;
		$dbtext =~ s/<EDS>/$pateds/gi;
		$dbtext =~ s/<Edition_No>/$patedition/gi;
		$dbtext =~ s/<Vol_PX>/$patvolumetext/gi;
		$dbtext =~ s/<Vol_SX>/$patvolumetext/gi;

	@jrnl = ($dbtext =~ m/journal=(.*?)\n/sgi);
	@book = ($dbtext =~ m/book=(.*?)\n/sgi);
	@edbk = ($dbtext =~ m/edbk=(.*?)\n/sgi);
		if($Refstyles =~ m/\[REFS\](.*?\n)\s*\[[A-Z]+\]/si)	{
			$text = $1;
		}

		$text =~ s/^\s*?//gi;
		$text =~ s/<\/?x>//gi;
		$text =~ s/(\?|\.|\,|\(|\)|\[|\]|\&|\#|\|)/\\$1/gi;
		$text =~ s/<Authorgroup>/<Authorgroup><doller><\/Authorgroup>/gi;
		$text =~ s/<ETCgroup>/<ETCgroup><doller><\/ETCgroup>/gi;
		$text =~ s/<Year>/<Year><doller><\/Year>/gi;
		$text =~ s/<Article_Title>/<Article_Title><doller><\/Article_Title>/gi;
		$text =~ s/<Chap_Title>/<Chap_Title><doller><\/Chap_Title>/gi;
		$text =~ s/<Journal_Title>/<Journal_Title><doller><\/Journal_Title>/gi;
		$text =~ s/<Extra_Info>/<Extra_Info><doller><\/Extra_Info>/gi;
		$text =~ s/<Vol_No>/<Vol_No><doller><\/Vol_No>/gi;
		$text =~ s/<Issue_No>/<Issue_No><doller><\/Issue_No>/gi;
		$text =~ s/<Suppl_No>/<Suppl_No><doller><\/Suppl_No>/gi;
		$text =~ s/<FirstPage>/<FirstPage><doller><\/FirstPage>/gi;
		$text =~ s/<LastPage>/<LastPage><doller><\/LastPage>/gi;
		$text =~ s/<PubDate>/<PubDate><doller><\/PubDate>/gi;
		$text =~ s/<Month>/<Month><doller><\/Month>/gi;
		$text =~ s/<Other>/<Other><doller><\/Other>/gi;
		$text =~ s/<Book_Title>/<Book_Title><doller><\/Book_Title>/gi;
		$text =~ s/<City>/<City><doller><\/City>/gi;
		$text =~ s/<State>/<State><doller><\/State>/gi;
		$text =~ s/<Name>/<Name><doller><\/Name>/gi;
		$text =~ s/<EDS>/<EDS><doller><\/EDS>/gi;
		$text =~ s/<Edition_No>/<Edition_No><doller><\/Edition_No>/gi;
		$text =~ s/<Vol_PX>/<Vol_PX><doller><\/Vol_PX>/gi;
		$text =~ s/<Vol_SX>/<Vol_PX><doller><\/Vol_SX>/gi;
	
	@jrnlpat = ($text =~ m/journal=(.*?)\n/sgi);
	@bookpat = ($text =~ m/book=(.*?)\n/sgi);
	@edbkpat = ($text =~ m/edbk=(.*?)\n/sgi);

	$patCont =~ s/&\#8220;/&ldquo;/g;
	$patCont =~ s/&\#8221;/&rdquo;/g;
	$patCont =~ s/&\#173;/\-/g;

		my $flag = 0;
		if($patCont =~ m/<Journal>(.*?)<\/Journal>/i)
		{
			my $reftext = $1;
			
			$reftext =~ s/<em>/<I>/gi;
			$reftext =~ s/<\/em>/<\/I>/gi;
			$reftext =~ s/([a-z0-9]+)\&\#8211;([a-z0-9]+)/$1\-$2/gi;
			$reftext =~ s/([a-z0-9]+)\&ndash;([a-z0-9]+)/$1\-$2/gi;
			for (my $now = 0; $now < @jrnl; $now++)
			{
				my $i = 1;
				if($reftext =~ m/^$jrnl[$now]$/)
				{
					my $tmp = $jrnlpat[$now];
					#$i++ while($tmp =~ s/<doller>/\$\E$i/i);
					$i++ while($tmp =~ s/<doller>/\$$i/i);
					$reftext =~ s/^$jrnl[$now]$/"\"$tmp\""/ee;
					$flag = 1;
					#print "Hai,,,,,";
					goto LABEL1;
				}
			}
			LABEL1:
			$patCont =~ s/<Journal>(.*?)<\/Journal>/<Journal>$reftext<\/Journal>/i;
#			if($flag == 0)
#			{
#				$patCont =~ s/<Journal>(.*?)<\/Journal>/<Journal><Color>$1<\/Color><\/Journal>/i;
#			}
		}

=comment

		if($patCont =~ m/<Book>(.*?)<\/Book>/i)
		{
			my $reftext = $1;
			$reftext =~ s/<em>/<I>/gi;
			$reftext =~ s/<\/em>/<\/I>/gi;
			$reftext =~ s/([a-z0-9]+)\&\#8211;([a-z0-9]+)/$1\-$2/gi;
			$reftext =~ s/([a-z0-9]+)\&ndash;([a-z0-9]+)/$1\-$2/gi;
			for (my $now = 0; $now < @book; $now++)
			{
				my $i = 1;
				if($reftext =~ m/^$book[$now]$/)
				{
					my $tmp = $bookpat[$now];
					#$i++ while($tmp =~ s/<doller>/\$\E$i/i);
					$i++ while($tmp =~ s/<doller>/\$$i/i);
					$reftext =~ s/^$book[$now]$/"\"$tmp\""/ee;
					$flag = 1;
					goto LABEL1;
				}
			}
			LABEL1:
			$patCont =~ s/<Book>(.*?)<\/Book>/<Book>$reftext<\/Book>/i;
			if($flag == 0)
			{
				$patCont =~ s/<Book>(.*?)<\/Book>/<Book><Color>$1<\/Color><\/Book>/i;
			}
		}
=cut

	$patCont =~ s/&ldquo;/&\#8220;/g;
	$patCont =~ s/&rdquo;/&\#8221;/g;
#print $patCont,"\n";#exit;

	return $patCont;
}


1;