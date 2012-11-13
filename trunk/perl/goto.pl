# goto.pl

print("What is 20 + 36?\n"); 
$correct_answer = 56; 
$input_answer = <STDIN>; 
chop($input_answer); 
$count = 0;
until($input_answer == $correct_answer) {
   print("wrong! keep trying!\n"); 
   $input_answer = <STDIN>; 
   chop($input_answer);
   if($count == 5) { 
      goto L1; 
   } 
   $count++;
}
print("You got it!\n"); 
goto L2;

L1: print("Lets give up\n");

L2:
print("end of session\n");
