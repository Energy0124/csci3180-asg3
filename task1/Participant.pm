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
    my $count = 0;
    print "#";
    foreach my $card (@{$self->{"cards"}})
    {
        print $card;
        $count++;
        print " " if $count < $self->{"cards"};

    };
}

sub getHandValue{
    my $self = shift @_;
    my @handValue = (0, 0);
    foreach my $card (@{$self->{"cards"}})
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


sub dropAllCards {
    my $self = shift @_;
    $self->{"cards"} = ();

}

sub getSoftHandValue{
    my $self = shift;
    my @handValue = $self->getHandValue();
    my $tempHandValue=$handValue[0];
    my $aCount=$handValue[1];
    while ($tempHandValue<21&&$aCount>0)
    {
        $tempHandValue+=10;
        $aCount--;
    }
    return $tempHandValue;
}
return 1;