# while.pl
# 
# $x ne $y Is $x string unequal to $y ? 
# 
print "Please enter password (e.g. why me?)\n";
print "Password? "; 
$a = <STDIN>; 
chop $a; # remove the newline at end

while($a ne "why me?") {
  print "sorry. try again\n"; 
  print "Password? "; 
  $a = <STDIN>; 
  chop $a;
}
print "You did it\n"; 
