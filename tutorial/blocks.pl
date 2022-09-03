#!/usr/bin/env perl

use Mojolicious::Lite;

=pod
 Blocks
 Los "template blocks" pueden ser usados como funciones normales de PERL y son siempre delimitados por 
 las palabras clave "begin" y "end", estos son las BASES de muchos "helpers"
=cut

get '/with_block' => 'block';

app->start;
__DATA__

@@ block.html.ep
% my $link = begin
    % my ($url,$name) = @_;
    Try <%= link_to $url => begin %><%= $name %><% end %>.
% end
<!DOCTYPE html>
<html>
  <head><title>Sebastians frameworks</title></head>
  <body>
    %= $link->('http://mojolicious.org', 'Mojolicious')
    %= $link->('http://mojojs.org', 'mojo.js')
  </body>
</html>