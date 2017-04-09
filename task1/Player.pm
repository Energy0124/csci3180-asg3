package Player;
use strict;
use warnings;
use parent("Participant");

sub new {
    my $self = shift;
    my $name = shift;
    my $dealer = undef;
    my $participant = $self->SUPER::new($name);
    $participant->{"dealer"}=$dealer;
    return bless $participant, $self;
}

sub setDealer{
    my $self = shift;
    my $dealer = shift;
    $self->{"dealer"} = $dealer;

}
1;