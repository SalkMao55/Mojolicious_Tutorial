#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Route names
All routes can have a name associated with them, this allows automatic template detection and backreferencing 
with "url_for" in Mojolicious::Controller, on which many methods and helpers like "link_to" in 
Mojolicious::Plugin::TagHelpers rely.
=cut


# Render the template "index.html.ep"
get '/' => sub ($c) {
    $c->render;
} => 'index';

# Other format
# get '/' => sub ($c) {
#     $c->render(template => 'index');
# };

# Render the template "hello.html.ep"
get '/hello';

app->start;
__DATA__

@@ index.html.ep
<%= link_to Hello => 'hello' %>.
<%= link_to Reload => 'index' %>.

@@ hello.html.ep
Hello World!