<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#Today'>Today</a>]<br>
<font color='red'>กำหนดส่ง พฤหัสฯ 13 ธ.ค.2555</font>

1) จงเขียนโปรแกรม wait.c รับค่า argument เป็นเลขสองตัว ถ้า argument ทั้งสองตัวคูณกันแล้วได้เลขคู่ child process จะเรียกใช้ฟังก์ชัน abort แต่ถ้าเป็นเลขคี่ให้ child process ถูก terminate ปกติ ส่วน parent process จะใช้ฟังก์ชัน wait เพื่อตรวจสอบสถานะว่า child process ถูก terminate ด้วยสาเหตุใด พร้อมทั้งแสดงสาเหตุการ terminate ออกหน้าจอ<br>
<br>
ตัวอย่างการทำงานโปรแกรม<br>
<pre><code>$ ./wait 2 2<br>
This chis process is terminated by abort() function.<br>
$ ./wait 3 1<br>
This chis process is terminated normally.<br>
</code></pre>