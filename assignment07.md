<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#Today'>Today</a>]<br>
<font color='red'>กำหนดส่ง พฤหัสฯ 6 ธ.ค.2555</font>

1) จงเขียนโปรแกรม forkcalc.c รับค่า ตัวเลข 2 ตัว <b>ผ่าน argument</b> โดยมีเงื่อนไขดังนี้<br>
<blockquote>- ถ้าอยู่ใน parent process ให้ทำการแสดงผลรวมของตัวเลขทั้ง  2 ตัวออกหน้าจอ<br>
- ถ้าอยู่ใน child process ให้ทำการแสดงผลคูณของตัวเลขทั้ง 2 ตัวออกหน้าจอ</blockquote>

ตัวอย่างการทำงานโปรแกรม<br>
<pre><code>$ ./forkcalc 55 44<br>
This is parent process, The value of 55+44 is 99<br>
This is child process, The value of 55*44 is 2420<br>
</code></pre>