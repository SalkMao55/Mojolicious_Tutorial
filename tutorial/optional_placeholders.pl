#!/usr/bin/en perl

use Mojolicious::Lite -signatures;

=pod
Optional placeholders
All placeholders require a value, but by assigning them default values you can make capturing optional.
=cut


# /hello
# /hello/Sara
 # SINTAXIS:  method_HTTP path/placeholder => {options_placeolders} => subrutine (args) {...}
get '/hello/:name' => {name => 'Sebastian', day => 'Monday'} => sub ($c) { #placeholders saved in STASH 
  $c->render(template => 'groovy', format => 'txt'); # Template to use and templeate format
};

app->start;
__DATA__

@@ groovy.txt.ep
My name is <%= $name %> and it is <%= $day %>.