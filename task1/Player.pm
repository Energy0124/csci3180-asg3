package Player;
use strict;
use warnings;
use parent("Participant");

sub new {
    my $self = shift @_;
    my $name = shift @_;
    my $dealer = undef;
    my $participant = $self->SUPER::new($name);
    $participant->{"dealer"}=$dealer;
    return $participant, $self;
}

sub setDealer{
    my $self = shift @_;
    my $dealer = shift @_;
    $self->{"dealer"} = $dealer;

}
1;