<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>
<table width='500'>
<td>
<table><thead><th><img src='http://www.nptel.iitm.ac.in/courses/Webcourse-contents/IIT-KANPUR/compiler-desing/chapter_2/images/sanjeev2.gif' /></th><th><img src='http://www.bogotobogo.com/cplusplus/images/assembly/linker_loader.png' /></th></thead><tbody>
ขั้นตอนง่าย ๆ ในการคอมไพล์โปรแกรมภาษาแอสเซมบลี้ใน Linux (ubuntu 10.04) ด้วยโปรแกรมแอสเซมเบลอร์ as ประกอบด้วยขั้นตอนหลัก คือ</tbody></table>

1) เขียนโปรแกรม hello.s ตามตัวอย่างข้างล่างขึ้นมาด้วยการใช้เอดิเตอร์ เช่น vi หรือ nano โดยเรียกคำสั่ง<br>
<pre><code>nano hello.s <br>
</code></pre>
จากนั้นให้บันทึกไฟล์แล้วออกจากเอดิเตอร์ เพื่อทำขั้นตอนต่อไป<br>
โปรแกรมภาษาแอสเซมบลี้ในไฟล์ hello.s เป็นดังนี้<br>
<pre><code>.text<br>
                           .global _start<br>
<br>
        movl $len,%edx # third argument: message length<br>
        movl $msg,%ecx # second argument: pointer to message to write<br>
        movl $1,%ebx # first argument: file handle (stdout)<br>
        movl $4,%eax # system call number (sys_write)<br>
        int $0x80 # call kernel<br>
<br>
# and exit<br>
<br>
        movl $0,%ebx # first argument: exit code<br>
        movl $1,%eax # system call number (sys_exit)<br>
        int $0x80 # call kernel<br>
<br>
.data # section declaration<br>
<br>
msg:<br>
        .ascii "Hello, world!\n" # our dear string<br>
        len = . - msg # length of our dear string<br>
</code></pre>


2) คอมไพล์ไฟล์โปรแกรม (hello.s) ด้วยแอสเซมเบลอร์ as ซึ่งจะให้ผลลัพธ์เป็นอ็อบเจ็คไฟล์ .o<br>
<pre><code>$ as hello.s -o hello.o<br>
</code></pre>

3) ลิงค์อ็อบเจ็คโค้ด (hello.o) เข้ากับไลบรารี่ด้วยโปรแกรม ld และให้สร้างไบนารี่ไฟล์ที่รันได้ (executable file) ชื่อว่า hello.out<br>
<pre><code>$ ld -o hello.out hello.o <br>
</code></pre>

4) เอาพุทที่ได้จากการลิงค์ชื่อไฟล์ hello.out สามารถรันได้จากคำสั่งในเชลล์ ขึ้นต้นด้วย ./ (เพื่อบอกว่าโปรแกรมนี้อยู่ในไดเร็กทอรี่ที่เราทำงานในปัจจุบัน เนื่องจากโปรแกรมนี้ไม่อยู่ใน PATH environment ของเชลล์ที่เรารันอยู่)<br>
<pre><code>$ ./hello.out<br>
Hello, world!<br>
</code></pre>


<h2>อ้างอิง</h2>
<ol><li><a href='http://asm.sourceforge.net/howto/hello.html'>http://asm.sourceforge.net/howto/hello.html</a>
</li><li><a href='http://zahidirfan.blogspot.com/2010/01/two-steps-to-using-assembly-in-linux.html'>http://zahidirfan.blogspot.com/2010/01/two-steps-to-using-assembly-in-linux.html</a></li></ol>

<a href='compilingCprogram.md'>Next: ภาษา C</a>