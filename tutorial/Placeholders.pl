#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Placeholders
Route placeholders allow capturing parts of a request path until a / or . separator occurs, similar to the regular 
expression ([^/.]+). Results are accessible via "stash" in Mojolicious::Controller and "param" in 
Mojolicious::Controller.

To separate them from the surrounding text, you can surround your placeholders with < and >, which also makes the 
colon prefix optional.
=cut

# STASH EXAMPLE
# /foo/test
# /foo/test123
get '/foo/:bar' => sub ($c) {
  my $bar = $c->stash('bar');
  $c->render(text => "Our :bar placeholder matched \" $bar \"");
}; # OUTPUT:  Our :bar placeholder marched " test123 "

# PARAM EXAMPLE
# /testsomething/foo
# /test123something/foo
get '/<:bar>something/foo' => sub ($c) {
  my $bar = $c->param('bar');
  $c->render(text => "Our :bar placeholder marched \" $bar \""); 
}; # OUTPUT:  Our :bar placeholder marched " test123 "

app->start;