#!/usr/bin/perl

# Flushing to STDOUT after each write
$| = 1;

use warnings;
use strict;
use IO::Socket::INET;

# Client side information
# Works by setting $dest to server address, needs to be on same domain
my $dest        = 'localhost';
my $port        = '7070';
my $proto    = 'tcp';

my $server = IO::Socket::INET->new (
    PeerHost    =>  $dest,
    PeerPort    =>  $port,
    Proto       =>  $proto,
) or die "Socket could not be created, failed with error: $!\n"; # Prints error code

print "TCP connection established!\n";

# read the socket data sent by server.
my $data = <$server>;
# we can also read from socket through recv()  in IO::Socket::INET
# $socket->recv($data,1024);
print "Received from Server : $data\n";

# open(my $fh, "<teach_programming.MP4")
#     or die "Can't open: $!";
# while(my $line = <$fh>) {
#     print $client $line;
# }
# close $fh;
# sleep(10);
$server->close();
