#!/usr/bin/env perl

use Mojolicious::Lite; # without "-signatures" because we aren't using $c Mojolicious::Controller object 

=pod
Relaxed Placeholders
Relaxed placeholders allow matching of everything until a / occurs, similar to the regular expression ([^/]+).
=cut

# /hello/test
# /hello/test.html
get '/hello/#you' => 'groovy';

# The above line is the abbreviation of the following route:
# get '/hello/#you' => sub {
#   my $c = shift @_;
#   $c->render(template => 'groovy');
# };


app->start;
__DATA__

@@ groovy.html.ep
Your name is <%= $you %>: