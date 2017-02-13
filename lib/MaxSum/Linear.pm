package MaxSum::Linear;

use Exporter qw(import);
our @EXPORT_OK = qw(find_max_sub_array);

sub find_max_sub_array {
    my $i_ref = shift;
    my @i     = @{$i_ref};

    my $max_ending_here = 0;
    my $max_so_far = 0;
    my $pos = 0;
    my $global_left = 0;
    my $global_right = 0;

    foreach $x (@i) {
      $pos++;
      if ($max_ending_here + $x > 0) {
        $max_ending_here = $max_ending_here + $x;
      } else {
        $max_ending_here = 0;
        $global_left = $pos;
      }

      if ($max_ending_here > $max_so_far) {
        $max_so_far = $max_ending_here;
        $global_right = $pos - 1;
      }
    }


    return ($global_left, $global_right, $max_so_far);
}

1;
