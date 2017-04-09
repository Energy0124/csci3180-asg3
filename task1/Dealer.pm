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
        $player->printTotalValue();

    }

    $self->hit($self->{'deck'}->fetchOneCardFromTop());
    $self->hit($self->{'deck'}->fetchOneCardFromTop());
    print "Dealer ", $self->{"name"}, "\n";
    print join( ', ', @{$self->{"cards"}} ), "\n";
    $self->printTotalValue();

    foreach my $player (@{$self->{'players'}})
    {
        print "**********Player ", $player->{"name"}, "'s Turn**********\n";

        if (!$player->is21())
        {
            while ($player->hitOrStand() eq "hit")
            {
                my $card = $self->{'deck'}->fetchOneCardFromTop();
                $player->hit($card);
                print $player->{"name"}, " received a card ", $card, "\n";
                print "Cards in hand: ", join( ', ', @{$player->{"cards"}} ), "\n";
                $player->printTotalValue();
                if ($player->is21()) {
                    print "Reached 21!\n";
                    last;
                } elsif ($player->isBursted()) {
                    print "Bursted!\n";
                    last;
                }

            }
        } else
        {
            print "Reached 21!\n";

        }
        print $player->{"name"}, " chooses to stand.\n";
        print "Cards in hand: ", join( ', ', @{$player->{"cards"}} ), "\n";
        $player->printTotalValue();

    }
    print "**********Dealer ", $self->{"name"}, "'s Turn**********\n";

    while ($self->hitOrStand() eq "hit")
    {
        my $card = $self->{'deck'}->fetchOneCardFromTop();

        $self->hit( $card);
        print $self->{"name"}, " received a card ", $card, "\n";
        print "Cards in hand: ", join( ', ', @{$self->{"cards"}} ), "\n";
        $self->printTotalValue();
        if ($self->is21()) {
            print "Reached 21!\n";
            last;
        } elsif ($self->isBursted()) {
            print "Bursted!\n";
            last;
        }

    }
    print $self->{"name"}, " chooses to stand.\n";
    print "Cards in hand: ", join( ', ', @{$self->{"cards"}} ), "\n";
    $self->printTotalValue();

    print "Final hand of everyone:\n";

    foreach my $player (@{$self->{'players'}})
    {
        $player->displayHand();
    }
    $self->displayHand();
    print "Winner between the dealer and each player:\n";

    my @winner = ();
    foreach my $player (@{$self->{'players'}})
    {
        if (!$player->isBursted() && $self->isBursted()) {
            push @winner, $player->{"name"};
        } elsif (!$player->isBursted() && !$self->isBursted()
            && $player->getBestHandValue() > $self->getBestHandValue())
        {
            push @winner, $player->{"name"};

        } else
        {
            push @winner, $self->{"name"};
        }
    }
    print "#";
    print join( ' ', @winner );
    print "\n";
}

sub reset{
    my $self = shift;

    foreach my $player (@{$self->{'players'}})
    {
        @{$player->{"cards"}} = ();

    }
    @{$self->{"cards"}}=();
    my $deck = Deck->new();
    $deck->shuffle();
    $self->{"deck"} = $deck;

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