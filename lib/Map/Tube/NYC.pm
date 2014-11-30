package Map::Tube::NYC;

$Map::Tube::NYC::VERSION = '0.01';

=head1 NAME

Map::Tube::NYC - Interface to the New York City Subway.

=head1 VERSION

Version 0.01

=cut

use 5.006;
use Data::Dumper;
use File::Share ':all';

use Moo;
use namespace::clean;

has xml => (is => 'ro', default => sub { return dist_file('Map-Tube-NYC', 'nyc-map.xml') });

with 'Map::Tube';

=head1 DESCRIPTION

It currently provides functionality to find the shortest  route between  the  two
given  nodes.It covers IND Eighth Avenue Line only now.I will be adding remaining
routes very soon.

For more information about New York City Subway, L<click here|http://en.wikipedia.org/wiki/New_York_City_Subway_map>.

=head1 STATIONS

    +---------------------------------------------------------------------------------------------+
    | Junctions                                                                                   |
    +--------------------+-------------------------------------+----------------------------------+
    | Station            | Line                                | Connected to                     |
    +--------------------+-------------------------------------+----------------------------------+
    | 168th Street       | IND Eighth Avenue, Seventh Avenue   | 175th Street, 168th Street       |
    | 145th Street       | IND Eighth Avenue, Concourse        | 155th Street, 145th Street       |
    | 59th Street        | IND Eighth Avenue, Seventh Avenue   | 72nd Street, 59th Street         |
    | 50th Street        | IND Eighth Avenue, Queens Boulevard | 59th Street, 50th Street         |
    | 42nd Street        | IND Eighth Avenue, Seventh Avenue,  | 50th Street, 42nd Street         |
    |                    | Flushing, Broadway                  |                                  |
    | 14th Street        | IND Eighth Avenue, Canarsie         | 23rd Street, West Fourth Street  |
    | West Fourth Street | IND Eighth Avenue, Sixth Avenue     | 14th Street, Spring Street       |
    | Fulton Street      | IND Eighth Avenue, Seventh Avenue   | Chambers Street, High Street     |
    |                    | Nassau Street, Lexington Avenue     |                                  |
    +--------------------+-------------------------------------+----------------------------------+

    +---------------------------------------------------------+
    | Line: IND Eighth Avenue                                 |
    +---------------------+-----------------------------------+
    | Station             | Connected to                      |
    +---------------------+-----------------------------------+
    | 207th Street        |  Dyckman Street                   |
    | Dyckman Street      |  207th Street, Dyckman Street     |
    | 190th Street        |  Dyckman Street, 190th Street     |
    | 181th Street        |  190th Street, 181st Street       |
    | 175th Street        |  181st Street, 175th Street       |
    | 163rd Street        |  168th Street, 163rd Street       |
    | 155th Street        |  163rd Street, 155th Street       |
    | 135th Street        |  145th Street, 135th Street       |
    | 125th Street        |  135th Street, 125th Street       |
    | 116th Street        |  125th Street, 116th Street       |
    | 110th Street        |  116th Street, 110th Street       |
    | 103rd Street        |  110th Street, 103rd Street       |
    | 96th Street         |  103rd Street, 96th Street        |
    | 86th Street         |  96th Street, 86th Street         |
    | 81st Street         |  86th Street, 81st Street         |
    | 72nd Street         |  81st Street, 72nd Street         |
    | 34th Street         |  42nd Street, 23rd Street         |
    | 23rd Street         |  34th Street, 14th Street         |
    | Spring Street       |  West Fourth Street, Canal Street |
    | Canal Street        |  Spring Street, Chambers Street   |
    | Chambers Street     |  Canal Street, Fulton Street      |
    | High Street         |  Fulton Street                    |
    +---------------------+-----------------------------------+

=head1 CONSTRUCTOR

The constructor DO NOT expects parameters.This setup the default node definitions.

    use strict; use warnings;
    use Map::Tube::NYC;

    my $subway = Map::Tube::NYC->new;

=head1 METHODS

=head2 get_shortest_route()

This  method  expects  two  parameters START and END node name. Node name is case
insensitive. It returns back the node sequence from START to END.

    use strict; use warnings;
    use Map::Tube::NYC;

    my $subway = Map::Tube::Delhi->new;
    my $route  = $subway->get_shortest_route('Canal Street', 'High Street');

    print "Route: $route\n";;

=head1 AUTHOR

Mohammad S Anwar, C<< <mohammad.anwar at yahoo.com> >>

=head1 REPOSITORY

L<https://github.com/Manwar/Map-Tube-NYC>

=head1 BUGS

Please report any bugs/feature requests to C<bug-map-tube-nyc at rt.cpan.org>, or
through the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Map-Tube-NYC>.
I will be notified, and then you'll automatically be notified of progress on your
bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Map::Tube::NYC

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Map-Tube-NYC>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Map-Tube-NYC>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Map-Tube-NYC>

=item * Search CPAN

L<http://search.cpan.org/dist/Map-Tube-NYC/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2014 Mohammad S Anwar.

This  program  is  free software; you can redistribute it and/or modify it under
the  terms  of the the Artistic License (2.0). You may obtain a copy of the full
license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any  use,  modification, and distribution of the Standard or Modified Versions is
governed by this Artistic License.By using, modifying or distributing the Package,
you accept this license. Do not use, modify, or distribute the Package, if you do
not accept this license.

If your Modified Version has been derived from a Modified Version made by someone
other than you,you are nevertheless required to ensure that your Modified Version
 complies with the requirements of this license.

This  license  does  not grant you the right to use any trademark,  service mark,
tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge patent license
to make,  have made, use,  offer to sell, sell, import and otherwise transfer the
Package with respect to any patent claims licensable by the Copyright Holder that
are  necessarily  infringed  by  the  Package. If you institute patent litigation
(including  a  cross-claim  or  counterclaim) against any party alleging that the
Package constitutes direct or contributory patent infringement,then this Artistic
License to you shall terminate on the date that such litigation is filed.

Disclaimer  of  Warranty:  THE  PACKAGE  IS  PROVIDED BY THE COPYRIGHT HOLDER AND
CONTRIBUTORS  "AS IS'  AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED
WARRANTIES    OF   MERCHANTABILITY,   FITNESS   FOR   A   PARTICULAR  PURPOSE, OR
NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS
REQUIRED BY LAW, NO COPYRIGHT HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL,  OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE
OF THE PACKAGE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut

1; # End of Map::Tube::NYC
