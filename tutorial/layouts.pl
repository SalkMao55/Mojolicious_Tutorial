#!/usr/bin/env perl

use Mojolicious::Lite;

=pod
Layouts
Los "templates" tambien pueden tener "layouts", solo debes seleccionar uno con el helper "layout" en 
"Mojolicious::Plugin::DefaultHelpers" y colocar el resultado del "actual template" con el helper "content"
en "Mojolicious::Plugin::DefaultHelpers"
=cut

#get '/with_layout' => sub ($c) {
#    $c->render(template => '/with_layout');
#};

# Abreviation of above route 
get '/with_layout';

app->start;
__DATA__

# Esto es el template
@@ with_layout.html.ep
% title 'Green';  # stash o helper "title" puede ser usado para pasar informacion adicionel al layout
% layout 'green';
Hello World!


@@ layouts/green.html.ep  # Esto es el layout, todo comentario arriba de esta linea y hasta "Hello World!" lo toma como contenido del template
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>