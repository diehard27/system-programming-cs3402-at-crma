# until.pl
print("What is 27 plus 26?\n"); 
$correct_answer = 53; 
$input_answer = <STDIN>; 
chop($input_answer);

until($input_answer == $correct_answer) {
   print("wrong! keep trying!\n"); 
   $input_answer = <STDIN>; 
   chop($input_answer);
} 
print("You got it!\n");
