package HumanPlayer;
use strict;
use warnings;
use parent("Player");

sub new {
    my $self = shift @_;
    my $name = shift @_;
    my $participant = $self->SUPER::new($name);
    return bless $participant, $self;
}

sub hitOrStand{
    my $self = shift @_;

    print  "Hit or stand: 'h' hit, 's' stand\n";
    my $input = <STDIN>;
    chomp $input;
    while($input ne 'h' && $input ne 's'){
        print BRIGHT_RED "Invalid input, please input again!\n";
        print  "Hit or stand: 'h' hit, 's' stand\n";
        $input = <STDIN>;
        chomp $input;
    }
    if($input eq 'h'){
        return "hit";
    }elsif($input eq 's'){
        return "stand";
    }else{
        return "error";
    }

}
1;