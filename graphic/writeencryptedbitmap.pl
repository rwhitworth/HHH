use strict;
use GD;
use Crypt::ECB;
$|++;

my $im = GD::Image->new(800,600);
my $white = $im->colorAllocate(255,255,255);
my $black = $im->colorAllocate(0,0,0);
my $counter = 0;
my $loop = 0;
my $max = 100;
my $col;

while ($counter < $max)
{
	$col = $im->colorAllocate(int(rand(255)),int(rand(255)),int(rand(255)));
	while ($loop < 100)
	{
		$im->line(int(rand(800)), int(rand(600)), int(rand(800)), int(rand(600)), $col);
		$loop++;
	}
	$counter++;
	$loop = 0;
}

$im->stringFT($black, 'c:\windows\fonts\nyala.ttf', 100, .6, 75, 550, "Flag: 8C9D6612", {});

open my $fh, ">", "output.png";
binmode $fh;
print $fh $im->png;
close $fh;
open $fh, ">", "output.dat";
binmode $fh;

print "Colors total: " . $im->colorsTotal . "\n";

my $index;

for (my $i = 0; $i < 800; $i++)
{
	for (my $j = 0; $j < 600; $j++)
	{
		$index = $im->getPixel($i, $j);
		my ($r, $g, $b) = $im->rgb($index);
		print $fh chr($r);
		print $fh chr($g);
		print $fh chr($b);
	}
}

close $fh;

open my $fh1, "<", "output.dat";
binmode $fh1;
read $fh1, my $s, 1000000000;
close $fh1;

my $crypt = Crypt::ECB->new();
$crypt->cipher('Blowfish');
$crypt->key(rand_string(8));
my $enc = $crypt->encrypt($s);

open my $fh2, ">", "output1.dat";
binmode $fh2;
print $fh2 $enc;
close $fh2;



sub rand_string
{
	my $len = shift;
	my @chars=('a'..'z','A'..'Z','0'..'9','_');
	my $str;
	foreach (1..$len) { $str.=$chars[rand @chars]; }
	return $str;
}