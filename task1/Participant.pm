use strict;
use warnings;
package Participant;


sub new {
    my $class = shift @_;
    my $name = shift @_;
    my @cards = ();
    return bless { 'name' => $name, 'cards' => @cards }, $class;
}

sub hit() {
    my $participant = shift @_;
    my $card = shift @_;
    push $participant->{"cards"}, $card
}

sub stand() {
    my $participant = shift @_;
    print $participant->{"name"}, " stand.\n";
    return 1;
}


sub displayHand() {
    my $participant = shift @_;
    my $count = 0;
    for my $card ($participant->{"cards"})
    {
        print $card;
        $count++;
        print " " if $count < $participant->{"cards"};

    };
}

sub getHandValue(){
    my $participant = shift @_;
    my @handValue = (0, 0);
    for my $card ($participant->{"cards"})
    {
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


sub dropAllCards() {
    my $participant = shift @_;
    $participant->{"cards"} = ();

}
return 1;