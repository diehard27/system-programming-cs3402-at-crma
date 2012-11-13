# bitwise.pl
$a = 9; # 1001
$b = 7; # 0111
$c = $a & $b; 
print(" $c\n"); # => 1 (0001)

$d = $a | $b; 
print(" $d\n"); # => 15 (1111)

$e = $a ^ $b; 
print(" $e\n"); # => 14 (1110)

$f = ~$a; 
print(" $f\n"); # => 4294967286

# two complement 
$z = -45; 
$z = ~$z; 
$z++; 
print(" $z\n");
