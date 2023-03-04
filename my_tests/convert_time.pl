#!/usr/bin/perl

use Time::Local qw/timelocal_posix timelocal/;
use POSIX qw/strftime/;

# $date is "1998"-06-03" (YYYY-MM-DD form).
my $date = "1998-06-03 13:23:04";
my ($yyyy,$MM,$dd,$hh,$mm,$ss) = ( $date =~ /(\d+)-(\d+)-(\d+)\s(\d+):(\d+):(\d+)/ );
print "($yyyy,$MM,$dd,$hh,$mm,$ss)\n";
my $timestamp = timelocal($ss,$mm,$hh,$dd,($MM-1),($yyyy));
print "TIME in seconds = $timestamp\n";
my $formatTime = strftime "%Y-%m-%d %H:%M:%S", localtime($timestamp);
print "TIME FORMAT ===> $formatTime\n";
$formatTime = strftime "%Y-%m-%d %H:%M:%S", localtime($timestamp+3600);
print "TIME FORMAT plus one hour===> $formatTime\n";
print "#" x 15, "\n";
my $current = time;
print "Value \$current ==> $current\n";
print "Value after convertion ===> ",timelocal_posix(localtime($current)),"\n";
print "Values with localtime ===> ",localtime($current),"\n";