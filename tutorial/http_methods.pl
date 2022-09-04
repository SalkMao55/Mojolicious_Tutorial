#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
HTTP methods
Routes can be restricted to specific request methods with different keywords like "get" in Mojolicious::Lite and 
"any" in Mojolicious::Lite.
=cut

# GET /hello
get '/hello' => sub ($c) {
  $c->render(text => "Hello World!");
};

# PUT /hello
put '/hello' => sub ($c) {
  my $size = length $c->req->body;                            # Get length or number of characters
  $c->render(text => "You uploaded $size bytes to /hello.");  # Print message
};

# GET|POST|PATCH /bye
any ['GET','POST','PATCH'] => '/bye' => sub ($c) {   # any_http_method[array_options] => path => subrutine (args) {...}
  $c->render(text => "Bye World!");
};

# * /whatever
any '/whatever' => sub ($c) { # It Route Accepts all HTTP methods.
  my $method = $c->req->method;
  $c->render(text => "You called /whatever with $method.")
};

app->start;