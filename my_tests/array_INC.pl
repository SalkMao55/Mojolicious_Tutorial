#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
@INC
Array cque contiene la ubicacion de los modulos de perl dentro del equipo, normalmente es empleado al usar "use" u 
otra forma para acceder a un Modulo, ejemplo:

  use Mojolicious::Lite -signatures;

Perl buscara dentro de @INC si el modulo existe en alguno de sus directorios almacenados.
Podemos manipular el array dentro del codigo como otro array, solo tenemos que llamarlo como "@INC"
=cut

# Para mostrar un HASH en un JSON con la palabra clave "json", necesitamos mandar la REFERENCIA del HASH,
# NO el HASH mismo 
get '/inc' => sub ($c) {
  my %directories = (); # Hash que almacenara la informacion
  my $dir = \%directories; # Variable que almacenara la REFERENCIA del hash
  while ( my ($index,$value) = each @INC){ # Leemos el array @INC
    $dir->{$index}=$value;    # Obtenemos los directorios almacenados en INC
  }
  # print information like a JSON
  $c->render(json => $dir); # Imprimimos el HASH como JSON por medio de su REFERENCIA
};

app->start;