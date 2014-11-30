#!perl

use strict; use warnings;
use Test::More tests => 4;
use Map::Tube::NYC;

my $subway = Map::Tube::NYC->new;

eval { $subway->get_shortest_route; };
like($@, qr/ERROR: Either FROM\/TO node is undefined/);

eval { $subway->get_shortest_route('Spring Street'); };
like($@, qr/ERROR: Either FROM\/TO node is undefined/);

eval { $subway->get_shortest_route('XYZ', 'Spring Street'); };
like($@, qr/\QMap::Tube::get_shortest_route(): ERROR: Received invalid FROM node 'XYZ'\E/);

eval { $subway->get_shortest_route('Spring Street', 'XYZ'); };
like($@, qr/\QMap::Tube::get_shortest_route(): ERROR: Received invalid TO node 'XYZ'\E/);
