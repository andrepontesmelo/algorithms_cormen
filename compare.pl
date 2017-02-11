#!/usr/bin/perl
# Usage: ./compare.pl N
# It will run both solutions: nlogn and squared for a random array of size N.
# Where Where N is the array size to be tested.
# e.g.: ./compare.pl 1000
#
# For inputs smaller then 120 elements, the squared algorithm is faster.

use strict;
use warnings;
use File::Basename qw(dirname);
use Time::HiRes qw(gettimeofday);
use Cwd qw(abs_path);
use lib ( dirname abs_path $0) . '/lib';
use MaxSumUtil qw(create_random_array);

sub test {
  my $script = shift;
  my $array_ref = shift;
  my @array = @{$array_ref};
  my $start = Time::HiRes::gettimeofday();
  my $t      = system $script, @array;
  my $end = Time::HiRes::gettimeofday();
  printf("Test $script took %.1fms\n", ($end - $start)*100);
}

my $base_path = ( dirname abs_path $0);
my $script_squared = $base_path . '/maxsum_squared.pl';
my $script_nlogn = $base_path . '/maxsum_nlogn.pl';
my @array = create_random_array(@ARGV);
test($script_nlogn, \@array);
test($script_squared, \@array);
