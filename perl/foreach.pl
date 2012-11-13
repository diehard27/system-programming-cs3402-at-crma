# foreach.pl 
# 
@wordlist = ("Good", "Morning", "Egoli"); 

foreach $word (@wordlist) {
   print("$word\n"); 
}

@numbers = ("3", "7", "3", "12", "15", "3", "3"); 
$count = 0;
foreach $x (@numbers) { 
   if($x == "3") { 
      ++$count; 
   } 
}
print $count; # => 4 
print "\n";
