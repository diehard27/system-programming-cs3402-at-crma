# sub3.pl
# passing parameters by reference
@array = (0..5);
print("Before function call, array = @array\n");
firstSub(@array);
print("After function call, array =  @array\n");

sub firstSub{
    $_[0] = "A";
    $_[1] = "B";
}
