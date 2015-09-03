<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>
<table width='500'>
<td>
คอมไพเลอร์ภาษา C บนเครื่องแม่ข่าย Ubuntu 10.04 นี้มีทั้ง gcc และ g++ ซึ่งสนับสนุนการคอมไพล์โปรแกรมภาษา C และ C++ ตามลำดับ ลักษณะการทำงานจะเป็น command line และ text-based ผู้ใช้ต้องพิมพ์คำสั่งผ่านเชลล์ เพื่อสั่งให้คอมไพเลอร์ทำการแปลงภาษาโปรแกรมให้เป็นไฟล์ที่สามารถรันได้<br>
<br>
ตรวจสอบเวอร์ชั่นของคอมไพเลอร์ภาษาแอสเซมบลี้<br>
<pre><code>as --version<br>
GNU assembler (GNU Binutils for Ubuntu) 2.20.1-system.20100303<br>
Copyright 2009 Free Software Foundation, Inc.<br>
This program is free software; you may redistribute it under the terms of<br>
the GNU General Public License version 3 or later.<br>
This program has absolutely no warranty.<br>
This assembler was configured for a target of `i486-linux-gnu'.<br>
</code></pre>

ตรวจสอบเวอร์ชั่นของคอมไพเลอร์ภาษา C<br>
<pre><code>prachya@pcubusrv104:~/asm$ gcc --version<br>
gcc (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3<br>
Copyright (C) 2009 Free Software Foundation, Inc.<br>
This is free software; see the source for copying conditions.  There is NO<br>
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br>
</code></pre>

ตรวจสอบเวอร์ชั่นของคอมไพเลอร์ภาษา C++<br>
<pre><code>prachya@pcubusrv104:~/asm$ g++ --version<br>
g++ (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3<br>
Copyright (C) 2009 Free Software Foundation, Inc.<br>
This is free software; see the source for copying conditions.  There is NO<br>
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br>
</code></pre>

การคอมไพล์โปรแกรมสามารถทำได้ด้วยการพิมพ์คำสั่ง gcc <ชื่อโปรแกรม.c><br>
เช่นโปรแกรมภาษา C ต่อไปนี้<br>
<pre><code>/* hello.c */<br>
#include &lt;stdio.h&gt;<br>
 <br>
int main() {<br>
    printf("Hello, world!\n");<br>
    return 0;<br>
}<br>
</code></pre>

สามารถคอมไพล์ด้วยคำสั่ง<br>
<pre><code>prachya@pcubusrv104:~/hello$ gcc hello.c<br>
</code></pre>
โดยหลังจากกด enter แล้ว gcc จะทำการคอมไพล์โปรแกรม hello.c พร้อมทั้งสร้างไฟล์ไบนารี่ชื่อ a.out โดยสามารถตรวจสอบดูว่ามีไฟล์อยู่หรือไม่ด้วยคำสั่ง ls<br>
<pre><code>prachya@pcubusrv104:~/hello$ ls<br>
a.out  hello.c<br>
</code></pre>
หากต้องการกำหนดชื่อไฟล์ไบนารี่ให้ใช้ตัวเลือก -o ร่วมกับการคอมไพล์<br>
<pre><code>prachya@pcubusrv104:~/hello$ gcc hello.c -o hello<br>
</code></pre>
จะได้ไฟล์ไบนารี่ชื่อว่า hello และสามารถรันโปรแกรมนี้จากเชลล์ด้วยคำสั่ง<br>
<pre><code>./hello<br>
Hello, world!<br>
</code></pre>

<a href='usingPerl.md'>Next: โปรแกรม Perl</a>