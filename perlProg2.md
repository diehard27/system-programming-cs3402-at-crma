<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProg3.md'>การโปรแกรม Perl 3</a>
<br>
<br>
การตั้งนามสกุลของเพิร์ลสคริปต์โดยทั่วไปจะตั้งเป็น .pl เช่น hello.pl เพื่อให้ป้องกันการสับสน (สามารถตั้งเป็นอย่างอื่นได้<br>
<pre><code># hello.pl<br>
print("Hello there\n");<br>
</code></pre>

การรันสคริปต์สามารถทำได้โดยเรียกใช้คำสั่ง perl จากพร็อมพ์ของเชลล์ เช่น<br>
<pre><code>perl  hello.c<br>
</code></pre>
หากต้องการรันสคริปต์จากเชลล์ตรง ๆ ให้ใส่ในบรรทัดแรกของไฟล์สคริปต์ตำแหน่งที่จะใช้โปรแกรม perl สามารถค้นหาได้ด้วยคำสั่ง which<br>
<pre><code>prachya@pcubusrv104&gt; which perl<br>
/usr/bin/perl<br>
</code></pre>
กำหนดว่าให้ใช้เพิร์ลไหน (บางครั้งในระบบมี perl หลายเวอร์ชั่น)<br>
<pre><code>#!/usr/bin/perl<br>
# hello.pl<br>
print("Hello there\n");<br>
</code></pre>
จากนั้นตั้งให้สคริปต์มี permission แบบ executable ด้วยคำสั่ง chmod<br>
<pre><code>chmod  +x  hello.pl<br>
</code></pre>
รันคำสั่งได้โดยตรงจากพร็อมท์<br>
<pre><code>./hello.pl<br>
</code></pre>

<h1>แบบของตัวแปร</h1>
เพิร์ลมีตัวแปรข้อมูล 3 แบบคือ scalars, arrays (lists), และ associative arrays (hashes)<br>
<h2>$x ตัวแปร scalar</h2>
ตัวแปรแบบ scalar เป็นได้ทั้งตัวเลข อักษร หรือสตริง มีเครื่องหมาย $ นำหน้าตัวแปร (คล้าย ๆ ใน shell หรือ PHP)<br>
ตัวอย่างโปรแกรมเพิร์ลที่ใช้ตัวแปร scalars<br>
<pre><code>#scalars<br>
$a = 7;<br>
$b = 1.23;<br>
$c = 'A';<br>
$d = "willi";<br>
$e = false;<br>
<br>
print($a);<br>
print("\n");    # newline<br>
print($b."\n"); # using dot to concat<br>
print("$b\n");<br>
print("$c\n");<br>
print($d."\n");<br>
print($e."\n");<br>
</code></pre>

<h2>@x ตัวแปร array หรือ lists</h2>
ตัวแปรอาเรย์แบบมีดัชนี (indexed arrays) นั้นต้องนำหน้าชื่อตัวแปรด้วยเครื่องหมาย @ ดัชนีเริ่มต้นที่ศูนย์โดยที่การกำหนดค่าของสมาชิกจะใช้วงเล็บ โดยที่ค่าต่างๆ สามารถผสมกันได้ว่าจะเป็น scalar แบบใด ดังตัวอย่างด้านล่าง  การเรียกใช้ตัวแปรของอาเรย์จะใช้เครื่องหมาย $ นำหน้าพร้อมทั้งกำหนดค่าดัชนีให้ตรงกับค่าที่ต้องการ<br>
<pre><code>#indexed arrays<br>
@a1 = ( 3, 4, 5, 2, -1, 'a', 1.23, "ergonomic");<br>
print(@a1);  # 3452-1a1.23ergonomic<br>
print("\n");<br>
print($a1[2]);  # element indexed 2 value =&gt; 5<br>
print("\n");<br>
</code></pre>

<h2>%x ตัวแปร associative array หรือ hashes</h2>

<pre><code># associative arrays<br>
%id_num = ("Prachya", 23, "Narong", 21, "Surat", 37);<br>
print($id_num{"Prachya"});  # return 23<br>
print("\n");<br>
print($id_num{"Surat"});  # return 37<br>
print("\n");<br>
</code></pre>

<h2><code>$_</code> ตัวแปร global scalar</h2>
ตัวแปรแบบ global scalar ที่ใช้มากในการเขียนเพิร์ลสคริปต์คือ <code>$_</code> สังเกตุการใช้งานจากตัวอย่างต่อไปนี้<br>
<pre><code># global.pl<br>
$_ = 4; <br>
$a = 7; <br>
$b = $_ + $a; <br>
print("b = " + $b); # =&gt; 11 <br>
print("\n");<br>
<br>
$_ = "Chalermwat"; <br>
print($_); # =&gt; Chalermwat<br>
</code></pre>

ตัวอย่างต่อไปเป็นการใช้คำสั่งค้นหา s/search_string/target_string/options ในประโยคำสั่งของเพิร์ลกับตัวแปรแบบ global<br>
<br>
<pre><code>#!/usr/bin/perl<br>
# global2.pl<br>
# in the following code block<br>
# we replace the substring the by the string xxx<br>
<br>
$_ = " the cat is in the house";<br>
print($_."\n");<br>
$str1 = "the";<br>
s/$str1/xxx/g; # acts on $_<br>
print("$_\n"); # =&gt; xxx cat is in xxx house<br>
</code></pre>
เมื่อรันสคริปต็ด้วยคำสั่ง <code>perl global2.pl</code> จะได้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl global2.pl<br>
 the cat is in the house<br>
 xxx cat is in xxx house<br>
</code></pre>

<h1>Arithmetic Operators</h1>
โอเปอเรเตอร์ทางคณิตศาสตร์ของเพิร์ลมีเช่นเดียวกับภาษาโปรแกรมระดับสูงคือ<br>
<table><thead><th> Operator </th><th> Comment</th></thead><tbody>
<tr><td> <code>+, -, *, /</code> </td><td> บวก, ลบ, คูณ, หาร</td></tr>
<tr><td> %        </td><td> ม็อดดูโล - หาเศษที่เหลือ </td></tr>
<tr><td> ++       </td><td> เพิ่มค่าขึ้นหนึ่ง ใช้ได้ทั้งแบบ pre-increment หรือ post-increment </td></tr>
<tr><td> --       </td><td> ลดค่าลงหนึ่ง ใช้ได้ทั้งแบบ pre-decrements หรือ post-decrements </td></tr>
<tr><td> <code>**</code> </td><td> ยกกำลัง </td></tr></tbody></table>

ตัวอย่างต่อไปในสคริปต์ arithmetic.pl แสดงการใช้งานโอเปอเรเตอร์แบบต่าง ๆ ของเพิร์ล<br>
<pre><code>#!/usr/bin/perl<br>
# arithmetic.pl<br>
<br>
$a = 4; <br>
$b = 13; <br>
$c = $a + $b; <br>
print("The sum is: $c\n");<br>
$d = $a - $b; <br>
print("The difference is: $d\n");<br>
$e = $a*$b; <br>
print("The product is: $e\n");<br>
$f = $b/$a; <br>
print("The division yields: $f\n"); # returns 3.25<br>
$g = $b%$a; # remainder <br>
print("The remainder is: $g\n"); # returns 1<br>
$a++; # post-increment <br>
++$a; # pre-increment; <br>
print("$a\n"); # returns 6<br>
$b--; # post-decrement <br>
--$b; # pre-decrement <br>
print("$b\n"); # returns 11<br>
# exponentiation operator is ** <br>
$x = 2.5; <br>
$y = 3.6; <br>
$z = $x ** $y; <br>
print("z = $z\n");<br>
print("Done --- arithmetic.pl\n");<br>
</code></pre>
สังเกตุได้ว่าการใช้งานโอเปอเรเตอร์ทางคณิตศาสตร์ของเพิร์ลมีความสะดวกมากกว่าเชลล์สคริปต์ อีกทั้งยังมีขีดความสามารถในการคำนวณเลขทศนิยมได้เป็นอย่างดี<br>
<br>
<h1><code>&lt;STDIN&gt;</code> Standard Input</h1>
เพิร์ลสามารถอ้างถึงอินพุทจากเชลล์ผ่าน standard input โดยจะกำหนดชื่อตัวแปรเฉพาะว่า STDIN ใช้ร่วมกับเครื่องหมายน้อยกว่ามากว่า คือ <code>&lt;STDIN&gt;</code>

<pre><code># stdin.pl<br>
print("Enter the distance in kilometers: "); <br>
$dist = &lt;STDIN&gt;; <br>
chop($dist); <br>
$miles = $dist * 0.6214; <br>
print($dist, " kilometers = ", $miles, " miles\n");<br>
<br>
print("Enter the distance in miles: "); <br>
$dist = &lt;STDIN&gt;; <br>
chop($dist); <br>
$kilometers = $dist * 1.609; <br>
print($dist, " miles = ", $kilometers, " kilometers\n");<br>
</code></pre>

เมื่อรันสคริปต์นี้จะได้ผลลัพธ์ดังต่อไปนี้<br>
<pre><code>prachya@pcubusrv104&gt; perl stdin.pl<br>
Enter the distance in kilometers: 1.6<br>
1.6 kilometers = 0.99424 miles<br>
Enter the distance in miles: 1<br>
1 miles = 1.609 kilometers<br>
</code></pre>

<h2>ฟังก์ชัน chop()</h2>
คำสั่ง chop ตัดอักษรสุดท้ายของตัวแปรออกไป (โดยทั่วไปแล้วใช้ในการกำจัดค่าแอสกี้ของ return/newline) ตัวอย่างต่อไปนี้ แสดงการทำงานของ chop()<br>
<br>
<pre><code>$v = 'Flowers';<br>
$r = chop($v);<br>
print "$v (without $r)\n";<br>
# displays Flower (without s)<br>
</code></pre>

<h1>String Operation เบื้องต้น</h1>
การใช้งานสตริงใน perl ไม่สลับซับซ้อนสตริงสามารถนำมาต่อกันได้โดยใช้จุด การเปรียบเทียบใช้ operator ที่ชื่อว่า cmp<br>
<br>
<h2>Printing</h2>
<pre><code>$a = "Prachya-"; <br>
$b = "Chalermwat"; <br>
print "$a$b"; # returns Prachya-Chalermwat <br>
print "\n";<br>
</code></pre>

<h2>Concatenate</h2>
<pre><code># concatenate $c and $d <br>
# the concatenate operators is the . <br>
$c = "alpha-"; <br>
$d = "3"; <br>
$e = $c . $d; <br>
print $e; # returns alpha-3 <br>
print "\n";<br>
</code></pre>

<h2>Interpolation</h2>
<pre><code># interpolation <br>
$str1 = "apples"; <br>
$str2 = "pears"; <br>
print "$str1 and $str2"; # returns apples and pears <br>
print "\n";<br>
</code></pre>

<h2>cmp - Comparison</h2>
โอเปอเรเตอร์ cmp เป็นการเปรียบเทียบสตริงแบบ case-sensitive นั่นคืออักษรตัวเล็กตัวใหญ่ถือว่าต่างกัน ถ้าสตริงตรงกัน cmp จะให้ค่ากลับมาเป็น 0<br>
<br>
<pre><code># comparing strings with cmp <br>
$x = "egoli"; <br>
$y = "gauteng"; <br>
$z = $x cmp $y; <br>
print($z); <br>
print("\n");<br>
</code></pre>

<pre><code>$name1 = "willi"; <br>
$name2 = "willi"; <br>
$result = $name1 cmp $name2; <br>
print($result); <br>
print("\n");<br>
</code></pre>

<pre><code>$u = "X"; <br>
$v = "x"; <br>
$w = $u cmp $v; <br>
print("w = "); <br>
print($w."\n");<br>
</code></pre>

<h1>String Functions</h1>
<table><thead><th>ฟังก์ชัน</th><th>คำอธิบาย</th></thead><tbody>
<tr><td>chomp   </td><td>ลบ newlines และคืนค่าจำนวนอักษรที่ลบออกไป<br><font color='green'> ต.ย. <code>chomp ($name = &lt;STDIN&gt;);</code></font></td></tr>
<tr><td>chop    </td><td>ลบอักษรสุดท้ายจากสตริง และคืนค่าของตัวอักษรที่ลบไป<br><font color='green'> ต.ย. <code>$r = chop($v);</code></font></td></tr>
<tr><td>chr     </td><td>แปลงค่า ASCII หรือ Unicode ให้เป็นตัวอักษร<br><font color='green'> ต.ย. <code>print chr(0x41), "\n";</code></font></td></tr>
<tr><td>crypt   </td><td>แปลงสตริงของรหัสผ่านให้อยู่ในรูป ASCII<br><font color='green'> ต.ย.<code> $encryptedString = crypt $string, $salt</code> .<a href='http://www.misc-perl-info.com/perl-crypt.html'>..more</a></font></td></tr>
<tr><td>hex     </td><td>แปลงเลขฐานสิบหกให้เป็นค่าตัวเลข<br><font color='green'> ต.ย.<code> print hex "0x4E8", "\n";</code></font> </td></tr>
<tr><td>index   </td><td>คืนค่าตำแหน่งของ substring ที่พบครั้งแรกในสตริงที่กำหนด<br><font color='green'> ต.ย.<code> my $found = index $someText, "Perl";</code> </font></td></tr>
<tr><td>lc      </td><td>แปลงทุกอักษรในสตริงให้เป็นภาษาอังกฤษตัวเล็กและคืนค่าสตริงที่แปลง<br><font color='green'> ต.ย.<code> lc($str);</code> </font></td></tr>
<tr><td>lcfirst </td><td>แปลงอักษรแรกของสตริงให้เป็นตัวเล็กแล้วคืนค่าสตริงที่แปลง<br><font color='green'> ต.ย.<code> my $newStr = lcfirst $str;</code> </font></td></tr>
<tr><td>length  </td><td>คืนจำนวนตัวอักษร หรือไบท์ของสตริง<br><font color='green'> ต.ย.<code> my $strLength = length($strVar);</code></font> </td></tr>
<tr><td>oct     </td><td>แปลงสตริงของเลขฐานแปดให้เป็นเลขฐานสิบ<br><font color='green'> ต.ย.<code> print oct(77), "\n";</code> </font></td></tr>
<tr><td>ord     </td><td>แปลงอักษรให้เป็น ASCII/Unicode ที่กำหนด<br><font color='green'> ต.ย.<code> print ord('A'), "\n";</code> </font></td></tr>
<tr><td>pack    </td><td>แปลง list ให้เป็นสตริง, ตาม template ที่กำหนด<br><font color='green'> ต.ย.<code> STRING = pack TEMPLATE, LIST</code></font> </td></tr>
<tr><td>q/STRING/</td><td>ใส่ single quote ให้สตริง<br><font color='green'> ต.ย.<code> $str = q/The pencil is mine./;</code> </font></td></tr>
<tr><td>qq/STRING/</td><td>ใส่ double quote ให้สตริง<br><font color='green'> ต.ย.<code> print qq/"$str\", he said.\n/;</code></font> </td></tr>
<tr><td>reverse </td><td>กลับลำดับของการเรียงสตริง<br><font color='green'> ต.ย.<code> $str = reverse @array;</code></font> </td></tr>
<tr><td>rindex  </td><td>คืนตำแหน่งของ substring อันสุดท้ายที่พบในสตริง<br><font color='green'> ต.ย.<code> my $pos = rindex $str, $substr;</code></font> </td></tr>
<tr><td>sprintf </td><td>จำลองฟังก์ชัน sprintf ของภาษา C<br><font color='green'> ต.ย.<code> my $string = sprintf '%c', 0x61;</code></font> </td></tr>
<tr><td>substr  </td><td>แยก substring จากสตริงแล้วคืนค่า substring นั้น<br><font color='green'> ต.ย.<code> my $oneName = substr($names, 5, 8);</code></font> </td></tr>
<tr><td>tr///   </td><td>แปลงสตริงตามรูปแบบที่กำหนด<br><font color='green'> ต.ย.<code> tr/SEARCHLIST/REPLACEMENTLIST/cds</code></font> </td></tr>
<tr><td>uc      </td><td>แปลงทุกอักษรในสตริงให้เป็นตัวใหญ่ แล้วคืนค่าที่แปลง<br><font color='green'> ต.ย.<code> $string = uc($string);</code> </font></td></tr>
<tr><td>ucfirst </td><td>แปลงเฉพาะอักษรแรกของสตริงให้เป็นตัวใหญ่ แล้วคืนค่าที่แปลง<br><font color='green'> ต.ย.<code> my $newStr = ucfirst $str;</code></font> </td></tr></tbody></table>

<font color='red'>หมายเหตุ: my ใช้กำหนด scope ของตัวแปร คล้ายกับการตั้งค่า local variable</font>

<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
</li><li><a href='http://www.misc-perl-info.com/perl-string-functions.html'>http://www.misc-perl-info.com/perl-string-functions.html</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProg3.md'>การโปรแกรม Perl 3</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/perlProg2'>Edit</a>