# expects:
#   $links_header - set to header text
#   $links - point to an array, which contains three elements per link, 
#     which is set in the meta file like so:
#       more_links  = http://sourceforge.net/projects/stickleback/
#       more_links  = stickleback project on sourceforge
#       more_links  = where to download stickleback, the plugin engine

if ( defined $links  &&  'ARRAY' eq ref( $links ) ) {
    my $count = 0;
    my $list;
    
    foreach my $link ( @{ $links } ) {
        my $url   = $link->{'url'};
        my $text  = $link->{'text'};
        my $extra = $link->{'extra'};
        
        if ( defined $url  &&  defined $text ) {
            $list .= "<li><em><a href='${url}'>${text}</a></em>";
            if ( defined $extra ) {
                $list .= "<span>&mdash;</span> ${extra}";
            }
            $list .= "</li>";
        }
    }
    
    if ( length $list > 0 ) {
        return <<HTML;
            <h2>${links_header}</h2>
            <ul class='links'>
            ${list}
            </ul>
HTML
    }
}
