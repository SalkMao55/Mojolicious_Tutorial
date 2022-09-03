use Mojolicious::Lite -signatures;

# param: Nos permite acceder a los parametros de GET o POST del Request

# /foo?user=sri
get 'foo'=> sub ($c) {
    my $user = $c->param('user');# "param" nos permite acceder a los parametros del Request
    $c->render(text=>"Hello $user.");
};
# Esta Route puede ser expresado en una sola linea, los () despues del "get" no son necesarios
# get ('foo', sub ($c) { my $user = $c->param('user'); print "Entro==>>\n"; $c->render(text=>"Hello $user."); });

app->start;