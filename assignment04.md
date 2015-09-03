<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]--><a href='shellScriptApp3.md'>การประยุกต์ใช้เชลล์สคริปต์ ๓</a>
<hr />
<font color='red'>Due date: ศุกร์ 24 ต.ค.57 </font>
<ol><li>ล็อกอินไปที่เครื่องแม่ข่าย 10.134.0.85<br>
</li><li>เปลี่ยนไดเร็กทอรี่ไปที่ /home/bXXYYY/public_html/ (<font color='red'>แทน bXXYYY ด้วยชื่อล็อกอิน</font>) ด้วยคำสั่ง cd  /home/bXXYYY/public_html/<br>
</li><li>สร้างไดเร็กทอรี่ asm04 ด้วยคำสั่ง mkdir  asm04  แล้วเปลี่ยนไดเร็กทอรี่ไปยัง asm04 ด้วยคำสั่ง cd asm04<br>
</li><li>เขียนเชลล์สคริปต์ชื่อ hex2dec.sh ให้รับอินพุทเข้ามาเป็นเลขฐาน 16 (hexadecimal) แล้วส่ง output ออกมาเป็นเลขฐานสิบ (decimal) เช่น hex2dec.sh  FF ควรให้คำตอบเป็น 255 เป็นต้น<br>
</li><li>เขียนเชลล์สคริปต์ชื่อ hex2bin.sh ให้รับอินพุทเข้ามาเป็นเลขฐาน 16 (hexadecimal) แล้วส่ง output ออกมาเป็นเลขฐานสอง เช่น hex2bin.sh  F9 จะให้ผลลัพธ์ออกมาเป็น 1111 1001 เป็นต้น<br>
</li><li>ทดสอบการใช้งาน Subversion ด้วยคำสั่ง svn โดยให้นักเรียน checkout ซอร์สโค้ดของวิชาจาก Google Code แบบ read-only ด้วยการทำตามตัวอย่างใน <a href='versionControl1.md'>การควบคุมเวอร์ชั่น ๑</a> โดยให้สร้างไดเร็กทอรี่ชื่อ svn ไว้ใน home ไดเร็กทอรี่ของตัวเองก่อนจากนั้นรันคำสั่ง <code> svn checkout http://system-programming-cs3402-at-crma.googlecode.com/svn/trunk/ system-programming-cs3402-at-crma-read-only </code> , จากนั้นตรวจสอบดูว่ามีไฟล์เพิ่มเติมที่ได้จากการดาวน์โหลดซอร์สโค้ดมาหรือไม่? (หมายเหตุ: เนื่องจากเป็นการ checkout แบบ Non-member นักเรียนจะไม่สามารถ add, commit การเปลี่ยนแปลงของไฟล์/โปรแกรมกับไปยัง Google Code ได้), Hint: นักเรียนควรมองเห็น tree ของไฟล์ตามลำดับดังนี้ /home/bXXYYY/public_html/svn/....... ซึ่งตรวจสอบได้โดยใช้คำสั่ง tree<br>
<hr />
สามารถดูผลการส่งงานได้ที่ <a href='AssignmentSummary.md'>AssignmentSummary</a>