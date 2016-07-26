#!/usr/bin/perl
use strict;
use warnings;
open (my $f, "<","hosts2scan");
while (my $line = <$f>){
  my @list=split(',',$line);
  my $host=$list[0];
  print $host;
  my $counter=1;
  for my $port (@list){
    print `nmap $host -p$list[$counter]`;
  }
}
