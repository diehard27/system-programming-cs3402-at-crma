[กลับไปหน้าหลัก](CourseSchedule2555_2.md)-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: [ทบทวนก่อนสอบระหว่างภาค](midtermReview.md)
<table width='500'>
<td>
<br>
<br>
ตัวแปรแบบอาเรย์เป็นตัวแปรแบบพิเศษ ที่มีค่าได้หลายค่า เช่นเดียวกับอาเรย์ในภาษาอื่น ๆ<br>
<ul><li>รูปแบบคือ <code>&lt;varname&gt;=(listing ..... )</code> เช่น a=(cat dog rat)<br>
</li><li>ดัชนี (index) เริ่มที่ 0<br>
</li><li>การอ้างถึงใช้วงเล็บปีกกาใหญ่ครอบ และวงเล็บสี่เหลี่ยมกำหนดดัชนี เช่น อ้างถึงตัวแปรอาเรย์ a ดัชนี 1 ให้ใช้ <code>${a[1]} </code> เป็นต้น</li></ul>

ตัวอย่าง <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/shell/advanced/array.sh'>array.sh</a>
<pre><code>     1  #!/bin/bash<br>
     2  #written by pyavinci@gmail.com<br>
     3  a=(0 1 2 3 4 5 6 7 8 9 A B C D E F)<br>
     4  echo ${a[*]}<br>
     5  echo ${a[0]} ... ${a[15]}<br>
     6  i=0<br>
     7  until [ $i -gt 15 ]; do<br>
     8    echo $i - ${a[$i]}<br>
     9    let i++<br>
    10  done<br>
    11  a[16]=X<br>
    12  echo ${a[*]}<br>
</code></pre>