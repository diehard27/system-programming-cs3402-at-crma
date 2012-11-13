#!/usr/bin/perl
# global2.pl
# in the following code block 
# we replace the substring the by the string xxx 

$_ = " the cat is in the house"; 
print($_."\n");
$str1 = "the"; 
s/$str1/xxx/g; # acts on $_ 
print("$_\n"); # => xxx cat is in xxx house
