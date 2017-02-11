#!/usr/bin/perl
# Time Complexity: O(n^2)
use strict;
use warnings;

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib (dirname abs_path $0) . '/lib';
use MaxSumUtil qw(print_solution);

sub max_solution {
  my $sum = shift;
  my $init = shift;
  my $end = shift;
  my $maxSum = shift;
  my $maxInit = shift;
  my $maxEnd = shift;

  if ($sum > $maxSum) {
    $maxSum = $sum;
    $maxInit = $init;
    $maxEnd = $end;
  }

  return ($maxSum, $maxInit, $maxEnd);
}

my @i = (13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7);
my @solution = (0, 0, 0);
foreach my $init (0..$#i) {
  my $sum = 0;

  foreach my $end ($init..$#i) {
    $sum += $i[$end];
    @solution = max_solution($sum, $init, $end, @solution);
  }
}

print_solution @solution;
