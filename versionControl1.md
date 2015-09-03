<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='shellScriptApp3.md'>การประยุกต์ใช้เชลล์สคริปต์ ๓</a>
<br>
<hr />
<h1>ข้อมูลพื้นฐาน</h1>
<ul><li>เครื่องแม่ข่ายที่ใช้ทดสอบโปรแกรมอยู่ที่่ 10.134.64.45 โดยที่การใช้งาน, การเขียนโปรแกรมจะกระทำบนเครื่องนี้ก่อนที่จะนำไปเก็บไว้ใน Google Code<br>
</li><li>ใช้ Google Code เป็นที่เก็บไฟล์ของโปรเจ็ค โดยจะถูกเก็บไว้ในฐานข้อมูล และเรียกดูได้จากแท็บ <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/checkout'>Source</a> ของ Google Code โดยสามารถดูไฟล์ในลิงค์ Browse ได้<br>
</li><li>ทางเลือกสามารถใช้<br>
<ul><li>Subversion, <a href='http://subversion.apache.org/'>http://subversion.apache.org/</a> เป็นที่ยอมรับในการใช้งานสร้างโปรเจ็คซอฟท์แวร์<br>
</li><li>Git Client, <a href='http://git-scm.com/about'>http://git-scm.com/about</a> ได้, มี GUI ให้ใช้งานได้สะดวก<br>
</li><li>Mercurial, <a href='http://mercurial.selenic.com/'>http://mercurial.selenic.com/</a>
</li><li>Tortoise, <a href='http://tortoisehg.bitbucket.org/'>http://tortoisehg.bitbucket.org/</a> ผู้ใช้บนวินโดวส์นิยมใช้กันมาก</li></ul></li></ul>

<h1>การใช้ Subversion</h1>
<a href='http://subversion.apache.org/'>
<img src='http://subversion.apache.org/images/svn-square.jpg' width='100></a'>

<h2>Project members</h2>
สมาชิกของโปรเจ็ค สามารถ checkout ซอร์สโค้ดไปจากที่เก็บไฟล์ของโปรเจ็คบน Google Code ได้ด้วยโปรแกรม Subversion โดยเรียกคำสั่ง svn checkout ....<br>
<pre><code>svn checkout https://system-programming-cs3402-at-crma.googlecode.com/svn/trunk/ \ <br>
system-programming-cs3402-at-crma --username pyavinci@gmail.com<br>
</code></pre>

ใช้รหัสผ่านจาก generated googlecode.com password ใน Profile->Settings ไม่ใช่รหัสผ่านของ Gmail<br>
<br>
<h2>Non-members</h2>
ผู้ที่ไม่ใช่สมาชิกสามารถ checkout โปรเจ็คไปได้แต่สามารถอ่านได้อย่างเดียว read only ไม่สามารถ commit ไฟล์ซอร์สโค้ดกลับมาที่ Google Code ได้<br>
<pre><code>svn checkout http://system-programming-cs3402-at-crma.googlecode.com/svn/trunk/ \<br>
system-programming-cs3402-at-crma-read-only<br>
</code></pre>

<h1>Git</h1>
<a href='http://git-scm.com/'>
<img src='http://git-scm.com/images/logo.png' width='100></a'>

<h1>Mercurial</h1>
<a href='http://mercurial.selenic.com/'><img src='http://www.selenic.com/hg-logo/logo-droplets-200.png' width='100></a'>

<h1>Tortoise</h1>
<a href='http://tortoisehg.bitbucket.org/'><img src='http://tortoisehg.bitbucket.org/css/img/logo.png' width='200></a'>

<h1>References</h1>
<ul><li>คู่มือการใช้งาน SVN Client, PSU, <a href='http://www.coe.phuket.psu.ac.th/guide/svn_guide_student_coe/'>http://www.coe.phuket.psu.ac.th/guide/svn_guide_student_coe/</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='shellScriptApp3.md'>การประยุกต์ใช้เชลล์สคริปต์ ๓</a>