package AIPlayer;

use strict;
use warnings;
use parent("Player");

sub new {
    my $self = shift @_;
    my $name = shift @_;
    my $participant = $self->SUPER::new($name);
    return bless $participant, $self;
}

sub hitOrStand {

    return "stand";



}
1;