<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]==>Next: <a href='perlProg4.md'>การโปรแกรม Perl 4</a><br>
<a href='perlProg2.md'>Previous</a><==<br>
<br>
<br>
<h1>Conditions</h1>
เงื่อนไขใน perl สามารถกำหนดได้ด้วยประโยคคำสั่ง if/else ตามรูปแบบต่อไปนี้<br>
<pre><code>if(&lt;condition&gt;) {<br>
  ..do something<br>
}<br>
else {<br>
  ..do other thing<br>
}<br>
</code></pre>
หรือในรูปแบบ elseif<br>
<pre><code>if(&lt;condition&gt;) {<br>
  ..do something<br>
}<br>
elseif {<br>
  ..do other thing<br>
}<br>
elseif {<br>
  ..do more thing<br>
}<br>
</code></pre>


โดยที่ condition ใน Perl จะเป็นไปตามตารางต่อไปนี้<br>
<table><thead><th>Operation </th><th>Numeric Version </th><th>String Version</th></thead><tbody>
<tr><td>น้อยกว่า  </td><td><               </td><td>lt            </td></tr>
<tr><td>น้อยกว่าหรือเท่ากับ </td><td><=              </td><td> le           </td></tr>
<tr><td>มากกว่า   </td><td> >              </td><td> gt           </td></tr>
<tr><td>มากกว่าหรือเท่ากับ</td><td> >=             </td><td> ge           </td></tr>
<tr><td>เท่ากับ   </td><td> ==             </td><td>eq            </td></tr>
<tr><td>ไม่เท่ากับ</td><td>!=              </td><td> ne           </td></tr>
<tr><td>เปรียบเทียบ </td><td><=>             </td><td>cmp           </td></tr></tbody></table>

<pre><code># cond1.pl<br>
$a = 1;<br>
$b = 7;<br>
print "a=$a, b=$b\n";<br>
if($a == $b)<br>
{<br>
print "numbers are equal\n";<br>
}<br>
else<br>
{<br>
print "numbers are not equal\n";<br>
}<br>
#<br>
$c = 7.3;<br>
$d = 7.3;<br>
print "c=$c, d=$d\n";<br>
if($c == $d)<br>
{<br>
print "numbers are equal\n";<br>
}<br>
else<br>
{<br>
print "numbers are not equal\n";<br>
}<br>
</code></pre>
รันสคริปต์ cond1.pl จะได้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl cond1.pl<br>
a=1, b=7<br>
numbers are not equal<br>
c=7.3, d=7.3<br>
numbers are equal<br>
</code></pre>

<pre><code># cond2.pl<br>
$char1 = 'a';<br>
$char2 = 'A';<br>
print "char1=$char1, char2=$char2\n";<br>
if($char1 eq $char2)<br>
{<br>
print "characters are equal"<br>
}<br>
else<br>
{<br>
print "characters are not equal";<br>
}<br>
print "\n";<br>
#<br>
$string1 = "willi";<br>
$string2 = "willI";<br>
print "string1=$string1, string2=$string2\n";<br>
if($string1 ne $string2)<br>
{<br>
print "string1 is not the same as string2\n";<br>
}<br>
else<br>
{<br>
print "strings 1 and string2 are the same\n";<br>
}<br>
</code></pre>
เมื่อรันสคริปต์จะได้ผลลัพธ์<br>
<pre><code>prachya@pcubusrv104&gt; perl cond2.pl<br>
char1=a, char2=A<br>
characters are not equal<br>
string1=willi, string2=willI<br>
string1 is not the same as string2<br>
</code></pre>

<h1>Arguments</h1>
Perl สามารถรับค่า arguments มาจากการรันผ่านเชลล์ได้ เช่น hello.pl 12 34 56 คล้ายกับการผ่านค่าตัวแปรเข้าสู่โปรแกรมในเชลล์สคริปต์<br>
<h2>ตัวแปร $ARGV</h2>
ตัวแปร $ARGV เป็นอาเรย์ของสตริงของ arguments ที่ส่งผ่าน command line เข้ามายังสคริปต์ของเพิร์ล สามารถอ้างถึงตัวแปรเหล่านั้นด้วยการกำหนดดัชนี โดยตัวแปรตัวแรกใช้ดัชนีเท่ากับ 0 เช่น <code>$ARGV[0]</code> ยกตัวอย่างเช่นหากรันโปรแกรม<br>
<pre><code>perl hello.pl 12 34<br>
</code></pre>
แล้วค่าของ <code>$ARGV[0]</code> คือ 12 ส่วน <code>$ARGV[1]</code> คือ 34<br>
<h2>จำนวนตัวแปร $#ARGV</h2>
โปรแกรมเมอร์สามารถหาจำนวนตัวแปรที่ส่งเข้ามายังสคริปต์ได้จากตัวแปร <code>$#ARGV</code> เช่นจากตัวอย่างการรัน hello.pl สคริปต์ข้างต้นจะได้ค่า <code>$#ARGV</code> เท่ากับ 1 หากไม่ม่ตัวแปรส่งผ่านเข้ามา ค่าของ <code>$#ARGV</code> จะมีค่าเท่ากับ -1<br>
<br>
ตัวอย่าง perl สคริปต์ต่อไปนี้แสดงให้เห็นความสัมพันธ์ของการส่งตัวแปรเข้าไปยังสคริปต์จาก command line<br>
<pre><code># arg.pl<br>
print "arg count=$#ARGV\n";<br>
print "0=$ARGV[0]\n";<br>
print "1=$ARGV[1]\n";<br>
print "2=$ARGV[2]\n";<br>
</code></pre>
ผลของการรันสคริปต์ที่มีการส่งผ่านตัวแปร<br>
<pre><code>prachya@pcubusrv104&gt; perl arg.pl 12 34 56<br>
arg count=2<br>
0=12<br>
1=34<br>
2=56<br>
</code></pre>
ผลของการรันสคริปต์ที่ไม่มีการส่งผ่านตัวแปรเข้าไป จะมีค่าของ $#ARGV= -1<br>
<pre><code>prachya@pcubusrv104&gt; perl arg.pl<br>
arg count=-1<br>
0=<br>
1=<br>
2=<br>
</code></pre>

ตัวอย่างต่อไปนี้เป็นสคริปต์ mycal.pl ที่ใช้ตัวแปร ARGV ในการคำนวณแบบเครื่องคิดเลข<br>
<pre><code>#!/usr/bin/perl -w<br>
#SRC: http://www.cyberciti.biz/faq/howto-pass-perl-command-line-arguments/<br>
if ($#ARGV != 2 ) {<br>
        print "usage: mycal number1 op number2\neg: mycal 5 + 3 OR mycal 5 - 2\n";<br>
        exit;<br>
}<br>
$n1=$ARGV[0];<br>
$op=$ARGV[1];<br>
$n2=$ARGV[2];<br>
$ans=0;<br>
if ( $op eq "+" ) {<br>
        $ans = $n1 + $n2;<br>
}<br>
elsif ( $op eq "-"){<br>
        $ans = $n1 - $n2;<br>
}<br>
elsif ( $op eq "/"){<br>
        $ans = $n1 / $n2;<br>
}<br>
elsif ( $op eq "*"){<br>
        $ans = $n1 * $n2;<br>
}<br>
else {<br>
        print "Error: op must be +, -, *, / only\n";<br>
        exit;<br>
}<br>
print "$ans\n";<br>
</code></pre>
ผลลัพธ์ของการรันสคริปต์ mycal.pl<br>
<pre><code>prachya@pcubusrv104&gt; ./mycal.pl<br>
usage: mycal number1 op number2<br>
eg: mycal 5 + 3 OR mycal 5 - 2<br>
prachya@pcubusrv104&gt; ./mycal.pl 5 + 3<br>
8<br>
prachya@pcubusrv104&gt; ./mycal.pl 34 / 3<br>
11.3333333333333<br>
</code></pre>

<h1>Perl Special Variable</h1>
ดูรายละเอียดของตัวแปรพิเศษใน <a href='perlSpecialVars.md'>ลิงค์นี้</a>
ตัวอย่างการใช้งาน<br>
<pre><code># time.pl<br>
print "$^T\n";<br>
</code></pre>
เมื่อรันสคริปต์จะได้ค่าของเวลา (เป็นวินาที) ขณะที่รันซึ่งสามารถนำไปประยุกต์ใช้คำนวณหาเวลาทั้งหมดหรือบางส่วนที่สคริปต์รัน<br>
<pre><code>prachya@pcubusrv104&gt; perl time.pl<br>
1352186777<br>
prachya@pcubusrv104&gt; perl time.pl<br>
1352186778<br>
</code></pre>

<h1>Logical Operators</h1>
ตัวกระทำทางตรรก (logical operators) ในภาษา Perl มีเช่นเดียวกับภาษาชั้นสูงอื่นๆ ต่อไปนี้<br>
<pre><code>&amp;&amp;  = logical AND  <br>
||  = logical OR<br>
xor = logical XOR<br>
!   = logical NOT<br>
</code></pre>
ตัวอย่างเพิร์ลสคริปต์ logical1.pl เป็นการใช้โอเปอเรเตอร์ AND เพื่อตรวจสอบเงื่อนไขทางตรรก<br>
<pre><code>#logical1.pl<br>
$x = 8; <br>
printf "x=$x\n";<br>
if(($x &gt; 0) &amp;&amp; (($x%2) == 0)) <br>
{ <br>
  print "integer number is positive and even"; <br>
} <br>
  else <br>
{ <br>
  print "number is either not positive or not even"; <br>
} <br>
print "\n";<br>
</code></pre>
ผลการรันสคริปต์ logical1.pl<br>
<pre><code>prachya@pcubusrv104&gt; perl logical1.pl<br>
x=8<br>
integer number is positive and even<br>
</code></pre>

ตัวอย่างสคริปต์ logical2.pl เป็นการทดสอบเงื่อนไขทางตรรกด้วยการใช้ NOT<br>
<pre><code># logical2.pl<br>
$y = 0;<br>
print "y=$y\n";<br>
if(!($y))<br>
{<br>
  print "number is zero";<br>
}<br>
else<br>
{<br>
  print "number is nonzero";<br>
}<br>
print("\n");<br>
</code></pre>
ผลการรันสคริปต์ logical2.pl<br>
<pre><code>prachya@pcubusrv104&gt; perl logical2.pl<br>
y=0<br>
number is zero<br>
</code></pre>

ตัวอย่างสคริปต์ logical3.pl แสดงการใช้งานโอเปอเรเตอร์ XOR (ทั้งคู่ต้องแตกต่างกัน)<br>
<pre><code># logical3.pl<br>
$u = 6;<br>
$v = 5;<br>
print "u=$u, v=$v\n";<br>
if(($u &gt; 0) xor ($v &gt; 0))<br>
{<br>
  print("abba\n");<br>
}<br>
else<br>
{<br>
  print("baab\n");<br>
}<br>
# what happens if you change to: # $v = -5; ?<br>
</code></pre>
ผลการรันสคริปต์ logical3.pl<br>
<pre><code>prachya@pcubusrv104&gt; perl logical3.pl<br>
u=6, v=5<br>
baab<br>
</code></pre>

<h1>Loops</h1>
ใน Perl โปรแกรมเมอร์สามารถใช้ for loop, while loop, until loop, และ foreach loop ได้ตามรายละเอียดต่อไปนี้<br>
<h2>for loop</h2>
รูปแบบ<br>
<pre><code>for($i=0; &lt;condition&gt;; $i++)<br>
{<br>
    ..do something<br>
}<br>
</code></pre>

ตัวอย่าง forloop1.pl เพื่อคำนวณค่าผลรวมของเลข<br>
<pre><code># forloop1.pl<br>
# forloop.pl<br>
#<br>
$sum = 0;<br>
for($i=0; $i&lt;10; ++$i)<br>
{<br>
  $sum = $sum + $i;<br>
}<br>
print "1+2+...+10=$sum";<br>
print "\n";<br>
</code></pre>
ผลการรันสคริปต์จะได้ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl forloop1.pl<br>
1+2+...+10=45<br>
</code></pre>

อีกตัวอย่างของการใช้ for loop ในสคริปต์ forloop2.pl เพื่อคำนวณผลคูณรวม<br>
<pre><code># forloop2.pl<br>
$product = 1;<br>
for($i=1; $i&lt;12; ++$i)<br>
{<br>
  $product *= $i;<br>
}<br>
print "$product";<br>
print "\n";<br>
</code></pre>
ซึ่งจะให้ผลลัพธ์เท่ากับ<br>
<pre><code>prachya@pcubusrv104&gt; perl forloop2.pl<br>
39916800<br>
</code></pre>

ตัวอย่างใน forloop3.pl แสดงการประยุกต์ใช้ STDIN ในลูป<br>
<pre><code># forloop3.pl<br>
#<br>
for($line = &lt;STDIN&gt;, $count = 1; $count &lt;= 3; $line = &lt;STDIN&gt;, $count++)<br>
{<br>
  print($line);<br>
}<br>
</code></pre>
ผลของการรันโปรแกรม forloop3.pl<br>
<pre><code>prachya@pcubusrv104&gt; perl forloop3.pl<br>
4<br>
4<br>
g<br>
g<br>
s<br>
s<br>
dfa<br>
</code></pre>

<h2>while loop</h2>
เช่นเดียวกับภาษาระดับสูงทั่วไป while loop สามารถกำหนดได้ตามรูปแบบ<br>
<pre><code>while (&lt;condition&gt;) <br>
{<br>
  do something..<br>
}<br>
</code></pre>
ตัวอย่างสคริปต์ while.pl ต่อไปนี้แสดงการใช้งาน while loop ในการรับอินพุทจาก STDIN<br>
<pre><code># while.pl<br>
#<br>
# $x ne $y Is $x string unequal to $y ?<br>
#<br>
print "Please enter password (e.g. why me?)\n";<br>
print "Password? ";<br>
$a = &lt;STDIN&gt;;<br>
chop $a; # remove the newline at end<br>
<br>
while($a ne "why me?") {<br>
  print "sorry. try again\n";<br>
  print "Password? ";<br>
  $a = &lt;STDIN&gt;;<br>
  chop $a;<br>
}<br>
print "You did it\n";<br>
</code></pre>
ผลการรันสคริปต์เป็นดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl while.pl<br>
Please enter password (e.g. why me?)<br>
Password? why me?<br>
You did it<br>
</code></pre>

<h2>until loop</h2>
ตรงกันข้ามกับ while until loop จะทำงานเมื่อ <code>&lt;condition&gt;</code> เป็น false ไปจนกว่าจะเป็น true จึงจะออกจาก loop โดยมีรูแปบบดังนี้<br>
<pre><code>until (&lt;condition&gt;) {<br>
   ...do something...<br>
}<br>
</code></pre>

ตัวอย่างสตริปต์ until.pl ต่อไปนี้แสดงการใช้งาน until loop<br>
<pre><code># until.pl<br>
print("What is 27 plus 26?\n");<br>
$correct_answer = 53;<br>
$input_answer = &lt;STDIN&gt;;<br>
chop($input_answer);<br>
<br>
until($input_answer == $correct_answer) {<br>
   print("wrong! keep trying!\n");<br>
   $input_answer = &lt;STDIN&gt;;<br>
   chop($input_answer);<br>
}<br>
print("You got it!\n");<br>
</code></pre>
ผลการรันสตริปต์เป็นดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl until.pl<br>
What is 27 plus 26?<br>
53<br>
You got it!<br>
</code></pre>

<h2>foreach loop</h2>
ใน foreach loop จะทำงานกับ list ขออาเรย์ไปตามลำดับ ตามตัวอย่าง foreach.pl ต่อไปนี้<br>
<pre><code># foreach.pl<br>
#<br>
@wordlist = ("Good", "Morning", "Egoli");<br>
<br>
foreach $word (@wordlist) {<br>
   print("$word\n");<br>
}<br>
<br>
@numbers = ("3", "7", "3", "12", "15", "3", "3");<br>
$count = 0;<br>
foreach $x (@numbers) {<br>
   if($x == "3") {<br>
      ++$count;<br>
   }<br>
}<br>
print $count; # =&gt; 4<br>
print "\n";<br>
</code></pre>
ซึ่งจะได้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl foreach.pl<br>
Good<br>
Morning<br>
Egoli<br>
4<br>
</code></pre>

<h1>goto Statement</h1>
เช่นเดียวกับภาษา C/C++ Perl มีคำสั่ง goto เพื่อให้สามารถกระโดดไปยังตำแหน่งที่กำหนดไว้ (ด้วย Label: ) ได้ตามตัวอย่างต่อไปนี้<br>
<pre><code># goto.pl<br>
<br>
print("What is 20 + 36?\n");<br>
$correct_answer = 56;<br>
$input_answer = &lt;STDIN&gt;;<br>
chop($input_answer);<br>
$count = 0;<br>
until($input_answer == $correct_answer) {<br>
   print("wrong! keep trying!\n");<br>
   $input_answer = &lt;STDIN&gt;;<br>
   chop($input_answer);<br>
   if($count == 5) {<br>
      goto L1;<br>
   }<br>
   $count++;<br>
}<br>
print("You got it!\n");<br>
goto L2;<br>
<br>
L1: print("LetÂ’s give up\n");<br>
<br>
L2:<br>
print("end of session\n");<br>
</code></pre>
ผลของการรับสตริปต์เป็นดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl goto.pl<br>
What is 20 + 36?<br>
56<br>
You got it!<br>
end of session<br>
</code></pre>

<h1>Mathematical Functions</h1>
Perl มี built-in ฟังก์ชันมากมาย ผู้อ่านที่สนใจรายละเอียดเพิ่มเติมสามารถดูได้จาก <a href='http://www.xav.com/perl/lib/Pod/perlfunc.html'>ลิงค์นี้</a> ฟังก์ชันทางคณิตศาสตร์ของ Perl ได้แก่ abs, atan2, cos, exp, hex, int, log, oct, rand, sin, sqrt, srand ในส่วนนี้จะกล่าวถึงตัวอย่างการใช้ฟังก์ชันทางคณิตศาสตร์เบื้องต้นจากสคริปต์ math.pl ต่อไปนี้<br>
<pre><code># math.pl<br>
<br>
$x = 3.14159;<br>
$y = sin($x);<br>
print("y = $y\n");<br>
<br>
$z = cos($y);<br>
print("z = $z\n");<br>
# atan2 function calculates and returns<br>
# the argument of one value divided by another,<br>
# in the range -pi to pi<br>
$u = atan2(1.0,4.0);<br>
print("u = $u\n");<br>
<br>
$v = sqrt(6.5);<br>
print("v = $v\n");<br>
<br>
$w = exp($v);<br>
print("w = $w\n");<br>
<br>
$r = log(4.0); # log base e<br>
print("r = $r\n");<br>
<br>
$s = abs(-3.5);<br>
print("s = $s\n");<br>
</code></pre>

ผลของการรันสคริปต์<br>
<pre><code>y = 2.65358979335273e-06<br>
z = 0.999999999996479<br>
u = 0.244978663126864<br>
v = 2.54950975679639<br>
w = 12.8008267258436<br>
r = 1.38629436111989<br>
s = 3.5<br>
</code></pre>

<h1>Bitwise Operations</h1>
Perl สนับสนุนการใช้ bitwise operation ดังนี้<br>
<pre><code>AND   &amp; <br>
OR    |<br>
XOR  ^ (exclusive OR)<br>
NOT  ~ (หรือ one's complement)  <br>
</code></pre>
ซึ่งเป็น operation ที่กระทำระดับบิทของตัวเลขไบนารี่ ตัวอย่างเลขไบนารี่ของ 1001 คือ<br>
<pre><code>00000000 00000000 00000000 00001001<br>
</code></pre>
ซึ่งหากทำ one's complement (NOT) แล้วจะได้ค่าดังนี้<br>
<pre><code>11111111 11111111 11111111 11110110<br>
</code></pre>
สคริปต์ bitwise.pl ต่อไปนี้แสดงตัวอย่างการใช้งาน bitwise operation ของ Perl<br>
<pre><code># bitwise.pl<br>
$a = 9; # 1001<br>
$b = 7; # 0111<br>
$c = $a &amp; $b;<br>
print(" $c\n"); # =&gt; 1 (0001)<br>
<br>
$d = $a | $b;<br>
print(" $d\n"); # =&gt; 15 (1111)<br>
<br>
$e = $a ^ $b;<br>
print(" $e\n"); # =&gt; 14 (1110)<br>
<br>
$f = ~$a;<br>
print(" $f\n"); # =&gt; 4294967286<br>
<br>
# two complement<br>
$z = -45;<br>
$z = ~$z;<br>
$z++;<br>
print(" $z\n");<br>
</code></pre>
ผลลัพธ์ของการรันสคริต์เป็นดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl bitwise.pl<br>
 1<br>
 15<br>
 14<br>
 4294967286<br>
 45<br>
</code></pre>




<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
</li><li>Devid Medinets, Perl 5 by Examples, <a href='http://affy.blogspot.com/p5be/ch12.htm'>http://affy.blogspot.com/p5be/ch12.htm</a>
</li><li>Perl Built-in Functions, <a href='http://www.xav.com/perl/lib/Pod/perlfunc.html'>http://www.xav.com/perl/lib/Pod/perlfunc.html</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProg4.md'>การโปรแกรม Perl 4</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/perlProg3'>Edit</a>