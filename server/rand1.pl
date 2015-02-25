#!/usr/bin/perl -w
use strict;
use warnings;

package MyPackage;

use base qw(Net::Server::PreForkSimple);

sub process_request 
{
  my $self = shift;
  my $s = <STDIN>;
  if ($s =~ /^4999/) { print "Flag: DEADBEEF\n"; }
  else { print "Username/Password is wrong\n"; }
}

#MyPackage->run(	port=>8888, 
#		min_servers=>20, 
#		min_spare_servers=>5, 
#		max_spare_servers=>50,
#		max_servers=>200, 
#		max_requests=>2000);
MyPackage->run(conf_file=>'rand1.conf');
