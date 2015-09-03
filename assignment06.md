<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#Today'>Today</a>]<br>
<font color='red'>กำหนดส่ง พฤหัสฯ 20 พ.ย.2557</font>

1) จงเขียนโปรแกรม stack.pl เพื่อเลียนแบบการทำงานของสแต็ค โดยตั้งตัวแปร stack ให้เป็นแบบอาร์เรย์ และสามารถใช้คำสั่ง push และ pop พร้อมทั้งยกตัวอย่างการใช้งานโปรแกรม<br>
<br>
ตัวอย่างการทำงานของโปรแกรม<br>
<pre><code>$ perl stack.pl push 23     <br>
in stack [23] <br>
$ perl stack.pl push 55<br>
in stack [23,55]<br>
$ perl stack.pl push 30<br>
in stack [23,55,30]<br>
$ perl stack.pl pop<br>
pop = 30<br>
in stack [23,55]<br>
$ perl stack.pl pop<br>
pop = 55<br>
in stack [23]<br>
$ perl stack pop<br>
pop = 23<br>
in stack []<br>
</code></pre>

Hint:<br>
<ul><li>แนวทางการเขียนโปรแกรม<br>
<ol><li>ถ้าใช้วิธีการรับ argument จะพบว่า ค่า stack หาย หลังจากการรันโปรแกรม จำเป็นจะต้องเก็บข้อมูล stack ลงในไฟล์ และอ่านค่าไฟล์เมื่อต้องการ รันโปรแกรมใหม่<br>
</li><li>ถ้าใช้วิธีการรันโปรแกรมแบบวนลูป จะต้องรับค่าจาก <br>
<br>
<STDIN><br>
<br>
 และวน loop ไปเรื่อย ๆ จนกว่าเงื่อนไขในการออกจาก loop จะถูกต้อง<br>
</li></ol></li><li>ใน perl มีฟังก์ชัน push , pop ให้ใช้ ไม่จำเป็นต้องสร้างฟังก์ชัน push, pop ขึ้นมาใหม่