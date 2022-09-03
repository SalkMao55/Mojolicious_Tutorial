#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
 HTTP
 "req" in Mojolicious::Controller and "res" in Mojolicious::Controller give you full access to all HTTP features and information

 For test this script, add the next line in your command line
 ./req_res_http.pl get -v -M POST -c 'test' /echo

 Use the following line at the top of your "script" if you do not want to have any error with the above line in your
 command line:
    #!/usr/bin/env perl
=cut

# Acces request information
get '/agent' => sub ($c) {                                 # We received a GET Request with the path "/agent" 
    my $host = $c->req->url->to_abs->host;                 # Get host
    my $ua   = $c->req->headers->user_agent;               # Get user agent
    $c->render(text => "Request by $ua reached $host.");   # By "render", we say how the "Response" must be generated
};

# Echo the request body and send custom header with response
post '/echo' => sub ($c) {                                 # We received a POST Request with the path "/agent" 
    $c->res->headers->header('X-Bender' => 'Bite my shiny metal ass!'); # Add this "header" to Response
    $c->render(data => $c->req->body);               # Render "data" in the body of the response, in this case data = "test"
};

app->start;                                                # Start app