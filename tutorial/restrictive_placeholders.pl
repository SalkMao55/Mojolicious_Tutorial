#!/usr/bin/env perl

use Mojolicious::Lite -signatures;

=pod
Restrictive placeholders
A very easy way to make placeholders more restrictive are alternatives, you just make a list of possible values.

TEST
For test this script and get regulars expressions of paths in routes:
    ./restrictive_placeholders.pl routes -v

Only to run Script
    morbo ./restrictive_placeholders.pl
=cut

# /test
# /123
any '/:foo' => [foo => ['test', '123']] => sub ($c) { # http_method path => placeholder_options => subrutine (args){...}
  my $foo = $c->param('foo');                        # Get placeholder from  Request with "param"
  $c->render(text => "Our :foo placeholder matched $foo");# Render result in text format
};

#All placeholders get compiled to a regular expression internally, this process can also be customized. 
#Just make sure not to use ^ and $, or capturing groups (...), non-capturing groups (?:...) are fine though.

# /test
# /123
any '/:bar' => [bar => qr/\d+/] => sub ($c) {
  my $bar = $c->param('bar');
  $c->render(text => "Our :bar placeholder matched $bar");
};
# You can take a closer look at all the generated regular expressions with the command Mojolicious::Command::routes.
# ./restrictive_placeholders.pl routes -v
#   RESULTS:
#       /:foo  ....  *  foo  ^/(test|123)
#       /:bar  ....  *  bar  ^/((?^u:\d+))

app->start;