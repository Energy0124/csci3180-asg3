# CSCI3180 Principles of Programming Languages
#
# --- Declaration ---
#
# I declare that the assignment here submitted is original except for source
# material explicitly acknowledged. I also acknowledge that I am aware of
# University policy and regulations on honesty in academic work, and of the
# disciplinary guidelines and procedures applicable to breaches of such policy
# and regulations, as contained in the website
# http://www.cuhk.edu.hk/policy/academichonesty/
#
# Assignment 3
# Name : Ling Leong
# Student ID : 1155062557
# Email Addr : lling5@cse.cuhk.edu.hk


use strict;
use warnings;
package Participant;


sub new {
    my $self = shift @_;
    my $name = shift @_;
    my @cards = ();
    return bless { 'name' => $name, 'cards' => \@cards }, $self;
}

sub hit {
    my $self = shift @_;
    my $card = shift @_;
    push $self->{"cards"}, $card
}

sub stand {
    my $self = shift @_;
    print $self->{"name"}, " stand.\n";
    return "stand";
}


sub displayHand {
    my $self = shift @_;
    #    my $count = 0;
    #    print "#";
    #    foreach my $card (@{$self->{"cards"}})
    #    {
    #        print $card;
    #        $count++;
    #        print " " if $count < $self->{"cards"};
    #
    #    };

    print "#", $self->{"name"}, " ", join( ' ', @{$self->{"cards"}} ), "\n";
}

sub getHandValue{
    my $self = shift @_;
    my @handValue = (0, 0);
    foreach my $card (@{$self->{"cards"}})
    {
        #        print $card, "\n";
        if ($card eq 'A') {
            $handValue[0] += 1;
            $handValue[1] += 1;

        } elsif ($card eq 'J' || $card eq 'Q' || $card eq 'K')
        {
            $handValue[0] += 10;
        } else {
            $handValue[0] += $card
        }
    };
    return @handValue;
}


sub dropAllCards {
    my $self = shift @_;
    $self->{"cards"} = ();

}

sub getBestHandValue{
    my $self = shift;
    my @handValue = $self->getHandValue();
    my $tempHandValue = $handValue[0];
    my $aCount = $handValue[1];
    while ($tempHandValue + 10 <= 21 && $aCount > 0)
    {
        $tempHandValue += 10;
        $aCount--;
    }
    return $tempHandValue;
}

sub is21{
    my $self = shift;
    my $bestValue = $self->getBestHandValue();
    my @handValue = $self->getHandValue();
    my $hardValue = $handValue[0];

    if ($hardValue == 21) {
        return "hard";

    } elsif ($bestValue == 21 && $hardValue <= 21) {
        return "soft";
    }
    return 0;
}

sub getHardValue {
    my $self = shift;
    my @handValue = $self->getHandValue();
    return $handValue[0];
}

sub isBursted {
    my $self = shift;
    my @handValue = $self->getHandValue();
    return $handValue[0] > 21;
}

sub getAceNumber {
    my $self = shift;
    my @handValue = $self->getHandValue();
    return $handValue[1];
}

sub printTotalValue{
    my $self = shift;
    my @handValue = $self->getHandValue();
    my $hardValue = $handValue[0];
    my $aCount = $handValue[1];
    print "Hard value: ", $hardValue, "\n";
    if ($hardValue > 21) {
        print "Bursted: ", $hardValue, "\n";

    } else {
        print "Best value: ", $self->getBestHandValue(), "\n";

    }
}
return 1;