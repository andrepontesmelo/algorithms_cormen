package MaxSum::Squared;

use Exporter qw(import);

our @EXPORT_OK = qw(find_max_sub_array find_max_sub_array_part);

sub max_solution {
    my $sum     = shift;
    my $init    = shift;
    my $end     = shift;
    my $max_ref = shift;
    my @max     = @{$max_ref};

    if ( $sum > $max[2] ) {
        return ( $init, $end, $sum );
    }

    return @max;
}

sub find_max_sub_array_part {
    my $i_ref      = shift;
    my $init_array = shift;
    my $end_array  = shift;

    my @i = @{$i_ref};
    my @solution = ( 0, 0, 0 );
    foreach my $init ( $init_array .. $end_array ) {
        my $sum = 0;

        foreach my $end ( $init .. $#i ) {
            $sum += $i[$end];
            @solution = max_solution( $sum, $init, $end, \@solution );
        }
    }

    return @solution;
}

sub find_max_sub_array {
    my $i_ref = shift;
    my @i     = @{$i_ref};

    return find_max_sub_array_part( $i_ref, 0, $#i );
}

1;
