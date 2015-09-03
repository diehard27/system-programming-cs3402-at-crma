[กลับไปหน้าหลัก](CourseSchedule2555_2.md)-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: [การโปรแกรมเชลล์ขั้นกลาง](IntermediateShellScript1.md)

<table width='500'>
<td>
<br>
<br>
<h1>ฟังก์ชั่น</h1>
ฟังก์ชั่นทำงานเช่นเดียวกับโปรแกรมย่อย (subroutine) มีลักษณะเป็นโมดูล มีอินพุทและเอาท์พุท และมีการประมวลผลภายใน มีสโคปของตัวเองเช่นมี local variable<br>
<br>
<h2>รูปแบบของฟังก์ชั่นเป็นดังนี้</h2>
<pre><code>function_name() {<br>
	statements<br>
}<br>
</code></pre>

ยกตัวอย่างเช่น<br>
<pre><code>#!/bin/bash<br>
myfunc() {<br>
	echo "Executing my function"<br>
}<br>
<br>
echo "Started script $0"<br>
myfunc<br>
echo "Script $0 ended"<br>
</code></pre>

<h2>การประกาศฟังก์ชั่น</h2>
การประกาศฟังก์ชั่นจะทำก่อนการเรียก โดยทั่วไปแล้วจะเขียนรายละเอียดของฟังก์ชั่นไว้ที่ส่วนแรก ๆ ของสคริปต์ จากนั้นเวลาจะใช้งานจะเรียกเพียงชื่อสคริปต์ เช่นในตัวอย่างนี้คือ myfunc นั่นเอง<br>
<br>
การเพิ่มฟังก์ชั่นเข้าไปใน environment ของเชลล์สามารถทำได้ตามตัวอย่างต่อไปนี้  สมมุติว่าเราต้องการสร้างฟังก์ชั่น โมดูลัส หรือการหาเศษที่เหลือของการหาร เพื่อให้สามารถเรียกใช้ได้จากเชลล์โดยตรง ขั้นเแรกให้ทำการสร้างไฟล์ที่มีฟังก์ชั่นตามต้องการ mod.sh และขั้นที่สองคือการโหลดเข้าไปใน environment ด้วย . mod.sh<br>
<br>
<pre><code>modulus()<br>
{<br>
    echo $(($1%$2))<br>
}<br>
</code></pre>

จากนั้นที่พรอมท์ให้รันคำสั่ง  .  mod.sh  (เครื่องหมายจุดคั่นด้วย space แล้วตามด้วยไฟล์ที่บรรจุฟังก์ชั่นนั้น) แล้วทดลองรันคำสั่ง set จะสังเกตุเห็นว่าฟังก์ชั่น modulus() ได้ถูกบันทึกไว้ใน environment เรียบร้อยแล้วผู้ใช้เพียงพิมพ์คำสั่งต่อไปนี้<br>
<pre><code># modulus 20 8<br>
4 <br>
</code></pre>
จะได้ผลลัพธ์เท่ากับ 4 เนื่องจาก 20 หารด้วย 8 มีค่าเท่ากับ 2 เศษ 4 นั่นเอง<br>
<br>
ตัวอย่างต่อไปเป็นการสร้างกลุ่มของคำสั่งให้เป็นลักษณะบล็อคโดยให้อยู่ภายเครื่องหมายวงเล็บปีกกา { .. } โดยใช้ร่วมกับเงื่อนไขทางตรรก<br>
<br>
<pre><code>#!/bin/bash<br>
tmpfile=temp_$$<br>
yes_or_no() {<br>
	while true<br>
	do<br>
	echo "Enter yes or no"<br>
	read ans<br>
	case "$ans" in<br>
		y | yes ) return 0;;<br>
		n | no ) return 1;;<br>
		* ) echo "Only accept yes or no"<br>
	esac<br>
	done<br>
}<br>
<br>
yes_or_no &amp;&amp; {<br>
	who &gt; $tmpfile<br>
	grep "secret" $tmpfile<br>
}<br>
</code></pre>

ในกรณีที่ผู้ใช้ตอบ yes หรือ y โปรแกรมจะตรวจสอบว่า who ทำงานและให้ค่ากลับมาที่เป็นจริงหรือไม่ (return 0) ถ้าเป็นจริงจะเขียนเอาพุทของการรันไว้ในไฟล์ tmp_หมายเลขโพรเซส<br>
<br>
<h2>การส่งผ่านพารามิเตอร์</h2>
การส่งผ่านพารามิเตอร์ไปยังฟังก์ชั่นและการคืนค่าด้วย return นั้นมีลักษณะเช่นเดียวกับการใช้งานสคริปต์จากเชลล์ ตัวอย่างต่อไปนี้เป็นการแสดงการส่งพารามิเตอร์เข้ามายังสคริปต์และการส่งพารามิเตอร์เข้าไปยังฟังก์ชั่น<br>
<br>
<pre><code>#!/bin/bash<br>
myfunc() {<br>
    echo "----Function called"<br>
    echo "----Parameters to this func: $*"<br>
}<br>
#Main body of script<br>
echo "Script $0 started..."<br>
echo "Parameters to $0 is $*"<br>
echo "Calling function..."<br>
myfunc "Passing this to myfunc"<br>
echo "Script $0 stopped"<br>
exit 0<br>
</code></pre>

ให้สังเกตุพารามิเตอร์ของฟังก์ชั่นจะแตกต่างจาก พารามิเตอร์ของตัวสคริปต์เอง เช่น $1 $2 ของฟังก์ชั่นจะแตกต่างจาก $1 $2 ของสคริปต์ที่ได้รับพารามิเตอร์มาจากเชลล์<br>
<br>
<h2>ตัวแปร local</h2>
ผู้เขียนโปรแกรมสามารถกำหนดให้ฟังก์ชั่นใช้ตัวแปรแบบ local ที่กำหนดขึ้นไว้ใช้ภายในฟังก์ชั่นเอง โดยหากมีชื่อซ้ำกันกับตัวแปรแบบ global จะเรียกใช้ตัวแปรแบบ local ก่อนดังตัวอย่างต่อไปนี้<br>
<br>
<pre><code>#!/bin/bash<br>
text="This is global variable"<br>
myfunc() {<br>
    local text="But this is local"<br>
    echo "Called myfunc"<br>
    echo $text<br>
}<br>
## main script body<br>
echo "Script $0 started"<br>
echo $text<br>
# now calling function<br>
myfunc<br>
echo "Script $0 stopped"<br>
exit 0<br>
</code></pre>

สคริปต์นี้มีตัวแปรชื่อ text ในตัวฟังก์ชั่น myfunc และภายนอกฟังก์ชั่น ตัวแปร text ที่อยู่ในกรอบของฟังก์ชั่นจะเรียกว่า local variable ส่วนตัวแปรที่อยู่นอกกรอบของฟังก์ชั่น แต่อยู่ในตัวของสคริปต์นั้นจะเรียกว่า global variable<br>
<br>
การคืนค่าออกจากฟังก์ชั่นจะใช้คำสั่ง return เช่นเดียวกับในสคริปต์ ส่วนการตรวจสอบค่าที่ให้กลับมาจะใช้คำสั่ง $? ดังต้วอย่างต่อไปนี้<br>
<br>
<h2>การเรียกฟังก์ชันซ้อนกัน</h2>
โปรแกรมเมอร์สามารถเขียนฟังก์ชันแล้วเรียกซ้อนกันได้ เช่นเดียวกับการโปรแกรมในภาษาระดับสูงทั่วไป ตัวอย่างต่อไป แสดงการลำดับการเรียกฟังก์ชั่น ซึ่งสามารถเรียกซ้อนกันได้เพื่อให้ control structure ตอบสนองความต้องการผู้ใช้<br>
<pre><code>#!/bin/bash<br>
subfunc() {<br>
  echo "____.____Started subfunc()"<br>
}<br>
myfunc() {<br>
  echo "____Started myfunc()"<br>
  subfunc<br>
}<br>
<br>
## main script body ##<br>
echo Started main script<br>
myfunc<br>
exit 0<br>
</code></pre>
ซึ่งจะให้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104:~/www/shell$ ./func-hirac.sh<br>
Started main script<br>
____Started myfunc()<br>
____.____Started subfunc()<br>
</code></pre>

<h2>แบบฝึกหัด</h2>

<h2>อ้างอิง</h2>

<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='IntermediateShellScript1.md'>การโปรแกรมเชลล์ขั้นกลาง</a>