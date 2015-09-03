<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a>
<br>
<br>
<h2>ทบทวนภาษา C</h2>
<blockquote>ภาษาซี เป็นภาษาที่พัฒนาขึ้นในปี ค.ศ. 1972 โดย <a href='http://en.wikipedia.org/wiki/Dennis_Ritchie'>Dennis Ritchie</a> แห่ง Bell Labs เป็นภาษาที่พัฒนามาจากภาษา B และจากภาษา BCPL ช่วงแรกภาษาซีถูกออกแบบให้เป็นภาษาที่ใช้เขียนโปรแกรมในระบบปฏิบัติการ UNIX และต่อมาในปี ค.ศ. 1978 Ritchie ได้ร่วมกับ Brain Kernighan แต่งหนังสือชื่อว่า "The C Programming Language" ทำให้ภาษาซีเป็นที่นิยมแพร่หลายเป็นอย่างมาก จนกระทั่งในปี ค.ศ. 1988 Ritchie และ Kernighan ได้ร่วมกับ ANSI (American National Standards Institute) กำหนดมาตรฐานของภาษาซีขึ้นมา โดยใช้ชื่อว่า "ANSI C"</blockquote>

<h2>การคอมไพล์ภาษาซีในระบบปฏิบัติการลินุกซ์</h2>
อธิบายใน <a href='compilingCprogram.md'>compilingCprogram</a>


<h2>ตัวอักษรพิเศษ</h2>
ตัวอักษรพิเศษ (Escape sequence) เป็นค่าคงที่ตัวอักษรชนิดหนึ่งของภาษาซี ใช้ในการควบคุมการแสดงผลและการทำหน้าที่พิเศษอื่น ๆ การเขียนจะใช้ตัวอักษร "\" (escape character) นำหน้าแล้วตามด้วยตัวอักษรพิเศษที่กำหนด ส่วนใหญ่ตัวอักษรพิเศษ จะเป็นตัวอักษร 32 ตัวแรกของรหัส <a href='http://en.wikipedia.org/wiki/ASCII'>ASCII</a> ตัวอักษรพิเศษที่นิยมใช้ในการเขียนโปรแกรมภาษาซี มีดังนี้<br>
<br>
<table><thead><th>ตัวอักษรพิเศษ</th><th>รหัสแอสกี</th><th>ความหมาย</th></thead><tbody>
<tr><td>\0           </td><td>0        </td><td> NULL, ตัวปิดท้ายข้อความ (string) </td></tr>
<tr><td>\a           </td><td>7        </td><td> alert, bell, กำหนดให้มีเสียงบี๊บ 1 ครั้ง</td></tr>
<tr><td>\b           </td><td>8        </td><td> backspace, เลื่อนเคอร์เซอร์ย้อนกลับไป 1 ช่อง</td></tr>
<tr><td>\t           </td><td>9        </td><td> horizontal Tab,เลื่อนเคอร์เซอร์ไปตามแนวนอน 1 แท็บ </td></tr>
<tr><td>\n           </td><td>10       </td><td> new line, เลื่อนเคอร์ลงไป 1 บรรทัด</td></tr>
<tr><td>\v           </td><td>11       </td><td> Vertical tab, เลื่อนเคอร์เซอร์ไปตามแนวตั้ง 1 แท็บ </td></tr>
<tr><td>\f           </td><td>12       </td><td> form feed, เลื่อนเคอร์เซอร์ไปที่บรรทัดแรกของหน้าใหม่ </td></tr>
<tr><td>\r           </td><td>13       </td><td> return, เลื่อนเคอร์เซอร์กลับไปต้นบรรทัด</td></tr>
<tr><td>\\           </td><td>-        </td><td> แสดงผลตัวอักษร \ (backslash) </td></tr>
<tr><td>\'           </td><td>-        </td><td> แสดงผลตัวอักษร ' (single quote)</td></tr>
<tr><td>\"           </td><td>-        </td><td> แสดงผลตัวอักษร " (double quote)</td></tr>
<tr><td>\000         </td><td>-        </td><td> กำหนดค่าตัวเลขฐานแปดจำนวน 1 ตัวอักษร </td></tr>
<tr><td>\xhh         </td><td>-        </td><td>กำหนดค่าตัวเลขฐานสิบหกจำนวน 1 ตัวอักษร </td></tr></tbody></table>

<h2>ชนิดข้อมูลแบบ Enumeration</h2>
<blockquote>Enumeration หรือ enum เป็นชนิดข้อมูลที่มีสมาชิกเป็น "เซต" ซึ่งมีลักษณะคล้ายกับการประกาศค่าคงที่ที่เป็นตัวเลข โดยค่าที่คืนออกมาจะเป็นตัวเลขเท่านั้น เราสามารถสร้างสมาชิกและกำหนดค่าของสมาชิกแต่ละตัวได้<br>
</blockquote><ul><li>ในกรณีที่ไม่ได้มีการกำหนดค่า<br>
<ol><li>ค่าสมาชิกตัวแรกจะมีค่าเป็น 0<br>
</li><li>ค่าของสมาชิกตัวถัดไปคือ ค่าของสมาชิกตัวก่อนหน้า+1</li></ol></li></ul>

<h3>การประกาศข้อมูลชนิด enum</h3>
<pre><code>enum &lt;ชื่อข้อมูลชนิด struct&gt; {ชื่อค่าคงที่[=ค่าคงที่],ชื่อค่าคงที่[=ค่าคงที่],...,ชื่อค่าคงที่[=ค่าคงที่]} &lt;ชื่อตัวแปร enum&gt; <br>
</code></pre>

<blockquote>ตัวอย่างของการใช้ enum แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 //enum.c<br>
  2 //by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 int main(void){<br>
  5         enum student{Wuttichai,Chaiyapat,Kulsiri=6,Athiwat} cadet1;<br>
  6         enum student cadet2 = Chaiyapat;<br>
  7         enum student cadet3 = Kulsiri;<br>
  8         cadet1 = Wuttichai;<br>
  9         printf("cadet1 is %d\n",cadet1); // =&gt; cadet1 is 0<br>
 10         printf("cadet2 is %d\n",cadet2); // =&gt; cadet2 is 1<br>
 11         printf("cadet3 is %d\n",cadet3); // =&gt; cadet3 is 6<br>
 12         return 0;<br>
 13 }<br>
</code></pre></blockquote>

<h3>แบบฝึกหัด</h3>
ผลของการรันโปรแกรมนี้คืออะไร<br>
<pre><code>  1 //enum.c<br>
  2 //by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 int main(void){<br>
  5         enum student{Wuttichai,Chaiyapat,Kulsiri=6,Athiwat,Eakburut=1,Sanwut} cadet1,cadet2;<br>
  6         enum student cadet3 = Athiwat;<br>
  7         cadet1 = Eakburut;<br>
  8         printf("cadet3 is %d\n",cadet3);<br>
  9         cadet2 = Sanwut;<br>
 10         printf("cadet1 is %d\n",cadet1);<br>
 11         printf("cadet2 is %d\n",cadet2);<br>
 12         cadet1 = Wuttichai;<br>
 13         printf("cadet2 is %d\n",cadet1);<br>
 14<br>
 15         return 0;<br>
 16 }<br>
</code></pre>

<h2>ตัวแปรแบบตัวชี้</h2>
ตัวแปรแบบตัวชี้ (Pointer) คือตัวแปรที่เก็บ <b>เลขตำแหน่ง (Address)</b> ที่อยู่ในหน่วยความจำของค่านั้น ๆ แตกต่างจากตัวแปรชนิดอื่นที่จะเก็บค่าต่าง ๆ ไว้ที่หน่วยความจำที่ได้มีการจองไว้<br>
<br>
โดยทั่วไป เมื่อเราประกาศตัวแปร ภาษาซีจะทำการจองหน่วยความจำไว้เพื่อเก็บค่าต่าง ๆ ซึ่งขนาดของหน่วยความจำที่จองจะขึ้นอยู่กับชนิดข้อมูล (Data Type) เช่น<br>
<pre><code>int a = 5;<br>
</code></pre>
จากโค้ดด้านบน ตัวแปร a มีชนิดข้อมูลเป็น integer ซึ่งต้องใช้พื้นที่หน่วยความจำขนาด 2 ไบต์ ภาษาซีก็จะเข้าไปทำการจองเนื้อที่บนหน่วยความจำ แล้วนำค่า 5 เข้าไปเก็บในหน่วยความจำที่ได้จองไว้ และทำฉลาก (Label) ตั้งชื่อหน่วยความจำส่วนนั้นว่า "a"<br>
<br>
แต่ในตัวแปรที่เป็น pointer ภาษาซีจะทำการสร้างตัวแปรที่เก็บ <b>Address</b> ของหน่วยความจำขึ้นมา เพื่อใช้อ้างอิง(ชี้) ค่าที่อยู่ในหน่วยความจำนั้น เช่น<br>
<pre><code>int a = 5;<br>
int *pa = &amp;a;<br>
</code></pre>
จากโค้ดด้านบน ตัวแปร pa ถูกประกาศให้เป็นตัวแปรแบบ pointer และเก็บ Address ของหน่วยความจำที่ตัวแปร a ได้ทำการจองไว้<br>
<ul><li>เครื่องหมาย <code>*</code> ข้างหน้าตัวแปร pa บ่งบอกถึงการประกาศตัวแปร pa ให้เป็นตัวแปรชนิด pointer<br>
</li><li>เครื่องหมาย <code>&amp;</code> ข้างหน้าตัวแปร a บ่งบอกถึง Address ของหน่วยความจำที่ตัวแปร a จองไว้<br>
ตัวอย่างของการใช้ Pointer แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 //pointer.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4<br>
  5 int main(void){<br>
  6<br>
  7         int a=5;<br>
  8         int *pa=&amp;a;<br>
  9<br>
 10         printf("a=%d\n",a);  // a=5<br>
 11         *pa=15;<br>
 12         printf("a=%d\n",a);   // a=15<br>
 13         return 0;<br>
 14 }<br>
<br>
</code></pre>
จากโค้ดด้านบนที่บรรทัด 11 เราจะกำหนดให้ address ของหน่วยความจำที่ตัวแปร pointer pa ชี้อยู่มีค่าเป็น 15  ซึ่งก็คือ address ของตัวแปร a จึงทำให้บรรทัดที่ 13 เมื่อทำการแสดงค่า a จะได้ผลลัพธ์คือ a=15</li></ul>

<h2>ชนิดข้อมูลแบบ struct</h2>
struct ชนิดข้อมูลแบบโครงสร้าง (structure) มีลักษณะคล้ายกับ array คือตัวแปรตัวเดียวสามารถเก็บข้อมูลได้มากกว่า 1 ค่า แต่ต่างกับ array ตรงที่ struct สามารถเก็บข้อมูลต่างชนิดกันได้ แต่ array จำเป็นต้องเก็บชนิดข้อมูลที่เป็นชนิดเดียวกัน<br>
<h3>การประกาศตัวแปรชนิด struct</h3>
<pre><code>struct &lt;ชื่อข้อมูลชนิด struct&gt; {<br>
     ชนิดข้อมูล ชื่อตัวแปร;<br>
     ชนิดข้อมูล ชื่อตัวแปร;<br>
     ...<br>
     ชนิดข้อมูล ชื่อตัวแปร;<br>
} &lt;ชื่อตัวแปร struct&gt;; <br>
</code></pre>

ตัวอย่างการใช้งานชนิดข้อมูล struct แสดงได้ดังโค้ดด้านล่าง<br>
<pre><code>  1 //struct.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 #include &lt;string.h&gt;<br>
  5<br>
  6 int main(void){<br>
  7         struct student {<br>
  8                 char name[20];<br>
  9                 char surname[20];<br>
 10                 char sex;<br>
 11                 int age;<br>
 12         } c29wutthi;<br>
 13         struct student c14jirawa;<br>
 14<br>
 15         strcpy(c29wutthi.name, "Wutthichai");<br>
 16         strcpy(c29wutthi.surname, "Wechayanwanichai");<br>
 17         c29wutthi.sex = 'M';<br>
 18         c29wutthi.age = 20;<br>
 19<br>
 20         strcpy(c14jirawa.name,"Jirawat");<br>
 21         strcpy(c14jirawa.surname, "Ngernkao");<br>
 22         c14jirawa.sex = 'M';<br>
 23         c14jirawa.age = 21;<br>
 24<br>
 25         printf("Student Name : %s %s\n Sex : %c\n Age : %d\n\n",c29wutthi.name,c29wutthi.surname,c29wutthi.sex,c29wutthi.age);<br>
 26         printf("Student Name : %s %s\n Sex : %c\n Age : %d\n\n",c14jirawa.name,c14jirawa.surname,c14jirawa.sex,c14jirawa.age);<br>
 27         return 0;<br>
 28 }<br>
<br>
</code></pre>
จากโค้ดด้านบน บรรทัดที่ 7-12 เป็นการประกาศข้อมูลชนิด struct โดยมีชนิดข้อมูลใน struct เป็น string, character, และ integer บรรทัดที่ 12-13 จะเป็นการประกาศตัวแปร ที่เป็นชนิดข้อมูล struct ที่เราได้ประกาศไว้ก่อนหน้า บรรทัดที่ 15-23 จะเป็นการนำค่าใส่เข้าไปในตัวแปรย่อยของตัวแปร struct โดยมีรูปแบบเป็น <ชื่อตัวแปร struct>.<ชื่อตัวแปรย่อย> ในกรณีตัวแปรย่อยที่เป็น character และ integer เราสามารถใช้เครื่องหมาย = ในการใส่ค่าให้ตัวแปรได้เลย แต่ในกรณีตัวแปรที่เป็น string เราจำเป็นต้องใช้ฟังก์ชัน "strcpy()" ซึ่งอยู่ใน library "string.h" (บรรทัดที่ 4) ช่วยในการนำค่าใส่ตัวแปร โดยการทำงานของ strcpy() จะทำการคัดลอกค่า string จาก argument ตัวที่สอง มายัง argument ตัวแรก บรรทัดที่ 25-26 จะเป็นการแสดงค่าที่อยู่ในตัวแปร struct ออกหน้าจอ<br>
<br>
<h2>ฟังก์ชัน</h2>
มีคำกล่าวไว้ว่า ภาษาซีเป็นภาษาฟังก์ชัน ซึ่งจะเห็นได้ว่าในการเขียนภาษาซีจะต้องประกาศฟังก์ชันอย่างน้อย 1 ฟังก์ชัน คือ main(){} และภาษาซีไม่มีโพรซีเจอร์ การเขียน sub routine จึงจำเป็นจะต้องใช้แต่ฟังก์ชันเท่านั้น ในกรณีที่ไม่ต้องการให้ sub routine ส่งค่า ต้องใช้ฟังก์ชันที่มีการส่งค่าเป็น void แทน<br>
<h2>ส่วนประกอบของฟังก์ชัน</h2>
<pre><code>returnType functionName (argument1,argument2,...)   &lt;--- Function Header<br>
{<br>
      statement;<br>
      statement;<br>
      statement;                                    &lt;--- Function Body<br>
      statement;<br>
      ...<br>
      statement;<br>
<br>
}<br>
</code></pre>

<h3>ส่วนหัวของฟังก์ชัน (Function Header)</h3>
ส่วนหัวของฟังก์ชันจะเป็นตัวกำหนดรูปแบบการเรียกใช้ฟังก์ชัน และกำหนดค่าที่จะส่งกลับหลังจากการเรียกใช้ฟังก์ชัน<br>
<br>
<h4>รูปแบบ</h4>
<i>returnType</i> <b><i>functionName</i></b> (<i>argument</i>)<br>
<br>
<table><thead><th>returnType</th><th>กำหนดชนิดของข้อมูลที่จะให้ฟังก์ชันส่งค่ากลับ ถ้าไม่ต้องการให้ส่งค่ากลับ ให้กำหนดเป็น void</th></thead><tbody>
<tr><td>functionName</td><td> ชื่อของฟังก์ชัน                                                                         </td></tr>
<tr><td>argument  </td><td>กำหนดค่าหรือข้อมูลที่ส่งผ่านเข้าไปทำงานในฟังก์ชัน ถ้าไม่ต้องการให้ส่งค่ากลับ ให้กำหนดเป็น void</td></tr></tbody></table>

<h3>ส่วนตัวฟังก์ชัน (Function Body)</h3>
ส่วนตัวฟังก์ชัน เป็นส่วนหลักในการทำงานของฟังก์ชัน จะประกอบด้วยชุดคำสั่ง (statement) หรือนิพจน์ (expression) ต่าง ๆ ซึ่งจะอยู่ใน block ของเครื่องหมายวงเล็บปีกกา {}<br>
<br>
<h2>ต้นแบบฟังก์ชัน</h2>
ต้นแบบฟังก์ชัน (Function Prototype) จะเป็นการกำหนด Function Header อีกแบบหนึ่ง เพื่อให้เรามีความสะดวกในการประกาศ function ไว้ส่วนใดก็ได้ เนื่องจากคอมไพเลอร์ภาษาซีจะทำงานไล่ทีละบรรทัดจากบน-ล่าง ตัวฟังก์ชันจึงจำเป็นต้องประกาศก่อนบรรทัดที่จะมีการเรียกใช้ฟังก์ชัน ไม่เช่นนั้นเมื่อมีการเรียกใช้ฟังก์ชันนั้น ๆ คอมไพเลอร์จะแจ้งว่า ไม่รู้จักฟังก์ชันที่เรียกใช้ การกำหนดต้นแบบฟังก์ชันให้อยู่ก่อนฟังก์ชัน main เพื่อให้คอมไพเลอร์ทราบว่ามีฟังก์ชันนี้อยู่ จะช่วยให้เราสามารถประกาศตัวฟังก์ชันไว้ที่ใดก็ได้ ไม่จำเป็นจะต้องประกาศตัวฟังก์ชันไว้ก่อนบรรทัดที่มีมีการเรียกใช้งานฟังก์ชันเสมอไป การประกาศต้นแบบฟังก์ชันจะเหมือนกันการประกาศส่วนหัวของฟังก์ชัน เพียงแต่เพิ่มเครื่องหมายเซมิโคลอน (;) ต่อท้ายเท่านั้น<br>
<h4>รูปแบบ</h4>
<i>returnType</i> <b><i>functionName</i></b> (<i>argument</i>);<br>
<br>
อย่างไรก็ตาม ในภาษาซีเวอร์ชันใหม่ ๆ ได้พัฒนาความสามารถเพิ่มขึ้นโดยยอมให้ใช้ฟังก์ชันก่อนมีการประกาศได้ แต่จะมีการแสดงข้อความเตือนในขั้นตอนคอมไพล์ (<a href='http://icecube.wisc.edu/~dglo/gcc-warnings.html'>implicit warning</a>) ว่าได้มีการเรียกใช้ฟังก์ชันก่อนมีการประกาศฟังก์ชันนั้น<br>
<br>
ตัวอย่างการใช้งานฟังก์ชัน สามารถแสดงได้ตามโค้ดด้านล่าง<br>
<br>
<pre><code>  1 //function.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 void sayHello(void);<br>
  5 //void sayGoodbye(void);<br>
  6<br>
  7<br>
  8 int main(void){<br>
  9<br>
 10         sayHello();<br>
 11         sayGoodbye();<br>
 12<br>
 13         return 0;<br>
 14 }<br>
 15<br>
 16 void sayHello(void){<br>
 17<br>
 18         printf("---------------------------\n");<br>
 19         printf(" Hello\n");<br>
 20         printf("---------------------------\n");<br>
 21<br>
 22 }<br>
 23<br>
 24 void sayGoodbye(void){<br>
 25<br>
 26         printf("---------------------------\n");<br>
 27         printf(" Goodbye\n");<br>
 28         printf("---------------------------\n");<br>
 29 }<br>
<br>
</code></pre>
จากโค้ดตัวอย่างด้านบน จะพบว่าบรรทัดที่ 4 จะเป็นการประกาศต้นแบบฟังก์ชันของฟังก์ sayHello ส่วนบรรทัดที่ 5 จะ remark การประกาศต้นแบบฟังก์ชันของฟังก์ชัน sayGoodbye และตัวฟังก์ชันของทั้งสองฟังก์ชันนี้อยู่หลังฟังก์ชัน main เมื่อทำการคอมไพล์โปรแกรมจะพบว่าคอมไพเลอร์มีการแสดงข้อความเตือนเกี่ยวกับฟังก์ชัน sayGoodbye ดังนี้<br>
<pre><code>function.c:24: warning: conflicting types for â€˜sayGoodbyeâ€™<br>
function.c:11: note: previous implicit declaration of â€˜sayGoodbyeâ€™ was here<br>
</code></pre>
ซึ่งมีความหมายว่า คอมไพเลอร์ได้มีการพบว่ามีการเรียกใช้ฟังก์ชัน sayGoodbye ก่อนที่จะมีการประกาศฟังก์ชัน แต่ก็ยังยอมให้ทำงานต่อไปได้<br>
<br>
จะสังเกตได้ว่า ทั้งฟังก์ชัน sayHello และฟังก์ชัน sayGoodbye ได้มีการประกาศตัวฟังก์ชันหลังฟังก์ชัน Main ทั้งคู่ แต่คอมไพเลอร์มีการเตือนเฉพาะฟังก์ชัน sayGoodbye แต่ไม่เตือนฟังก์ชัน sayHello ทั้งนี้เนื่องจากเราได้มีการประกาศต้นแบบฟังก์ชัน sayHello ไว้แล้วนั่่นเอง<br>
<br>
การแก้ไขข้อความเตือนของฟังก์ชัน sayGoodbye ทำได้โดยการประกาศตัวแบบฟังก์ชัน sayGoodbye  หรือเขียนตัวฟังก์ชัน sayGoodbye ไว้ก่อนที่จะมีการประกาศใช้<br>
<br>
<h2>การส่งผ่านค่าให้กับฟังก์ชัน</h2>
การส่งผ่านค่าคือการนำค่าจากภายนอกไปใช้ประมวลผลในฟังก์ชัน โดยทำการส่งค่าจาก argument หรือตัวแปรที่อยู่ในวงเล็บหลังชื่อฟังก์ชัน การส่งผ่านค่าให้ฟังก์ชันในภาษาซีมี 2 แบบได้แก่ การส่งค่าแบบ pass by value และ pass by reference<br>
<br>
<h3>Pass by Value</h3>
คือการส่งค่าหรือคัดลอกค่าที่อยู่ในตัวแปรเข้ามาในฟังก์ชัน ถ้ามีการเปลี่ยนแปลงค่าตัวแปรในฟังก์ชัน ตัวแปรที่เป็น argument จะไม่เกิดการเปลี่ยนแปลงใด ๆ ตัวอย่างการส่งค่าแบบ pass by value แสดงได้ดังโค้ดข้างล่าง<br>
<pre><code>  1 //passbyvalue.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 int sumof(int startvalue, int stopvalue){<br>
  5         int i;<br>
  6         int sumof = 0;<br>
  7         for(i=startvalue;i&lt;=stopvalue;i++)<br>
  8                 sumof+=i;<br>
  9         startvalue=5;<br>
 10         stopvalue=5;<br>
 11         return sumof;<br>
 12 }<br>
 13<br>
 14 int main(void){<br>
 15         int a=1,b=4;<br>
 16         printf("a=%d,b=%d\n",a,b);       // a=1,b=4<br>
 17         int sum = sumof(a,b);<br>
 18         printf("sum=%d\n",sum);           // sum=10<br>
 19         printf("a=%d,b=%d\n",a,b);      // a=1,b=4<br>
 20         return 0;<br>
 21 }<br>
<br>
</code></pre>

จากโค้ดด้านบนบรรทัดที่ 4-12 จะเป็นการประกาศตัวฟังก์ชันชื่อ sumof ซึ่งให้ผลในการบวกเลขตั้งแต่ 1 ถึงจำนวนที่กำหนด และในบรรทัดที่ 9 และ 10 มีการเปลี่ยนแปลงค่าของตัวแปรที่เป็น parameter ทั้งสองตัว (ข้อสังเกตจะเห็นได้ว่า sumof ไม่ได้ประกาศต้นแบบฟังก์ชัน แต่ตอนคอมไพล์ก็ไม่มีข้อความแจ้งเตือนใด ๆ ทั้งนี้เนื่องจากเราได้ทำการประกาศตัวฟังก์ชันก่อนบรรทัดที่เรียกใช้งานคือบรรทัดที่ 17) ต่อมาในบรรทัดที่ 14-21 จะเป็นส่วนของฟังก์ชัน main  โดยบรรทัดที่ 16 จะเป็นการแสดงค่าของตัวแปร a และ b ก่อนทำฟังก์ชัน sumof และบรรทัดที่ 19 จะเป็นการแสดงค่าของตัวแปร a และ b หลังจากทำฟังก์ชัน sumof จะเห็นค่า a และ b ก่อนและหลังทำฟังก์ชัน จะไม่เปลี่ยนแปลง ทั้งนี้เนื่องจากการส่งค่าให้ฟังก์ชันเป็นแบบ pass by value นั่นเอง<br>
<br>
<h3>Pass by Reference</h3>
คือการส่งค่าแบบอ้างอิง กล่าวคือการส่ง address ของหน่วยความจำที่ตัวแปรนั้นเก็บค่าอยู่ เข้ามาในฟังก์ชัน ถ้ามีการเปลี่ยนแปลงค่าตัวแปรในฟังก์ชัน ตัวแปรที่เป็น argument จะเกิดการเปลี่ยนแปลงค่าด้วย การส่งค่าแบบ Pass by Reference นี้มักใช้เป็นเทคนิคในการเขียนโปรแกรม กรณีที่ต้องการให้ฟังก์ชันสามารถ return ค่าได้มากกว่า 1 ค่าในภาษาซี  ตัวอย่างการส่งค่าแบบ pass by value แสดงได้ดังโค้ดข้างล่าง<br>
<pre><code>  1 //passbyref.c<br>
  2 // by narong phoomsuk<br>
  3 #include &lt;stdio.h&gt;<br>
  4 int sumof(int startvalue, int* stopvalue){<br>
  5         int i;<br>
  6         int sumof = 0;<br>
  7         for(i=startvalue;i&lt;=*stopvalue;i++)<br>
  8                 sumof+=i;<br>
  9         startvalue=5;<br>
 10         *stopvalue=5;<br>
 11         return sumof;<br>
 12 }<br>
 13<br>
 14 int main(void){<br>
 15         int a=1,b=4;<br>
 16         printf("a=%d,b=%d\n",a,b);  //a=1,b=4<br>
 17         int sum = sumof(a,&amp;b);<br>
 18         printf("sum=%d\n",sum);      // sum = 10<br>
 19         printf("a=%d,b=%d\n",a,b);  // a=1,b=5<br>
 20         return 0;<br>
 21 }<br>
</code></pre>
จากโค้ดด้านบนจะเห็นว่า โค้ดแทบจะเหมือนกับโค้ดในส่วนของ passbyvalue.c เกือบทุกประการ แตกต่างกันเล็กน้อยในส่วนของฟังก์ชัน sumof ที่บรรทัดที่ 4 ตัวแปร parameter stopvalue ถูกกำหนดให้เป็น pointer เพื่อให้สามารถส่งค่าแบบ pass by reference ได้ ที่บรรทัดที่ 7 และ 10 จะเห็นว่าการเรียกใช้ stopvalue ทุกครั้งจะต้องมีเครื่องหมาย <code>*</code> นำหน้าเสมอ บรรทัดที่ 7 หมายถึงการเรียกใช้ค่าในหน่วยความจำ ที่ ตัวแปร pointer stopvalue ชี้อยู่ ในส่วนของบรรทัดที่ 10 หมายถึง การนำค่า 10 ไปใส่ในหน่วยความจำ ที่ัตัวแปร pointer stopvalue ชี้อยู่ ส่วนโค้ดของฟังก์ชัน main ต่างกันเล็กน้อยที่บรรทัดที่ 17 การส่งค่า argument ของตัวแปร b จะมีเครื่องหมาย & อยู่ข้างหน้า ซึ่งหมายถึง การ ส่ง address ของหน่วยความจำที่ตัวแปร b ใช้เก็บค่าให้กับฟังก์ชัน sumof ผลจากกันโปรแกรม จะพบว่าค่าของตัวแปร b มีการเปลี่ยนแปลงหลังจากการทำงานของฟังก์ชัน sumof ซึ่งเป็นผลจากการส่งค่าให้ฟังก์ชันแบบ pass by reference นั่นเอง<br>
<br>
<br>
<h2>การส่งค่า Argument ให้โปรแกรม</h2>
นอกจากที่เราจะสามารถส่งค่า argument ให้ฟังก์ชันได้แล้ว เรายังสามารถส่งค่า argument ให้กับตัวโปรแกรมภาษาซีได้อีกด้วย โดยการกำหนด argument มาตรฐานให้กับฟังก์ชัน main ของโปรแกรมดังนี้<br>
<pre><code>int main (int argc, char *argv[])<br>
</code></pre>
จากโค้ดจะพบว่ามี argument 2 ตัว ตัวแรกเป็นชนิด integer ส่วนอีกตัวเป็น array ของ pointer ชนิด character<br>
<ul><li>argc     argument count เป็นตัวแปรที่เก็บจำนวนของ argument ที่รับเข้ามาในโปรแกรม ซึ่งรวมไปถึงชื่อของโปรแกรมด้วย<br>
</li><li>argv     argument vector เป็น list ของ argument ที่รับมา โดยที่ <code>argv[0]</code> จะเป็นชื่อของโปรแกรม</li></ul>

ตัวอย่างการส่งค่า argument ให้โปรแกรมแสดงได้จากโค้ดด้านล่าง<br>
<pre><code>  1 //octhex.c<br>
  2 // by narong phoomsuk<br>
  3 // usage : octhex.c o 10<br>
  4 //         octhex.c h 99<br>
  5 #include &lt;stdio.h&gt;<br>
  6 #include &lt;stdlib.h&gt;<br>
  7 int main(int argc, char* argv[]){<br>
  8         if(argc != 3){ //argc should be 3 for correct execution<br>
  9                 printf("usage : %s o 10\n",argv[0]);<br>
 10                 printf("usage : %s h 99\n",argv[0]);<br>
 11                 return -1;<br>
 12         }<br>
 13         char choice = *argv[1];<br>
 14         int num = atoi(argv[2]);<br>
 15         switch(choice){<br>
 16                 case 'o' : printf("The value of %s in OCTAL is %o\n",argv[2],num);<br>
 17                            break;<br>
 18                 case 'h' : printf("The value of %s in HEXADECIMAL is %X\n",argv[2],num);<br>
 19                            break;<br>
 20                 default : printf("invalid argument\n");<br>
 21         }<br>
 22<br>
 23         return 0;<br>
 24 }<br>
<br>
</code></pre>
จากตัวอย่างด้านบนจะเป็นการสร้างโปรแกรม octhex ซึ่งใช้แปลงค่าเลขฐานสิบ เป็นฐานแปดหรือฐานสิบหก โดยบรรทัดที่ 8 โปรแกรมจะตรวจสอบว่า จำนวน argument ที่ร้บมา เท่ากับ 3 หรือไม่ (ชื่อโปรแกรม + argument ที่เป็น input) ถ้าไม่ใช่ก็จะแสดงวิธีใช้และออกจากโปรแกรม ด้วยคำสั่ง return ในบรรทัดที่ 11 ถ้ามี จากนั้นในบรรทัดที่ 13 จะประกาศตัวแปร choice ซึ่งเป็นชนิด character รับค่าที่อยู่ใน address ที่ argv<code>[1]</code> ชี้อยู่ บรรทัดที่ 14 จะใช้ฟังก์ชัน atoi ซึ่งเป็นฟังก์ชันมาตรฐานที่้ใช้ในการแปลง string หรือ character ให้เป็นตัวเลข จะสังเกตได้ว่า ที่บรรทัดนี้ <code>argv[2]</code> จะไม่มีเครื่องหมาย <code>*</code> นำหน้า เนื่องจากฟังก์ชัน atoi รับ argument เป็น string ได้ และ <code>argv[2]</code> เป็น array of character ซึ่งก็คือ string เช่นกัน จึงไม่ต้องมีเครื่องหมาย <code>*</code> นำหน้า (ถ้าใส่จะคอมไพล์ผ่าน แต่ตอนรันจะเกิด <a href='http://en.wikipedia.org/wiki/Segmentation_fault'>Segmentation Fault</a>) บรรทัดที่ 15-20 เป็นการเปรียบเทียบค่า choice ด้วย switch บรรทัดที่ 16 ในกรณีที่ choice เป็น 'o' จะทำการแปลงเลขฐานสิบให้เป็นเลขฐานแปดด้วย format "%o" ของฟังก์ชัน printf ส่วนบรรทัดที่ 18 ในกรณีที่ choice เป็น 'h' จะทำการแปลงเลขฐานสิบให้เป็นเลขฐานสิบหกด้วย format "%X" ของฟังก์ชัน printf<br>
<br>
<br>
<br>
<h1>References</h1>
<ol><li>Robert Love, <i>LINUX System Programming</i> , O'Rielly, 2007.<a href='http://mirror.paramadina.ac.id/pub/linux/doc/book/Linux.System.Programming.pdf'>PDF</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cSysProg.md'>C กับ System Programming</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/cReview'>Edit</a>