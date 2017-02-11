package MaxSumUtil;

use Exporter qw(import);

our @EXPORT_OK = qw(print_solution);

sub print_solution {
  my $max_left = shift;
  my $max_right = shift;
  my $sum = shift;

  print "Max sum is $sum from $max_left to $max_right\n";
}

1;
