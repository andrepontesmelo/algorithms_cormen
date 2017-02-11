package MaxSumUtil;

use Exporter qw(import);

our @EXPORT_OK = qw(print_solution create_random_array);

sub print_solution {
  my $max_left = shift;
  my $max_right = shift;
  my $sum = shift;

  print "Max sum is $sum from $max_left to $max_right\n";
}

sub create_random_array {
  my $elements = shift;
  return map { rand } ( 1..$elements );
}
1;
