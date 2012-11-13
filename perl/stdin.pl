# stdin.pl
print("Enter the distance in kilometers: "); 
$dist = <STDIN>; 
chop($dist); 
$miles = $dist * 0.6214; 
print($dist, " kilometers = ", $miles, " miles\n");

print("Enter the distance in miles: "); 
$dist = <STDIN>; 
chop($dist); 
$kilometers = $dist * 1.609; 
print($dist, " miles = ", $kilometers, " kilometers\n");
