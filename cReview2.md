<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a>
<br>
<br>
<h2>stdin,stdout,stderr</h2>
ทั้ง stdin,stdout, และ stderr เป็น global variable ที่เป็นไฟล์หรือ stream ในภาษาซี โดยปกติเราจะทำการรับข้อมูลจาก stdin ก็คือคีย์บอร์ด และแสดงผลไปยัง stdout ซึ่งก็คือจอภาพ และเรายังสามารถเขียนโปรแกรมเก็บข้อผิดพลาดไปไว้ที่ stderr ได้อีกด้วย โดยใช้ฟังก์ชัน fprintf<br>
fprintf เป็นฟังก์ชัน ที่ใช้แสดงผลคล้าย printf แต่แทนที่จะแสดงผลออกหน้าจอ จะไปเก็บผลไว้ที่ไฟล์แทน ตัวอย่างโค้ดด้านล่างเป็นการแสดงการใช้ fprintf ในการ redirect ข้อผิดพลาดไว้ใน stderr<br>
<pre><code>  1 //stderr.c<br>
  2 // by narong phoomsuk<br>
  3 // usage : stderr.c string<br>
  4 #include &lt;stdio.h&gt;<br>
  5 #include &lt;stdlib.h&gt;<br>
  6 int main(int argc,char* argv[]){<br>
  7         if(argc != 2){<br>
  8                 printf("usage %s string\n",argv[0]);<br>
  9                 fprintf(stderr,"Invalid argument\n");<br>
 10                 exit(1);<br>
 11         }<br>
 12         printf("string is %s",argv[1]);<br>
 13         exit(0);<br>
 14 }<br>
<br>
</code></pre>
จากโค้ดด้านบน บรรทัดที่ 6 จะมีการรับ argument ใส่ไปยังโปรแกรม บรรทัดที่ 7 จะตรวจสอบจำนวน argument รวมทั้งชื่อโปรแกรมว่ามีจำนวนมากกว่า 2 ตัวหรือไม่ ถ้ามีมากกว่า บรรทัดที่ 8 ให้แสดงข้อความ "usage <ชื่อโปรแกรม> string\n" ออกทางหน้าจอ หรือ stdout และบรรทัดที่ 9 จะให้แสดงข้อความ "Invalid argument\n" ออกทาง stderr โดยอาศัยฟังก์ชัน fprintf ช่วยแสดงข้อความไปยัง stderr บรรทัดที่ 10 จะเป็นการใช้ฟังก์ชัน exit() ซึ่งอยู่ใน library stdlib.h เพื่อหยุดการทำงานโปรแกรมและคืนค่า 1 ซึ่งหมายถึงจบโปรแกรมแบบมีข้อผิดพลาด<br>
หากเราคอมไพล์โปรแกรมด้วยคำสั่ง "gcc -Wall -o stderr stderr.c" แล้วทดลองรันโปรแกรมปกติ ผลของการรันโปรแกรมจะเป็นดังนี้<br>
<pre><code>$ ./stderr<br>
usage ./stderr string<br>
Invalid argument<br>
</code></pre>
จากผลการรันโปรแกรมจะเห็นว่าข้อความ Invalid argument ซึ่งในโค้ดต้องการให้ออกที่ stderr กลับออกที่ stdout แทน ทั้งนี้เพราะคำสั่งในการรันโปรแกรม ไม่ได้ระบุให้ stderr แสดงค่าไว้ที่ใด เพื่อให้เห็นการทำงานของ stderr อย่างชัดเจน เราสามารถปรับเปลี่ยนวิธีการรันโปรแกรมได้ดังนี้<br>
<pre><code>$ ./stderr 2&gt;err.txt<br>
usage ./stderr string<br>
</code></pre>
จากผลการรันจะเห็นได้ว่าข้อความ Invalid argument ได้หายไป และเมื่อตรวจสอบที่ directory ปัจจุบัน ด้วยคำสั่ง "ls" จะพบไฟล์ "err.txt" ที่ถูกสร้างขึ้นมาใหม่ เมื่อเข้าไปดูเนื้อหาในไฟล์ err.txt ด้วยคำสั่ง <code>cat err.txt</code> จะพบข้อความ Invalid argument อยู่ ซึ่งสิ่งนี้แสดงให้เห็นถึงการทำงานของฟังก์ชัน fprintf ที่มีการส่งข้อมูลผ่าน stderr มาเก็บไว้ในไฟล์ err.txt<br>
<h3>แบบฝึกหัด</h3>
จากการรันคำสั่งด้านล่างนี้ จะได้ผลลัพธ์เป็นอย่างไร<br>
<pre><code>$ gcc -Wall -o stderr stderr.c<br>
$ ./stderr &gt; stdout.txt<br>
</code></pre>

<h2>FILE</h2>
ไฟล์คือที่เก็บข้อมูลต่าง ๆ ของคอมพิวเตอร์ ในระบบปฏิบัติการลินุกซ์และภาษาซี อาจรวมไปถึงอุปกรณ์และทรัพยากรต่าง ๆ ที่ต่ออยู่กับเครื่องคอมพิวเตอร์ เช่น คีย์บอร์ด จอภาพ<br>
การติดต่อไฟล์จะต้องทำผ่าน stream โดยไฟล์แบ่งออกได้เป็นแบบต่าง ๆ ดังนี้<br>
<ul><li>Text file เป็นไฟล์ของตัวอักษร การเก็บไฟล์จะเป็นเลขฐานสองตามรหัสตัวอักขระของ ASCII ไม่สามารถเก็บข้อมูลที่เป็นค่าตัวเลข จุดทศนิยม หรือเป็นในลักษณะของโครงสร้างได้ ปกติไฟล์พวกนี้เราจะสามารถเปิดอ่านและเข้าใจได้<br>
</li><li>Binary file เป็นไฟล์เก็บข้อมูลที่เป็นเลขฐานสอง ซึ่งสามารถเก็บข้อมูลที่เป็นค่าตัวเลข จุดทศนิยม หรือข้อมูลในลักษณะเชิงโครงสร้างได้ การอ่านเขียนข้อมูลจะเป็นในลักษณะของไบต์ต่อไบต์ เราไม่สามารถทำความเข้าใจข้อมูลที่อยู่ในไฟล์พวกนี้ได้<br>
การประกาศตัวแปรเพื่อติดต่อกับไฟล์มีรูปแบบดังนี้<br>
<pre><code>FILE *&lt;ชื่อตัวแปร file pointer&gt;;<br>
</code></pre>
เช่น<br>
<pre><code>FILE *fp;<br>
</code></pre>
<h2>ฟังก์ชันที่เกี่ยวข้องกับไฟล์</h2>
<h3>fopen</h3>
เป็นฟังก์ชันที่ใช้ในการเปิดไฟล์ ซึ่งมีรูปแบบการใช้งานดังนี้<br>
<pre><code>&lt;ชื่อตัวแปร file pointer&gt;=fopen("&lt;absolute path name&gt;","&lt;โหมด&gt;")<br>
</code></pre>
โดยโหมดในการเปิดไฟล์มีดังนี้<br>
<table><thead><th>r</th><th>เปิดไฟล์เพื่ออ่าน</th></thead><tbody>
<tr><td>w</td><td>เปิดไฟล์เพื่อเขียน (จำเป็นต้องมีไฟล์อยู่ก่อน)</td></tr>
<tr><td>a </td><td>เปิดไฟล์เพื่อเขียนต่อท้าย (จำเป็นต้องมีไฟล์อยู่ก่อน)</td></tr>
<tr><td>r+</td><td>เปิดไฟล์เพื่ออ่านและเขียนได้ โดยจะเริ่มเคอร์เซอร์ที่ต้นไฟล์</td></tr>
<tr><td>w+</td><td>เปิดไฟล์เพื่ออ่านและเขียน โดยจะเขียนทับไฟล์เดิม</td></tr>
<tr><td>a+</td><td>เปิดไฟล์เพื่ออ่านและเขียน โดยจะเขียนต่อท้ายไฟล์ถ้ามีไฟล์อยู่</td></tr></li></ul></tbody></table>

ในกรณีเปิดอ่านด้วยโหมด "r" และ "a" หากไม่มีไฟล์อยู่ก่อน ฟังก์ชันจะทำการคืนค่า null<br>
ตัวอย่างการใช้ fopen สามารถแสดงได้ดังโค้ดข้างล่างนี้<br>
<pre><code>FILE *fp;<br>
fp=fopen("test.text,"r");<br>
</code></pre>
<h3>fclose</h3>
เป็นฟังก์ชันที่ใช้ในการปิดไฟล์ ซึ่งมีรูปแบบดังนี้<br>
<pre><code>fclose(&lt;ชื่อตัวแปร file pointer&gt;);<br>
</code></pre>

ตัวอย่างการใช้ fclose สามารถแสดงได้ดังโค้ดข้างล่างนี้<br>
<pre><code>fclose(fp);<br>
</code></pre>

<h3>feof</h3>
ใช้ในการครวจสอบเคอร์เซอร์ที่ชี้อยู่ในไฟล์ว่าถึงจุดสิ้นสุดไฟล์ (Enf-of-File, EOF) หรือยัง ถ้าถึงแล้วจะ return ค่าเป็น true มีรูปแบบการใช้งานดังนี้<br>
<pre><code>feof(&lt;ชื่อตัวแปร file pointer&gt;);<br>
</code></pre>
ตัวอย่างการใช้งานฟังก์ชัน feof สามารถแสดงได้ดังโค้ดข้างล่างนี้<br>
<pre><code>while(!feof(fp)){<br>
    ...<br>
    ...<br>
}<br>
</code></pre>
ในกรณีที่ฟังก์ชัน fclose ไม่สามารถปิดไฟล์ได้ จะทำการ return ค่าเป็น EOF<br>
<h3>fprintf</h3>
เป็นฟังก์ชันที่ใช้สำหรับการเขียนไฟล์ มีรูปแบบดังนี้<br>
<pre><code>fprintf(&lt;ชื่อตัวแปร file pointer&gt;,"ข้อมูลที่เป็น string");<br>
</code></pre>
ตัวอย่างการใช้ฟังก์ชัน fprintf แสดงได้จากโค้ดด้านล่าง<br>
<pre><code>  1 //fprintf.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 #include &lt;stdlib.h&gt;<br>
  5<br>
  6 int main(int argc,char* argv[]){<br>
  7         FILE *fp;<br>
  8         char username[9];<br>
  9         int i;<br>
 10         fp=fopen("test.txt","w");<br>
 11         for(i=1;i&lt;=5;i++)<br>
 12         {<br>
 13<br>
 14                 printf("\nEnter username[%d] : ",i);<br>
 15                 gets(username);<br>
 16                 fprintf(fp,"%s\n",username);<br>
 17         }<br>
 18<br>
 19         if(fclose(fp)==EOF)<br>
 20         {<br>
 21                 printf("\nError closing file test.txt\n");<br>
 22                 exit(2);<br>
 23         }<br>
 24         printf("file closed\n");<br>
 25         exit(0);<br>
 26 }<br>
</code></pre>
จากโค้ดด้านบน บรรทัดที่ 10 จะเป็นการเปิดไฟล์ "test.txt" เพื่อเขียน บรรทัดที่ 15 จะเป็นการรับข้อมูลที่เป็น string ด้วยฟังก์ชัน gets จากนั้นบรรทัดที่ 16 จะทำการเขียนข้อมูลที่รับมาลงในไฟล์ test.txt พ บรรทัดที่ 19 เป็นการใช้ฟังก์ชัน fclose สำหรับปิดไฟล์ โดยกำหนดเงื่อนไขว่าถ้า fclose คืนค่ามาเป็น EOF แสดงว่าปิดไฟล์ไม่ได้ ให้แสดงข้อความเตือนออกจอภาพ และออกจากโปรแกรมด้วยฟังก์ชัน exit<br>
<br>
<h3>fscanf</h3>
เป็นฟังก์ชันที่ใช้ในการอ่านข้อมูลในไฟล์ มีรูปแบบดังนี้<br>
<pre><code>fscanf(&lt;ชื่อ file Pointer&gt;,"&lt;format&gt;",&lt;ชื่อตัวแปร&gt;);<br>
</code></pre>
format ของ fscanf จะเป็นรูปแบบในลักษณะเดียวกันกับ printf ซึ่งสามารถเลือก format ที่เป็นได้ทั้งตัวอักษร(%s,%c) หรือแม้แต่ตัวเลขต่าง ๆ (%d,%f,...)<br>
<b>ข้อควรระวังในการใช้ fscanf</b> การใช้ชนิดของตัวแปรที่รับข้อมูลจาก fscanf ควรเลือกชนิดข้อมูลที่ตรงกับ format และในกรณีที่อ่านข้อมูลมาเป็น string ต้องระมัดระวังความยาวของ string ด้วย ไม่เช่นนั้นอาจเกิด Segmentation Fault ได้<br>
<br>
ตัวอย่างการใช้ฟังก์ชัน fscanf แสดงดังโค้ดด้างล่าง<br>
<pre><code>  1 //file1.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 #include &lt;stdlib.h&gt;<br>
  5<br>
  6 int main(int argc,char* argv[]){<br>
  7         FILE *fp;<br>
  8         char username[9];<br>
  9         if((fp=fopen("test.txt","r"))==NULL)<br>
 10         {<br>
 11                 printf("\nError opening file test.txt\n");<br>
 12                 exit(1);<br>
 13         }<br>
 14         printf("file opened\n");<br>
 15         while(!feof(fp)){<br>
 16                 fscanf(fp,"%s",username);<br>
 17                 printf("user is %s\n",username);<br>
 18         }<br>
 19<br>
 20         if(fclose(fp)==EOF)<br>
 21         {<br>
 22                 printf("\nError closing file test.txt\n");<br>
 23                 exit(2);<br>
 24         }<br>
 25         printf("file closed\n");<br>
 26         exit(0);<br>
 27 }<br>
</code></pre>

จากโค้ดบรรทัดที่ 7 เป็นการประกาศตัวแปร file pointer ซึ่งจะนำมาใช้กับฟังก์ชันต่าง ๆ บรรทัดที่ 9 เป็นการใช้ฟังก์ชัน fopen เปิดไฟล์ test.txt เพื่ออ่านอย่างเดียว โดยตรวจสอบเงื่อนไขว่า fopen คืนค่า NULL หรือไม่ ถ้าถูกต้องแสดงว่าไม่พบไฟล์ test.txt อยู่ให้แสดงคำเตือนออกหน้าจอ และออกจากโปรแกรมด้วยคำสั่ง exit(1) บรรทัดที่ 15 ใช้ loop while เพื่อจะทำการอ่านไฟล์จนกว่าจะหมดไฟล์ หรือพบว่าเป็น EOF โดยเช็คเงื่อนไขการออกจาก loop ด้วยฟังก์ชัน feof บรรทัดที่ 16 จะเป็นการข้อมูลจากไฟล์ด้วยฟังก์ชัน fscanf โดยกำหนด format "%s" ให้่อ่านข้อมูลมาเป็น string และไปเก็บในตัวแปร username ข้อสังเกตคือจำนวนตัวอักษรแต่ละบรรทัดในไฟล์จะเท่ากับความยาวของตัวแปร string ที่จะนำมารับข้อมูล บรรทัดที่ 17 จะทำการแสดงค่าข้อมูลที่อ่านได้ออกจอภาพ บรรทัดที่ 20 เป็นการใช้ฟังก์ชัน fclose สำหรับปิดไฟล์ โดยกำหนดเงื่อนไขว่าถ้า fclose คืนค่ามาเป็น EOF แสดงว่าปิดไฟล์ไม่ได้ ให้แสดงข้อความเตือนออกจอภาพ และออกจากโปรแกรมด้วยฟังก์ชัน exit<br>
<br>
<h2>แบบฝึกหัด</h2>
ให้ นนร. เขียนโปรแกรม copy.c เพื่อทำการ copy ไฟล์ จากไฟล์ต้นทางที่เป็น argument ตัวแรก และ ไฟล์ปลายทางที่เป็น argument ตัวที่สอง<br>
ตัวอย่างการทำงานของโปรแกรม<br>
<br>
$ copy test.txt copy.txt<br>
<blockquote>copy.txt created.</blockquote>


<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> (Chapter 2 File I/O) <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/cReview2'>Edit</a>