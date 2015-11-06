#!perl

use 5.006;
use strict; use warnings;
use Test::More tests => 4;
use Map::Tube::NYC;

eval { Map::Tube::NYC->new()->get_shortest_route; };
like($@, qr/ERROR: Missing Station Name/);

eval { Map::Tube::NYC->new()->get_shortest_route('Spring Street'); };
like($@, qr/ERROR: Missing Station Name/);

eval { Map::Tube::NYC->new()->get_shortest_route('XYZ', 'Spring Street'); };
like($@, qr/ERROR: Invalid Station Name/);

eval { Map::Tube::NYC->new()->get_shortest_route('Spring Street', 'XYZ'); };
like($@, qr/ERROR: Invalid Station Name/);
