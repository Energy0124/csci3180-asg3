use strict;
use warnings;
package Dealer;
use parent("Participant");
require Deck;

sub new {
    my $self = shift;
    my $name = shift;
    my $dealer = $self->SUPER::new($name);
    my $players = shift;
    #    my @players = @{$players};
    my $deck = Deck->new();
    $deck->shuffle();
    #    $dealer->{'players'}=\@players;
    $dealer->{'players'} = $players;
    $dealer->{'deck'} = $deck;
    return bless $dealer, $self;
}

sub start{
    my $self = shift;
    print "Deal two cards to all players\n";
    print "Cards in all players' hand\n";

    foreach my $player (@{$self->{'players'}})
    {
        $player->hit($self->{'deck'}->fetchOneCardFromTop());
        $player->hit($self->{'deck'}->fetchOneCardFromTop());
        $player->setDealer($self);
        print "Player ", $player->{"name"}, "\n";
        print join( ', ', @{$player->{"cards"}} ), "\n";

    }

    $self->hit($self->{'deck'}->fetchOneCardFromTop());
    $self->hit($self->{'deck'}->fetchOneCardFromTop());
    print "Dealer ", $self->{"name"}, "\n";
    print join( ', ', @{$self->{"cards"}} ), "\n";

    foreach my $player (@{$self->{'players'}})
    {
        print "Player ", $player->{"name"}, "'s Turn:\n";

        while ($player->hitOrStand() eq "hit")
        {
            my $card = $self->{'deck'}->fetchOneCardFromTop();
            $player->hit($card);
            print $player->{"name"}, " received a card ",$card,"\n";
            print "Cards in hand: ",join( ', ', @{$player->{"cards"}} ), "\n";


        }

    }
    print "Dealer ", $self->{"name"}, "'s Turn:\n";

    while ($self->hitOrStand() eq "hit")
    {
        my $card = $self->{'deck'}->fetchOneCardFromTop();

        $self->hit( $card);
        print $self->{"name"}, " received a card ",$card,"\n";
        print "Cards in hand: ",join( ', ', @{$self->{"cards"}} ), "\n";
    }

    print "#";

    foreach my $player (@{$self->{'players'}})
    {
        #       TODO: handle score compara
    }
    print "\n";
}

sub reset{
    my $self = shift;

    foreach my $player (@{$self->{'players'}})
    {
        @{$player->{"cards"}} = ();

    }
    my $deck = Deck->new();
    $self->{"deck"} = $deck->shuffle();

}

sub hitOrStand(){
    my $self = shift;
    my @handValue = $self->getHandValue();
    if ($handValue[0] < 17)
    {
       return "hit"

    } else
    {
        return "stand"
    }
}

return 1;