# sub2.pl
firstSub(1, 2, 3, 4, 5, 6);
firstSub(1..3);
firstSub("A".."Z");

sub firstSub {
    $numParameters = @_;
    print("The number of parameters is $numParameters\n");
}
