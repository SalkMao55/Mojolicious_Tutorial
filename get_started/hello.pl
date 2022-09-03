
use Mojolicious::Lite; # Usar version ligera del framework

# Realizar al recibir metodo GET con el path raiz: Lanza RESPONSE con el mensaje indicado 
get '/' => {text => 'I ♥ Mojolicious!'};

# iniciciar la aplicacion
app->start;
