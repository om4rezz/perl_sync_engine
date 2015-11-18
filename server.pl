#!/usr/bin/perl

# Display all the files in /tmp directory.
$dir = "/home/om4rezz/Desktop/sync_dir/*";
my $output;
my @files = glob( $dir );
foreach (@files ){
    @arr = split('/', $_);
    $size = @arr;
    $rdn = $arr[$size - 1];
    $output = $output . "$rdn,";
}

print "$output\n";
## END Omar

## Start Osama

# Flushing to STDOUT after each write
$| = 1;

use warnings;
use strict;
use IO::Socket::INET;
#use v5.10;

my ($peeraddress,$peerport);

# Server side information
my $ip_address = 'localhost';
my $listen_port  = '7070';
my $protocal     = 'tcp';


# Creating socket for server
my $server = IO::Socket::INET->new (
    LocalPort   => $listen_port,
    Proto       => $protocal,
    Listen      => 5,
    Reuse       => 1,
) or die "Socket could not be created, failed with error: $!\n"; # Prints error code
print    "Waiting for client connection on port $listen_port\n";

# Accept connection
while(1)
{
# waiting for new client connection.
my $client_socket = $server->accept();

# get the host and port number of newly connected client.
my $peer_address = $client_socket->peerhost();
my $peer_port = $client_socket->peerport();

print "Accepted New Client Connection From : $peeraddress, $peerport\n ";

# write operation on the newly accepted client.
print $client_socket "$output\n";
# we can also send the data through IO::Socket::INET module,
# $client_socket->send($data);

# read operation on the newly accepted client
################ $data = <$client_socket>;
# we can also read from socket through recv()  in IO::Socket::INET
# $client_socket->recv($data,1024);
################ print "Received from Client : $data\n";
}

$server->close();
#####
#####
#####

# open(my $fh, ">/tmp/geek.mp4")
#     or die "File can not be opened: $!";

# while (read($client_socket, my $data, 8192)) {
#     print $fh $data;
# }
# close $fh;
# $server->close();