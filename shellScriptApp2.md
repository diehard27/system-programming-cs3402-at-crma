<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='shellScriptApp3.md'>การประยุกต์ใช้เชลล์สคริปต์ ๓</a>
<br>
<h1>คำสั่ง printf</h1>
คำสั่ง printf ทำงานใกล้เคียงกับคำสั่ง printf() ในภาษา C ที่เราคุ้นเคย รูปแบบคำสั่งในเชลล์เป็นดังนี้<br>
<pre><code>printf "format string" parameter1 parameter2 ...<br>
</code></pre>

<table><thead><th>Escape Sequence </th><th>หมายเหตุ</th></thead><tbody>
<tr><td>\\              </td><td>Backslash character.</td></tr>
<tr><td>\a              </td><td>Alert (rings the bell or beep).</td></tr>
<tr><td>\b              </td><td>Backspace character.</td></tr>
<tr><td>\f              </td><td>Form feed character.</td></tr>
<tr><td>\n              </td><td>Newline character.</td></tr>
<tr><td>\r              </td><td>Carriage return.</td></tr>
<tr><td>\t              </td><td>Tab character.</td></tr>
<tr><td>\v              </td><td>Vertical tab character.</td></tr>
<tr><td>\ooo            </td><td>The single character with actual octal value ooo</td></tr></tbody></table>

ตัวอย่างของตัวกำหนดค่าที่ใช้บ่อย<br>
<br>
<table><thead><th>กำหนดค่าตัวแปร</th><th> หมายเหตุ</th></thead><tbody>
<tr><td>d             </td><td> เลขจำนวนเต็ม</td></tr>
<tr><td>c             </td><td> ตัวอักษร</td></tr>
<tr><td>s             </td><td> สตริง   </td></tr>
<tr><td>%             </td><td> เครื่องหมาย % </td></tr></tbody></table>

<pre><code>$ printf "%s\n" hello<br>
hello<br>
</code></pre>
อีกตัวอย่างของการใช้ printf<br>
<pre><code>$ printf "%s %d\t%s" "Hi there" 15 people<br>
Hi there 15 people<br>
</code></pre>

<h1>คำสั่ง set และ unset</h1>
คำสั่ง set ตั้งค่าของพารามิเตอร์ของเชลล์ สำหรับพารามิเตอร์ที่คั่นด้วย space<br>
ตัวอย่างเช่น<br>
<pre><code>set x y z<br>
</code></pre>
จะกำหนดค่า ของ x ไปที่ $1, y ไปที่ $2 และ z ไปที่ $3<br>
ผลของการรันคำสั่งต่อไป<br>
<pre><code>set x y z<br>
echo $2<br>
</code></pre>
จะได้ผลลัพธ์เท่ากับ<br>
<pre><code>y<br>
</code></pre>

ถ้ารัน set โดยไม่มีพารามิเตอร์ จะพิมพ์ค่าของตัวแปรทั้งหมดเรียงตามลำดับอักษร เช่น<br>
<pre><code>set |head<br>
</code></pre>
จะได้ผลลัพธ์คือ<br>
<pre><code>BASH=/bin/bash<br>
BASHOPTS=checkwinsize:cmdhist:expand_aliases:extglob:extquote:force_fignore:histappend:interactive_comments:login_shell:progcomp:promptvars:sourcepath<br>
BASH_ALIASES=()<br>
BASH_ARGC=()<br>
BASH_ARGV=()<br>
BASH_CMDS=()<br>
BASH_COMPLETION=/etc/bash_completion<br>
BASH_COMPLETION_COMPAT_DIR=/etc/bash_completion.d<br>
BASH_COMPLETION_DIR=/etc/bash_completion.d<br>
BASH_LINENO=()<br>
</code></pre>
ตัวอย่างการใช้งาน<br>
<pre><code>#! /bin/bash<br>
echo the date is $(date)<br>
set $(date)<br>
echo The month is $2<br>
exit 0<br>
</code></pre>
จะได้ผลลัพธ์เป็น<br>
<pre><code>the date is Thu Nov 13 23:16:33 SAT 1997<br>
The month is Nov<br>
</code></pre>
เนื่องจากคำสั่ง date ให้ผลลัพธ์เป็น <code>Thu Nov 13 23:16:33 SAT 1997</code> ซึ่งเมื่อรันคำสั่ง <code>set $(date)</code> จะทำให้ $1=Thu, $2=Nov, ตามลำดับ ดังนั้นจึงได้ผลลัพธ์ดังตัวอย่างข้างต้น<br>
<br>
<h1>การจัดการพารามิเตอร์ expansion</h1>
จากตัวอย่างเชลล์สคริปต์ paramsubst.sh<br>
<pre><code>#!/bin/bash<br>
echo 1 &gt; 1_temp<br>
echo 2 &gt; 2_temp<br>
echo 3 &gt; 3_temp<br>
for i in 1 2 3<br>
do<br>
  cat $i_temp<br>
done<br>
</code></pre>
จะเกิดปัญหารการรันค้างเนื่องจากเชลล์นึกว่าให้ส่งพารามิเตอร์ชื่อว่า <code>i_temp</code> แทนที่จะใช้ตัวแปร i ไปให้โปรแกรม cat และจะไม่แสดงผลลัพธ์ใด ๆ วิธีแก้ไขคือการใช้วงเล็บปีกกาใหญ่ช่วยทำให้การระบุการใช้ตัวแปรให้ชัดเจนดังตัวอย่างโปรแกรม paramsubst2.sh<br>
<pre><code>#!/bin/bash<br>
echo 1 &gt; 1_temp<br>
echo 2 &gt; 2_temp<br>
echo 3 &gt; 3_temp<br>
for i in 1 2 3<br>
do<br>
  cat ${i}_temp<br>
done<br>
</code></pre>
ซึ่งจะให้ผลลัพธ์ตามต้องการดังนี้<br>
<pre><code>$ ./paramsubst2.sh<br>
1<br>
2<br>
3<br>
</code></pre>

ตารางแสดงการใช้ parameter expansion<br>
<table><thead><th><b>พารามิเตอร์ expansion</b></th><th> <b>คำอธิบาย</b></th></thead><tbody>
<tr><td>${param:-default}           </td><td> ถ้าพารามิเตอ์เป็น null ให้เซ็ทเป็นค่า default</td></tr>
<tr><td>${#param}                   </td><td> ให้ความยาวของพารามิเตอร์</td></tr>
<tr><td>${param%word}               </td><td> จากจุดเริ่มต้น เอาส่วนที่เหมือน word สั้นที่สุดออกจากพารามิเตอร์เดิมแล้วส่งส่วนที่เหลือเป็นผลลัพธ์</td></tr>
<tr><td>${param%%word}              </td><td> จากจุดเริ่มต้นเอาส่วนที่ยาวที่สุดที่เหมือน word ออกจากพารามิเตอร์ แล้วส่งส่วนที่เหลือเป็นผลลัพธ์</td></tr>
<tr><td>${param#word}               </td><td> จากสุดท้ายของพารามิเตอร์เอาส่วนที่เล็กสุดที่เหมือน word ออก</td></tr>
<tr><td>${param##word}              </td><td> จากสุดท้ายของพารามิเตอร์เอาส่วนที่ยาวสุดที่เหมือน word ออก</td></tr></tbody></table>

ตัวอย่างการใช้งาน parameter expansion ในสคริปต์ paramsubst3.sh<br>
<pre><code>#!/bin/bash<br>
unset foo<br>
echo ${foo:-bar}<br>
<br>
foo=fud<br>
echo ${foo:-bar}<br>
<br>
foo=/usr/bin/X11R6/startx<br>
echo ${foo#*/}<br>
echo ${foo##*/}<br>
<br>
bar=/usr/local/etc/local/networks<br>
echo ${bar%local*}<br>
echo ${bar%%local*}<br>
exit 0<br>
</code></pre>
ซึ่งจะให้ผลการรันดังนี้<br>
<pre><code>$  ./paramsubst3.sh<br>
bar<br>
fud<br>
usr/bin/X11R6/startx<br>
startx<br>
/usr/local/etc/<br>
/usr/<br>
</code></pre>

<h1>ปัญหา ๑</h1>
<ul><li>ต้องการสร้างหน้าเว็บที่รับอินพุทจากผู้ใช้ เพื่อรันคำสั่งในเชลล์</li></ul>

<h2>แนวทาง</h2>
ในตัวอย่างนี้<br>
<h3>การรันคำสั่งเชลล์ผ่าน PHP</h3>
PHP สามารถรันคำสั่งในเชลล์ได้ และยังสามารถแสดงผลลัพธ์ของการรัน จากตัวอย่างต่อไปนี้<br>
<pre><code>&lt;?php<br>
$output = shell_exec('last');<br>
echo "&lt;pre&gt;$output&lt;/pre&gt;";<br>
?&gt;<br>
</code></pre>
<h3>การรับอินพุทจากผู้ใช้ผ่านบราวเซอร์</h3>
ในส่วนนี้เราต้องการให้ผู้ใช้สามารถป้อนคำสั่งที่จะรันผ่านฟอร์มของที่หน้าบราวเซอร์ ส่วนี้สามารถใช้สคริปต์ <a href='http://www.w3schools.com/php/php_forms.asp'>PHP</a> ที่สนับสนุนการทำงานผ่านฟอร์ม และสามารถส่งคำสั่งจากผู้ใช้ไปยังเชลล์ได้ตามโปรแกรม<br>
<pre><code>&lt;html&gt;<br>
&lt;body&gt;<br>
&lt;table widht=500&gt;&lt;td&gt;<br>
&lt;!-- written by pyavinci@gmail.com --&gt;<br>
<br>
&lt;form action="shexec.php" method="post"&gt;<br>
Command: &lt;input type="text" name="cmd" /&gt;<br>
Params: &lt;input type="text" name="params" /&gt;<br>
&lt;input type="submit" /&gt;<br>
&lt;/form&gt;<br>
&lt;hr&gt;<br>
Shell command executed :<br>
&lt;?php echo $_POST["cmd"]; ?&gt;<br>
&lt;?php echo $_POST["params"]; ?&gt;<br>
&lt;hr&gt;<br>
&lt;?php<br>
$lcmd =  $_POST["cmd"]." ".$_POST["params"];<br>
$output = shell_exec($lcmd);<br>
echo "&lt;pre&gt;$output&lt;/pre&gt;";<br>
?&gt;<br>
&lt;/td&gt;&lt;/table&gt;<br>
&lt;/body&gt;<br>
&lt;/html&gt;<br>
</code></pre>
<h3>ปรับแต่งโปรแกรม</h3>
<pre><code>&lt;html&gt;<br>
&lt;body&gt;<br>
&lt;table width=500&gt;&lt;td&gt;<br>
&lt;!-- written by pyavinci@gmail.com --&gt;<br>
<br>
&lt;table width=500 bgcolor=#33CC33&gt;&lt;td&gt;<br>
&lt;form action="shexec.php" method="post"&gt;<br>
Command: &lt;input type="text" name="cmd" /&gt;<br>
Params: &lt;input type="text" name="params" /&gt;<br>
&lt;input type="submit" /&gt;<br>
&lt;/form&gt;<br>
&lt;/td&gt;&lt;/table&gt;<br>
&lt;hr&gt;<br>
&lt;table width=500&gt;&lt;tr&gt;<br>
&lt;td width=200&gt; Shell command executed :&lt;/td&gt;<br>
&lt;td bgcolor=#FF9900 widht=20&gt;&lt;/td&gt;<br>
&lt;td bgcolor=#FFCC00&gt;<br>
&lt;?php echo "  "; ?&gt;<br>
&lt;?php echo $_POST["cmd"]; ?&gt;<br>
&lt;?php echo $_POST["params"]; ?&gt;<br>
&lt;/td&gt;<br>
&lt;/tr&gt;&lt;/table&gt;<br>
&lt;hr&gt;<br>
&lt;table width=500 bgcolor=#CCFFCC&gt;&lt;td&gt;<br>
&lt;?php<br>
$lcmd =  $_POST["cmd"]." ".$_POST["params"];<br>
$output = shell_exec($lcmd);<br>
echo "&lt;pre&gt;$output&lt;/pre&gt;";<br>
?&gt;<br>
&lt;/td&gt;&lt;/table&gt;<br>
&lt;/td&gt;&lt;/table&gt;<br>
&lt;/body&gt;<br>
&lt;/html&gt;<br>
</code></pre>
เพิ่มการควบคุมสีของการแสดง สามารถตรวจสอบได้จากการรัน<br>
<a href='http://10.134.64.45/prachya/shell/intermediate/shexec.php'>shexec.php</a>

<img src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/Figures/shexec-screen.png' />

<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='shellScriptApp3.md'>การประยุกต์ใช้เชลล์สคริปต์ ๓</a>