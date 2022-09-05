#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Content negotiation
For resources with different representations and that require truly RESTful content negotiation you can also use 
"respond_to" in Mojolicious::Plugin::DefaultHelpers.
=cut

# /hello (Accept: application/json)
# /hello (Accept: application/xml)
# /hello.json
# /hello.xml
# /hello?_format=json
# /hello?_format=xml
get '/hello' => [format => ['json','xml']] => {format => undef} => sub ($c) {
  $c-> respond_to( # Content negotiation
    json => {json => {hello => 'world'}},
    xml  => {text => '<hello>world</hello>'},
    any  => {data => '', status => 204}
  );
};

# MIME type mappings can be extended or changed easily with "types" in Mojolicious.
# app->types->type(rdf => 'application/rdf+xml');


app-start;