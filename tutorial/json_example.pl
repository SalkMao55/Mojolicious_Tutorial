#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
JSON is the most commonly used data-interchange format for web services. Mojolicious loves JSON 
and comes with the possibly fastest pure-Perl implementation Mojo::JSON built right in, 
which is accessible through "json" in Mojo::Message as well as the reserved stash value json.

TEST
./json_example.pl get -M PUT -c '{"message":"Hello Mojo!"}' /reverse
=cut

# Modify the received JSON document and return it
put '/reverse' => sub ($c) {    # Catch PUT HTTP method and reverse the request's JSON. 
    my $hash = $c->req->json;   # Get JSON from Request and returns a HASH reference
    # my @algo = keys %{$hash}; # This get keys from hash formed with reference
    #print "RETURNS THIS reference =======> $hash  \n";
    $hash->{message} = reverse $hash->{message}; # Reverse Anonymous HASH VALUE, VALUE get by the key "message"
    $c->render(json => $hash);  # Send JSON to Response, this convert the HASH to JSON
    # OUTPUT ==> {"message":"!ojoM olleH"}
};

app->start;