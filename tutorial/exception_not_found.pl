#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Built-in exception and not_found pages
Durante el "desarrollo" tu encontraras estas paginas donde quiera que cometas un error, estas son utiles
y contienen mucha informacion valiosa que te ayudara depuracion (debugging) de tu aplicacion

La informacion de estas paginas solo esta disponible durante el desarrollo y son sustituidas en el ambiente de produccion.

TEST
Usar la siguiente linea para realizar la prueba de este codigo
    
    ./exception_not_found.pl get /missing '#error'

Donde '#error' es un identificador de un ID en CSS, podemos identificar elementos HTML por medio de su ID con la misma sintaxis
que en CSS (Mojolicious::Command::get). Esto nos permite extraer solo la informacion que nos interesa.

Si corremos el comando anterior sin el argumento '#error' nos dara como resultado una gran pagina HTML con informacion 
del error ocurrido. El siguiente comando filtra este resultado:
    
    ./exception_not_found.pl get /missing | grep "id=\"error\""

    Donde nos dara el resultado filtrado de la pagina HTML:

                <pre id="error" class="error">Could not render a response at ./exception_not_found.pl line 15.
    
    Con esto podemos ver que el ID "error" si existe en pagina HTML del error.
=cut

# Not found (404)
get '/missing' => sub ($c) {
    $c->render(template => 'does_not_exist'); # Genera como Response el siguiente template
};

# Exception (500)
get '/dies' => sub { die "intentional error"};

app->start;