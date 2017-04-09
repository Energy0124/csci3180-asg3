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
    } else {
        $self->useBlackMagic($enemy);
    }
}

1;