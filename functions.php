<?
function db_connect()
{
	$db_user = "userdb1";
	$db_name = "1102643_KcC";
	$db_password = "VeajvP9fDbKGwN";
	$db_code = "utf8";
	$db_connection = mysql_connect($db_user,$db_name,$db_password);
	
	if (!$db_connection) {
		;//die('Could not connect: ' . mysql_error());
	}
	else 
	;//echo (" Connected successfully ");
	mysql_set_charset($db_code,$db_connection); 
	mysql_select_db($db_name) or die(" "/*mysql_error()."Nie mozna wybrac bazy danych."*/);
	
}

function start()
{
	session_start(); 
	if(!isset($_SESSION['nr_sesji']))
	{
		$_SESSION['nr_sesji'] = time()+rand(10,99);
	}	
}



function menu($id)
{
	echo '
	<div class="row">
			<div class="col-md-12">
				<img class="img-responsive" src="naglowek1.png" alt="naglowek" width="100%"> 
				<div class="row">
					<div class="col-md-12">
					<nav class="navbar navbar-default" role="navigation">
						<!-- Grupowanie do "marki" i przycisku rozwijania menu dla wersji mobilnej -->
						<div class="navbar-header">
						  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#zwin-mobilna-wersja">
							<span class="sr-only">Rozwiń nawigację</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						  </button>
							  <a href="index.html">
								<img class="navbar-brand" src="logo.png" alt="logo" >
							  </a>
						</div>
						<!-- Grupowanie elementów menu w celu lepszego wyświetlania na urządzeniach moblinych -->
						<div class="collapse navbar-collapse" id="zwin-mobilna-wersja">
						  							  
						  <ul class="nav navbar-nav navbar-right">
							<li';
							if($id==1)echo ' class="active" ';
							echo'><a href="oferta.html">Oferta</a></li>
							<li';
							if($id==2)echo ' class="active" ';
							echo'><a href="galeria.html">Galeria</a></li>
							<li';
							if($id==3)echo ' class="active" ';
							echo'><a href="kontakt.html">Kontakt</a></li>
						  </ul>
						</div><!-- /.navbar-collapse -->
					</nav>
					</div>
				</div>
			</div>
		</div>
	';
}





function cp()
{
$znaki = '0123456789';		// dozwolone znaki
$szerokosc = 170; 		// szerokość obrazka
$wysokosc = 30;			// wysokość obrazka
$ilosc_znakow = 6;		// długość captchy
$str = '';			// zmienna pomocnicza
 
// losowanie ciągu znkaów
for ($i = 0; $i < $ilosc_znakow; $i++)
	$str .= substr($znaki, mt_rand(0, strlen($znaki) -1), 1);
 
$string = $str;
$_SESSION['captcha'] = $string; // przypisanie do zmiennej sesyjnej
 
// tworzenie obrazka o danych wymiarach
$im = imagecreate($szerokosc, $wysokosc);
 
//kolory obrazka
$tlo	 = imagecolorallocate($im,0,0,0);
$czcionka   = imagecolorallocate($im,255,255,255);
$siatka   = imagecolorallocate($im,78,78,78);
$ramka = imagecolorallocate ($im, 255, 0, 0);
 
imagefill($im,1,1,$tlo); // wypełnienie tłem
 
// losowanie siatki
for($i=0; $i<1600; $i++)
{
	$rand1 = rand(0,$szerokosc);
	$rand2 = rand(0,$wysokosc);
	imageline($im, $rand1, $rand2, $rand1, $rand2, $siatka);
}
 
// losowanie pozycji znaków
$x = rand(5, $szerokosc/(7/2));
 
// dodawanie obramowania
imagerectangle($im, 0, 0, $szerokosc-1, $wysokosc-1, $ramka);
 
// umieszczanie liter na obrazku
for($a=0; $a < 7; $a++)
{
	imagestring($im, 6, $x, rand(4 , $wysokosc/5), substr($string, $a, 1), $czcionka);
	$x += (5*3); // odstęp między literami
}
 
// zwrócenie wygenerowanego obrazka, ustawienie typu mime na GIF
header("Content-type: image/gif");
imagegif($im);
imagedestroy($im);
}

?>


