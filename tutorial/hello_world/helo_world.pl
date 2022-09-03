#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

# Request GET a raiz
get '/' => sub ($c) {
    # Response generado con "render"
    $c-> render(text => "Hello World!");
};

# Route leading to an action that renders some text
get '/foo' => sub ($c) {
    $c-> render(text => "Hello World!\nRuta foo");
};

app->start;
