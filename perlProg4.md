<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProgApp.md'>การประยุกต์ใช้ Perl</a><br>
<a href='perlProg3.md'>Previous</a><==<br>
<br>
<br>
<h1>printf และ sprintf</h1>
รูปแบบการใช้งาน printf และ sprintf<br>
<pre><code>sprintf FORMAT, LIST<br>
</code></pre>
เพิร์ลเลียนแบบการทำงานของ printf และ sprintf ในภาษา C ทำให้ผู้ที่คุ้นเคยกับการโปรแกรมภาษา C สามารถใช้ฟังก์ชันนี้ได้โดยง่าย ยกตัวอย่างเช่น ต้องการฟอร์แม็ตตัวแปร result และ rounded ให้มีผลลัพธ์ที่ต้องกาสามารถใช้ sprintf ได้ดังนี้<br>
<pre><code>        # Format number with up to 8 leading zeroes<br>
        $result = sprintf("%08d", $number);<br>
        # Round number to 3 digits after decimal point<br>
        $rounded = sprintf("%.3f", $number);<br>
</code></pre>
รูปแบบทั่วไปที่เหมือน C<br>
<pre><code>   %%	a percent sign<br>
   %c	a character with the given number<br>
   %s	a string<br>
   %d	a signed integer, in decimal<br>
   %u	an unsigned integer, in decimal<br>
   %o	an unsigned integer, in octal<br>
   %x   an unsigned integer, in hexadecimal<br>
   %e  	a floating-point number, in scientific notation<br>
   %f	a floating-point number, in fixed decimal notation<br>
   %g	a floating-point number, in %e or %f notation<br>
</code></pre>

ฟอร์แม็ตเพิ่มเติมสำหรับ conversion<br>
<br>
<pre><code>  %X    like %x, but using upper-case letters<br>
  %E    like %e, but using an upper-case "E"<br>
  %G    like %g, but with an upper-case "E" (if applicable)<br>
  %b    an unsigned integer, in binary<br>
  %B    like %b, but using an upper-case "B" with the # flag<br>
  %p    a pointer (outputs the Perl value's address in hexadecimal)<br>
  %n    special: *stores* the number of characters output so far<br>
         into the next argument in the parameter list<br>
</code></pre>

ยกตัวอย่างเช่น<br>
<pre><code>printf("%04b\n",8);<br>
</code></pre>
จะให้ผลลัพธ์<br>
<pre><code>prachya@pcubusrv104&gt; perl asm05-2.pl<br>
1000<br>
</code></pre>

<h1>Say</h1>
ในเพิร์ลเราสามารถใช้คำสั่ง say ในการพิมพ์ได้คล้ายกับการทำงานของ print โดยที่จะเพิ่ม newline เข้าไปให้อัตโนมัติ นอกจากนั้นยังสามารถเพิ่มเงื่อนไขในการพิมพ์ได้ ดังตัวอย่างต่อไปนี้<br>
<pre><code>use v5.10.1;<br>
@array = (1, 2, 3, undef, 4, 5);<br>
print @array;<br>
print "\n";<br>
say "some elements undefined" if undef ~~ @array;<br>
</code></pre>

<h1>System Calls</h1>
<pre><code>#!/usr/bin/perl<br>
# sys1.pl<br>
<br>
@files = qx(ls /proc);<br>
#print @files;<br>
my $i=0;<br>
foreach my $f (@files) {<br>
  print "$i : $f";<br>
  $i++;<br>
}<br>
</code></pre>

<pre><code> #!/usr/bin/perl<br>
    use strict;<br>
    use warnings;<br>
    my $info = qx(uptime);<br>
    print "Uptime is: $info\n";<br>
</code></pre>
สามารถใช้ back tick (')  แทนการเรียกฟังก์ชัน qx() ได้<br>
<pre><code>    #!/usr/bin/perl<br>
    use strict;<br>
    use warnings;<br>
    my @info = `who`;<br>
    foreach my $i (@info) {<br>
        print "$i is online\n";<br>
    }<br>
</code></pre>

<h1>List Operation</h1>
list จะถูกเก็บไว้ในอาร์เรย์ ซึ่งสามารถถ้างถึงตัวแปรแต่ละตัวด้วยดัชนี (index) ตามตัวอย่างต่อไปนี้<br>
<pre><code>@myarray = (7, "Egoli", 1.23, "\"Having fun?\"", 9.23e-10);<br>
</code></pre>
ดังนั้น ตัวแปรตัวแรก และตัวแปรถัดไปคือ<br>
<pre><code>myarray[0] = 7; myarray[1] = "Egoli";<br>
</code></pre>
ตัวอย่างต่อไปแสดงการนับตัวแปรใน list<br>
<pre><code># mylist.pl #<br>
@myarray = (7, "Egoli", 1.23, "\"Having fun?\"", 9.23e-10);<br>
$count = 0;<br>
while($count &lt;= 5)<br>
{<br>
   print("element $count is $myarray[$count]\n");<br>
$count++; }<br>
</code></pre>
โปรแกรมต่อไปนี้แสดงตัวอย่างการใช้ list operators แบบต่าง ๆ รวมถึงการตั้งค่าตัวแปรโดยตรงจากอาเรย์ (x,y,z)<br>
<pre><code># array operations<br>
# array.pl<br>
#<br>
@fruit = ("apples ", "pears ", "banana ");<br>
@cities = ("Egoli ", "Cape Town ", "Durban ", "Pretoria ");<br>
@numbers = ("4", "7", "9", "12", "15");<br>
print @fruit;<br>
print "\n";<br>
print $cities[2]; # =&gt; Durban<br>
print "\n";<br>
if($numbers[2] != $numbers[4])<br>
{<br>
$sum = $numbers[2] + $numbers[4];  # =&gt; 24<br>
print($sum);<br>
print("\n");<br>
}<br>
else<br>
{<br>
$difference = $numbers[2] - $numbers[4];<br>
print $difference;<br>
print "\n";<br>
}<br>
($x, $y, $z) = @cities;<br>
print $x;<br>
print "\n";<br>
print $z;<br>
print "\n";<br>
# =&gt; Egoli<br>
# =&gt; Durban<br>
</code></pre>

<h1>push และ pop</h1>
ตัวอย่างสคริปต์ต่อไปนี้แสดงการใช้งานคำสั่ง push และ pop เพื่อเก็บค่าเข้าไปในอาร์เรย์ หรือดึงค่าออกมาจากอาร์เรย์<br>
<pre><code>@fruit = ("apples ", "pears ", "banana ");<br>
@cities = ("Egoli ", "Cape Town ", "Durban ", "Pretoria ");<br>
@morecities = ("George", "Bloemfontain");<br>
push(@cities, "Grahamstown");<br>
print @cities;<br>
print "\n";<br>
push(@fruit, "strawberries ", "peach ", "plums ");<br>
print @fruit;<br>
print "\n";<br>
push(@cities, @morecities);<br>
$mycity = pop(@cities);<br>
print $mycity;<br>
print "\n";<br>
</code></pre>
ตัวอย่างการใช้งานคำสั่ง pop<br>
<pre><code>@s = ("AAAA","BBB");<br>
$tmp = pop(@s);<br>
print $tmp;<br>
</code></pre>

<h1>split และ  join</h1>
split ใช้ในการแยกคำหรือส่วนของคำออกจากกันให้อยู่ในรูปของอาร์ย์ โดยผู้ใช้กำหนดตัวแยก เช่น คอมม่า หรือ เซมิโคลอน ส่วน join ใช้ในการเชื่อมค่าของตัวแปรในอาร์เรย์เข้าด้วยกัน ดังแสดงในตัวอย่างต่อไปนี้  ตัวแปร sting  เป็นตัวแปรแบบสตริง ในที่นี้เราจะกำหนดให้ คอมม่าเป็นตัวแบ่งคำ แล้วเก็บไว้ในอาร์เรย์ myarray ส่วนคำสั่ง join ใช้ต่อคำในอาร์เรย์ names ให้เป็นสตริงตัวเดียวชื่อ concatstring<br>
<pre><code># mysplit.pl<br>
# splitting a string into a list<br>
#<br>
$string = "otto, carl, ludwig, berlin:postdam";<br>
@myarray = split(/,/, $string);<br>
print "@myarray\n"; # =&gt; otto carl ludwig berlin:postdam<br>
print("\n");<br>
print $myarray[2];   # =&gt; ludwig<br>
print("\n");<br>
@names = ("Egoli-", "Gauteng ", "Johannesburg");<br>
$concatstring = join("", @names);<br>
print("$concatstring");<br>
</code></pre>

<h1>Associative Array Operations</h1>

<pre><code># assoc.pl<br>
%ages = ( "Ludwig Otto", 40,  "Franz Karl", 32,<br>
          "Jane Coppersmith", 21, "Dan Smithlone", 67);<br>
print $ages{"Ludwig Otto"};  # =&gt; 40<br>
print("\n");<br>
print $ages{"Jane Coppersmith"}; # =&gt; 21<br>
print("\n");<br>
# adding an element<br>
$ages{"Henry VIII"} = 1654;  # !! curly brackets<br>
print %ages;<br>
print("\n");<br>
# deleting an element<br>
delete($ages{"Franz Karl"});<br>
print %ages;<br>
print("\n");<br>
@myarray = keys(%ages);<br>
print @myarray;          # =&gt; only the names<br>
print("\n");<br>
@valuearray = values(%ages);<br>
print("@valuearray");       # =&gt; only the values<br>
print("\n\n");<br>
while(($name, $value) = each(%ages))<br>
{<br>
   print($name);<br>
   print(" ");<br>
   print($value);<br>
   print("\n");<br>
}<br>
</code></pre>

<h1>Pattern Matching</h1>
perl ใช้ regular expression  โอเปอเรเตอร์<br>
<pre><code>=~<br>
</code></pre>
ในการค้นหา matching  และแทนส่วนที่ต้องการ จากตัวอย่างข้างล่าง สคริปต์จะทำการค้นหาคำว่า please ในคำตอบที่ผู้ใช้ป้อนเข้ามาในตัวแปร question และจะทำการพิมพ์เมื่อคำที่ป้อนเข้ามามีคำว่า please จากนั้นพิมพ์คำว่า Thank you for being polite<br>
<pre><code># matching.pl<br>
print("Ask me a question politely:\n");<br>
$question = &lt;STDIN&gt;;<br>
if($question =~ /please/)<br>
{<br>
   print("Thank you for being polite!");<br>
}<br>
else {<br>
   print("That was not very polite!\n");<br>
}<br>
</code></pre>

<h1>Regular Expression</h1>
Regular expression เป็นแพ็ทเทิร์นที่ใช้ในการเปรียบเทียบสตริง หรือ combination ของสตริง<br>
<pre><code>s/pattern/replacement/<br>
options for the substitution operator<br>
g change all occurence of the pattern<br>
i ignore case in pattern<br>
e evaluate replacement string as expression<br>
m treat string to be matched as multiple lines<br>
o evaluate only once<br>
s treat string to be matched as single line<br>
x ignore white space in pattern<br>
</code></pre>

ตัวอย่างแรกเป็นการแสดงการแทนที่คำว่า 123 ในสตริง string ด้วย 4567 โดยใช้ pattern matching โอเปอเรเตอร์ =~<br>
<pre><code># replace1.pl<br>
$string = "abc123def";<br>
$string =~ s/123/4567/;<br>
print("$string\n"); # =&gt; abc4567def<br>
</code></pre>

ตัวอย่างต่อไปแสดงการใช้ตัวแปร global variable <code>$_</code> กับคำสั่ง  pattern matching <code>s/&lt;word&gt;/&lt;substitution&gt;/&lt;options&gt;</code> หาอักษรอังกฤษตัวใหญ่ใด ๆ [A-Z] แล้วแทนด้วย +[A-Z]+ โดยใช้ regular expression <code>/+\1+/</code> pattern matching ส่วนที่สอง ทำคล้ายกันแต่กับอักษรตัวเล็กทั้งหมดโดยแทนด้วย [a-z]+ ไม่มีเครื่องหมายบวกด้านหน้า<br>
<pre><code># regexp1.pl<br>
$_ = "Egoli Gauteng";<br>
s/([A-Z])/+\1+/g;     # acts on global scalar variable $_<br>
print("$_");          # =&gt; +E+goli +G+auteng<br>
print("\n");<br>
s/([a-z])/\1+/g;<br>
print("$_");          # =&gt; +E+g+o+l+i+ +G+a+u+t+e+n+g+<br>
print("\n");<br>
</code></pre>

<pre><code># replace2.pl<br>
@input = &lt;STDIN&gt;;<br>
$count = 0;<br>
while($input[$count] ne "")<br>
{<br>
  $input[$count] =~ s/^[ \t]+//;<br>
  $input[$count] =~ s/[ \t]+\n$/\n/;<br>
  $input[$count] =~ s/[ \t]+/ /g;<br>
  $count++;<br>
}<br>
print("Formatted text:\n");<br>
print(@input);<br>
</code></pre>
บรรทัดนี้ตรวจสอบ ในกรณีที่มี space หรือ tab ที่จุดเริ่มต้นของบรรทัด ถ้ามีให้เอาส่วนนั้นออกจากสตริงเป้าหมาย<br>
<pre><code>$input[$count] =~ s/^[ \t]+//;<br>
</code></pre>
บรรทัดต่อไปนี้ ตรวจสอบว่ามี space หรือ tab ที่ท้ายบรรทัดหรือไม่ ถ้ามีให้นำออกจากสตริงเป้าหมาย<br>
<pre><code>$input[$count] =~ s/[ \t]+\n$/\n/;<br>
</code></pre>
บรรทัดต่อไปนี้ ใช้ตัวเลือก g หรือ global เพื่อกำจัด space และ tab ระหว่างคำทั้งหมด<br>
<pre><code>$input[$count] =~ s/[ \t]+/ /g <br>
</code></pre>

<h1>function as sub</h1>
เพิร์ลฟังก์ชนใช้ sub ในการกำหนดค่า subroutine หรือฟังก์ชัน ดังตัวอย่างสคริปต์ sub1.pl<br>
<pre><code># sub1.pl<br>
$areaOfFirstCircle = areaOfCircle(5);<br>
print("$areaOfFirstCircle\n");<br>
<br>
sub areaOfCircle {<br>
    $radius = $_[0];<br>
    return(3.1415 * ($radius ** 2));<br>
}<br>
จะสังเกตุการใช้งานตัวแปร {{{$_}}} เพื่อเรียกใช้พารามิเตอร์ที่ส่งเข้ามาในฟังก์ชัน areaOfCircel()<br>
</code></pre>

<h2>ส่งตัวแปรแบบอาเรย์</h2>
ตัวอย่างต่อไปนี้แสดงการใช้งานตัวแปรอาเรย์ <code>@_</code> ซึ่งให้ผลลัพธ์คือจำนวนตัวแปรที่ส่งเข้ามาในฟังก์ชัน จากการเรียกใช้ในบรรทัด <code> $numParameters = @_;</code>
<pre><code># sub2.pl<br>
firstSub(1, 2, 3, 4, 5, 6);<br>
firstSub(1..3);<br>
firstSub("A".."Z");<br>
<br>
sub firstSub {<br>
    $numParameters = @_;<br>
    print("The number of parameters is $numParameters\n");<br>
}<br>
</code></pre>
<h2>passing by reference</h2>
ตัวอย่างต่อไปเป็นการส่งพารามิเตอร์แบบอ้างถึง ซึ่งจะทำฟังก์ชันสามารถเข้าไปแก้ไขค่าของตัวแปรที่ส่งมาแบบ passing by reference ได้<br>
<pre><code># sub3.pl<br>
# passing parameters by reference<br>
@array = (0..5);<br>
print("Before function call, array = @array\n");<br>
firstSub(@array);<br>
print("After function call, array =  @array\n");<br>
<br>
sub firstSub{<br>
    $_[0] = "A";<br>
    $_[1] = "B";<br>
}<br>
</code></pre>

เมื่อรันสคริปต์จะให้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl sub3.pl<br>
Before function call, array = 0 1 2 3 4 5<br>
After function call, array =  A B 2 3 4 5<br>
</code></pre>

<h1>แบบฝึกหัด</h1>
<h2>ออกเลขรางวัล</h2>
ตัวอย่างต่อไปนี้แสดงการใช้งาน random function ของ perl และการใช้งาน sprint เพื่อออกเลขรางวัล 6 หลัก พร้อมให้แสดงเลขท้ายสามตัว และเลขท้ายสองตัว<br>
<pre><code># rand.pl<br>
my $random = rand(1000000);<br>
my $first = sprintf("%06d", $random);<br>
my $last3 = sprintf("%03d", rand(1000));<br>
my $last2 = sprintf("%02d", rand(100));<br>
print "First Prize = $first", "\n";<br>
print "Last 3 Prize = $last3", "\n";<br>
print "Last 2 Prize = $last2", "\n";<br>
</code></pre>
ผลการรันโปรแกรม rand.pl<br>
<pre><code>prachya@pcubusrv104&gt; perl rand.pl<br>
First Prize = 103298<br>
Last 3 Prize = 776<br>
Last 2 Prize = 84<br>
</code></pre>

เพิ่มส่วนการป้อนตัวเลขให้ผู้ใช้งานทาย<br>
<pre><code>print "Please enter 6-digit number: ";<br>
$yournum = &lt;STDIN&gt;;<br>
my $random = rand(1000000);<br>
my $first = sprintf("%06d", $random);<br>
my $last3 = sprintf("%03d", rand(1000));<br>
my $last2 = sprintf("%02d", rand(100));<br>
print "First Prize = $first", "\n";<br>
print "Last 3 Prize = $last3", "\n";<br>
print "Last 2 Prize = $last2", "\n";<br>
if ($yournum==$first) {<br>
  print "!!!You have won the first prize\n";<br>
} elsif ($yournum==$last3) {<br>
  print "!!!You have won the last-3 prize\n";<br>
} elsif ($yournum==$last2) {<br>
  print "!!!You have won the last-2 prize\n";<br>
} else {<br>
  print "You didn\'t win.\n";<br>
}<br>
</code></pre>

ผลการรันสคริปต์ rand2.pl<br>
<pre><code>prachya@pcubusrv104&gt; perl rand2.pl<br>
Please enter 6-digit number: 258963<br>
First Prize = 331268<br>
Last 3 Prize = 784<br>
Last 2 Prize = 96<br>
You didn't win.<br>
</code></pre>

เพิ่ม until loop เพื่อให้ผู้ใช้ทายไปเรื่อย ๆ และออกจากโปรแกรมด้วยการป้อนศูนย์<br>
<pre><code>$yournum=123456;<br>
until ($yournum=="000000") {<br>
print "Please enter 6-digit number (000000 to quit): ";<br>
$yournum = &lt;STDIN&gt;;<br>
my $random = rand(1000000);<br>
my $first = sprintf("%06d", $random);<br>
my $last3 = sprintf("%03d", rand(1000));<br>
my $last2 = sprintf("%02d", rand(100));<br>
print "First Prize = $first", "\n";<br>
print "Last 3 Prize = $last3", "\n";<br>
print "Last 2 Prize = $last2", "\n";<br>
if ($yournum==$first) {<br>
  print "!!!You have won the first prize\n";<br>
} elsif ($yournum==$last3) {<br>
  print "!!!You have won the last-3 prize\n";<br>
} elsif ($yournum==$last2) {<br>
  print "!!!You have won the last-2 prize\n";<br>
} else {<br>
  print "You didn\'t win.\n";<br>
}<br>
}<br>
</code></pre>

<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
</li><li>perldoc.perl.org, <a href='http://perldoc.perl.org/5.8.8/functions/sprintf.html'>http://perldoc.perl.org/5.8.8/functions/sprintf.html</a>
</li><li>System Calls, <a href='http://perlmeme.org/faqs/system/system.html'>http://perlmeme.org/faqs/system/system.html</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProgApp.md'>การประยุกต์ใช้ Perl</a><br>
<a href='perlProg3.md'>Previous</a><==</li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/perlProg4'>Edit</a>