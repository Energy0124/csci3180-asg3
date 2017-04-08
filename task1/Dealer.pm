use strict;
use warnings;
package Dealer;
use parent("Participant");
require Deck;

sub new {
    my $self = shift;
    my $name = shift;
    my $dealer = $self->SUPER::new($name);
    my @players = shift;
    my $deck = Deck->new();
    $deck->shuffle();
    $dealer->{'players'}=@players;
    $dealer->{'deck'} = $deck;
    return bless $dealer, $self;
}

sub start{
    my $self = shift;

    foreach my $player ($self->{'players'})
    {
        $player->hit($self->{'deck'}->fetchOneCardFromTop());
        $player->hit($self->{'deck'}->fetchOneCardFromTop());
        $player->setDealer($self);

    }

    foreach my $player ($self->{'players'})
    {
        while ($player->hitOrStand() eq "hit")
        {
            $player->hit($self->{'deck'}->fetchOneCardFromTop());
        }


    }

    while ($self->hitOrStand() eq "hit")
    {
        $self->hit($self->{'deck'}->fetchOneCardFromTop());
    }

    print "#"

    foreach my $player ($self->{'players'})
    {
#       TODO: handle score compara
    }
    print "\n";
}

sub hitOrStand(){
    my $self = shift;
    my @handValue = $self->getHandValue();
    if ($handValue[0] < 17)
    {
        $self->hit($self->{'deck'}->fetchOneCardFromTop());

    }
}

return 1;