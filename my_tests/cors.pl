#!/usr/bin/perl -w                                                                                                                                                                                 

use Mojolicious::Lite;
use Mojo::Util 'secure_compare';

=pod
For testing:
curl -v -X OPTIONS -H 'Origin: site.tld' -H 'Access-Control-Request-Method: POST' http://localhost:3000/users/login
=cut

options '*' => sub {
    my $c = shift;
    my $origin = $c->req->headers->origin;
    say "OPTION ORIGIN: $origin";


    $c->res->headers->header('Access-Control-Allow-Origin' => $origin);
    $c->res->headers->header('Access-Control-Allow-Credentials' => 'true');
    $c->res->headers->header('Access-Control-Allow-Methods' => 'GET, OPTIONS, POST, DELETE, PUT');
    $c->res->headers->header('Access-Control-Allow-Headers' => 'Content-Type');
    #$c->res->headers->header('Access-Control-Max-Age' => '1728000');                                                                                                                              

    $c->respond_to(any => { data => '', status => 200 });

};

post '/users/login' => sub {
    my $c = shift;

    print "GET found\n";
    $c->render(text => 'Hello!')

        if secure_compare $c->req->url->to_abs->userinfo, 'Bender:rocks';

    $c->res->headers->www_authenticate('Basic');
    $c->render(text => 'Authentication required!', status => 401);
};


app->hook(after_dispatch => sub {
    my $c = shift;
    my $origin = $c->req->headers->origin;
    say "HOOK ORIGIN: $origin";

    $c->res->headers->header('Access-Control-Allow-Origin' => $origin);
          });

app->secrets(['My very secret passphrase.']);
app->start;