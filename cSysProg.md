<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='CShell.md'>C กับ การติดต่อกับ Shell</a>
<br>
<br>
<h2>inode</h2>
inode, index node (ดัชนีโหนด)เป็นเลขรหัสของไฟล์ที่มีในระบบไฟล์ของระบบปฏิบัติการ Unix หรือ Linux ระบบปฏิบัติการจะมองทรัพยากรหรือวัตถุทุกอย่างเป็นไฟล์ และใช้เลข inode ในการอ้างอิงไฟล์ โดย inode จะเก็บข้อมูลต่าง ๆ เกี่ยวกับไฟล์ หรือที่เรียกว่า meta-data เช่น ชนิดของไฟล์, ชื่อเจ้าของ, ชื่อกลุ่ม, ขนาดไฟล์, สิทธิ์ในใช้ไฟล์, เวลาในการอ่านและเขียนไฟล์ (UNIX  และ Linux จะไม่เก็บเวลาในการสร้างไฟล์), เวลาในการลบไฟล์ เป็นต้น<br>
<br>
<ul><li>เลข inode จะไม่ซ้ำกัน</li></ul>

<h3>คำสั่งที่ใช้ดูเลข inode</h3>

<pre><code>$ ls -i /etc/passwd<br>
</code></pre>

<h3>การประยุกต์ใช้ inode</h3>

<pre><code>$ cd /tmp<br>
$ ls -l<br>
</code></pre>

จะได้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; ls -l<br>
total 8<br>
-rw-r--r-- 1 prachya prachya 2082 2012-11-14 16:51 gchart-disk.pl<br>
-rw-r--r-- 1 prachya prachya    6 2012-11-05 13:34 junk<br>
</code></pre>
ในที่นี้ ls จะแสดงรายละเอียดของไฟล์แต่ไม่แสดง inode โดยที่ total 8 ในที่นี้หมายถึงจำนวน blocks ที่ถูกใช้ในไดเร็กทอรี่/ไฟล์นี้ (สามารถตรวจสอบดูได้ด้วยคำสั่ง ls -s ซึ่งจะแสดงจำนวน blocks ที่ใช้ในแต่ละไฟล์/ไดเร็กทอรี่<br>
<br>
ในกรณีที่เราต้องการดูรายละเอียดของ index ของ inode สามารถใช้ตัวเลือก -i เพื่อให้แสดงข้อมูลของ inode ได้<br>
<pre><code>$ ls -il /tmp<br>
</code></pre>
จะได้ผลลัพธ์ดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; ls -il /tmp<br>
total 8<br>
2496286 -rw-r--r-- 1 prachya prachya 2082 2012-11-14 16:51 gchart-disk.pl<br>
2101314 -rw-r--r-- 1 prachya prachya    6 2012-11-05 13:34 junk<br>
</code></pre>

<h3>stat แสดง inode</h3>
โปรแกรม stat จะแสดงรายละเอียดต่าง ๆ ของไฟล์/ไดเร็กทอรี่ รวมถึงข้อมูลของ inode ดังตัวอย่าง<br>
<br>
<pre><code>prachya@pcubusrv104&gt; stat /tmp/junk<br>
  File: `/tmp/junk'<br>
  Size: 6               Blocks: 8          IO Block: 4096   regular file<br>
Device: 803h/2051d      Inode: 2101314     Links: 1<br>
Access: (0644/-rw-r--r--)  Uid: ( 1001/ prachya)   Gid: ( 1001/ prachya)<br>
Access: 2012-11-05 13:34:21.479437961 +0700<br>
Modify: 2012-11-05 13:34:03.455437909 +0700<br>
Change: 2012-11-05 13:34:03.455437909 +0700<br>
</code></pre>

<h3>C โปรแกรมที่เข้าถึง inode</h3>

ตัวอย่างโปรแกรมภาษา C ต่อไปนี้ใช้ไลบรารี่ fstat() เพื่อเรียกดูข้อมูลของไฟล์/ไดเร็กทอรี่<br>
รูปแบบของ fstat()<br>
<pre><code>int fstat(int fildes, struct stat *buf);<br>
</code></pre>
โดยที่<br>
<br>
<table><thead><th>Field</th><th>Description</th></thead><tbody>
<tr><td>int fildes</td><td>	The file descriptor of the file that is being inquired.</td></tr>
<tr><td><code>struct stat *buf</code> </td><td>	A structure where data about the file will be stored. A detailed look at all of the fields in this structure can be found in the struct stat page. </td></tr>
<tr><td>return value</td><td>	Returns a negative value on failure.</td></tr></tbody></table>

ดูรายละเอียดของ sys/stat.h ได้ด้วยคำสั่ง<br>
<pre><code>man -s 2 stat<br>
</code></pre>

<pre><code>// test-fstat.c<br>
#include &lt;unistd.h&gt;<br>
#include &lt;fcntl.h&gt;<br>
#include &lt;stdio.h&gt;<br>
#include &lt;sys/stat.h&gt;<br>
#include &lt;sys/types.h&gt;<br>
 <br>
int main(int argc, char **argv)<br>
{<br>
    if(argc != 2)    <br>
        return 1;<br>
 <br>
    int file=0;<br>
        if((file=open(argv[1],O_RDONLY)) &lt; -1)<br>
            return 1;<br>
 <br>
    struct stat fileStat;<br>
    if(fstat(file,&amp;fileStat) &lt; 0)    <br>
        return 1;<br>
 <br>
    printf("Information for %s\n",argv[1]);<br>
    printf("---------------------------\n");<br>
    printf("File Size: \t\t%d bytes\n",fileStat.st_size);<br>
    printf("Number of Links: \t%d\n",fileStat.st_nlink);<br>
    printf("File inode: \t\t%d\n",fileStat.st_ino);<br>
 <br>
    printf("File Permissions: \t");<br>
    printf( (S_ISDIR(fileStat.st_mode)) ? "d" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IRUSR) ? "r" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IWUSR) ? "w" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IXUSR) ? "x" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IRGRP) ? "r" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IWGRP) ? "w" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IXGRP) ? "x" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IROTH) ? "r" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IWOTH) ? "w" : "-");<br>
    printf( (fileStat.st_mode &amp; S_IXOTH) ? "x" : "-");<br>
    printf("\n\n");<br>
 <br>
    printf("The file %s a symbolic link\n\n", (S_ISLNK(fileStat.st_mode)) ? "is" : "is not");<br>
 <br>
    return 0;<br>
}<br>
// source: http://codewiki.wikidot.com/c:system-calls:fstat<br>
</code></pre>

คอมไพล์โปรแกรมด้วยคำสั่ง<br>
<pre><code>gcc test-fstat.c -o test-fstat<br>
</code></pre>
ทดสอบการทำงาน<br>
<pre><code>prachya@pcubusrv104&gt; ./test-fstat /tmp/junk<br>
Information for /tmp/junk<br>
---------------------------<br>
File Size:              6 bytes<br>
Number of Links:        1<br>
File inode:             2101314<br>
File Permissions:       -rw-r--r--<br>
<br>
The file is not a symbolic link<br>
</code></pre>

<h2>FILE I/O</h2>
การเขียนโปรแกรมติดต่อไฟล์บนระบบปฏิบัติการ Linux นั้นจำเป็นจะต้องมีการเปิดไฟล์ก่อน ซึ่งตัว kernel ได้สร้าง List ของไฟล์ที่เปิดอยู่ไว้ให้ เรียกว่า File Table ซึ่งใน File Table จะมีเลขดัชนีที่ไม่มีค่าติดลบ เรียกว่า File Descriptor (fds) ซึ่งจะมีรายละเอียดต่าง ๆ เกี่ยวกับการเปิดไฟล์ รวมถึงรายละเอียดเกี่ยวกับหน่วยความจำที่ใช้ในการเปิดไฟล์ด้วย<br>
<br>
<h2>system call function</h2>
เป็นฟังก์ชันระดับ Low-Level ของระบบปฏิบัติการ ซึ่งมีความรวดเร็วสูงในการทำงาน แต่มีข้อจำกัดคือฟังก์ชันจะผูกกับระบบปฏิบัติการนั้น ๆ และการใช้งานค่อนข้างยุ่งยาก<br>
<br>
(หมายเหตุ: standard C library จะมีการติดต่อกับไฟล์ด้วย fopen(), fclose() ฟังก์ชันซึ่ง<br>
สามารถดูรายละเอียดของการใช้งานด้วยคำสั่ง <code>man fopen</code> ซึ่งเป็นมาตรฐานของภาษา C ดังนั้นหากต้องการให้โปรแกรม portable โปรแกรมเมอร์ควรพิจารณาใช้งาน fopen() มากกว่า )<br>
<br>
<h2>open( ) System Call</h2>
เป็น system call ที่ใช้สำหรับเปิดไฟล์ (ดูรายละเอียดใน man page ด้วยคำสั่ง <code>man -s 2 open</code>

<pre><code>#include &lt;sys/types.h&gt; <br>
#include &lt;sys/stat.h&gt; <br>
#include &lt;fcntl.h&gt; <br>
int open (const char *name, int flags); <br>
int open (const char *name, int flags, mode_t mode);<br>
</code></pre>

ตัวอย่างการใช้ open() System Call<br>
<pre><code>int fd; <br>
fd = open ("/home/kidd/madagascar", O_RDONLY); <br>
if (fd == -1) <br>
/* error */ <br>
</code></pre>

<h2>Flag ของ open() System Call ที่น่าสนใจ</h2>
<ul><li>O_APPEND<br>
The file will be opened in append mode. That is, before each write, the file<br>
position will be updated to point to the end of the file. This occurs even if another<br>
process has written to the file after the issuing process' last write, thereby<br>
changing the file position. (See "Section 2.3.2" later in this chapter).<br>
</li><li>O_ASYNC<br>
A signal (SIGIOby default) will be generated when the specified file becomes<br>
readable or writable. This flag is available only for terminals and sockets, not for<br>
regular files.<br>
</li><li>O_CREAT<br>
If the file denoted by name does not exist, the kernel will create it. If the file<br>
already exists, this flag has no effect unless O_EXCL is also given.<br>
Linux System Programming<br>
38 of 396<br>
</li><li>O_DIRECT<br>
The file will be opened for direct I/O (see "Section 2.5" later in this chapter).<br>
</li><li>O_DIRECTORY<br>
If nameis not a directory, the call to open( )will fail. This flag is used internally<br>
by the opendir( )library call.<br>
</li><li>O_EXCL<br>
When given with O_CREAT, this flag will cause the call to open( ) to fail if the file<br>
given by name already exists. This is used to prevent race conditions on file<br>
creation.<br>
</li><li>O_LARGEFILE<br>
The given file will be opened using 64-bit offsets,allowing files larger than two<br>
gigabytes to be opened. This is implied on 64-bit architectures.<br>
</li><li>O_NOCTTY<br>
If the given name refers to a terminal device (say, /dev/tty), it will not become<br>
the process' controlling terminal, even if the process does not currently have a<br>
controlling terminal. This flag is not frequently used.<br>
</li><li>O_NOFOLLOW<br>
If name is a symbolic link, the call to open( ) will fail. Normally, the link is<br>
resolved, and the target file is opened. If other components in the given path are<br>
links, the call will still succeed. For example, if name is /etc/ship/plank.txt, the<br>
call will fail if plank.txt is a symbolic link. It will succeed, however, if etcor ship<br>
is a symbolic link, so long as plank.txt is not.<br>
</li><li>O_NONBLOCK<br>
If possible, the file will be opened in non blocking mode. Neither the open( ) call,<br>
nor any other operation will cause the process to block (sleep) on the I/O. This<br>
behavior may be defined only for FIFOs.<br>
</li><li>O_SYNC<br>
The file will be opened for synchronous I/O. No write operation will complete until<br>
the data has been physically written to disk; normal read operations are already<br>
synchronous, so this flag has no effect on reads. POSIX additionally defines<br>
O_DSYNC and O_RSYNC; on Linux, these flags are synonymous with O_SYNC.</li></ul>

<ul><li>O_TRUNC<br>
If the file exists, it is a regular file, and the given flags allow for writing, the file<br>
will be truncated to zero length. Use of O_TRUNCon a FIFO or terminal device is<br>
ignored. Use on other file types is undefined. Specifying O_TRUNC with O_RDONLY<br>
is also undefined, as you need write access to the file in order to truncate it.<br>
For example, the following code opens for writing the file /home/teach/pearl. If the file<br>
already exists, it will be truncated to a length of zero. Because the O_CREAT flag is not<br>
specified, if the file does not exist, the call will fail:<br>
<pre><code>int fd; <br>
fd = open ("/home/teach/pearl", O_WRONLY | O_TRUNC); <br>
if (fd == -1) <br>
/* error */ <br>
</code></pre>
<h2>close( ) System Call</h2>
เป็น system call ที่ใช้สำหรับปิดไฟล์<br>
รูปแบบของ close()<br>
<pre><code>#include &lt;unistd.h&gt; <br>
int close (int fd);<br>
</code></pre>
ตัวอย่างการใช้งานของ close() System Call<br>
<pre><code>if (close (fd) == -1) <br>
perror ("close"); <br>
</code></pre></li></ul>

<h2>ตัวอย่าง xcpy.c</h2>

<pre><code>// xcpy.c<br>
#include &lt;stdio.h&gt;<br>
#include &lt;stdarg.h&gt;<br>
#include &lt;fcntl.h&gt;<br>
//#include &lt;syscalls.h&gt;<br>
#define PERMS 0666     /* RW for owner, group, others */<br>
<br>
  /* error:  print an error message and die */<br>
void error(char *fmt, ...)<br>
{<br>
       va_list args;<br>
<br>
       va_start(args, fmt);<br>
       fprintf(stderr, "error: ");<br>
       fprintf(stderr, fmt, args);<br>
       fprintf(stderr, "\n");<br>
       va_end(args);<br>
       exit(1);<br>
}<br>
<br>
   /* cp:  copy f1 to f2 */<br>
main(int argc, char *argv[])<br>
{<br>
       int f1, f2, n;<br>
       char buf[BUFSIZ];<br>
<br>
       if (argc != 3)<br>
           error("Usage: cp from to");<br>
       if ((f1 = open(argv[1], O_RDONLY, 0)) == -1)<br>
           error("cp: can't open %s", argv[1]);<br>
       if ((f2 = creat(argv[2], PERMS)) == -1)<br>
           error("cp: can't create %s, mode %03o",<br>
               argv[2], PERMS);<br>
       while ((n = read(f1, buf, BUFSIZ)) &gt; 0)<br>
           if (write(f2, buf, n) != n)<br>
               error("cp: write error on file %s", argv[2]);<br>
       return 0;<br>
}<br>
<br>
// modified from source: http://www.java-samples.com/showtutorial.php?tutorialid=570<br>
</code></pre>

<h2>Error Handling</h2>
การเกิดข้อผิดพลาด (Error) เป็นสิ่งที่อยู่คู่กับการเขียนโปรแกรม ภาษาซีได้เตรียม <code>errno</code> สำหรับการรับมือกับข้อผิดพลาด ทั้งในส่วนการใช้ library และ system call ซึ่งโดยปกติแล้ว หากฟังก์ชันมีการทำงานผิดพลาดจะส่งคืนค่า -1 กลับมาเป็นค่าปริยาย (ค่าที่ return มาจริงขึ้นอยู่กับแต่ละฟังก์ชันว่าจะกำหนดให้เป็นอย่างอื่นหรือเปล่า) ด้วยค่าที่ส่งกลับนี้จะบ่งบอกเพียงว่า มีข้อผิดพลาดในการทำงานเกิดขึ้น แต่ไม่ได้บอกว่า เกิดข้อผิดพลาดจากสาเหตุใด ตัวแปร <code>errno</code> จึงเป็นเครื่องมือสำคัญที่ใช้ในการสาเหตุของข้อผิดที่เกิดขึ้น<br>
<br>
ตัวแปร errno ถูกประกาศไว้ใน library <errno.h> ดังนี้<br>
<pre><code>extern int errno;<br>
</code></pre>

ค่าของตัวแปร errno ได้ถูก map กับคำอธิบายข้อผิดพลาดต่าง ๆ และ Preprocessor <code>#define</code> ก็ได้ทำการ map ค่า errno ที่เป็นตัวเลข ให้เป็นค่าคงที่ เช่น ถ้า preprocessor ระบุค่า EACCESS ให้เท่ากับ 1 นั่นหมายความว่า เกิดข้อผิดพลาด <code>Permission denied</code> ตารางด้านล่างจะแสดงรายละเอียด ของ คำอธิบายข้อผิดพลาดต่าง ๆ ที่ระบุไว้ใน Preprocesser<br>
<br>
<table><thead><th><b>Preprocessor define</b> </th><th>  <b>Description</b> </th></thead><tbody>
<tr><td>E2BIG                      </td><td> Argument list too long </td></tr>
<tr><td>EACCESS                    </td><td> Permission denied   </td><td> </td></tr>
<tr><td>EAGAIN                     </td><td> Try again           </td></tr>
<tr><td>EBADF                      </td><td> Bad file number     </td></tr>
<tr><td>EBUSY                      </td><td> Device or resource busy </td></tr>
<tr><td>ECHILD                     </td><td> No child processes  </td></tr>
<tr><td>EDOM                       </td><td> Math argument outside of domain of function </td></tr>
<tr><td>EEXIT                      </td><td> File already exists </td></tr>
<tr><td>EFAULT                     </td><td> Bad address         </td></tr>
<tr><td>EFBIG                      </td><td> File too large      </td></tr>
<tr><td>EINTR                      </td><td> System call was interrupted </td></tr>
<tr><td>EINVAL                     </td><td> Invalid argument    </td></tr>
<tr><td>EIO                        </td><td> I/O  error          </td></tr>
<tr><td>EISDIR                     </td><td> Is a directory      </td></tr>
<tr><td>EMFILE                     </td><td> Too many open files </td></tr>
<tr><td>EMLINK                     </td><td> Too many links      </td></tr>
<tr><td>ENFILE                     </td><td> File table overflow </td></tr>
<tr><td>ENODEV                     </td><td> No such device      </td></tr>
<tr><td>ENOENT                     </td><td> No such file or directory </td></tr>
<tr><td>ENOEXEC                    </td><td> Exec format error   </td></tr>
<tr><td>ENOMEM                     </td><td> Out of memory       </td></tr>
<tr><td>ENOSPC                     </td><td> No space left on device </td></tr>
<tr><td>ENOTDIR                    </td><td> Not a directory     </td></tr>
<tr><td>ENOTTY                     </td><td> Inappropriate I/O control operation </td></tr>
<tr><td>ENXIO                      </td><td> No such device or address </td></tr>
<tr><td>EPERM                      </td><td> Operation not permitted </td></tr>
<tr><td>EPIPE                      </td><td> Broken pipe         </td></tr>
<tr><td>ERANGE                     </td><td> Result too large    </td></tr>
<tr><td>EROFS                      </td><td> Read-only filesystem </td></tr>
<tr><td>ESPIPE                     </td><td> Invalid seek        </td></tr>
<tr><td>ESRCH                      </td><td> No such process     </td></tr>
<tr><td>ETXTBSY                    </td><td> Text file busy      </td></tr>
<tr><td>EXDEV                      </td><td> Improper link       </td></tr></tbody></table>

<h3>ฟังก์ชันสำหรับรายงานข้อผิดพลาด</h3>
ภาษาซี ได้จัดเตรียมฟังก์ชันสำหรับแปลค่า errno ให้อยู่ในรูปแบบของข้อความแจ้งข้อผิดพลาด ฟังก์ชันที่ใช้ในการรายงานข้อผิดพลาดมีดังนี้<br>
<br>
<h3>perror()</h3>
ฟังก์ชันนี้จะทำการ พิมพ์ข้อความแจ้งข้อผิดพลาดไปยัง stderr รูปแบบการประกาศฟังก์ชัน ดังโค้ดด้านล่าง<br>
<pre><code>#include &lt;stdio.h&gt; <br>
 void perror (const char *str);<br>
</code></pre>
<h3>ตัวอย่างการใช้งาน perror</h3>
<pre><code>  1 // checkfile.c<br>
  2 // by narong phoomsuk<br>
  3 // usage : ./checkfile filename<br>
  4 #include &lt;stdio.h&gt;        // for printf()<br>
  5 #include &lt;sys/types.h&gt; // for open()<br>
  6 #include &lt;sys/stat.h&gt;   // for open()<br>
  7 #include &lt;fcntl.h&gt;        // for open()<br>
  8 #include &lt;errno.h&gt;      // for errno<br>
  9 #include &lt;stdlib.h&gt;      // for exit()<br>
 10 #include &lt;unistd.h&gt;    // for close()<br>
 11<br>
 12 int main(int argc,char* argv[]){<br>
 13         int fd;<br>
 14         if(argc!=2){<br>
 15                 printf("usage : %s filename\n",argv[0]);<br>
 16                 perror("Invalid argument\n");<br>
 17                 exit(-1);<br>
 18         }<br>
 19         fd = open (argv[1],O_RDONLY);<br>
 20         if (fd==-1){<br>
 21                 perror("open file failed\n");<br>
 22                 printf("Cannot open %s\n",argv[1]);<br>
 23                 exit(-1);<br>
 24         }<br>
 25         if (close(fd)==-1){<br>
 26                 perror("close file failed\n");<br>
 27                 printf("Cannot open %s\n",argv[1]);<br>
 28                 exit(-1);<br>
 29         }<br>
 30         return 0;<br>
 31 }<br>
</code></pre>
จากโค้ดด้านบน บรรทัดที่ 16, 21, และ 26 หากเกิดข้อผิดพลาดฟังก์ชัน perror จะแสดงข้อความในวงเล็บ แต่ต่อท้ายด้วย เครื่องหมาย ":" และสาเหตุที่เกิดข้อผิดพลาด<br>
<br>
<h3>ตัวอย่างการรันโปรแกรม checkfile</h3>
<pre><code> $ ./checkfile file1.txt<br>
open file failed<br>
: No such file or directory<br>
Cannot open file1.txt<br>
 $  ./checkfile file1.txt 2&gt;err2.txt<br>
Cannot open file1.txt<br>
</code></pre>
<h1>References</h1>
<ol><li>Robert Love, Linux System Programming, O'Rielly, 2007. <a href='http://seesee.pbworks.com/f/linux.pdf'>[PDF</a>]<br>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='CShell.md'>C กับ การติดต่อกับ Shell</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/cSysProg'>Edit</a>