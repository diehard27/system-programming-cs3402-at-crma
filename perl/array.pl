# array operations
# array.pl
#
@fruit = ("apples ", "pears ", "banana ");
@cities = ("Egoli ", "Cape Town ", "Durban ", "Pretoria ");
@numbers = ("4", "7", "9", "12", "15");
print @fruit;
print "\n";
print $cities[2]; # => Durban
print "\n";
if($numbers[2] != $numbers[4])
{
$sum = $numbers[2] + $numbers[4];  # => 24
print($sum);
print("\n");
}
else
{
$difference = $numbers[2] - $numbers[4];
print $difference;
print "\n";
}
($x, $y, $z) = @cities;
print $x;
print "\n";
print $z;
print "\n";
# => Egoli
# => Durban
