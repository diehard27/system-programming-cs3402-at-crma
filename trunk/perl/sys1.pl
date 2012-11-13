#!/usr/bin/perl
@files = qx(ls /proc);
#print @files;
my $i=0;
foreach my $f (@files) {
  print "$i : $f";
  $i++;
}
