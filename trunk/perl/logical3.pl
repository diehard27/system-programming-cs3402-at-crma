# logical3.pl
$u = 6; 
$v = 5; 
print "u=$u, v=$v\n";
if(($u > 0) xor ($v > 0)) 
{ 
  print("abba\n"); 
} 
else 
{ 
  print("baab\n"); 
} 
# what happens if you change to: # $v = -5; ?
