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


sub displayInfo {
    my $self = shift @_;
    print $self->{"name"}, ":\n";
    print "HP: ", $self->{"hp"}, "\n";
    print "DP: ", $self->{"dp"}, "\n";
}


1;