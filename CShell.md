<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a>
<br>
<br>
<h2>Process</h2>
<blockquote>ความหมายของ Process ที่ถูกใช้บ่อย ๆ คือ "โปรแกรมที่กำลังประมวลผลอยู่" โดยคำว่า process จะมีความหมายเช่นเดียวกับ job หรือ task โดยในแต่ละ Process จะมีรายละเอียดต่าง ๆ ดังนี้<br>
</blockquote><ul><li>ทุก ๆ Process จะมี "process ID" ซึ่งเป็นเลขไม่ซ้ำกัน (Unique)<br>
</li><li>process ID จะมีค่าเป็นเลขจำนวนเต็มบวกเสมอ<br>
</li><li>ถึงแม้ processID จะไม่ซ้ำกัน, แต่เลข process ID จะถูกนำกลับมาใช้ใหม่ได้<br>
</li><li>แต่ละ processID จะมีสถานะในการประมวลผล (state)<br>
ในระบบที่มีตัวประมวลผลเดียว ก็ยังสามารถรันหลาย ๆ process ได้ในเวลาเดียวกัน เช่นเดียวกับระบบที่มีตัวประมวลผลหลายตัว การเรียกโปรแกรมให้ทำงานเป็นการเริ่มต้นการสร้าง process เมื่อโปรแกรมถูกรัน process จะถูกสร้างขึ้นและมีการจ่าย processID ให้กับ process นั้น โดยฟังก์ชัน getpid() จะสามารถแสดง processID ของ process ที่กำลังรันอยู่ได้</li></ul>

<h2>ฟังก์ชัน getpid()</h2>
เป็นฟังก์ชันที่อยู่ใน library <unistd.h> ใช้ในแสดงเลข processID ของโปรแกรมที่กำลังทำงานอยู่<br>
<br>
ตัวอย่างการทำงานของ getpid() แสดงดังโค้ดด้านล่าง<br>
<br>
<pre><code>  1 //getpid.c<br>
  2 #include &lt;stdio.h&gt;<br>
  3 #include &lt;unistd.h&gt;<br>
  4 int main(void){<br>
  5         printf("Hello, this is process ID %d\n",getpid());<br>
  6         return 0;<br>
  7 }<br>
<br>
</code></pre>
โดยปกติแล้ว ProcessID จะถูกตั้งค่าสูงสุดไว้ที่ 32768 เพื่อรองรับกับระบบปฏิบัติการ UNIX แบบเก่าที่ใช้สถาปัตยกรรม 16 บิต อย่างไรก็ตาม เราสามารถเข้าไปแก้ไขค่า Maximum processID ได้ ที่  /proc/sys/kernel/pid_max<br>
<br>
<br>
ในเครื่องที่มีตัวประมวลผลเดี่ยว แต่ละ Process จะถูกเรียกเข้ามาประมวลผล ในช่วงเวลาอันสั้น เราสามารถใช้คำสั่ง ps สำหรับแสดง processID ทั้งหมดที่กำลังทำงานอยู่ได้ โดยคำสั่ง ps จะแสดง ProcessID, ชื่อของ terminal(TTY), เวลาที่ Process ใช้ในการประมวลผล (TIME), และคำสั่งที่กำลังประมวลผลอยู่ (CMD)<br>
<br>
<pre><code>$ ps<br>
  PID TTY          TIME CMD<br>
 6506 pts/2    00:00:00 bash<br>
 6573 pts/2    00:00:00 ps<br>
<br>
</code></pre>
<blockquote>อย่างไรก็ตาม คำสั่ง ps จะแสดงเฉพาะ Process ของผู้ใช้ที่กำลังประมวลผลอยู่ ณ ปัจจุบัน แต่เราสามารถใช้ flag เพื่อให้แสดง process ทั้งหมดได้ด้วย flag "-a", และยังสามารถแสดงข้อมูล process ในแบบเต็มรูปได้ด้วย flag "-l"</blockquote>

ข้อมูลเพิ่มเติมของแต่ละ process ได้แก่<br>
<table><thead><th>PID</th><th> เลข processID ที่เป็นเลขจำนวนเต็มบวก</th></thead><tbody>
<tr><td>PPID</td><td> เลข processID แม่ (Parent Process) ที่เป็นเลขจำนวนเต็มบวก</td></tr>
<tr><td>STAT</td><td> สถานะของ Process                    </td></tr>
<tr><td>TIME</td><td> CPU Time ที่ process ใช้ (เป็นวินาที)</td></tr>
<tr><td>TT </td><td> ชื่อ control terminal ของ Process   </td></tr>
<tr><td>CMD</td><td> คำสั่งของผู้ใช้ ที่เป็นตัวเริ่ม Process</td></tr></tbody></table>

<h2>Process Hierachy</h2>
ในแต่ละ Process จะมี Parent Process (process แม่) ซึ่งก็คือ Process ที่ได้สร้าง Process ใหม่ขึ้นมารัน ส่วน Process ที่ถูก Parent สร้างขึ้นมา จะเรียกว่า Child Process (process ลูก) ค่าที่ใช้บ่งบอกความสัมพันธ์ระหว่าง parent กับ child ได้แก่  ppid (Parent Process ID) ซึ่งจะเก็บค่า pid ของ process ที่เป็น parent ของ process นั้น ฟังก์ชันที่ใช้สำหรับแสดง ppid ได้แก่ getppid()<br>
<br>
<h3>pid_t</h3>
pid_t เป็น type ของ processID ซึ่งถูกประกาศไว้ใน library <sys/types.h> ซึ่งโดยทั่วไปแล้ว ชนิดของ pid_t จะเป็น Integer<br>
<br>
<h2>ฟังก์ชัน getppid()</h2>
เป็นฟังก์ชันที่อยู่ใน library <unistd.h> ใช้ในแสดงเลข processID ของโปรแกรมที่กำลังทำงานอยู่<br>
<br>
ตัวอย่างการทำงานของ getppid() แสดงดังโค้ดด้านล่าง<br>
<br>
<pre><code>  1 //getppid.c<br>
  2 #include &lt;stdio.h&gt;<br>
  3 #include &lt;unistd.h&gt;<br>
  4 int main(void){<br>
  5         printf("Hello, this is process ID %d\n",getpid());<br>
  6         printf("Hello, this is my parent ID %d\n",getppid());<br>
  7         return 0;<br>
  8 }<br>
<br>
</code></pre>

<h3>Process Tree</h3>
คำสั่ง ps สามารถแสดงรายละเอียดเชิงกราฟต้นไม้ของโพรเซสได้ ซึ่งจะทำให้ผู้ใช้เห็นความสัมพันธ์ของการแตก (fork) โพรเซสลูกออกมา ตามตัวอย่างต่อไปนี้<br>
<br>
<pre><code>prachya@pcubusrv104&gt; ps --forest -aux |grep prachya<br>
Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html<br>
root      8330  0.0  0.2  12852  4380 ?        Ss   11:03   0:00  \_ sshd: prachya [priv]<br>
prachya   8401  0.0  0.0  12852  1856 ?        S    11:03   0:00      \_ sshd: prachya@pts/1<br>
prachya   8402  0.0  0.1   5824  3200 pts/1    Ss   11:03   0:00          \_ -bash<br>
prachya   8532  0.0  0.0   2708  1052 pts/1    R+   11:11   0:00              \_ ps --forest -aux<br>
prachya   8533  0.0  0.0   3320   800 pts/1    S+   11:11   0:00              \_ grep --color=auto prachya<br>
prachya   1164  0.0  0.1   5880  3240 tty2     S    Nov30   0:00  \_ -bash<br>
prachya    919  0.0  0.1   5880  3240 tty1     S    Nov30   0:00  \_ -bash<br>
</code></pre>

จากผลการรัน <code>ps --forest -aux |grep prachya </code> จะแสดงต้นไม้ของโพรเซสที่เกี่ยวข้องกับผู้ใช้ prachya ยกตัวอย่างเช่น ผู้ใช้ล็อกอินเข้าระบบด้วย ssh และได้รัน bash (8402) เพื่อให้รับคำสั่งผ่านคีย์บอร์ดและแสดงผลออกเทอมินอล ในเชลล์่ที่มีหมายเลขโพรเซส 8402 ของผู้ใช้นี้ ได้ fork โพรเซสของคำสั่ง ps และคำสั่ง grep หมายเลขโพรเซส 8532 และ 8533 ตามลำดับ คำสั่ง ps ที่ใช้ตัวเลือก --forest ทำให้เห็นความสัมพันธ์ของการรันโพรเซสได้เป็นอย่างดี<br>
<br>
<h2>Background Process</h2>
Backgroud Process จะทำงานอยู่เบื้องหลังไปเรื่อย ๆ แม้กระทั่ง ที่มีการ logout ออกจากระบบ การรันโปรแกรมให้มีลักษณะเป็น Background process ทำได้โดยใช้เครื่องหมาย & ตามหลังโปรแกรมที่รันดังนี้<br>
<pre><code>./perl stack.pl &amp;<br>
</code></pre>
วิธีการตรวจสอบว่า โปรแกรมยังรันอยู่หลังจาก logout หรือไม่ ให้ logout ออกจากระบบ แล้ว login เข้าไปใหม่ แล้วทดลองใช้คำสั่ง ps ดูว่ายังมีโปรแกรม รันอยู่หรือเปล่า<br>
<br>
<br>
<h2>Running a New Process</h2>
ในระบบปฏิบัติการ Unix จะแยกการ execute program ออกจากการสร้าง(create) process ใหม่ การ execute program คือ การที่ system call หนึ่งทำการโหลดโปรแกรมที่เป็น binary ลงในหน่วยความจำ แล้วแทนที่เนื้อหาต่าง ๆ ในหน่วยความจำ และเริ่มให้ program ทำงานใหม่ โดยสามารถเรียกใช้ function ในกลุ่ม exec (exec family) สำหรับการ execute โปรแกรมใหม่ได้<br>
<br>
ในขณะที่การสร้าง process ใหม่ เริ่มต้นจะมีการสร้าง process ลูกขึ้นมาใหม่ โดยคุณสมบัติของ process ลูกจะลอกเลียนมาจากคุณสมบัติของ process แม่ทุกประการ แต่มี pid, พื้นที่หน่วยความจำ,เวลาในการใช้ CPU, และ state เป็นของตัวเอง จากนั้นก็จะทำการ execute program ใหม่ เรียกพฤติกรรมแบบนี้ว่า "fork" ซึ่งจะทำให้โปรแกรมสามารถทำงานได้มากกว่าหนึ่ง process ในเวลาเดียวกันได้<br>
<h2>ฟังก์ชันกลุ่ม exec</h2>
เป็นกลุ่มฟังก์ชันที่อยู่ใน library <unistd.h> ใช้สำหรับการ execute program การทำงานของ exec คือสร้าง process exec ขึ้นมา แล้วตรวจสอบ argument ซึ่งเป็นชื่อคำสั่งที่จะต้องการ execute ถ้าชื่อคำสั่งถูกต้องก็จะโหลดคำสั่งมาทับหน่วยความจำของคำสั่ง exec เดิม ไม่ได้มีการสร้าง process ใหม่เพิ่มเติมเหมือนคำสั่ง fork แต่อย่างใด ฟังก์ชันในกลุ่มคำสั่ง exec มีดังนี้<br>
<br>
<ul><li>execl --- argument แรก ใช้รับค่าเป็น path name ของไฟล์ที่จะทำการ excute ส่วน ที่เหลือรับค่าของ  command line arguments และจบด้วย NULL.<br>
ตัวอย่าง<br>
<pre><code> execl("./a.out", NULL);<br>
 execl("/usr/bin/vi","vi","/home/phnarong/test1.txt");<br>
</code></pre>
</li><li>execv --- argument แรก ใช้รับค่าเป็น path name ของไฟล์ที่จะทำการ excute ส่วน ที่เหลือใช้ array ในการรับค่า argument ที่เหลือ<br>
ตัวอย่าง<br>
<pre><code>static char* args[] = {“ “, "cat.txt", "test1.txt", NULL}; <br>
execv("/bin/cp", args);<br>
</code></pre>
ค่า string ว่าง “ “ สามารถแทนด้วยชื่อคำสั่งของตัวมันเอง เช่น “ “ หรือปล่อยว่างไว้เช่นเดิมก็ได้ “ “.<br>
</li><li>execlp --- เหมือนกับ execl แต่ไม่จำเป็นต้องรับ path name เป็น full path name ก็ได้<br>
ตัวอย่าง<br>
<pre><code>         execlp("ls", NULL)<br>
</code></pre></li></ul>

<h2>ฟังก์ชัน fork</h2>
fork ใช้สำหรับสร้าง process ใหม่ มีรูปแบบการใช้งานดังนี้<br>
<pre><code>#include&lt;sys/types.h&gt;<br>
#include&lt;unistd.h&gt;<br>
<br>
pid_t fork(void)<br>
</code></pre>

ฟังก์ชัน fork จะส่งค่ากลับเป็นค่าของ pid ของ process ลูกที่สร้างขึ้นใหม่ ถ้าส่งค่า 0 หมายถึง process ลูกเรียกคำสั่ง fork แต่ถ้า fork สร้าง process ใหม่ไม่ได้ จะส่งกลับค่า -1 ตัวอย่างการใช้ฟังก์ชัน fork มีดังนี้<br>
<pre><code>  1 //fork.c<br>
  2 // by narong<br>
  3 #include &lt;unistd.h&gt;<br>
  4 #include &lt;stdio.h&gt;<br>
  5<br>
  6 int main(void){<br>
  7         int pid;<br>
  8         pid =fork();<br>
  9         if (pid==0){<br>
 10                 printf("I am a child process\n");<br>
 11                 printf("my getpid() is %d\n",getpid());<br>
 12         }else if(pid&lt;0){<br>
 13                 perror("Cannot create process");<br>
 14         } else{<br>
 15                 printf("My Process ID is %d\n",pid);<br>
 16                 printf("my getpid() is %d\n",getpid());<br>
 17         }<br>
 18         return 0;<br>
 19 }<br>
</code></pre>
จากโค้ดด้านบน บรรทัดที่ 8 เป็นการเรียกใช้ fork แล้ว pid จะได้รับค่า pid ใหม่ของ process ลูก เมื่อ pid มีค่ามากกว่า 0 จึงไปทำงานที่บรรทัดที่ 14 หลังจาก child process ทำงานเสร็จ ก็จะตรวจสอบว่า pid เท่ากับ 0 หรือไม่ ถ้าเท่ากับ 0 ก็จะไปทำงานที่บรรทัดที่ 10-11<br>
<br>
ตัวอย่างการทำงานกับ ด้วยฟังก์ชัน fork แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 //fork2.c<br>
  2 // code by http://www.cs.cmu.edu/~guna/15-123S11/Lectures/Lecture25.pdf<br>
  3 #include &lt;sys/types.h&gt;<br>
  4 #include &lt;unistd.h&gt;<br>
  5 #include &lt;stdio.h&gt;<br>
  6<br>
  7 int main(void){<br>
  8         int A[]={1,2,3,4,5,6};<br>
  9         int sum=0, pdt=1, PID, i;<br>
 10         if ((PID=fork())==0){<br>
 11                 for (i=0;i&lt;6;i++) sum += A[i];<br>
 12                 printf("This is child process computed sum %d \n", sum);<br>
 13         }<br>
 14         if (PID &lt;0) {<br>
 15                 perror("problem creating a process \n");<br>
 16         }<br>
 17         if (PID &gt;0) {<br>
 18                 for (i=0;i&lt;6;i++) pdt *= A[i];<br>
 19                 printf("The parent process completed the product %d \n", pdt);<br>
 20         }<br>
 21         return 0;<br>
 22 }<br>
<br>
</code></pre>

<h2>Terminating a Process</h2>
ฟังก์ชันที่ใช้ในการหยุดการทำงาน (Terminate) process ที่กำลังทำงานอยู่ได้แก่ ฟังก์ชัน exit() โดยจะทำการ return ผลของการ terminate process ได้ 2 แบบคือ exit(EXIT_SUCCESS) ซึ่งบ่งบอกว่าออกโดยทำงานสำเร็จ หรือ exit (EXIT_FAILURE) ซึ่งบอกว่าออกโดยทำงานล้มเหลว รูปแบบการใช้งาน ฟังก์ชัน exit() มีดังนี้<br>
<pre><code>#include &lt;stdlib.h&gt;<br>
void exit (int status);<br>
</code></pre>
<table><thead><th>EXIT_SUCCESS </th><th> จะมีค่าเท่ากับ 0 </th></thead><tbody>
<tr><td>EXIT_FAILURE </td><td> จะมีค่าเท่ากับ -1 </td></tr></tbody></table>

นอกจากนี้ process สามารถถูก Terminate ด้วย Signal ที่ใช้ในการ Terminate เช่น SIGTERM และ SIGKILL ได้อีกด้วย<br>
<h2>ฟังก์ชัน atexit()</h2>
ฟังก์ชัน atexit() ใช้สำหรับเรียกฟังก์ชันที่ register ไว้ เมื่อ process ถูก Terminate ผ่านฟังก์ชัน exit() หรือ ผ่านการ return จากฟังก์ชัน main  แต่ถ้า Process ถูก Terminate ด้วย Signal ฟังก์ชันที่ register ไว้จะไม่ถูกเรียก โดยฟังก์ชัน atexit() จะ return ค่า 0 เมื่อทำงานสำเร็จ ถ้าหากล้มเหลว จะ return ค่า -1 รูปแบบของฟังก์ชัน atexit() มีดังนี้<br>
<pre><code>#include &lt;stdlib.h&gt;<br>
int atexit (void (*function) (void));<br>
</code></pre>
โดยฟังก์ชันที่่จะใช้ register ต้องไม่มีการรับค่า parameter และไม่มีการ return ค่า รูปแบบของฟังก์ชันต้นแบบจะเป็นดังนี้<br>
<pre><code>void my_function (void);<br>
</code></pre>
ตัวอย่างการใช้งาน ฟังก์ชัน atexit() แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 //atexit.c<br>
  2 // by narong ,base on Robert  Love<br>
  3 #include &lt;stdio.h&gt;<br>
  4 #include &lt;stdlib.h&gt;<br>
  5<br>
  6 void out (void)<br>
  7 {<br>
  8         printf ("atexit(  ) succeeded!\n");<br>
  9 }<br>
 10  int main (void)<br>
 11 {<br>
 12         printf("Now for test exiting\n");<br>
 13         if (atexit (out)){<br>
 14                 fprintf(stderr, "atexit(  ) failed!\n");<br>
 15         }<br>
 16         return 0;<br>
 17 }<br>
<br>
</code></pre>
จากตัวอย่างโค้ดด้านบน ฟังก์ชัน out จะถูกประกาศไว้ตามรูปแบบต้นแบบฟังก์ชันที่จะใช้ใน atexit() ในกรณีที่โปรแกรมถูก Terminate ปกติ ฟังก์ชัน atexit() จะเรียกฟังก์ชัน out() ให้ทำงานและจะแสดงข้อความ "atexit() succeeded!" ออกหน้าจอ<br>
<br>
<h2>Waiting for Terminated Child Processes</h2>
หลายครั้งที่ parent ต้องการได้รับข้อมูลอื่น ๆ จาก child ที่ถูก Terminate เช่น ค่า ที่ child return ผู้ออกแบบ UNIX จึงได้ออกแบบให้ส่ง Child ที่ถูก Terminate ก่อน parent ของมันไปอยู่ใน State พิเศษ โดยกำหนดให้ process ที่อยู่ใน state นี่ชื่อว่า <b>"Zombie"</b> ซึ่ง Process นี้จะยังคงเก็บจะเก็บข้อมูลโครงสร้างพื้นฐานบางอย่างของ kernel ที่มีประโยชน์ไว้อยู่ เพื่อรอให้ parent สอบถามข้อมูลเกี่ยวกับสถานะของตัวมัน หลังจากที่ parent ได้ข้อมูลจาก child ที่เป็น Zombie เรียบร้อยแล้ว zombie ก็จะถูกกำจัดทิ้ง<br>
<br>
<h2>ฟังก์ชัน wait()</h2>
ระบบปฏิบัติการ Linux ได้จัดเตรียมฟังก์ชันหลายตัวสำหรับการรับข้อมูลจาก Child Process ที่ถูก Terminate ฟังก์ชันที่ใช้งานง่าย คือ wait() โดยมีรูปแบบการใช้งานดังนี้<br>
<pre><code>#include &lt;sys/types.h&gt; <br>
#include &lt;sys/wait.h&gt; <br>
 <br>
pid_t wait (int *status); <br>
 <br>
</code></pre>
ฟังก์ชัน wait จะ return ค่า PID ของ child ที่ถูก Terminate แต่หากเกิด error จะ return ค่า -1 ถ้าไม่มี child ถูก terminate เลย ฟังก์ชันจะทำการรอไปเรื่อย ๆ จนกว่าจะมี child ถูก terminate ถ้าพบว่ามี child ถูก terminate แล้ว ฟังก์ชันจะทำการ return ค่า PID ของ child นั้นทันที ค่า error ที่อาจเกิดขึ้นได้มี 2 ค่าได้แก่<br>
<table><thead><th>ECHILD </th><th> The calling process does not have any children. </th></thead><tbody>
<tr><td>EINTR  </td><td> A signal was received while waiting, and the call returned early.  </td></tr></tbody></table>

ถ้าค่าที่ return ไม่ใช่ null ข้อมูลเพิ่มเติมอื่น ๆ ของ child จะสามารถหาได้จากตัวแปร pointer status ที่ทำงานในมาโครฟังก์ชันของภาษา C เตรียมไว้สำหรับแปลข้อมูลต่าง ๆ ของ child โดยมีรูปแบบการใช้งาน ดังนี้<br>
<pre><code>#include &lt;sys/wait.h&gt; <br>
 <br>
int WIFEXITED (status); <br>
int WIFSIGNALED (status); <br>
int WIFSTOPPED (status); <br>
int WIFCONTINUED (status); <br>
 <br>
int WEXITSTATUS (status); <br>
int WTERMSIG (status); <br>
int WSTOPSIG (status); <br>
int WCOREDUMP (status); <br>
 <br>
</code></pre>
รายละเอียดความหมายต่าง ๆ ของ macro function แสดงได้ดังนี้<br>
<table><thead><th>WIFEXITED</th><th> จะ return true ถ้า child process ได้ถูก terminated แบบปกติ</th></thead><tbody>
<tr><td>WEXITSTATUS</td><td> จะเตรียมข้อมูล 8 bit ที่ผ่านจากฟังก์ชัน <code>_exit()</code> สำหรับกรณี ที่ WIFEXITED return ค่า true</td></tr>
<tr><td>WIFSIGNALED</td><td> จะ return ค่า true ถ้า child process ถูก terminate เพราะ Signal </td></tr>
<tr><td>WTERMSIG </td><td> จะ return ค่าของ Signal ที่เป็นสาเหตุที่ทำให้ child ถูก terminate สำหรับกรณีที่ WIFSIGNALED return ค่า true</td></tr>
<tr><td>WCOREDUMP</td><td> จะ return ค่า true หาก child process ถูก terminate และมีการผลิต core dump</td></tr>
<tr><td>WIFSTOPPED</td><td> จะ return ค่า true หาก child process ถูกหยุดการทำงาน      </td></tr>
<tr><td>WSTOPSIG </td><td> จะ return ค่าของ Signal ที่เป็นสาเหตุที่ทำให้ child หยุดการทำงาน สำหรับกรณีที่ WIFSTOPPED return ค่า true</td></tr></tbody></table>

ตัวอย่างการทำงานของฟังก์ชัน wait แสดงได้ดัง Code ข้างล่าง<br>
<pre><code>  1 // wait.c<br>
  2 // base on Robert Love<br>
  3 #include &lt;unistd.h&gt;<br>
  4 #include &lt;stdio.h&gt;<br>
  5 #include &lt;sys/types.h&gt;<br>
  6 #include &lt;sys/wait.h&gt;<br>
  7 #include &lt;stdlib.h&gt;<br>
  8<br>
  9 int main (void)<br>
 10 {<br>
 11         int status;<br>
 12         pid_t pid,pid_fork;<br>
 13<br>
 14         pid_fork = fork();<br>
 15         if (!pid_fork){<br>
 16                 //abort();<br>
 17                 return 1;<br>
 18         }<br>
 19         pid = wait (&amp;status);<br>
 20         if (pid == -1)<br>
 21                 perror ("wait");<br>
 22<br>
 23         printf ("pid=%d\n", pid);<br>
 24<br>
 25         if (WIFEXITED (status))<br>
 26                 printf ("Normal termination with exit status=%d\n",<br>
 27                         WEXITSTATUS (status));<br>
 28<br>
 29         if (WIFSIGNALED (status))<br>
 30                 printf ("Killed by signal=%d%s\n",<br>
 31                         WTERMSIG (status),<br>
 32                         WCOREDUMP (status) ? " (dumped core)" : "");<br>
 33<br>
 34         if (WIFSTOPPED (status))<br>
 35                 printf ("Stopped by signal=%d\n",<br>
 36                         WSTOPSIG (status));<br>
 37<br>
 38         if (WIFCONTINUED (status))<br>
 39                 printf ("Continued\n");<br>
 40<br>
 41        return 0;<br>
 42 }<br>
</code></pre>
จากโค้ดด้านบนจะเป็นการเรียกใช้ฟังก์ชัน wait() บรรทัดที่ 12 จะประกาศตัวแปร pid สำหรับรับค่า ที่ return จากฟังก์ชัน wait() และประกาศตัวแปร pid_fork สำหรับรับค่า pid ที่ return จากฟังก์ชัน fork() ในบรรทัดที่ 14 จะมีการเรียกใช้ฟังก์ชัน fork ถ้าค่าที่ return  เป็น 0 ก็จะ ออกจากโปรแกรมด้วยคำสั่ง return 1 ในบรรทัดที่ 19 จะมีการเรียกใช้ฟังก์ชัน wait โดยค่าที่ return จะไปเก็บไว้ใน pid ในกรณีที่ค่า pid > 0 โปรแกรมจะทำการตรวจสอบ status ด้วย มาโครฟังก์ชันต่าง ๆ หากตรงกับเงื่อนไขของมาโครฟังก์ชันใด ก็จะทำงานใน block เงื่อนไขของมาโครฟังก์ชันนั้น<br>
<br>
ผลลัพธ์จากการรันโปรแกรมแสดงได้ดังนี้<br>
<pre><code>pid=11204<br>
Normal termination with exit status=1<br>
</code></pre>

<b>ข้อสังเกต</b>
ในบรรทัดที่ 16 มีการ remark ฟังก์ชัน abort ไว้ ถ้าปลด remark บรรทัดที่ 16 ออกจะทำให้ผลลัพธ์ของการทำงานเปลี่ยนไป ดังนี้<br>
<pre><code>pid=11059<br>
Killed by signal=6<br>
</code></pre>

<pre><code>  1 //wait2.c<br>
  2 // code by http://support.sas.com/documentation/onlinedoc/sasc/doc/lr2/wait.htm<br>
  3   #include &lt;sys/types.h&gt;<br>
  4   #include &lt;sys/wait.h&gt;<br>
  5   #include &lt;unistd.h&gt;<br>
  6   #include &lt;stdio.h&gt;<br>
  7   #include &lt;stdlib.h&gt;<br>
  8<br>
  9   main()<br>
 10   {<br>
 11      int status, randomNumber, seed;<br>
 12      char buffer[80];<br>
 13      pid_t pid;<br>
 14<br>
 15      if ((pid = fork()) == -1) {<br>
 16           perror("fork error");<br>
 17           exit(EXIT_FAILURE);<br>
 18      }<br>
 19<br>
 20      else if (pid == 0) {             /* start of child process      */<br>
 21         printf("Child process started\n");<br>
 22         printf("Enter a random seed\n");<br>
 23         if(gets(buffer)) {<br>
 24            seed = atoi(buffer);<br>
 25            srand(seed);<br>
 26         }<br>
 27         randomNumber = rand();        /* random end to child process */<br>
 28         if ((randomNumber % 2) == 0) {<br>
 29            printf("Child process aborted; pid = %d\n", (int) pid);<br>
 30            abort();<br>
 31            fclose(stdout);<br>
 32         }<br>
 33         else {<br>
 34            printf("Child process ended normally; pid = %d\n", (int) pid);<br>
 35            exit(EXIT_SUCCESS);<br>
 36         }<br>
 37      }<br>
 38      else {                           /* start of parent process     */<br>
 39         printf("Parent process started\n");<br>
 40         if ((pid = wait(&amp;status)) == -1)<br>
 41                                      /* Wait for child process.      */<br>
 42            perror("wait error");<br>
 43         else {                       /* Check status.                */<br>
 44            if (WIFSIGNALED(status) != 0)<br>
 45               printf("Child process ended because of signal %d\n",<br>
 46                       WTERMSIG(status));<br>
 47            else if (WIFEXITED(status) != 0)<br>
 48               printf("Child process ended normally; status = %d\n",<br>
 49                       WEXITSTATUS(status));<br>
 50            else<br>
 51               printf("Child process did not end normally\n");<br>
 52         }<br>
 53         printf("Parent process ended\n");<br>
 54         exit(EXIT_SUCCESS);<br>
 55      }<br>
 56   }<br>
</code></pre>
จากโค้ดด้านบนบรรทัดที่ 15 มีการเรียกใช้ฟังก์ชัน fork() แล้วนำค่าที่ return ไปเก็บไว้ที่ตัวแปร pid<br>
บรรทัดที่ 20 ถ้าค่า pid เป็น 0 ซึ่งหมายถึงเป็น child process บรรทัดที่ จะกำหนดให้รับค่าทางคีย์บอร์ดด้วยฟังก์ชัน gets() แล้วนำมาเก็บข้อมูลไว้ที่ตัวแปร buffer จากนั้นบรรทัดที่ 24 จะนำค่า buffer ซึ่งเป็น string มาแปลงเป็นตัวเลขด้วยฟังก์ชัน atoi() แล้วไปเก็บในตัวแปร seed บรรทัดที่ 25 จะใช้ฟังก์ชัน srand() เป็นตัวกำหนดช่วงความกว้างในการสุ่มตัวเลข โดยช่วงความกว้างในการสุ่มจะใช้ค่าจากตัวแปร seed บรรทัดที่ 27 จะใช้ฟังก์ชัน rand() เพื่อสุ่มค่าตัวเลขแล้วนำไปเก็บไว้ในตัวแปร randomNumber บรรทัดที่ 28 จะเปรียบเทียบเงื่อนไขของตัวแปร randomNumber % 2 ถ้ามีค่าเท่ากับ 0 จะเข้าไปทำเงื่อนไขบรรทัดที่ 29-31 โดยใช้ฟังก์ชัน abort() เพื่อ Terminate Child Process แต่ถ้าค่า randomNumber %2 ไม่เท่ากับ 0 จะไปทำเงื่อนไขในบรรทัดที่ 34-35 โดยให้ child process terminate ปกติ<br>
ในกรณีที่ ค่า pid มากกว่า 0 นั่นคือ parent process บรรทัดที่ 40 จะตรวจสอบค่าที่ return จากฟังก์ชัน wait() ว่าเป็น -1 หรือไม่ ถ้าใช่ จะให้แสดง error แต่ถ้าไม่ จะตรวจสอบ สถานะของ child process ด้วยมาโครฟังก์ชันต่าง ๆ ตั้งแต่บรรทัดที่ 44-54<br>
<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
</li><li>Ananda Gunawardena, <i>Process Control</i> <a href='http://www.cs.cmu.edu/~guna/15-123S11/Lectures/Lecture25.pdf'>PDF</a>
</li><li>March H. Scholl, <i>Process Control Subsystem</i> <a href='http://www.inf.uni-konstanz.de/dbis/teaching/ss09/os/L2.pdf'>PDF</a>
</li></ol><ol><li>www.no-poor.com, <i>Process and Threads</i> <a href='http://www.no-poor.com/dssandos/os_ch03_process.htm'>HTML</a>
</li><li>lecture.cs.buu.ac.th, <i>s49232 Lab06 fork</i> <a href='https://docs.google.com/viewer?url=http%3A%2F%2Flecture.cs.buu.ac.th%2F~s49232%2FLab06%2Ffork.doc'>DOC</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/CShell'>Edit</a>