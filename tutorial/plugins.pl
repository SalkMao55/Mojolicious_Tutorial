#!/usr/bin/env perl

use Mojolicious::Lite -signatures; # signatures: Evita el warning de no usar "my" con objeto $c

=pod
Plugin
Los "plugins" son aplicaciones que ayudan a "compartir" y "organizar" codigo. Tu puedes cargar un plugin con la palabra
clave "plugin" en Mojolicious::Lite, el cual permite omitir usar el "nombre del plugin" desde 
Mojolicious::Plugin::_nombre_plugin, y opcionalmente provee la configuracion para el plugin.

Mojolicious::Plugin::Config 
Es un plugin el cual puede ser cargado desde "config" por medio de un "archivo de configuracion (.conf)" en Mojolicious.
Los plugins tambien puden cargar "routes", "hooks", "handlers", o incluso otros "plugins".

Puedes acceder a plugins desde una de las siguientes dos fuentes:
  1.- Mojolicious::Plugins (plugins incluidos en MOJO):https://docs.mojolicious.org/Mojolicious/Plugins#PLUGINS
  2.- CPAN (plugins fuera del nucleo de MOJO): https://metacpan.org/search?q=Mojolicious+Plugin
=cut

# Cargar la configuracion desde un archivo, si no, recurrir a "default" (carga un HASH).
plugin Config => {file => '/etc/myapp.conf', default => {foo => 'bar'}};

# Retorna valor configurado de "foo" o default, si no existe el archivo de configuracion
get '/foo' => sub ($c) {
  my $foo = $c->app->config('foo');   # Obtener el valor de foo
  $c->render(json => {foo => $foo});  # Generar Response como un JSON por medio del HASH
}; # OUT {foo: "bar"}

app->start;                           # Iniciar app