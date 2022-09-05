#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Format
Formats can be automatically detected from file extensions like .html, they are used to find the right template and 
generate the correct Content-Type header. Use a restrictive placeholder to declare the possible values.

Note:
The default format is html and the renderer will fall back to when necessary.

TEST
  morbo ./formats.pl
=cut

# EXAMPLE 1

# /detection.html
# /detection.txt
get '/detection' => [format => ['html', 'txt']] => sub ($c) { # http_method path => format_restrictions => subrutine
  $c->render(template => 'detected');
};

# EXAMPLE 2
# And just like with placeholders you can use a default value to make the format optional.

# /hello        => OUTPUT {"hello":"world!"}
# /hello.json   => OUTPUT {"hello":"world!"}
# /hello.txt    => OUTPUT 'hello world'
# sintaxis: http_method path => format_restrictions => defualt_formats => subrutine (args) {...}
get '/hello' => [format => ['json', 'txt']] => {format => 'json'} => sub ($c) {
  return $c->render(json => {hello => "world!"}) if $c->stash('format') eq 'json';
  $c->render(text => 'hello world');
};

app->start;
__DATA__

@@ detected.html.ep
<html>
  <head><title>Detected</title></head>
  <body>HTML was detected.</body>
</html>

@@ detected.txt.ep
TXT was detected
