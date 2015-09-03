<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a>
<br>
<br>
<h2>Permission</h2>
ภาษาซีมีฟังก์ชัน chmod และ fchmod ที่ใช้ในการกำหนด permission ให้ไฟล์ โดยมีรูปแบบดังนี้<br>
<pre><code>#include &lt;sys/types.h&gt; <br>
#include &lt;sys/stat.h&gt; <br>
int chmod (const char *path, mode_t mode); <br>
int fchmod (int fd, mode_t mode);<br>
</code></pre>
ทั้ง chmod และ  fchmod สามารถใช้ set permission ได้เหมือนกัน ต่างกันตรงที่ chmod ใช้กับ absolute path name แต่ fchmod ใช้กับ file descriptor<br>
<br>
flag สำหรับ chmod มีดังนี้<br>
<table><thead><th>Flag</th><th>Octal value</th><th>Purpose</th></thead><tbody>
<tr><td>S_ISUID</td><td>04000      </td><td>Set user ID on execution</td></tr>
<tr><td>S_ISGID</td><td>02000      </td><td>Set group ID on execution</td></tr>
<tr><td>S_ISVTX</td><td>01000      </td><td>Sticky bit</td></tr>
<tr><td>S_IRUSR, S_IREAD</td><td>00400      </td><td>Read by owner</td></tr>
<tr><td>S_IWUSR, S_IWRITE</td><td>00200      </td><td>Write by owner</td></tr>
<tr><td>S_IXUSR, S_IEXEC</td><td>00100      </td><td>Execute/search by owner</td></tr>
<tr><td>S_IRGRP</td><td>00040      </td><td>Read by group</td></tr>
<tr><td>S_IWGRP</td><td>00020      </td><td>Write by group</td></tr>
<tr><td>S_IXGRP</td><td>00010      </td><td>Execute/search by group</td></tr>
<tr><td>S_IROTH</td><td>00004      </td><td>Read by others</td></tr>
<tr><td>S_IWOTH</td><td>00002      </td><td>write by others</td></tr>
<tr><td>S_IXOTH</td><td>00001      </td><td>Execute/search by others</td></tr></tbody></table>

ตัวอย่างของการใช้งาน chmod() แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 #include &lt;sys/types.h&gt;<br>
  2 #include &lt;sys/stat.h&gt;<br>
  3 #include &lt;stdio.h&gt;<br>
  4 #include &lt;errno.h&gt;<br>
  5 #include &lt;errno.h&gt;<br>
  6<br>
  7 int main(int argc,char* argv[]){<br>
  8<br>
  9           int rc;<br>
 10<br>
 11           rc = chmod(argv[1], 0444);<br>
 12           if (rc == -1)<br>
 13              fprintf(stderr, "chmod failed, errno = %d\n", errno);<br>
 14         return 0;<br>
 15 }<br>
</code></pre>

ตังอย่างของการใช้งาน fchmod() แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>int ret; <br>
/* <br>
* Set the file behind 'fd' to owner-readable <br>
* and -writable. <br>
*/ <br>
ret = fchmod (fd, S_IRUSR | S_IWUSR); <br>
if (ret) <br>
perror ("fchmod"); <br>
</code></pre>
ถ้า chmod() และ fchmod() ทำงานสำเร็จจะ return 0 แต่ถ้าไม่สำเร็จ จะ return -1 รายละเอียดของ error สามารถดูได้จากค่าของตัวแปร errno<br>
<br>
<br>
<h2>Reading the directory's content</h2>
ภาษาซี จะมอง content ของ directory เป็น stream ก่อนจะเริ่มอ่าน content จาก directory จะต้องทำการสร้าง directory stream เสียก่อน ซึ่งแทนด้วยการประการ Object ชื่อ <b>DIR</b>
ภาษาซี ใช้ ตัวแปรโครงสร้าง (struct) dirent ซึ่งอยู่ใน library <dirent.h> ในการเก็บข้อมูลต่าง ๆ ของ content ใน directory โดยรายละเอียดของ struct dirent แสดงได้ตามโค้ดด้านล่าง<br>
<pre><code>struct dirent { <br>
ino_t d_ino; /* inode number */ <br>
off_t d_off; /* offset to the next dirent */ <br>
unsigned short d_reclen; /* length of this record */ <br>
unsigned char d_type; /* type of file */ <br>
char d_name[256]; /* filename */ <br>
};<br>
</code></pre>
ในการอ่าน content ใน directory ด้วยภาษาซี จะใช้ฟังกชันหลัก ๆ 3 function ได้แก่ opendir(), readdir(), และ closedir() โดยรูปแบบการใช้งานของแต่ละฟังก์ชันแสดงได้ตามโค้ดด้านล่าง<br>
รูปแบบการใช้งาน ฟังก์ชัน opendir()<br>
<pre><code>#include &lt;sys/types.h&gt; <br>
#include &lt;dirent.h&gt; <br>
DIR * opendir (const char *name);<br>
</code></pre>

รูปแบบการใช้งานฟังก์ชัน readdir()<br>
<pre><code>#include &lt;sys/types.h&gt; <br>
#include &lt;dirent.h&gt; <br>
struct dirent * readdir (DIR *dir);<br>
</code></pre>

รูปแบบการใช้งานฟังก์ชัน closedir()<br>
<pre><code>#include &lt;sys/types.h&gt; <br>
#include &lt;dirent.h&gt; <br>
int closedir (DIR *dir);<br>
</code></pre>
ตัวอย่างนการเรียกใช้งานฟังก์ชันในการอ่าน content ใน directory แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code> //Source code produced by Adri Jovin.J.J<br>
  9 #include&lt;stdio.h&gt;<br>
 10 #include&lt;dirent.h&gt;<br>
 11 #include&lt;stdlib.h&gt;<br>
 12 struct dirent *dptr;<br>
 13 int main(int argc, char *argv[])<br>
 14 {<br>
 15         char buff[256];<br>
 16         DIR *dirp;<br>
 17         printf("\n\n Enter directory Name");<br>
 18         scanf("%s",buff);<br>
 19         if((dirp=opendir(buff))==NULL)<br>
 20         {<br>
 21                 printf("Error");<br>
 22                 exit(1);<br>
 23         }<br>
 24         while(dptr=readdir(dirp))<br>
 25         {<br>
 26                 printf("%s\n",dptr-&gt;d_name);<br>
 27         }<br>
 28         closedir(dirp);<br>
 29 }<br>
</code></pre>
<h2>Memory Management</h2>
<h3>Allocate Dynamic Memory</h3>
โดยทั่วไปการใช้งาน memory จะเป็นแบบคงที่ แต่มีบ่อยครั้งในการเขียนโปรแกรมที่เรายังไม่ทราบจะต้องใช้ memory เท่าไร หรือต้องการใช้ memory เพิ่มในระหว่างรันโปรแกรม เนื่องจาก memory ที่ให้มาไม่เพียงพอ ภาษาซีได้จัดเตรียมฟังก์ชันสำหรับจอง memory ในระหว่างรันโปรแกรมไว้ให้ ทำให้เรามีความยืดหยุ่น (dynamic) ในการใช้งาน memory ได้มากยิ่งขึ้น ฟังก์ชันที่น่าสนใจสำหรับจัดการหน่วยความจำได้แก่ malloc(),realloc(), และ free()<br>
malloc เป็นฟังก์ชันที่ใช้จองหน่วยความจำ โดยจะ return pointer ที่ชี้ไปยังหน่วยความจำใหม่ที่จองไว้ให้ตามที่ขนาดที่ระบุไว้ในฟังก์ชัน  ซึ่งมีรูปแบบการใช้งานดังนี้<br>
<pre><code>#include &lt;stdlib.h&gt; <br>
void * malloc (size_t size);<br>
</code></pre>

realloc() เป็นฟังก์ชันที่ใช้ในการปรับเปลี่ยนหน่วยความจำที่ขอไว้ รูปแบบการใช้งานมีดังนี้<br>
<pre><code>#include &lt;stdlib.h&gt; <br>
void * realloc (void *ptr, size_t size); <br>
</code></pre>

free() เป็นฟังก์ชันที่ใช้ในคืนหน่วยความเมื่อเลิกใช้งานแล้ว รูปแบบการใช้งานมีดังนี้<br>
<pre><code>#include &lt;stdlib.h&gt; <br>
void free (void *ptr);<br>
</code></pre>
ตัวอย่างการใช้งาน malloc แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>// code by http://www.codingunit.com/c-tutorial-the-functions-malloc-and-free<br>
  1 #include&lt;stdio.h&gt;<br>
  2 #include&lt;stdlib.h&gt;<br>
  3         int main()<br>
  4         {<br>
  5                 int *ptr_one;<br>
  6<br>
  7                 ptr_one = (int *)malloc(sizeof(int));<br>
  8<br>
  9                 if (ptr_one == 0)<br>
 10                 {<br>
 11                         printf("ERROR: Out of memory\n");<br>
 12                         return 1;<br>
 13                 }<br>
 14<br>
 15                 *ptr_one = 25;<br>
 16                 printf("%d\n", *ptr_one);<br>
 17<br>
 18                 free(ptr_one);<br>
 19<br>
 20                 return 0;<br>
 21         }<br>
</code></pre>
ตัวอย่างการใช้งาน realloc() แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  // code by http://www.codingunit.com/c-reference-stdlib-h-function-realloc<br>
  1 #include&lt;stdio.h&gt;<br>
  2 #include&lt;stdlib.h&gt;<br>
  3 int main ()<br>
  4 {<br>
  5         int * buffer;<br>
  6         /*get a initial memory block*/<br>
  7         buffer = (int*) malloc (10*sizeof(int));<br>
  8         if (buffer==NULL)<br>
  9         {<br>
 10                 printf("Error allocating memory!");<br>
 11                 exit (1);<br>
 12         }<br>
 13         /*get more memory with realloc*/<br>
 14         buffer = (int*) realloc (buffer, 20*sizeof(int));<br>
 15         if (buffer==NULL)<br>
 16         {<br>
 17                 printf("Error reallocating memory!");<br>
 18                 //Free the initial memory block.<br>
 19                 free (buffer);<br>
 20                 exit (1);<br>
 21         }<br>
 22         free (buffer);<br>
 23         printf ("realloc complete\n");<br>
 24         return 0;<br>
 25 }<br>
</code></pre>
<h2>struct mallinfo()</h2>
ใช้สำหรับดูสถิติการใช้ memory ซึ่ง struct mallinfo จะประกาศอยู่ใน library "malloc.h" ซึ่งรายละเอียดของ struct mallinfo() สามารถแสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>/* all sizes in bytes */ <br>
struct mallinfo { <br>
int arena; /* size of data segment used by malloc */ <br>
int ordblks; /* number of free chunks */ <br>
int smblks; /* number of fast bins */ <br>
int hblks; /* number of anonymous mappings */ <br>
int hblkhd; /* size of anonymous mappings*/ <br>
int usmblks; /* maximum total allocated size */ <br>
int fsmblks; /* size of available fast bins */ <br>
int uordblks; /* size of total allocated space */ <br>
int fordblks; /* size of available chunks */ <br>
int keepcost; /* size of trimmable space */<br>
};<br>
</code></pre>
<h3>ฟังก์ชัน malloc_stats()</h3>
อยู่ใน library malloc.h เช่นกัน ใช้แสดงรายละเอียดที่เกี่ยวเนื่องกับการใช้ memory รูปแบบการใช้งานมีดังนี้<br>
<pre><code>#include &lt;malloc.h&gt; <br>
void malloc_stats (void);<br>
</code></pre>

ตัวอย่างการใช้งาน mallinfo และ malloc_stats()  สามารถแสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 #include &lt;stdio.h&gt;<br>
  2 #include &lt;stdlib.h&gt;<br>
  3 #include &lt;malloc.h&gt;<br>
  4<br>
  5 int main (void){<br>
  6<br>
  7         struct mallinfo m;<br>
  8         m = mallinfo ( );<br>
  9          printf ("free chunks: %d\n", m.ordblks);<br>
 10         malloc_stats();<br>
 11         return 0;<br>
 12 }<br>
<br>
</code></pre>
<h2>Signal</h2>
เป็นสัญญาณที่สร้างขึ้นโดยระบบปฏิบัติการ UNIX การส่ง Signal มีอยู่สองลักษณะ ได้แก่<br>
<ol><li>kernel ส่งไปยัง process<br>
<blockquote>Ctrl+C , Ctrl+Delete SIGINT<br>
Ctrl+backslash SIGQUIT<br>
Ctrl+Z  SIGTSTP<br>
</blockquote></li><li>process ส่งไปยัง process<br>
<blockquote>เช่น การใช้ command line kill -9 <br>
<br>
<pid><br>
<br>
<br>
<blockquote>การใช้ ฟังก์ชัน int kill(int pid, int sig);<br>
ภาษาซีได้จัดเตรียมฟังก์ชัน ที่ใช้จัดการกับ signal ไว้ใน library "signal.h" โดยฟังก์ชันที่น่าสนใจได้แก่ signal ซึ่งมีรูปแบบการใช้งานดังนี้<br>
<pre><code>#include &lt;signal.h&gt;<br>
int (*signal (int sig, void (*func)(int) ) ) (int);<br>
</code></pre>
โดยที่<br>
</blockquote></blockquote></li></ol><ul><li>sig        ระบุสัญญาณที่ได้รับ<br>
</li><li>void func  ฟังก์ชันที่ทำงานเมื่อได้รับสัญญาณโดยไม่มีการส่งค่ากลับ<br>
</li><li>int        ฟังก์ชันที่มีอาร์กิวเมนต์สำหรับรับข้อมูลโดยเป็นหมายเลขของสัญญาณ</li></ul>

ฟังก์ชัน signal<br>
จะส่งค่ากลับเป็นค่าที่ได้กำหนดไว้ตั้งแต่การทำงานครั้งสุดท้าย<br>
หรืออาจใดค่าหนึ่งต่อไปนี้<br>
<br>
<ul><li>SIG_IGN  เพิกเฉยต่อสัญญาณ<br>
</li><li>SIG_DFL  ย้อนกลับการทำงานที่เป็นค่าปริยาย</li></ul>

รายชื่อสัญญาณ ที่กำหนดไว้ใน signal.h มีดังนี้<br>
<table><thead><th>SIGALRM</th><th>เกิดขึ้นมาโดย timer โดยใช้ฟังก์ชัน alarm ใช้สำหรับกำหนดเวลาของโปรเซส (ไม่ใช่เวลาที่ใช้งานCPU) ส่วนใหญ่จะใช้กำหนดเวลาหมดการทำงานของโปรเซส</th></thead><tbody>
<tr><td>SIGHUP </td><td>จะส่งไปยังโปรเซสเมื่อเทอร์มินอลยกเลิกการใช้งาน                                                                                          </td></tr>
<tr><td>SIGINT </td><td>จะเกิดขึ้นเมื่อกดคีย์อินเตอร์รัพ (Ctrl-C) บนเทอร์มินอลหรืออักษรอื่นที่กำหนดไว้                                                          </td></tr>
<tr><td>SIGKILL</td><td>จะบังคับให้โปรเซสหยุดการทำงานเนื่องจากโปรเซสไม่สามารถจะทำงานอื่นหรือเฉยต่อสัญญาณนี้ได้                                                  </td></tr>
<tr><td>SIGTSTP</td><td>จะส่งไปยังโปรเซสเมื่อกดคีย์ Ctrl-Z หรือ Ctrl-Y โปรเซสหยุดการทำงานเนื่องจากสัญญาณนี้สามารถทำงานต่อด้วยสัญญาณ SIGCONT                     </td></tr>
<tr><td>SIGCONT</td><td>ถ้าโปรเซสหยุดทำงานให้เริ่มรันโปรเซสโปรเซสต่อไป                                                                                          </td></tr>
<tr><td>SIGILL </td><td>ระบุว่ามีการใช้คำสั่งที่ไม่ถูกต้อง                                                                                                      </td></tr>
<tr><td>SIGQUIT</td><td>ปรกติจะเกิดขึ้นเมื่อเทอร์มินอล Ctrl-\ หรืออักษรที่กำหนดไว้                                                                              </td></tr>
<tr><td>SIGTERM</td><td>แจ้งให้โปรเซสหยุดทำงานเป็นสัญญาณที่ส่งไปให้โปรแกรมเมื่อใช้คำสั่ง kill                                                                   </td></tr>
<tr><td>SIGABORKT</td><td>สร้างขึ้นเมื่อเกิดข้อผิดพลาดจากการทำงานของฮาร์ดแวร์และส่งไปยังโปรเซสเองเพื่อหยุดทำงาน                                                   </td></tr>
<tr><td>SIGSEGV</td><td>ขึ้นอยู่กับฮาร์ดแวร์เมื่อมีแอ็คเซสพื้นที่หน่วยความจำที่ไม่ถูกต้องโครงสร้างในการจัดการหน่วยความจำเสียหาย                                 </td></tr>
<tr><td>SIGCHLD</td><td>ส่งไปยังโปรเซสต้นฉบับเมื่อโปรเซสลูกหยุดทำงานหรือเมื่อพบคำสั่ง exit                                                                      </td></tr>
<tr><td>SIGSTOP</td><td>สั่งให้โปรเซสหยุดรันโดยโปรเซสที่ได้รับสัญญาณนี้จะสามารถรันต่อไปได้ด้วยสัญญาณ SIGCONT                                                    </td></tr></tbody></table>

ฟังก์ชันที่ใช้สำหรับจัดการกับ signal มีดังนี้<br>
<br>
<table><thead><th>signal()</th><th>จะติดตั้งตัวควบคุมสัญญาณขึ้นมาใหม่สำหรับสัญญาณโดยตัวควบคุมสัญญาณที่ติดตั้งจะอยู่ในรูปของตัวเลขสัญญาณตัวควบคุมสัญญาณจะติดตั้งเพื่อ sighandler ซึ่งฟังก์ชันนี้อาจจะสร้างขึ้นโดยผู้ใช้หรือสัญญาณอื่นๆ</th></thead><tbody>
<tr><td>pause() </td><td>ทำให้โปรแกรมหยุดทำงานจนกระทั่งเกิดสัญญาณบางอย่างจึงจะรันต่อ                                                                                                                                       </td></tr>
<tr><td>sigfillset()</td><td>เริ่มต้นใช้งานตัวแปรต่อชุดสัญญาณที่กำหนด                                                                                                                                                          </td></tr>
<tr><td>sigprocmask()</td><td>กำหนดหรือตรวจสอบสัญญาณที่ถูกบล็อกสำหรับโปรเซสที่กำลังรันเพื่อป้องกันไม่ให้โปรเซสรับสัญญาณ                                                                                                         </td></tr>
<tr><td>kill()  </td><td>ใช้ฆ่าโปรเซสโดยการส่งสัญญาณถึงโปรเซส                                                                                                                                                              </td></tr>
<tr><td>alarm() </td><td>กำหนดช่วงเวลาที่เคอร์เนลจะส่งสัญญาณ SIGALRM ไปยังโปรเซส                                                                                                                                           </td></tr></tbody></table>

ตัวอย่างการใช้งานฟังก์ชัน signal แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>// code by http://lecture.cs.buu.ac.th/~s47232/special_report/new/signal.doc<br>
  1 #include &lt;stdio.h&gt;      /* standard I/O functions */<br>
  2 #include &lt;unistd.h&gt;    /* standard unix functions, like getpid() */<br>
  3 #include &lt;signal.h&gt;    /* signal name macros, and the signal() prototype */<br>
  4<br>
  5 /* first, here is the signal handler */<br>
  6 void catch_int(int sig_num)<br>
  7 {<br>
  8     /* re-set the signal handler again to catch_int, for next time */<br>
  9     signal(SIGINT, catch_int);<br>
 10     printf("Don't do that\n");<br>
 11     fflush(stdout);<br>
 12 }<br>
 13<br>
 14<br>
 15 int main(int argc, char* argv[])<br>
 16 {<br>
 17     /* set the INT (Ctrl-C) signal handler to 'catch_int' */<br>
 18     signal(SIGINT, catch_int);<br>
 19<br>
 20     /* now, lets get into an infinite loop of doing nothing. */<br>
 21     for ( ;; )<br>
 22         pause();<br>
 23 }<br>
<br>
</code></pre>



<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
</li><li>Ananda Gunawardena, <i>Process Control</i> <a href='http://www.cs.cmu.edu/~guna/15-123S11/Lectures/Lecture25.pdf'>PDF</a>
</li><li>March H. Scholl, <i>Process Control Subsystem</i> <a href='http://www.inf.uni-konstanz.de/dbis/teaching/ss09/os/L2.pdf'>PDF</a></li></ol>


<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/CShell2'>Edit</a>