<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]<br>
<hr />
<br>
<hr />
<h2>การเปรียบเทียบสตริง</h2>
การเปรียบเทียบสตริง เป็นไปตามการกำหนดเงื่อนไขต่อไปนี้<br>
<br>
<table><thead><th>string</th><th>เป็นจริงถ้าสตริงที่กำหนดไม่เป็นสตริงที่ว่างเปล่า</th></thead><tbody>
<tr><td>str1 = str2</td><td>เป็นจริงถ้าทั้งสองเท่ากัน                       </td></tr>
<tr><td>str1 != str2</td><td>เป็นจริงถ้าทั้งสองไม่เท่ากัน                    </td></tr>
<tr><td>-n str1</td><td>เป็นจริงถ้า str1 ไม่เป็น null                   </td></tr>
<tr><td>-z str1</td><td>เป็นจริงถ้า str1 เป็น null                      </td></tr></tbody></table>

<font color='red'>หมายเหตุ: </font> ต้องเว้น 1 space หลัง "if [" และ 1 space ก่อนปิดวงเล็บ " ]"<br>
<br>
ตัวอย่าง<br>
<pre><code>$ string1="Yahoo"<br>
$ string2="Yahoopp"<br>
$ if [ $string1 = $string2 ]; then<br>
&gt; echo "Strings are the same"<br>
&gt; else<br>
&gt; echo "Strings are different"<br>
&gt; fi<br>
</code></pre>
ผลลัพธ์<br>
<pre><code>Strings are different<br>
</code></pre>

<h2>การเปรียบเทียบค่าทางคณิตศาสตร์</h2>
การเปรียบเทียบค่าทางคณิตศาสตร์<br>
<br>
<table><thead><th>expr1 -eq expr2</th><th>เป็นจริงถ้าค่าของทั้งสองพจน์เท่ากัน</th></thead><tbody>
<tr><td>expr1 -ne expr2</td><td>เป็นจริงถ้าค่าของทั้งสองพจน์ไม่เท่ากัน</td></tr>
<tr><td>expr1 -gt expr2</td><td>เป็นจริงถ้า expr1 มากกว่า expr2    </td></tr>
<tr><td>expr1 -ge expr2</td><td>เป็นจริงถ้า expr1 มากกว่าหรือเท่ากับ expr2</td></tr>
<tr><td>expr1 -lt expr2</td><td>เป็นจริงถ้า expr1 น้อยกว่า expr2   </td></tr>
<tr><td>expr1 -le expr2</td><td>เป็นจริงถ้า expr1 น้อยกว่าหรือเท่ากับ expr2</td></tr>
<tr><td>! expr         </td><td>กลับค่า expr ถ้า expr เป็นจริงจะให้ !expr จะเป็นเท็จ</td></tr></tbody></table>

ตัวอย่าง<br>
<pre><code>$ num1=10<br>
$ num2=14<br>
$ if [ $num1 -gt $num2 ]; then<br>
&gt; echo "$num1 is greater than $num2"<br>
&gt; else<br>
&gt; echo "$num1 is less than $num2"<br>
&gt; fi<br>
</code></pre>
ผลลัพธ์<br>
<pre><code>10 is less than 14<br>
</code></pre>

นอกจากนั้นแล้วยังสามารถใช้เครื่องหมายวงเล็บสองชั้น เช่น ((c=c+1)) หรือ ((X<5)) เพื่อช่วยในการประมวลผลทางคณิตศาสตร์ของสตริงให้เป็นแบบตัวเลข<br>
<br>
<h2>โครงสร้างการควบคุม</h2>
โครงสร้างการควบคุม (control structures) เป็นคำสั่งที่เกี่ยวข้องกับการกำหนดทิศทาง หรือขั้นตอนการทำงานของโปรแกรม ซึ่งสามารถใช้คำสั่ง if, else if, for, while, until, หรือ case ได้ตามรายละเอียดและตัวอย่างต่อไปนี้<br>
<h3>if</h3>
if ใช้สำหรับกำหนดเงื่อนไขให้โปรแกรมทำงานตามเงื่อนไขที่กำหนด มีรูปแบบการใช้งานที่ง่ายและเป็นไปตามธรรมชาติความเข้าใจของภาษา<br>
<pre><code>if conditions<br>
then<br>
	statement<br>
else<br>
	statements<br>
fi<br>
</code></pre>
ตัวอย่าง<br>
<pre><code>#!/bin/bash<br>
echo "Is it morning? Please answer yes or no"<br>
read answ<br>
if [ $answ = "yes" ]; then<br>
	echo "Good morning na ja"<br>
else<br>
	echo "Good afternoon na ka"<br>
fi<br>
exit 0<br>
</code></pre>
สคริปต์ดังกล่าวตรวจสอบค่าของ $answ ว่าผู้ใช้ตอบกลับมาเป็น yes หรือไม่ และถ้าไม่ตอบ yes เราไม่จำเป็นต้องตรวจสอบว่าเป็น no ซึ่งจะเข้าอยู่ในเงื่อนไขของ else<br>
<br>
<h3>elif</h3>
elif ย่อมาจาก else-if ใช้กรณีที่มีเงื่อนไขที่มากกว่าสอง และใช้อยู่ภายในกรอบ if...fi ตามตัวอย่างต่อไปนี้<br>
<pre><code>#!/bin/bash<br>
echo "Is it morning? Please answer yes or no"<br>
read answ<br>
if [ $answ = "yes" ]; then<br>
	echo "Good morning na ja"<br>
elif [ $answ = "no" ]; then<br>
	echo "Good afternoon na ka"<br>
else<br>
	echo "Please enter only yes or no"<br>
	exit 1<br>
fi<br>
exit 0<br>
</code></pre>
จากตัวอย่างการใช้ elif ข้างต้นจะเห็นได้ว่ามีเงื่อนไขที่มากกว่าตัวอย่างที่ผ่านมาซึ่งผู้เขียนโปรแกรมต้องการให้มีสามเงื่อนไข คำสั่ง exit 1 ให้ค่ากลับไปที่ shell เพื่อบอกให้รู้ว่ามีข้อผิดพลาดเกิดขึ้นในการใส่อินพุท<br>
<br>
<h3>for loop</h3>
คำสั่ง for เป็นการวนลูปหรือทำซ้ำให้โปรแกรมทำงานตามรายการที่กำหนดไว้หลัง in มีรูปแบบโดยทั่วไปดังนี้<br>
<pre><code>for variable in values<br>
do<br>
	statements<br>
done<br>
</code></pre>
การควบคุมของลูปจะอยู่ภายในกรอบ do...done ตัวอย่างในบทก่อนหน้านี้ได้แสดงให้เห็นการใช้งาน for ลูป เช่น<br>
<pre><code>for bc in Five Four Three Two One Fire<br>
do<br>
	echo $bc<br>
done<br>
</code></pre>
จะให้ผลลัพธ์ที่หน้าจอเป็น<br>
<pre><code>Five<br>
Four<br>
Tree<br>
Two<br>
One<br>
Fire<br>
</code></pre>
ตัวอย่างต่อไปนี้เป็นการสั่งเครื่องพิมพ์ (หากมีการติดตั้งโปรแกรม lpr) โดยให้พิมพ์ไฟล์ chap3.txt chap4.txt และ chap5.txt<br>
<pre><code>#!/bin/bash<br>
for pfile in $(ls chap[345].txt); do<br>
	lpr $pfile<br>
done<br>
</code></pre>
สคริปต์นี้เรียกใช้โปรแกรม lpr ซึ่งจะส่งรายชื่อของไฟล์ด้วยการใช้ RE (regular expression)<br>
<br>
<h3>while loop</h3>
while เป็นคำสั่งในการวนลูปคล้ายกับ for แต่ผู้ใช้สามารถกำหนดเงื่อนไขในการหยุดการวนซ้ำได้ตามต้องการไม่จำเป็นต้องไล่ไปตามลิสต์ที่กำหนดไว้ล่วงหน้าเหมือน for การใช้ while มีรูปแบบดังนี้<br>
<pre><code>while conditions<br>
do<br>
	statements<br>
done<br>
</code></pre>
ตัวอย่างต่อไปเป็นการใช้ลูป while ร่วมกับการทดสอบเงื่อนไขและการประมวลผลตัวเลข<br>
<pre><code>#!/bin/bash<br>
#while1.sh - by pyavincy@gmail.com<br>
c=1<br>
while [ "$c" -le 20 ]<br>
do<br>
	echo "Counting $c"<br>
	c=$(($c+1))<br>
done<br>
exit 0<br>
</code></pre>
<h3>until loop</h3>
การใช้งาน until เป็นการควบคุมลูปคล้ายกับ while ต่างกันที่ until จะทดสอบเงื่อนไขหลังจากทำคำสั่ง done แล้วแต่ while จะทดสอบเงื่อนไขก่อนคำสั่ง do ตัวอย่างของการใช้ until มีดังนี้<br>
<pre><code>until who | grep "$1" &gt; /dev/null<br>
do<br>
	sleep 10<br>
done<br>
echo -e \\a<br>
echo "$1 has just logged in!!""<br>
exit 0<br>
</code></pre>
สคริปต์นี้จะทำงานไปเรื่อย ๆ จนกว่าจะมีคนล็อกอิน แล้วจะส่งสัญญาณเป็น ASCII ของ alert (bell) ด้วยการใช้ -e ร่วมกับเครื่องหมาย \ (backslash) คือ -e \\a  หรือบางครั้งเรียกว่า escaped characters เช่น \a = alert(bell), \b = backspace, \c suppress trailing newline, \f = form feed, \n = new line, \r = carriage return, \t horizontal tab, \v = vertical tab, \\ = backslash เป็นต้น<br>
<br>
<h3>case</h3>
<blockquote>ถึงแม้ว่าในการควบคุมทางเลือกของโปรแกรมจะสามารถใช้ if .. elif .. else .. fi ได้ก็ตาม หากมีทางเลือกหลายทางและมีความจำเป็นต้องประเมินเงื่อนไขที่ซับซ้อนขึ้น การใช้ case .. esac จะช่วยให้ผู้เขียนโปรแกรมมีความสะดวกมากขึ้น  รูปแบบของการใช้ case มีดังนี้<br>
<pre><code>case variable in values<br>
    pattern [ | pattern] ...) statements;;<br>
    pattern [ | pattern] ...) statements;;<br>
    ...<br>
esac<br>
</code></pre>
ตัวอย่างต่อไปนี้เป็นการใช้งาน case ในการสร้างทางเลือกให้กับผู้ใช้<br>
<pre><code>#!/bin/bash<br>
echo "Is it morning? Pleas answer yes or no"<br>
read answ<br>
case "$answ" in<br>
   "yes") echo "Good Morning";;<br>
   "no") echo "Good Afternoon";;<br>
   "y") echo "Good Morning";;<br>
   "n") echo "Good Afternoon";;<br>
   * ) echo "Sorry, answer not recognized";;<br>
esac<br>
</code></pre>
เครื่องหมาย <code>*</code> ใช้เป็นค่า default สำหรับตัวเลือก  ตัวอย่างต่อไปเป็นการปรับปรุงสคริปต์ให้เรียบง่ายและเข้าใจได้ง่ายขึ้น<br>
<pre><code>#!/bin/bash<br>
echo "Is it morning? Please answer yes or no"<br>
read answ<br>
case "$answ" in<br>
    "yes" | "y" | "Yes" | "YES" ) echo "Good Morning";;<br>
    "no" | "n" | "N" )  echo "Good Afternoon";;<br>
    * ) echo "Sorry, anwser not recognized";;<br>
esac<br>
exit 0<br>
</code></pre>
<h2>โอเปอเรเตอร์ทางตรรก AND และ OR</h2>
บางครั้งโปรแกรมเมอร์ต้องการเขียนชุดคำสั่งโดยมีเงื่อนไขที่ซับซ้อนมากขึ้นการใช้งาน if..elfi..else..fi แต่เพียงอย่างเดียวอาจทำให้เกิดความสับสนในการควบคุมโปรแกรม เช่นต้องการตรวจสอบว่ามีไฟล์ A หรือ B หรือ C หรือไม่ก็สามารถเขียนสคริปต์ได้ดังนี้<br>
<pre><code>if [ -f file_A ]; then<br>
	answ="True"<br>
elif [ -f file_B ]; then<br>
	answ="True"<br>
elif [ -f file_C ]; then<br>
	answ="True"<br>
else<br>
	answ="False"<br>
fi<br>
if [  "$answ" = "True" ]; then<br>
	echo "At least one of the file exists"<br>
else<br>
	echo "No specified files found"<br>
fi<br>
</code></pre>
จะเห็นได้ว่าลอจิกนั้นเป็น (file_A) OR (file_B) OR (file_C) เงื่อนไขที่ต้องการทั้งหมดจะเป็นจริง  เราสามารถแทน OR ได้ด้วยเครื่องหมาย || และสามารถแทน AND ได้ด้วยเครื่องหมาย && สคริปต์ก่อนหน้านี้สามารถเขียนใหม่ได้เป็น<br>
<pre><code>if [ -f file_A] || [ -f file_B] || [ -f file_C]; then<br>
	answ="True"<br>
else<br>
	answ="False"<br>
fi<br>
if [ "$answ" = "True"]; then<br>
	echo "At least one of the file exists"<br>
else<br>
	echo "No specified files found"<br>
fi<br>
</code></pre>
ตัวอย่างต่อไปเป็นการใช้ลอจิก AND ในการควบคุมการทำงานของโปรแกรม<br>
<pre><code>#!/bin/bash<br>
echo "Please enter 3 numbers"<br>
echo "First number:"<br>
read n1<br>
echo "Second number:"<br>
read n2<br>
echo "Third number:"<br>
read n3<br>
<br>
if [ "$n1" = "1" ] &amp;&amp; [ "$n2" = "3" ] &amp;&amp; [ "$n3" = "5" ]<br>
then<br>
     echo "All numbers are odd"<br>
else <br>
    echo "Some of them might be even"<br>
fi<br>
exit 0<br>
</code></pre>
โปรแกรมจะพิมพ์วลี "All numbers are odd" เฉพาะกรณีที่เลขเป็นคี่เรียงตามลำดับที่กำหนดไว้คือ 1, 3, และ 5</blockquote>

<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]--><a href='functionInShell.md'>(Next:ฟังก์ชัน)</a>