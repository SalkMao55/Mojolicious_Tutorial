#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Helpers
Son pequeñas funciones que puedes crear con la palabra clave "helper" en "Mojolicious::Lite" y reusadas a traves de 
toda tu aplicacion, incluyendo acciones y templates.
=cut

# Un helper para identificar a los visitantes
helper whois => sub ($c) {
    my $agent = $c->req->headers->user_agent || 'Anonymous';    # Obtener el usuario
    my $ip    = $c->tx->remote_address;                         # Obtener IP
    return "$agent ($ip)"; # Retorna STRING
};

# Usar HELPER en un "action" y un "template"
get '/secret' => sub ($c) {                     # Ejemplo de action
    my $user = $c->whois;                       # Llamamos al Helper
    $c->app->log->debug("Request from $user");  # Mostrar resultado en el log
};# Al no colocar donde dirigirse por "render" busca "template" con el mismo path del "route", en este caso "secret"

app->start;
__DATA__

# Ejemplo en template, NOTA: No agregar comentarios al lado de la defincion del primer TEMPLATE, si no, no ubica el template 
@@ secret.html.ep
We know who you are <%= whois %>.