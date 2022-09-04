#!/usr/bin/env perl

use Mojolicious::Lite;

=pod
Wildcard Placeholders
Wildcard placeholders allow matching absolutely everything, including / and ., similar to the regular expression (.+).
=cut


# /hello/test
# /hello/test123
# /hello/test.123/test/123
get '/hello/*you' => 'groovy';

# The above line is the abbreviation of the following route:
# get '/hello/*you' => sub {
#   my $c = shift @_;
#   $c->render(template => 'groovy');
# };

app->start;
__DATA__

@@ groovy.html.ep
Your name is <%= $you %>