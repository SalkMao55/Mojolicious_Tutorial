#!/usr/bin/env perl

use Mojolicious::Lite -signatures;
use Mojo::Headers;

=pod
@INC
Array cque contiene la ubicacion de los modulos de perl dentro del equipo, normalmente es empleado al usar "use" u 
otra forma para acceder a un Modulo, ejemplo:

  use Mojolicious::Lite -signatures;

Perl buscara dentro de @INC si el modulo existe en alguno de sus directorios almacenados.
Podemos manipular el array dentro del codigo como otro array, solo tenemos que llamarlo como "@INC"
=cut

my $headers = Mojo::Headers->new;
$headers->access_control_allow_origin('test');

# Para mostrar un HASH en un JSON con la palabra clave "json", necesitamos mandar la REFERENCIA del HASH,
# NO el HASH mismo 
get '/inc/directorios' => sub ($c) {
  print "Este es mi path ".$c->req->url->to_abs->path,"\n";
  my ($match) = $c->req->url->to_abs->path =~ /\/inc\/(\w+)/;
  print "Este es el match === $match \n";
  my %directories = (); # Hash que almacenara la informacion
  my $dir = \%directories; # Variable que almacenara la REFERENCIA del hash
  while ( my ($index,$value) = each @INC){ # Leemos el array @INC
    $dir->{$index}=$value;    # Obtenemos los directorios almacenados en INC
  }
  $dir->{success}=\1;

  # print information like a JSON
  $c->render(json => $dir); # Imprimimos el HASH como JSON por medio de su REFERENCIA
};

# Hook before dispatch para recibir los request antes de ser procesados por el ruteo

app->hook(before_dispatch  => sub {
    my $c = shift;
    my $origin = $c->req->headers->origin;
    say "OPTION ORIGIN: $origin";


    #$c->res->headers->header('Access-Control-Allow-Origin' => "htttp://test.com:3002");
    # $c->res->headers->header('Access-Control-Allow-Credentials' => 'true');
    # $c->res->headers->header('Access-Control-Allow-Methods' => 'GET, OPTIONS, POST, DELETE, PUT');
    # $c->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type');
    #$c->res->headers->header('Access-Control-Max-Age' => '1728000');                                                                                                                              

    #$c->respond_to(any => { data => '', status => 200 });
});

app->hook(after_dispatch => sub {
    my$c = shift;
    my $origin = $c->req->headers->origin;
    say "HOOK ORIGIN: $origin";

    #$c->res->headers->header('Access-Control-Allow-Origin'=> '*');
});

app->secrets(['My very secret passphrase.']);
app->start;
