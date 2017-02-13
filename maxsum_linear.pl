#!/usr/bin/perl
# Time Compĺexity: O(n)
use strict;
use warnings;
use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib ( dirname abs_path $0) . '/lib';
use MaxSumUtil qw(print_solution);
use MaxSum::Linear qw(find_max_sub_array);

my @i = @ARGV;
my @result = find_max_sub_array(\@i);
print_solution @result;
