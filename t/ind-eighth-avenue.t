use strict; use warnings;
use Test::More tests => 8;
use Map::Tube::NYC;

my $subway = Map::Tube::NYC->new;
while (<DATA>) {
    chomp;
    next if /^\#/;
    my ($description, $from, $to, $expected) = split /\|/;
    is($subway->get_shortest_route($from, $to), $expected, $description);
}

__DATA__
Route 1|Canal Street|High Street|Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 2|canal street|high street|Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 3|Canal Street    |High Street|Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 4|Canal Street|High Street    |Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 5|   Canal Street|High Street|Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 6|Canal Street|    High Street|Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 7|Canal Street    |High Street    |Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
Route 8|canal Street    |high Street    |Canal Street (IND Eighth Avenue), Chambers Street (IND Eighth Avenue), Fulton Street (IND Eighth Avenue), High Street (IND Eighth Avenue)
