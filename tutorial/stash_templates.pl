use Mojolicious::Lite -signatures;

=pod
STASH
Es una estructura de "Mojolicious::Controller" usada para pasar DATOS a un "template", 
    esta informacion puede ser agregada a la seccion DATA (__DATA__). Algunos valores del stash son RESERVADOS:
    * template
    * text
    * data
    siendo usados por "render" para decidir como el "Response" deberia ser generado.
=cut

# Route leading to an action that renders a template
get '/foo' => sub ($c) {
    # STASH con valores a mostrar en la seccion de datos
    $c->stash( one => "27",
               name => "Salomon");
    $c->render(template => 'magic', two => 28); 
};

# Comenzar aplicacion
app->start;
__DATA__

@@ magic.html.ep
Los numeros magicos son <%= $one %> y <%= $two %>, mientras que el usario es <%=$name%>