<table width='500'>
<td>
<h2>ปัญหา</h2>
<ul><li>เครื่องแม่ข่าย 10.134.64.45 อยู่หลังไฟร์วอลล์ ไม่สามารถเข้าถึงได้จากอินเทอร์เน็ต<br>
</li><li>ต้องการใช้งานเว็บ (พอร์ต 80) และ ssh (พอร์ต 22) บนเครื่อง 10.134.64.45<br>
<h2>ข้อมูลพื้นฐาน</h2>
</li><li>เครื่อง webmail.crma.ac.th สามารถเข้าถึงด้วย ssh ได้จากอินเทอร์เน็ต<br>
</li><li>เครื่อง webmail อยู่ใน intranet เดียวกับเครื่อง 10.134.64.45<br>
<h2>แนวทาง</h2>
</li><li>ใช้ port ของเครื่อง localhost (เครื่องที่จะรัน ssh client) map ไปที่พอร์ตของเครื่อง webmail<br>
</li><li>ใช้ port forward ของ ssh เพื่อให้เครื่อง webmail ส่งการติดต่อพอร์ตที่ต้องการไปยังเครื่อง 10.134.64.45</li></ul>

<h2>ขั้นตอน เข้าถึงเว็บของ 10.134.64.45</h2>
<ol><li>ทำ port forward ระหว่างเครื่อง localhost กับเครื่อง webmail ด้วย ssh -L<br>
</li><li>เข้าถึงเว็บของเครื่อง 10.134.64.45 ผ่านพอร์ต 8000 ของเครื่อง localhost</li></ol>

(1) ทำ port forward (localhost:8000<==>webmail:22<==>10.134.64.45:80) ป้อนรหัสผ่านตามปกติ และให้ทิ้ง session ค้างไว้ขณะใช้งาน<br>
<pre><code>Apple$ ssh -L 8000:10.134.64.45:80   prachya@webmail.crma.ac.th<br>
prachya@webmail.crma.ac.th's password: <br>
Last login: Sat Sep 22 21:37:28 2012 from ppp.asianet.co.th<br>
[prachya@webmail ~]$<br>
</code></pre>
ใน putty กำหนดใน connection-->ssh-->tunnel ให้ source port = 8000 และ destination = 10.134.64.45:80 แล้วล็อกอินตามปกติ<br>
<br>
(2) เข้าเว็บ intranet ผ่าน localhost:8000 โดยใช้บราวเซอร์ปกติ<br>
<br>
<h2>ขั้นตอน เข้าถึง ssh ของเครื่อง 10.134.64.45</h2>
<ol><li>ทำ port forward ระหว่างเครื่อง localhost พอร์ต 8022 กับ webmail ssh session โดยให้ทำ tunnel ไปยังเครื่อง 10.134.64.45 พอร์ต 22<br>
</li><li>ล็อกอินเข้าที่เครื่อง localhost:8022 ฟังก์ชัน port forward จะทำการเชื่อมต่อไปยัง intranet โดยอัตโนมัติ</li></ol>

(1) ทำ port forward (localhost:8022<==>webmail:22<==>10.134.64.45:22) ป้อนรหัสผ่านตามปกติ และให้ทิ้ง session ค้างไว้ขณะใช้งาน<br>
<pre><code>Apple$ ssh -L 8022:10.134.64.45:22 prachya@webmail.crma.ac.th<br>
prachya@webmail.crma.ac.th's password: <br>
Last login: Sat Sep 22 21:57:38 2012 from ppp.asianet.co.th<br>
[prachya@webmail ~]$ <br>
</code></pre>
ใน putty กำหนดใน connection-->ssh-->tunnel ให้ source port = 8000 และ destination = 10.134.64.45:80 แล้วล็อกอินตามปกติ<br>
<br>
<img src='http://www.akadia.com/img/ssh_putty_1.gif' />

(2) ssh ไปยัง localhost:8022<br>
<pre><code>Apple$ ssh -p 8022 prachya@localhost <br>
The authenticity of host '[localhost]:8022 ([127.0.0.1]:8022)' <br>
can't be established.<br>
RSA key fingerprint is 0a:cb:1a:3d:d2:a2:b9:df:87:36:86:ef:b7<br>
Are you sure you want to continue connecting (yes/no)? yes<br>
<br>
Last login: Fri Sep 21 11:31:40 2012 from 10.134.68.113<br>
prachya@pcubusrv104:~$<br>
</code></pre>

<h2>อ้างอิง</h2>
<ol><li>Port forwarding with SSH (putty), <a href='http://www.akadia.com/services/ssh_putty.html'>http://www.akadia.com/services/ssh_putty.html</a>