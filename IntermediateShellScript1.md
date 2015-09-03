<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]<br>
<hr />
<br>
<hr />
<h2>การเรียกใช้ bc</h2>
bc คือ arbitrary precision calculator language ซึ่งสามารถใช้ช่วยในการคำนวนแทนเครื่องคิดเลขที่โปรแกรมได้ (ดูคู่มือ bc <a href='http://unixhelp.ed.ac.uk/CGI/man-cgi?bc+1'>Eng</a>,<a href='http://translate.google.com/translate?sl=en&tl=th&js=n&prev=_t&hl=th&ie=UTF-8&layout=2&eotf=1&u=http%3A%2F%2Funixhelp.ed.ac.uk%2FCGI%2Fman-cgi%3Fbc%2B1'>Th</a> )เนื่องจากการคำนวณในเชลล์นั้นจะเป็นแบบเลขจำนวนเต็ม (integer) ซึ่งทำให้บางครั้งมีข้อจำกัดในการคำนวณที่ซับซ้อนมากขึ้น อีกทั้งยังขาดฟังก์ชันทางคณิตศาสตร์ เช่น ฟังก์ชันตรีโกณมิติ เป็นต้น  ตัวอย่างต่อไปเป็นเชลล์สคริปต์ที่เรียกใช้โปรแกรม bc ที่คำนวณค่า Sine ของมุมที่เป็นองศา (degrees) แต่เนื่องจาก bc จะรับมุมเป็นเรเดี้ยน (radiant) โดยที่ 1 องศา =  0.0174532925 เรเดี้ยน จึงมีความจำเป็นต้องแปลงมุมองศาที่เป็นอินพุทให้เป็นเรเดี้ยนก่อนที่จะเรียกฟังก์ชัน s(x)<br>
<pre><code>#!/bin/bash<br>
#usage: ./sine.sh &lt;degrees&gt;<br>
#written by pyavinci@gmail.com<br>
if [ -z $1 ]; then<br>
  echo -e \\a<br>
  echo Usage: $0 \&lt;degrees\&gt;<br>
  echo Example: $0 90<br>
  echo will give answer about 1.0<br>
  exit 1<br>
fi<br>
# 1 degree = 0.0174532925 radians<br>
r=$(echo "$1*0.0174532925"|bc -l)<br>
echo $r radiants<br>
x=$(echo "s($r)" |bc -l)<br>
echo Sine\($1 degrees\)=$x<br>
</code></pre>

ตัวอย่างการรันสคริปต์นี้<br>
<br>
<pre><code>prachya@pcubusrv104:~/www/shell/advanced$ man bc<br>
prachya@pcubusrv104:~/www/shell/advanced$ ./sine.sh 90<br>
1.5707963250<br>
Sine(90 degrees)=.99999999999999999838<br>
</code></pre>

<h2>แบบฝึกหัด</h2>
<h3>สร้างหน้าเว็บอัตโนมัติด้วยเชลล์สคริปต์</h3>
ตัวอย่างต่อไปนี้เป็นการสร้างหน้าเว็บ แบบอัตโนมัติ โดยจะทำการอ่านไฟล์รายชื่อผู้ใช้จาก /etc/passwd จากนั้นนำมาแปลงให้อยู่ในฟอร์แม็ตของ HTML Tags ให้บันทึกเชลล์สคริปต์นี้ในไฟล์ชื่อ users1.sh<br>
<pre><code>#!/bin/bash<br>
#LOGIN:PWD:UID:GID:COMMENT:HOME:SHELL<br>
#c30chaiya:x:5530:5500::/home/c30chaiya:/bin/bash<br>
j=1<br>
echo "&lt;html&gt;"<br>
echo "NO:LOGIN:PWD:UID:GID:COMMENT:HOME:SHELL&lt;br&gt;"<br>
for i in $(cat /etc/passwd); do<br>
  echo "$j: $i &lt;br&gt;"<br>
  let j++<br>
done<br>
echo "&lt;/html&gt;"<br>
</code></pre>
การนำไปใช้งานสามารถทำได้ด้วยการ redirect เอาท์พุทไปที่ไฟล์ users.html<br>
<pre><code>$ ./users1.sh  &gt; users1.html<br>
</code></pre>
หากไฟล์นี้อยู่ที่เว็บเซอร์ฟเวอร์ก็จะสามารถเปิดดูได้ <a href='http://10.134.64.45/prachya/shell/intermediate/users1.html'>users1.html</a>
<h3>ใช้ grep ช่วยกรอง</h3>
หากเราไม่ต้องการข้อมูลบางส่วนก็สามารถใช้คำสั่ง grep ในการช่วยกรอง โดยจะแก้ไขคำสั่งในตัวอย่างที่ผ่านมาดังนี้ บรรทัด<br>
<pre><code>for i in $(cat /etc/passwd); do<br>
</code></pre>
แก้ให้เป็น<br>
<pre><code>for i in $(cat /etc/passwd |grep c[0-9]); do<br>
</code></pre>
แล้วให้บันทึกไฟล์เป็น users2.sh  แทนที่ตัวแปร i จะเป็นทุกบรรทัดที่อยู่ในไฟล์ /etc/passwd จะถูกส่งต่อโดยไปป์ (pipe) ในเครื่องหมายขีดตั้ง (|) ให้ไปเป็นอินพุทของ grep แทนซึ่งจะเลือกเฉพาะบรรทัดที่มี c0-c9 เท่านั้น (ซึ่งเป็นล็อกอินของนักเรียน)<br>
<pre><code>#!/bin/bash<br>
#LOGIN:PWD:UID:GID:COMMENT:HOME:SHELL<br>
#c30chaiya:x:5530:5500::/home/c30chaiya:/bin/bash<br>
j=1<br>
echo "&lt;html&gt;"<br>
echo "NO:LOGIN:PWD:UID:GID:COMMENT:HOME:SHELL&lt;br&gt;"<br>
for i in $(cat /etc/passwd |grep c[0-9]); do<br>
  echo "$j: $i &lt;br&gt;"<br>
  let j++<br>
done<br>
echo "&lt;/html&gt;"<br>
</code></pre>
จากนั้นรันโปรแกรมด้วยคำสั่ง<br>
<pre><code>$ ./users2.sh  &gt; users2.html<br>
</code></pre>
จะได้ผลลัพธ์ดังแสดงในลิงค์ <a href='http://10.134.64.45/prachya/shell/intermediate/users2.html'>users2.html</a>

<h2>การใช้ shift</h2>
คำสั่ง shift จะเลื่อนอินพุทพารามิเตอร์ที่ส่งเข้ามาผ่าน <code>$*</code> ซึ่งจะเลื่อนให้อินพุทตัวที่สอง $2 กลายมาเป็นอินพุทตัวแรก $1 พร้อมทั้งเลื่อนตัวอื่น ๆ ที่ตามหลังมา ตัวอย่างต่อไปนี้แสดงให้เห็นค่าของ $1 ที่เปลี่ยนไปหลังจากการ shift พร้อมทั้งแสดงค่าของ <code>$*</code> ที่เปลี่ยนไปเนื่องจากคำสั่ง shift คำสั่ง shift มีประโยชน์ในการที่ต้องประมวลผลตัวแปรหลายตัวด้วย routine เดียวกัน<br>
<pre><code>#/bin/bash<br>
#shitf.sh<br>
echo "-----------|-------------"<br>
echo "Value of \$1: Value of \$*"<br>
echo "-----------|-------------"<br>
while [ "$1" != "" ]; do<br>
  echo "$1        |  $*"<br>
  shift<br>
done<br>
</code></pre>
ทดสอบสคริปต์ด้วยการรันคำสั่ง <code>./shift.sh cat dog rat bat</code> จะได้ผลลัพธ์ดังนี้<br>
<pre><code>$ ./shift.sh cat dog rat bat<br>
-----------|-------------<br>
Value of $1: Value of $*<br>
-----------|-------------<br>
cat        |  cat dog rat bat<br>
dog        |  dog rat bat<br>
rat        |  rat bat<br>
bat        |  bat<br>
</code></pre>

<h3>สร้างฟังก์ชันช่วย</h3>
(แหล่งที่มา <a href='http://www.shelldorado.com/shelltips/intermediate.html'>http://www.shelldorado.com/shelltips/intermediate.html</a>)<br>
สร้างไฟล์ func1.sh ให้มีคำสั่งต่อไปนี้<br>
<pre><code># Append to .bashrc or call it from there.<br>
# Save some typing at the command line :)<br>
# src: http://www.shelldorado.com/shelltips/intermediate.html<br>
# longlist a directory, by page<br>
# lo [directoryname]<br>
lo () {<br>
      if [ -d "$1" ] ; then<br>
         ls -al "$1" | less<br>
      else<br>
         ls -al $(pwd) | less<br>
      fi<br>
}<br>
<br>
# Same as above but recursive<br>
lro () {<br>
      if [ -d "$1" ] ; then<br>
         ls -alR "$1" | less<br>
      else<br>
         ls -alR $(pwd) | less<br>
      fi<br>
}<br>
export -f lo lro<br>
</code></pre>

รันคำสั่ง source เพื่อให้อ่านสคริปต์และปรับ environment variables<br>
<pre><code>source ./func1.sh<br>
</code></pre>

ทดสอบเรียกฟังก์ชันจากเชลล์<br>
<pre><code>lo /etc<br>
</code></pre>
หรือ<br>
<pre><code>lro /var/www<br>
</code></pre>