[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]
<table width='500'>
<td>
<h1>เชลล์คืออะไร?</h1>
เชลล์เป็นส่วนติดต่อระหว่างผู้ใช้กับเคอร์เนิ่ลของระบบปฏิบัติการ เพื่อสนับสนุนการร้องขอ ผ่านการเรียกคำสั่ง (system call) เพื่อใช้ทรัพยากร/ฮาร์ดแวร์ต่าง ๆ เช่น หน้าจอแสดงผล ระบบไฟล์ หน่วยความจำ การใช้งานซีพียู เครื่องพิมพ์เป็นต้น  โดยทั่วไปแล้วการใช้งานเชลล์ผู้ใช้จะต้องพิมพ์คำสั่งผ่านคีย์บอร์ดของโปรแกรม terminal ซึ่งเป็นหน้าจอสำหรับการติดต่อกับเคอร์เนิ่ลผ่านโปรแกรมเชลล์อีกชั้นหนึ่ง  โปรแกรมเชลล์ที่เราจะกล่าวถึงในขอบเขตของวิชานี้คือ bash (Bourne-Again SHell) ซึ่งเป็นซูเปอร์เซ็ทของ Bourne Shell โดยที่ bash พัฒนาโดย ไบรอัน ฟ็อกซ์ (Brian Fox)  bash มีการพัฒนาเวอร์ชั่นมาเรื่อย bash 3.0 สนับสนุน in-process regular expression คล้ายกับการทำงานของ perl และ bash 4.0 สนับสนุน associative array ดังตัวอย่างข้างล่าง<br>
<pre><code>declare -A a         # ประกาศตัวแปรแบบ associative array 'a' เสมือน bi-dimensional indexed array<br>
i=1; j=2             # ค่าเริ่มต้นบางตัว<br>
a[$i,$j]=5           # ค่า associate "5" ตาม key "$i,$j" (i.e. "1,2")<br>
echo ${a[$i,$j]}     # พิมพ์ค่าตาม key "$i,$j"<br>
</code></pre>
นอกจากนั้นยังสนับสนุน brace expansion เพื่อให้สามารถโปรแกรมได้อย่างมีประสิทธิภาพมากขึ้น ตัวอย่างของ brace expansion แสดงด้านล่าง<br>
<pre><code>echo a{p,c,d,b}e # ape ace ade abe<br>
echo {a,b,c}{d,e,f} # ad ae af bd be bf cd ce cf<br>
</code></pre>
หรือ<br>
<pre><code>ls *.{jpg,jpeg,png}    # ขยาย  *.jpg *.jpeg *.png - คำสั่ง ls ให้ทำซ้ำสำหรับตัวแปรอื่นในลิสต์<br>
</code></pre>

<h1>สคริปต์เริ่มต้น/ออก</h1>
เมื่อ bash เริ่มทำงานมันจะรันคำสั่งต่าง ๆ ในสคริปต์ที่กำหนดไว้ดังนี้<br>
<br>
<ul><li>เมื่อเริ่มใน interactive login shell -- Bash อ่านและรันคำสั่งใน /etc/profile (ถ้ามี) บางครั้ง อาจเรียกสคริปต์ใน /etc/bash.bashrc อีกชั้น หลังจากนั้นจะหาไฟล์ ~/.bash_profile,  ~/.bash_login, และ ~/.profile ตามลำดับ เพื่ออ่านไฟล์ และรันคำสั่งต่าง ๆ ที่อยู่ในไฟล์ (ถ้ามี)<br>
</li><li>เมื่อออกจาก shell -- Bash อ่านและรันไฟล์ ~/.bash_logout (ถ้ามี)<br>
</li><li>เมื่อใช้ interactive shell (แต่ไม่ใช่ login shell) -- Bash อ่านและรันไฟล์  ~/.bashrc (ถ้ามี)  หากต้องการยกเลิกสามารถใช้ตัวเลือก  --norc  ส่วนตัวเลือก --rcfile จะบังคับให้อ่านและรันคำสั่งในไฟล์ที่ต้องการ แทนที่จะใช้ไฟล์ ~/.bashrc.</li></ul>

<h1>คีย์บอร์ด</h1>
<ul><li>Tab ↹ : Autocompletes from the cursor position.<br>
</li><li>Ctrl+a : Moves the cursor to the line start (equivalent to the key Home).<br>
</li><li>Ctrl+b : Moves the cursor back one character (equivalent to the key ←).<br>
</li><li>Ctrl+c : Sends the signal SIGINT to the current task, which aborts and closes it.<br>
</li><li>Ctrl+d: Sends an EOF marker, which (unless disabled by an option) closes the current shell (equivalent to the command exit). (Only if there is no text on the current line) If there is text on the current line, deletes the current character (then equivalent to the key Delete).</li></ul>

<h1>อ้างอิง</h1>
<ol><li>GNU Bash Reference Manual, <a href='http://www.gnu.org/software/bash/manual/bashref.html'>http://www.gnu.org/software/bash/manual/bashref.html</a>
</li><li>Bash (Unix Shell) - Wikipedia, <a href='http://en.wikipedia.org/wiki/Bash_(Unix_shell'>http://en.wikipedia.org/wiki/Bash_(Unix_shell</a>)</li></ol>

Next: <a href='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/Doc/shell-program%20by%20pc.pdf'>การเขียนโปรแกรมเชลล์สคริปต์</a>