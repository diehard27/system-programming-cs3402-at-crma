#!/usr/bin/perl -w
#SRC: http://www.cyberciti.biz/faq/howto-pass-perl-command-line-arguments/
if ($#ARGV != 2 ) {
	print "usage: mycal number1 op number2\neg: mycal 5 + 3 OR mycal 5 - 2\n";
	exit;
}
$n1=$ARGV[0];
$op=$ARGV[1];
$n2=$ARGV[2];
$ans=0;
if ( $op eq "+" ) {
	$ans = $n1 + $n2;
}
elsif ( $op eq "-"){
	$ans = $n1 - $n2;
}
elsif ( $op eq "/"){
	$ans = $n1 / $n2;
}
elsif ( $op eq "*"){
	$ans = $n1 * $n2;
}
else {
	print "Error: op must be +, -, *, / only\n";
	exit;
}
print "$ans\n";
