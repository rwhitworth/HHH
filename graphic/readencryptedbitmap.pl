use strict;
use warnings;
use GD;
$|++;

my $x = 800;
my $y = 600;
my $_255 = 255;
my $_155 = 155;
my $_135 = 135;

my $im = GD::Image->new($x,$y);

my $white = $im->colorAllocate($_255,$_255,$_255);
my $black = $im->colorAllocate(0,0,0);
my $threshhold = (255 * 255 * 255) / 3;

open my $enc, '<', "output1.dat";
binmode $enc;
my $r;


for (my $i = 0; $i < $x; $i++)
{
	for (my $j = 0; $j < $y; $j++)
	{
		read $enc, $r, 3;
		my @a = split (//, $r);
		if (( ord($a[0]) * ord($a[1]) * ord($a[2]) ) > ($threshhold))
		{
			$im->setPixel($i, $j, $white);
		}
		else { $im->setPixel($i, $j, $black); }
	}
}


open my $f, '>', "output1.png";
binmode $f;
print $f $im->png;
close $f;