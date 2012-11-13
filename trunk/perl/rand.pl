# rand.pl
my $random = rand(1000000);
my $first = sprintf("%06d", $random);
my $last3 = sprintf("%03d", rand(1000));
my $last2 = sprintf("%02d", rand(100));
print "First Prize = $first", "\n";
print "Last 3 Prize = $last3", "\n";
print "Last 2 Prize = $last2", "\n";
