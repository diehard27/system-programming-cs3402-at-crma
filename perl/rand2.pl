print "Please enter 6-digit number: ";
$yournum = <STDIN>;
my $random = rand(1000000);
my $first = sprintf("%06d", $random);
my $last3 = sprintf("%03d", rand(1000));
my $last2 = sprintf("%02d", rand(100));
print "First Prize = $first", "\n";
print "Last 3 Prize = $last3", "\n";
print "Last 2 Prize = $last2", "\n";
if ($yournum==$first) {
  print "!!!You have won the first prize\n";
} elsif ($yournum==$last3) {
  print "!!!You have won the last-3 prize\n";
} elsif ($yournum==$last2) {
  print "!!!You have won the last-2 prize\n";
} else {
  print "You didn\'t win.\n";
}
