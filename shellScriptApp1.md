[กลับไปหน้าหลัก](CourseSchedule2555_2.md)-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: [การประยุกต์ใช้เชลล์สคริปต์ ๒](shellScriptApp2.md)
<table width='500'>
<td>
<hr />
<br>
<hr />
ตัวอย่างต่อไปนี้เป็นการประยุกต์ใช้เชลล์สคริปต์ในการสร้างหน้าเว็บ สำหรับแสดงข้อมูลของผู้ใช้งานบนเครื่องแม่ข่าย 10.134.64.45 โดยจะแสดงรายชื่อของผู้ใช้พร้อมทั้งลิงค์ไปยังรายละเอียด ของผู้ใช้เช่นข้อมูลจาก last, นับจำนวนล็อกอินแล้วพิมพ์ออกเป็นกราฟแนวนอน, แสดงลิงค์ไปยังเว็บไดเร็กทอรี่ของผู้ใช้<br>
<h2>สร้างเฮดเดอร์สำหรับ HTML</h2>
<pre><code>#!/bin/bash<br>
#written by pyavinci@gmail.com<br>
echo "&lt;html&gt;&lt;body&gt;"<br>
echo "&lt;title&gt;CS3402: System Programming&lt;/title&gt;"<br>
</code></pre>
<h2>กำหนดชื่อ และ anchor</h2>
<pre><code>echo "&lt;h1&gt;&lt;a href='https://code.google.com/p/system-programming-cs3402-at-crma/'&gt;CS3402&lt;/a&gt;: System Programming&lt;/h1&gt;"<br>
echo "&lt;a name='top'&gt;&lt;/a&gt;"<br>
echo "&lt;table width=500&gt;&lt;td&gt;"<br>
</code></pre>
<h2>สร้างรายชื่อผู้ใช้</h2>
<pre><code>echo "&lt;table widht=500&gt;&lt;tr&gt;&lt;td&gt;"<br>
echo "&lt;img src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/References/Books/linux%20system%20programming%20-%20cover.png' width=150&gt;"<br>
echo "&lt;/td&gt;&lt;td&gt;"<br>
u="$(ls /home | grep c[0-9]) phnarong prachya"<br>
for i in $u ; do<br>
  echo "&lt;a href=#$i&gt;$i&lt;/a&gt;"<br>
done<br>
echo "&lt;/td&gt;"<br>
echo "&lt;/tr&gt;&lt;/table&gt;"<br>
echo "&lt;hr&gt;"<br>
</code></pre>

<h2>สร้างรายละเอียดของผู้ใช้แต่ละคน</h2>
<pre><code>for i in $u ; do<br>
  echo "&lt;a name="$i"&gt;&lt;h2&gt;$i&lt;/h2&gt;&lt;/a&gt;"<br>
  echo "[&lt;a href=/$i&gt;Dir&lt;/a&gt;],[&lt;a href=#top&gt;Top&lt;/a&gt;], "<br>
  lc=$(last $i|wc -l)<br>
  let lc=lc-2<br>
  echo "Last Log: login $lc times&lt;br&gt;"<br>
</code></pre>
<h2>สร้างกราฟแนวนอน</h2>
<pre><code>  x="&amp;#9775"<br>
  # http://natural-innovations.com/wa/doc-charset.html<br>
  bar=""<br>
  while [ $lc -gt "0" ]; do<br>
    bar=$bar$x<br>
    let lc--<br>
  done<br>
  echo "Frequency: $bar&lt;br&gt;"<br>
  echo "$(last $i|head -1)&lt;br&gt;"<br>
  echo "&lt;hr&gt;"<br>
done<br>
echo "&lt;/td&gt;&lt;/table&gt;"<br>
echo "&lt;/body&gt;&lt;/html&gt;"<br>
</code></pre>

<h2>ไฟล์ userweb.sh</h2>
<pre><code>#!/bin/bash<br>
#written by pyavinci@gmail.com<br>
echo "&lt;html&gt;&lt;body&gt;"<br>
echo "&lt;title&gt;CS3402: System Programming&lt;/title&gt;"<br>
echo "&lt;h1&gt;&lt;a href='https://code.google.com/p/system-programming-cs3402-at-crma/'&gt;CS3402&lt;/a&gt;: System Programming&lt;/h1&gt;"<br>
echo "&lt;a name='top'&gt;&lt;/a&gt;"<br>
echo "&lt;table width=500&gt;&lt;td&gt;"<br>
echo "&lt;table widht=500&gt;&lt;tr&gt;&lt;td&gt;"<br>
echo "&lt;img src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/References/Books/linux%20system%20programming%20-%20cover.png' width=150&gt;"<br>
echo "&lt;/td&gt;&lt;td&gt;"<br>
u="$(ls /home | grep c[0-9]) phnarong prachya"<br>
for i in $u ; do<br>
  echo "&lt;a href=#$i&gt;$i&lt;/a&gt;"<br>
done<br>
echo "&lt;/td&gt;"<br>
echo "&lt;/tr&gt;&lt;/table&gt;"<br>
echo "&lt;hr&gt;"<br>
for i in $u ; do<br>
  echo "&lt;a name="$i"&gt;&lt;h2&gt;$i&lt;/h2&gt;&lt;/a&gt;"<br>
  echo "[&lt;a href=/$i&gt;Dir&lt;/a&gt;],[&lt;a href=#top&gt;Top&lt;/a&gt;], "<br>
  lc=$(last $i|wc -l)<br>
  let lc=lc-2<br>
  echo "Last Log: login $lc times&lt;br&gt;"<br>
  x="&amp;#9775"<br>
  # http://natural-innovations.com/wa/doc-charset.html<br>
  bar=""<br>
  while [ $lc -gt "0" ]; do<br>
    bar=$bar$x<br>
    let lc--<br>
  done<br>
  echo "Frequency: $bar&lt;br&gt;"<br>
  echo "$(last $i|head -1)&lt;br&gt;"<br>
  echo "&lt;hr&gt;"<br>
done<br>
echo "&lt;/td&gt;&lt;/table&gt;"<br>
echo "&lt;/body&gt;&lt;/html&gt;"<br>
</code></pre>
บันทึกเชลล์สคริปต์นี้ไว้ที่ไฟล์ userweb.sh จากนั้นรันคำสั่ง<br>
<pre><code>./userweb.sh &gt; userweb.html<br>
</code></pre>
เปิดหน้าเว็บของไฟล์ <a href='http://10.134.64.45/prachya/shell/intermediate/userweb.html'>userweb.html</a> เพื่อดูผลของการสร้างหน้าเว็บที่ต้องการ<br>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='shellScriptApp2.md'>การประยุกต์ใช้เชลล์สคริปต์ ๒</a>