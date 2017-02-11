#!/usr/bin/perl
use strict;
use warnings;

use constant MAX_SIZE_SQUARED_ALGORITHM => 120;

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib ( dirname abs_path $0) . '/lib';
use MaxSumUtil qw(print_solution create_random_array);
use MaxSum::NLogN qw(find_max_sub_array);
use MaxSum::Squared qw(find_max_sub_array);

my @array = create_random_array(@ARGV);
my $array_size = @array;
my @result =
  $array_size <  @{[MAX_SIZE_SQUARED_ALGORITHM]}
  ? MaxSum::Squared::find_max_sub_array( \@array )
  : MaxSum::NLogN::find_max_sub_array( \@array );

print_solution @result;
