use POSIX   qw( strftime );

my %timestamp_formats = (
        data  => '%B %d, %Y <span>%H:%M</span>',
        wordy => '%A, %B %d, %Y at %H:%M',
    );


sub convert_timestamp {
    my $timestamp = shift 
                 // time();
    my $type      = shift;

    my $format = $timestamp_formats{ $type } 
              // "%D/%m/%Y";

    return strftime( $format, gmtime( $timestamp ) );
}
