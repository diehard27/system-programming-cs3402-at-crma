<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cReview.md'>ทบทวนภาษา C</a><br>
<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/perlProgApp'>Previous</a><==<br>
<br>
<br>
<h1>สร้างกราฟการใช้ memory จาก sar</h1>
จากตัวอย่างที่ผ่านมาเราสามารถนำมาประยุกต์ใช้สร้างกราฟสถิติจาก sar ได้อีกเช่นในกรณีนี้หากเรารันคำสั่ง sar -r จะได้ผลการรันดังนี้<br>
<pre><code>prachya@pcubusrv104&gt; sar -r<br>
<br>
Linux  pcubusrv104  2.6.32-33-generic-pae  #70-Ubuntu SMP Thu Jul 7 22:51:12 UTC 2011  i686  11/14/2012<br>
<br>
00:00:01  memtot memfree buffers   cached  slabmem      swptot swpfree  _mem_<br>
00:10:01    488M     68M    184M     165M      32M        976M    976M<br>
00:20:01    488M     68M    184M     165M      32M        976M    976M<br>
00:30:01    488M     68M    184M     165M      32M        976M    976M<br>
</code></pre>
จะเห็นได้ว่าเครื่องมีหน่วยความจำ 488M และ หน่วยความจำเหลือ memfree=68M (เปลี่ยนไปตามเวลา) มีส่วนที่เป็น buffers และ ส่วนที่เป็น virtual memory หรือ swap ในที่นี้เราจะ plot การใช้งานหน่วยความจำที่ใช้, หน่วยความจำที่เหลือ, และ buffers<br>
<br>
เราจะใช้โค้ด <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/perl/gchart-mem.pl'>gchart-mem.pl</a> ซึ่งมีลักษณะเดียวกันกับ gchart-disk.pl โดยแก้ไขบางส่วนที่เกี่ยวข้องกับการใช้หน่วยความจำ และเราเลือกใช้ <code>AreaChart()</code> ตามตัวอย่างใน <a href='http://code.google.com/apis/ajax/playground/?type=visualization#area_chart'>Google Chart</a>

<pre><code># gchart-mem.pl<br>
# written by Prachya Chalermwat, Ph.D. Mail: pyavinci@gmail.com<br>
# Nov 14, 2012<br>
print "&lt;html xmlns=\"http://www.w3.org/1999/xhtml\"&gt;\n";<br>
print "  &lt;head&gt;\n";<br>
print "    &lt;meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/&gt;\n";<br>
print "    &lt;title&gt;\n";<br>
print "      Google Visualization API Sample\n";<br>
print "    &lt;/title&gt;\n";<br>
print "    &lt;script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"&gt;&lt;/script&gt;\n";<br>
print "    &lt;script type=\"text/javascript\"&gt;\n";<br>
print "      google.load('visualization', '1', {packages: ['corechart']});\n";<br>
print "    &lt;/script&gt;\n";<br>
print "    &lt;script type=\"text/javascript\"&gt;\n";<br>
print "      function drawVisualization() {\n";<br>
print "        // Some raw data (not necessarily accurate)\n";<br>
print "        var data = google.visualization.arrayToDataTable([\n";<br>
print "          ['Time',   'Used', 'free', 'buffer'],\n";<br>
system("sar -r &gt; tmp.dat");<br>
open FILE, "&lt;", "tmp.dat" or die $!;<br>
$i=0;<br>
foreach $buf (&lt;FILE&gt;) {<br>
  $buf =~s/[ \t\n]+/;/g ; # get rid of white spaces/tab and put ; instead<br>
  if ($i&gt;5) {<br>
    $x=@col=split(/;/,$buf);<br>
    $tstamp=$col[0];  $tstamp=~s/[ \t]+//g;<br>
    $total=$col[1];  $total=~s/M//g;<br>
    $free=$col[2];  $free=~s/M//g;<br>
    $buffer=$col[3]; $buffer=~s/M//g;<br>
    my $used=$total-$free;<br>
    if ($total!=0) { # get rid of error lines<br>
    print "          [\'$tstamp\', $used,   $free,       $buffer],\n";<br>
    }<br>
  }<br>
  $i++;<br>
}<br>
print "        ]);\n";<br>
print "        // Create and draw the visualization.\n";<br>
print "        var ac = new google.visualization.AreaChart(document.getElementById('visualization'));\n";<br>
print "        ac.draw(data, {\n";<br>
print "          title : 'Memory Usage',\n";<br>
print "          isStacked: true,\n";<br>
print "          width: 600,\n";<br>
print "          height: 400,\n";<br>
print "          vAxis: {title: \"MB\"},\n";<br>
print "          hAxis: {title: \"Time\"}\n";<br>
print "        });\n";<br>
print "      }\n";<br>
print "      \n";<br>
print "\n";<br>
print "      google.setOnLoadCallback(drawVisualization);\n";<br>
print "    &lt;/script&gt;\n";<br>
print "  &lt;/head&gt;\n";<br>
print "  &lt;body style=\"font-family: Arial;border: 0 none;\"&gt;\n";<br>
print "    &lt;div id=\"visualization\" style=\"width: 600px; height: 400px;\"&gt;&lt;/div&gt;\n";<br>
print "  &lt;/body&gt;\n";<br>
print "&lt;/html&gt;\n";<br>
</code></pre>

เมื่อรันด้วยคำสั่งต่อไปนี้จะได้หน้า <a href='http://10.134.64.45/prachya/perl/t6.html'>t6.html</a> ซึ่งแสดงกราฟแบบพื้นที่ ข้อมูลการใช้งานหน่วยความจำของเครื่องเซอร์ฟเวอร์<br>
<pre><code>perl gchart-mem.pl &gt; t6.html<br>
</code></pre>

<h2>อธิบายการแก้ไขโค้ด</h2>
โค้ดในส่วนนี้ได้รับการแก้ไขให้อ่านข้อมูล จากการรัน sar -r แล้วเก็บไว้ในไฟล์ tmp.dat จากนั้นก็เปิดไฟล์เพื่ออ่านด้วยคำสั่ง open โดยใช้ตัวแปร FILE เป็น file handler ตั้งค่าบรรทัด i=0 ก่อนเข้าลูปของการอ่านแต่ละบรรทัด ด้วยคำสั่ง <code>foreach $buf (&lt;FILE&gt;)</code>  เมื่ออ่านเข้ามาแล้วก็กำจัดช่องว่างและแทนที่ด้วยตัวคั่นในที่นี้ใช้เซมิโคล่อน (;) โดยกระทำทั้งหมดในคำสั่ง <code>$buf =~s/[ \t\n]+/;/g ;</code>

เงื่อนไข <code> if ($i&gt;5) {</code> จะทำการข้ามหัวของรายงานไปประมาณ 4 บรรทัด จากนั้นแปลง buf ให้เป็นอาเรย์โดยใช้คำสั่ง split ในบรรทัด <code> $x=@col=split(/;/,$buf);</code> แล้วทำการแยกตัวแปรที่ต้องการ ในที่นี้มี tstamp, total, free, และ buffer เสร็จแล้วคำนวณ used จากค่าของ total-free แล้วพิมพ์ออกมาให้อยู่ในรูปแบบข้อมูลของ Google Code<br>
<pre><code>system("sar -r &gt; tmp.dat");<br>
open FILE, "&lt;", "tmp.dat" or die $!;<br>
$i=0;<br>
foreach $buf (&lt;FILE&gt;) {<br>
  $buf =~s/[ \t\n]+/;/g ; # get rid of white spaces/tab and put ; instead<br>
  if ($i&gt;5) {<br>
    $x=@col=split(/;/,$buf);<br>
    $tstamp=$col[0];  $tstamp=~s/[ \t]+//g;<br>
    $total=$col[1];  $total=~s/M//g;<br>
    $free=$col[2];  $free=~s/M//g;<br>
    $buffer=$col[3]; $buffer=~s/M//g;<br>
    my $used=$total-$free;<br>
    if ($total!=0) { # get rid of error lines<br>
    print "          [\'$tstamp\', $used,   $free,       $buffer],\n";<br>
    }<br>
  }<br>
  $i++;<br>
}<br>
</code></pre>
<img width='400' src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/Figures/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%A0%E0%B8%B2%E0%B8%9E4.png'>

ข้อมูลสถิติของ sar ประเภทอื่นๆ ก็สามารถนำมาประยุกต์ใช้ได้เช่นเดียวกัน ทำให้สามารถสร้างข้อมูลสถิติของระบบคอมพิวเตอร์ได้โดยง่าย<br>
<br>
<h1>แบบฝึกหัด</h1>
<ol><li>ใช้คำสั่ง sar -l เพื่อแสดงสถิติของการใช้เน็ตเวิร์ค โดยให้พล็อตกราฟแบบเส้น ของ inbyt/s เปรียบเทียบกับ otbyt/s และให้แกน x เป็นเวลา time stamp<br>
</li><li>ใช้คำสั่ง sar -l เพื่อแสดงสถิติของการใช้เน็ตเวิร์ค แล้วพล็อตกราฟแบบเส้นของ inpck/s เปรียบเทียบกับ otpck/s<br>
</li><li>ใช้คำสั่ง sar -P เพื่อแสดงสถิติของ process load โดยใช้ Google Chart ช่วยในการแสดงผล</li></ol>

<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='cReview.md'>ทบทวนภาษา C</a><br>
<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/perlProgApp'>Previous</a><==<br>
<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/perlProgApp2'>Edit</a>