#!/usr/bin/perl
use strict;
use warnings;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib (dirname abs_path $0) . '/lib';
use MaxSumUtil qw(print_solution);
use Math::Round;

sub find_max_crossing_sub_array {
    my $a_ref = shift;
    my $low   = shift;
    my $mid   = shift;
    my $high  = shift;

    my @a         = @{$a_ref};
    my $max_left  = 0;
    my $max_right = 0;
    my $left_sum  = -inf;
    my $sum       = 0;
    for my $i ( reverse $low .. $mid ) {
        $sum += $a[$i];
        if ( $sum > $left_sum ) {
            $left_sum = $sum;
            $max_left = $i;
        }
    }

    my $right_sum = -inf;
    $sum = 0;
    for my $j ( $mid + 1 .. $high ) {
        $sum += $a[$j];
        if ( $sum > $right_sum ) {
            $right_sum = $sum;
            $max_right = $j;
        }
    }

    return ( $max_left, $max_right, $left_sum + $right_sum);
}

my @i = ( 13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7 );
my @result = find_max_crossing_sub_array( \@i, 0, round($#i / 2), $#i );
print_solution @result;
