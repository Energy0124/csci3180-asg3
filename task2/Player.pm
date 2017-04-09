package Player;
use strict;
use warnings;

sub new {
    my $self = shift @_;
    my $name = shift @_;
    my $hp = 2000;
    my $dp = 500;
    return bless { 'name' => $name, 'hp' => $hp, 'dp' => $dp }, $self;
}


sub attackWithSword {
    my $self = shift @_;
    my $enemy = shift @_;
    $enemy->{"hp"} -= 800 - $enemy->{"dp"};
}

sub useBlackMagic{
    my $self = shift @_;
    my $enemy = shift @_;
    $enemy->{"hp"} -= 600 - $enemy->{"dp"};
    my $rand = rand();
    if ($rand < 0.4) {
        $enemy->{"hp"} -= 1000 - $enemy->{"dp"};
    }
}

sub isDead {
    my $self = shift @_;
    if ($self->{"hp"} > 0) {
        return 0;
    } else {
        return 1;
    }
}


sub displayInfo{
    my $self = shift @_;
    print $self->{"name"}, ":\n";
    print "HP: ",$self->{"hp"}, "\n";
    print "DP: ",$self->{"dp"}, "\n";
}


1;