# sub1.pl
$areaOfFirstCircle = areaOfCircle(5);
print("$areaOfFirstCircle\n");

sub areaOfCircle {
    $radius = $_[0];
    return(3.1415 * ($radius ** 2));
}
