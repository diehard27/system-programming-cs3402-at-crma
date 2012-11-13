#!/usr/bin/perl
# arithmetic.pl

$a = 4; 
$b = 13; 
$c = $a + $b; 
print("The sum is: $c\n");
$d = $a - $b; 
print("The difference is: $d\n");
$e = $a*$b; 
print("The product is: $e\n");
$f = $b/$a; 
print("The division yields: $f\n"); # returns 3.25
$g = $b%$a; # remainder 
print("The remainder is: $g\n"); # returns 1
$a++; # post-increment 
++$a; # pre-increment; 
print("$a\n"); # returns 6
$b--; # post-decrement 
--$b; # pre-decrement 
print("$b\n"); # returns 11
# exponentiation operator is ** 
$x = 2.5; 
$y = 3.6; 
$z = $x ** $y; 
print("z = $z\n");
print("Done --- arithmetic.pl\n");
