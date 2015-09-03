<table width='500'>
<td>
<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>

Shell เปรียบเสมือนเปลือกนอกของระบบปฏิบัติการซึ่งมี kernel ควบคุมการใช้งานฮาร์ดแวร์อยู่ภายใน ผู้ใช้ไม่สามารถติดต่อกับฮาร์ดแวร์โดยตรงได้ ต้องกระทำผ่าน system call หรือ ส่งคำสั่งผ่าน shell ในลิหนิกซ์ bash ถือว่าเป็น shell ที่เป็นที่นิยมและใช้เป็นมาตรฐานในการใช้งานลิหนิกซ์<br>
<br>
<table><thead><th>ชือ Shell</th><th>พัฒนาโดย</th><th>จาก</th><th>หมายเหตุ</th></thead><tbody>
<tr><td>BASH ( Bourne-Again SHell )</td><td>	Brian Fox และ Chet Ramey</td><td>Free Software Foundation</td><td>เป็น shell ที่เป็นที่นิยมและใช้มากที่สุดในลิหนิกซ์</td></tr>
<tr><td>CSH (C SHell)</td><td> Bill Joy</td><td>	University of California (สำหรับ BSD)</td><td>โครงสร้างประโยคคำสั่ง ใกล้เคียงกับการเขียนโปรแกรมภาษา C </td></tr>
<tr><td>KSH (Korn SHell)</td><td> David Korn</td><td> AT & T Bell Labs</td><td>--      </td></tr>
<tr><td>TCSH     </td><td>	ดู man page</td><td> $ man tcsh</td><td>TCSH เป็นการพัฒนา csh ให้มีขีดความสามารถมากขึ้นแต่ยังคง  compatible กับ Berkeley UNIX C shell (CSH).</td></tr></tbody></table>

คำสั่งต่าง ๆ ที่พิมพ์ผ่าน shell สามารถนำมาเรียงกันเช่นเดียวกับการเขียนโปรแกรมในภาษาอื่นๆ shell ยังสนับสนุนการควบคุมโปรแกรม (control structure) เช่น การวนซ้ำ (loop) หรือการสร้างตัวแปร เป็นต้น  ตัวอย่างของ shell script<br>
<br>
เราสามารถตรวจสอบว่าระบบมี shell แบบไหนบ้างด้วยคำสั่ง cat /etc/shells<br>
<pre><code>prachya@pcubusrv104:~/perl$ cat /etc/shells<br>
# /etc/shells: valid login shells<br>
/bin/csh<br>
/bin/sh<br>
/usr/bin/es<br>
/usr/bin/ksh<br>
/bin/ksh<br>
/usr/bin/rc<br>
/usr/bin/tcsh<br>
/bin/tcsh<br>
/usr/bin/esh<br>
/bin/dash<br>
/bin/bash<br>
/bin/rbash<br>
/usr/bin/screen<br>
</code></pre>

หากต้องการตรวจสอบว่าเราอยู่ใน shell ใดอยู่ให้ใช้คำสั่ง echo $SHELL<br>
<pre><code>prachya@pcubusrv104:~/perl$ echo $SHELL<br>
/bin/bash<br>
</code></pre>

โปรแกรมแรกในการเขียน shell script ถูกเขียนไว้ในไฟล์ hello.sh<br>
<pre><code>#!/bin/bash<br>
# My first script<br>
<br>
echo "Hello World!"<br>
</code></pre>

การรัน shell script สามารถทำได้ด้วยคำสั่ง sh hello.sh<br>
<pre><code>prachya@pcubusrv104:~/shell$ sh hello.sh<br>
Hello World!<br>
</code></pre>

นอกจากจะรันเชลล์สคริปต์ด้วยการเรียกผ่านคำสั่ง sh โดยตรงแล้วเรายังสามารถเปลี่ยน mode ของไฟล์สคริปต์ให้เป็นแบบ executable และรันโดยไม่ต้องเรียกคำสั่ง sh ได้<br>
<pre><code>chmod 755 hello.sh<br>
./hello.sh<br>
Hello World!<br>
</code></pre>

รายละเอียดการประยุกต์ใช้เชลล์สคริปต์ จะกล่าวถึงในบทถัดไป<br>
<h2>อ้างอิง</h2>
<ol><li><a href='http://www.freeos.com/guides/lsst/ch01sec07.html'>http://www.freeos.com/guides/lsst/ch01sec07.html</a>