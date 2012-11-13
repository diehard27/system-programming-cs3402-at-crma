use v5.10.1;
@array = (1, 2, 3, undef, 4, 5);
print @array;
print "\n";
say "some elements undefined" if undef ~~ @array;
