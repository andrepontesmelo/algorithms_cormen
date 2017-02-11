package MaxSum::NLogN;

use Exporter qw(import);
use MaxSum::Squared qw(find_max_sub_array_part);

our @EXPORT_OK = qw(find_max_sub_array);

# O(n)
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

    return ( $max_left, $max_right, $left_sum + $right_sum );
}

# O(n*log(n))
sub find_max_sub_array_rec {
    my $a_ref = shift;
    my $low   = shift;
    my $high  = shift;

    my @a = @{$a_ref};
    if ( $low == $high ) {
        return ( $low, $high, $a[$low] );
    }
    else {
        if (($high - $low) < 120) {
          return MaxSum::Squared::find_max_sub_array_part($a_ref, $low, $high);
        } else
        {
          my $mid = int( ( $low + $high ) / 2 );
          my @solution_left  = find_max_sub_array_rec( \@a, $low,     $mid );
          my @solution_right = find_max_sub_array_rec( \@a, $mid + 1, $high );
          my @solution_cross = find_max_crossing_sub_array( \@a, $low, $mid, $high );
          my $left_low   = $solution_left[0];
          my $left_high  = $solution_left[1];
          my $left_sum   = $solution_left[2];
          my $right_low  = $solution_right[0];
          my $right_high = $solution_right[1];
          my $right_sum  = $solution_right[2];
          my $cross_low  = $solution_cross[0];
          my $cross_high = $solution_cross[1];
          my $cross_sum  = $solution_cross[2];

          if ( $left_sum >= $right_sum and $left_sum >= $cross_sum ) {
              return @solution_left;
          }
          elsif ( $right_sum >= $left_sum and $right_sum > $cross_sum )
            {
              return @solution_right;
          }
          else {
              return @solution_cross;
          }
      }
    }
}

sub find_max_sub_array {
  my $i_ref = shift;
  my @i = @{$i_ref};
  return find_max_sub_array_rec($i_ref, 0, $#i);
}

1;
