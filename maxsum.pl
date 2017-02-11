#!/usr/bin/perl
# Time Complexity: O(n^2)
use strict;
use warnings;

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib ( dirname abs_path $0) . '/lib';
use MaxSumUtil qw(print_solution create_random_array read_input_array);

sub max_solution {
    my $sum     = shift;
    my $init    = shift;
    my $end     = shift;
    my $max_ref = shift;
    my @max = @{$max_ref};

    if ( $sum > $max[2] ) {
        return ($init, $end, $sum);
    }

    return @max;
}

sub find_max_sub_array {
    my $i_ref    = shift;
    my @i        = @{$i_ref};
    my @solution = ( 0, 0, 0 );
    foreach my $init ( 0 .. $#i ) {
        my $sum = 0;

        foreach my $end ( $init .. $#i ) {
            $sum += $i[$end];
            @solution = max_solution( $sum, $init, $end, \@solution );
        }
    }

    return @solution;
}

my @i = read_input_array;
my @solution = find_max_sub_array( \@i );
print_solution @solution;
