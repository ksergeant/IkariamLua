#!/usr/bin/perl -w
use strict;
use warnings;
use strict;
use WWW::Mechanize;
use HTTP::Cookies;
use File::Copy qw/ move mv /;
use open ':std', ':encoding(UTF-8)';

#Dossier 
my $repertoire= 'Villes';
my $repertoire2= 'Island';

#Fichier Json
my $outfileVille1 = 	"Ville1.json";
my $outfileVille2 = 	"Ville2.json";
my $outfileVille3 = 	"Ville3.json";
my $outfileVille4 = 	"Ville4.json";
my $outfileVille5 = 	"Ville5.json";
my $outfileVille6 = 	"Ville6.json";
my $outfileVille7 = 	"Ville7.json";
my $outfileVille8 = 	"Ville8.json";
my $outfileVille9 = 	"Ville9.json";
my $outfileVille10 = 	"Ville10.json";
my $outfileVille11 = 	"Ville11.json";
my $outfileVille12 = 	"Ville12.json";

my $outfileIsland1 = 	"Island1.json";
my $outfileIsland2 = 	"Island2.json";
my $outfileIsland3 = 	"Island3.json";
my $outfileIsland4 = 	"Island4.json";
my $outfileIsland5 = 	"Island5.json";
my $outfileIsland6 = 	"Island6.json";
my $outfileIsland7 = 	"Island7.json";
my $outfileIsland8 = 	"Island8.json";
my $outfileIsland9 = 	"Island9.json";
my $outfileIsland10 = 	"Island10.json";
my $outfileIsland11 = 	"Island11.json";
my $outfileIsland12 = 	"Island12.json";


#Url du Serveur
my $serveur = "http://snumeroDeServeur.ikariam.gameforge.com/index.php?action=loginAvatar&function=login&uni_url=s34-fr.ikariam.gameforge.com&name=nomDeCompte&password=mdp&pwat_uid=&pwat_checksum=&startPageShown=1&detectedDevice=1&kid=&autoLogin=on";

#Url des villes
my $urlVille1 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=idVille&ajax=1"; 		
my $urlVille2 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=idVille&ajax=1"; 		
my $urlVille3 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=idVille&ajax=1"; 		
my $urlVille4 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=idVille&ajax=1"; 		
my $urlVille5 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=idVille&ajax=1";		
my $urlVille6 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=city&currentCityId=idVille&ajax=1"; 		
my $urlVille7 = "";
my $urlVille8 = "";
my $urlVille9 = "";
my $urlVille10 = "";
my $urlVille11 = "";
my $urlVille12 = "";

#Url des iles
my $urlIsland1 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=idVille&ajax=1"; 	
my $urlIsland2 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=idVille&ajax=1"; 	
my $urlIsland3 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=idVille&ajax=1"; 		
my $urlIsland4 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=idVille&ajax=1";		
my $urlIsland5 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=idVille&ajax=1"; 	
my $urlIsland6 = "http://s34-fr.ikariam.gameforge.com/?view=updateGlobalData&backgroundView=island&currentCityId=idVille&ajax=1"; 	
my $urlIsland7 = "";
my $urlIsland8 = "";
my $urlIsland9 = "";
my $urlIsland10 = "";
my $urlIsland11 = "";
my $urlIsland12 = "";

#Declaration du mech
my $mech = WWW::Mechanize->new();

#Prototypes des fonctions
sub TraitementVille{
	my ($url1,$outfile1)=@_;
	my $urlX = $url1;
	my $outfileX = $outfile1;
	$mech->get($urlX);
	my $output_page = $mech->content();
	open(OUTFILE, ">$outfileX");
	binmode(OUTFILE, ":utf8");
	print OUTFILE "$output_page";
	close(OUTFILE);	
	mv($outfileX, $repertoire);	
}

sub TraitementIsland{
	my ($url1,$outfile1)=@_;
	my $urlX = $url1;
	my $outfileX = $outfile1;
	$mech->get($urlX);
	my $output_page = $mech->content();
	open(OUTFILE, ">$outfileX");
	binmode(OUTFILE, ":utf8");
	print OUTFILE "$output_page";
	close(OUTFILE);	
	mv($outfileX, $repertoire2);	
}

#Début du programme
mkdir ($repertoire,0755);
mkdir ($repertoire2,0755);
$mech->cookie_jar(HTTP::Cookies->new());
$mech->get($serveur);

# Connexion au serveur
# $mech->field("name", $username);
#$mech->field("password", $password);
$mech->click;

############ -> Traitement des villes
TraitementVille($urlVille1,$outfileVille1);
TraitementVille($urlVille2,$outfileVille2);
TraitementVille($urlVille3,$outfileVille3);
TraitementVille($urlVille4,$outfileVille4);
TraitementVille($urlVille5,$outfileVille5);
TraitementVille($urlVille6,$outfileVille6);

#TraitementVille($urlVille7,$outfileVille7);
#TraitementVille($urlVille8,$outfileVille8);
#TraitementVille($urlVille9,$outfileVille9);
#TraitementVille($urlVille10,$outfileVille10);
#TraitementVille($urlVille11,$outfileVille11);
#TraitementVille($urlVille12,$outfileVille12);

########### -> Traitement des iles
TraitementIsland($urlIsland1, $outfileIsland1);
TraitementIsland($urlIsland2, $outfileIsland2);
TraitementIsland($urlIsland3, $outfileIsland3);
TraitementIsland($urlIsland4, $outfileIsland4);
TraitementIsland($urlIsland5, $outfileIsland5);
TraitementIsland($urlIsland6, $outfileIsland6);
#TraitementIsland($urlIsland7, $outfileIsland7);
#TraitementIsland($urlIsland8, $outfileIsland8);
#TraitementIsland($urlIsland9, $outfileIsland9);
#TraitementIsland($urlIsland10, $outfileIsland10);
#TraitementIsland($urlIsland11, $outfileIsland11);
#TraitementIsland($urlIsland12, $outfileIsland12);



