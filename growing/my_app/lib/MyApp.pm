package MyApp;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Hooks
  $self->app->hook(before_render => sub {
    my $c = shift;
    my $args = shift;
    
    my $bytes = undef;

    return unless my $template = $args->{template};
    return unless $template eq 'not_found';

    print "ESTOS SON LOS ARCHIVOS:\n @{$c->app->static->paths}\n";
    my $asset = $c->app->static->file('error404.html');
    if($asset && $asset->is_file){
      print "Este es mi archivo ===> ".$asset->path."\n";
      # Obtener bytes
      $bytes = $asset->slurp;
    }
    $c->stash(data => $bytes);
  });

  # Normal route to controller
  $r->get('/')->to('Example#welcome'); # Abre /lib/MyApp/Controller/Example.pm # sub welcome {...}
}

1;
