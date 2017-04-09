package AIPlayer;
use strict;
use warnings;
use parent("Player");

sub new {
    my $self = shift @_;
    my $name = shift @_;
    my $player = $self->SUPER::new($name);
    return bless $player, $self;
}

sub attack{
    my $self = shift @_;
    my $enemy = shift @_;
    my $rand = rand();
    if ($rand < 0.5) {
        $self->attackWithSword($enemy);
    }else{
        $self->useBlackMagic($enemy);
    }
}

1;