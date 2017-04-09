package HumanPlayer;
use strict;
use warnings;
use parent("Player");

our $msg = "Error! Print message not set!";
our $choice = 'Error: Something is wrong!';

sub new {
    my $self = shift @_;
    my $name = shift @_;
    my $player = $self->SUPER::new($name);
    return bless $player, $self;
}

sub attack{
    my $self = shift @_;
    my $enemy = shift @_;
    local $choice;
    $self->getInput();
    if ($choice eq 's') {
        $self->attackWithSword($enemy);
    } elsif ($choice eq 'b') {
        $self->useBlackMagic($enemy);

    }else{
        local $msg = $choice;
        printLine();
    }
}

sub getInput{
    my $self = shift @_;
    local $msg;
    $msg = "'s' to attack with sword, 'b' to attack with black magic";
    printLine();
    my $input = <STDIN>;
    chomp $input;
    while($input ne 's' && $input ne 'b'){
        $msg = "Invalid input, please input again!";
        printLine();
        $msg = "'s' to attack with sword, 'b' to attack with black magic";
        printLine();
        $input = <STDIN>;
        chomp $input;
    }
    $choice = $input;

}

sub printLine {
    print $msg, "\n";
}


1;