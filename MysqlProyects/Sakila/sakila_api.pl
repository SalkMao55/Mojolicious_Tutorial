#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use Mojo::JSON qw(decode_json encode_json true false);
use DBIx::Connector; # Database Connection
use Data::Dumper; # Show structures, example: print (Dumper($response));

## Atribute in mojo
my $mysql_conn = mysql_conn();

get '/' => sub ($c) {
  $c->render(template => 'index');
};

get '/cities' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from city";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error al ejecutar";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row; 
  }
  # Build response
  $response->{data} = {
  	total => scalar @data,
	cities => \@data
  };
  $c->render(json => $response);
};

get '/countries' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from country";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error al ejecutar";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row; 
  }
  # Build response
  $response->{data} = {
  	total => scalar @data,
	  countries => \@data
  };
  $c->render(json => $response);
};

get '/categories' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from category";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error to execute Query";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row;
  }
  # Build response
  $response->{data} = {
    total => scalar @data,
    categories => \@data
  };
  $c->render(json => $response);
};

get '/languages' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from language";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error to execute Query";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row;
  }
  # Build response
  $response->{data} = {
    total => scalar @data,
    languages => \@data
  };
  $c->render(json => $response);
};

get '/stores' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from store";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error to execute Query";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row;
  }
  # Build response
  $response->{data} = {
    total => scalar @data,
    stores => \@data
  };
  $c->render(json => $response);
};

get '/films' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from film";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error to execute Query";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row;
  }
  # Build response
  $response->{data} = {
    total => scalar @data,
    films => \@data
  };
  $c->render(json => $response);
};

get '/actors' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from actor";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error to execute Query";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row;
  }
  # Build response
  $response->{data} = {
    total => scalar @data,
    actors => \@data
  };
  $c->render(json => $response);
};

get '/customers' => sub ($c) {
  # Define Response
  my $response = $c->response_str;
  # Array to save results
  my @data = ();
  # Build Query and Get information
  my $sql = "SELECT * from customer";
  my $sth = $mysql_conn->dbh->prepare($sql);
  $sth->execute() || die "Error to execute Query";
  # Get all values in an ARRAY of HASH References
  while (my $row = $sth->fetchrow_hashref) {
    push @data, $row;
  }
  # Build response
  $response->{data} = {
    total => scalar @data,
    customers => \@data
  };
  $c->render(json => $response);
};


############### HELPERS ####################
# Helper that return a HASH REF with the structure to return in every response.
helper response_str => sub ($c) {
 # This variable is equeal to the Reference fo the next HASH
 my $response_structure = {
	data => {},
    success => true,
	status => "OK" 
 };
 # If I returned a Reference, the code that works with this results will work with a double REFERENCE
 #   to work with only one REFERENCE, I returns this variable and not its Reference
 return $response_structure;
};

############### Subroutines ##########################
sub mysql_conn {
  my $self = shift;
  warn "Creating connection to MYSQL\n";
  my $dsn = "DBI:mysql:database=sakila;host=localhost;port=3306";
  my ($user,$pass) = ("root","mysql2022");
  # Create connection
  my $conn = DBIx::Connector->new($dsn,$user,$pass);
  # Return object connection
  return $conn;
}


app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
