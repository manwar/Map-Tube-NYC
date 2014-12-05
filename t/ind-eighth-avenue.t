use strict; use warnings;
use Test::More tests => 8;
use Map::Tube::NYC;

my $subway = Map::Tube::NYC->new;
while (<DATA>) {
    chomp;
    next if /^\#/;
    my ($description, $from, $to, $expected) = split /\|/;
    is_deeply($subway->get_shortest_route($from, $to), _expected_route($expected), $description);
}

sub _expected_route {
    my ($route) = @_;
    my $nodes   = [];
    foreach my $name (split /\,/,$route) {
        push @$nodes, $subway->get_node_by_name($name);
    }

    return Map::Tube::Route->new(
       { from  => $nodes->[0],
         to    => $nodes->[-1],
         nodes => $nodes });
}

__DATA__
Route 1|Canal Street|High Street|Canal Street,Chambers Street,Fulton Street,High Street
Route 2|canal street|high street|Canal Street,Chambers Street,Fulton Street,High Street
Route 3|Canal Street    |High Street|Canal Street,Chambers Street,Fulton Street,High Street
Route 4|Canal Street|High Street    |Canal Street,Chambers Street,Fulton Street,High Street
Route 5|   Canal Street|High Street|Canal Street,Chambers Street,Fulton Street,High Street
Route 6|Canal Street|    High Street|Canal Street,Chambers Street,Fulton Street,High Street
Route 7|Canal Street    |High Street    |Canal Street,Chambers Street,Fulton Street,High Street
Route 8|canal Street    |high Street    |Canal Street,Chambers Street,Fulton Street,High Street
