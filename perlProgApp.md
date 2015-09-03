<table width='500'>
<td>
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProgApp2.md'>การประยุกต์ใช้ Perl 2</a>
<br>
<br>
<h1>Render SAR to HTML for Google Chart</h1>
<h2>SAR คืออะไร?</h2>
SAR ย่อมาจาก System Activity Report ใช้สำหรับแสดงข้อมูลทางสถิติที่เกี่ยวกับระบบการทำงานของเครื่องแม่ข่ายหรือคอมพิวเตอร์ทั่วไป เช่น การใช้งานซีพียู เน็ตเวอร์ค หน่วยความจำ หรือดิสก์ โดย sar ที่รันในห้วงเวลาที่ต้องการ การติดตั้งบน Ubuntu เพียงแค่รันคำสั่ง sudo aptitude install atsar โดยที่ ผู้ใช้สามารถเรียกใช้งานด้วยคำสั่ง sar หรือ atsar ได้เนื่องจากเป็น symbolic ไปที่โปรแกรมเดียวกัน เมื่อติดตั้ง sar จะทำการเก็บข้อมูลเป็นระยะตามที่ตั้งเวลาไว้ใน cron ดูได้จาก /etc/cron.d/atsar ซึ่งค่าปริยายคือทุก ๆ 10 นาที<br>
<br>
<pre><code>prachya@pcubusrv104&gt; cat /etc/cron.d/atsar<br>
@reboot root test -x /usr/lib/atsar/atsadc &amp;&amp; (LOGDIR=/var/log/atsar; CURDAY=`date +\%d`; find $LOGDIR/atsa$CURDAY -mtime +2 -type f -exec rm {} \; 2&gt; /dev/null; /usr/lib/atsar/atsadc $LOGDIR/atsa$CURDAY)<br>
*/10 * * * * root test -x /usr/lib/atsar/atsa1 &amp;&amp; /usr/lib/atsar/atsa1<br>
</code></pre>
การใช้งานแบบแรกกำหนดห้วงการเก็บข้อมูลในแต่ละแบบ โดยที่เก็บข้อมูลจาก kernel เป็น n ช่วงใน  t วินาที ค่า default ของ n เท่ากับ 1 และ t มีค่า >= 1  รายละเอียดการใช้งาน sar เพิ่มเติมสามารถศึกษาได้ <a href='http://sebastien.godard.pagesperso-orange.fr/tutorial.html'>ที่นี่</a>
<pre><code>sar [ -flags ] t [ n ]<br>
</code></pre>
ยกตัวอย่างเช่น ต้องการทราบข้อมูลเกี่ยวกับการใช้งานหน่วยความจำ ทุก 1 วินาที 5 ครั้ง<br>
<pre><code>prachya@pcubusrv104&gt; sar -r 1 5<br>
<br>
Linux  pcubusrv104  2.6.32-33-generic-pae  #70-Ubuntu SMP Thu Jul 7 22:51:12 UTC 2011  i686  11/14/2012<br>
<br>
05:34:21  memtot memfree buffers   cached  slabmem      swptot swpfree  _mem_<br>
05:34:22    488M     63M    185M     166M      32M        976M    976M<br>
05:34:23    488M     63M    185M     166M      32M        976M    976M<br>
05:34:24    488M     63M    185M     166M      32M        976M    976M<br>
05:34:25    488M     63M    185M     166M      32M        976M    976M<br>
05:34:26    488M     63M    185M     166M      32M        976M    976M<br>
</code></pre>

การเรียกใช้งาน sar<br>
<pre><code>usage: atsar [-flags] t [n]              or<br>
       atsar [-flags] [-s hh:mm] [-e hh:mm] [-i sec] [-n day# | -f file]<br>
flags:<br>
        -A      all flags<br>
        -S      time-stamp for every output-line<br>
        -u      cpu (default flag)<br>
        -P      process load<br>
        -d      disk<br>
        -D      disk-partition<br>
        -r      memory &amp; swap<br>
        -p      paging &amp; swapping<br>
        -I      interrupts<br>
        -v      kernel-resources<br>
        -y      tty activity<br>
        -l      net-interf (general)<br>
        -L      net-interf (errors)<br>
        -w      ip   v4    (general)<br>
        -W      ip   v4    (errors)<br>
        -t      tcp  v4    (general)<br>
        -T      tcp  v4    (errors)<br>
        -U      udp  v4<br>
        -m      icmp v4    (general)<br>
        -M      icmp v4    (per type)<br>
        -g      ip   v6    (general)<br>
        -G      ip   v6    (errors)<br>
        -j      tcp  v6    (general)<br>
        -h      udp  v6<br>
        -k      icmp v6    (general)<br>
        -K      icmp v6    (per type)<br>
        -N      nfs        (general)<br>
        -E      nfs        (errors)<br>
        -V      nfs        (server)<br>
        -R      nfs-rpc    (%calls)<br>
</code></pre>

<h2>Output ของ SAR</h2>
ตัวอย่างการใช้งาน sar เพื่อเรียกดูสถิติการใช้งานของดิสก์ด้วยตัวเลือก -D<br>
<pre><code>prachya@pcubusrv104&gt; sar -D<br>
<br>
Linux  pcubusrv104  2.6.32-33-generic-pae  #70-Ubuntu SMP Thu Jul 7 22:51:12 UTC 2011  i686  11/14/2012<br>
<br>
00:00:01  partition   busy  read/s Kbyt/r   write/s Kbyt/w  avque avserv _part_<br>
00:10:01  sda (8-0)     0%    0.00    0.0      0.06    6.2   1.02   6.05 ms<br>
          sda3                0.00    0.0      0.06    6.2<br>
00:20:01  sda (8-0)     0%    0.00    0.0      0.06    5.3   1.02   6.27 ms<br>
          sda3                0.00    0.0      0.06    5.3<br>
00:30:01  sda (8-0)     0%    0.00    0.0      0.05    5.6   1.02   6.27 ms<br>
          sda3                0.00    0.0      0.05    5.6<br>
00:40:01  sda (8-0)     0%    0.00    0.0      0.06    5.7   1.03   6.97 ms<br>
          sda3                0.00    0.0      0.06    5.7<br>
00:50:01  sda (8-0)     0%    0.00    0.0      0.05    5.6   1.02   6.00 ms<br>
          sda3                0.00    0.0      0.05    5.6<br>
01:00:01  sda (8-0)     0%    0.00    0.0      0.05    5.7   1.02   6.19 ms<br>
          sda3                0.00    0.0      0.05    5.7<br>
01:10:01  sda (8-0)     0%    0.00    0.0      0.07    6.2   1.38   7.60 ms<br>
          sda3                0.00    0.0      0.06    6.3<br>
          sda5                0.00    0.0      0.01    5.0<br>
01:20:01  sda (8-0)     0%    0.00    0.0      0.06    5.7   1.03   6.74 ms<br>
          sda3                0.00    0.0      0.06    5.7<br>
01:30:02  sda (8-0)     0%    0.00    0.0      0.05    5.7   1.00   5.73 ms<br>
          sda3                0.00    0.0      0.05    5.7<br>
01:40:01  sda (8-0)     0%    0.00    0.0      0.07    5.9   1.01   6.18 ms<br>
          sda3                0.00    0.0      0.07    5.9<br>
01:50:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.04   6.58 ms<br>
          sda3                0.00    0.0      0.05    6.1<br>
02:00:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.00   5.10 ms<br>
          sda3                0.00    0.0      0.05    6.1<br>
02:10:01  sda (8-0)     0%    0.00    0.0      0.06    6.1   1.00   5.03 ms<br>
          sda3                0.00    0.0      0.06    6.1<br>
02:20:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.04   6.06 ms<br>
          sda3                0.00    0.0      0.05    6.1<br>
02:30:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.00   5.24 ms<br>
          sda3                0.00    0.0      0.05    6.1<br>
02:40:01  sda (8-0)     0%    0.00    0.0      0.06    5.9   1.00   5.37 ms<br>
          sda3                0.00    0.0      0.06    5.9<br>
02:50:01  sda (8-0)     0%    0.00    0.0      0.05    5.9   1.00   5.47 ms<br>
</code></pre>

ปรับผลลัพธ์ให้มีเฉพาะข้อมูลที่ต้องการด้วย grep<br>
<pre><code>prachya@pcubusrv104&gt; sar -D |grep "sda \|partition"<br>
00:00:01  partition   busy  read/s Kbyt/r   write/s Kbyt/w  avque avserv _part_<br>
00:10:01  sda (8-0)     0%    0.00    0.0      0.06    6.2   1.02   6.05 ms<br>
00:20:01  sda (8-0)     0%    0.00    0.0      0.06    5.3   1.02   6.27 ms<br>
00:30:01  sda (8-0)     0%    0.00    0.0      0.05    5.6   1.02   6.27 ms<br>
00:40:01  sda (8-0)     0%    0.00    0.0      0.06    5.7   1.03   6.97 ms<br>
00:50:01  sda (8-0)     0%    0.00    0.0      0.05    5.6   1.02   6.00 ms<br>
01:00:01  sda (8-0)     0%    0.00    0.0      0.05    5.7   1.02   6.19 ms<br>
01:10:01  sda (8-0)     0%    0.00    0.0      0.07    6.2   1.38   7.60 ms<br>
01:20:01  sda (8-0)     0%    0.00    0.0      0.06    5.7   1.03   6.74 ms<br>
01:30:02  sda (8-0)     0%    0.00    0.0      0.05    5.7   1.00   5.73 ms<br>
01:40:01  sda (8-0)     0%    0.00    0.0      0.07    5.9   1.01   6.18 ms<br>
01:50:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.04   6.58 ms<br>
02:00:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.00   5.10 ms<br>
02:10:01  sda (8-0)     0%    0.00    0.0      0.06    6.1   1.00   5.03 ms<br>
02:20:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.04   6.06 ms<br>
02:30:01  sda (8-0)     0%    0.00    0.0      0.05    6.1   1.00   5.24 ms<br>
02:40:01  sda (8-0)     0%    0.00    0.0      0.06    5.9   1.00   5.37 ms<br>
02:50:01  sda (8-0)     0%    0.00    0.0      0.05    5.9   1.00   5.47 ms<br>
03:00:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   4.80 ms<br>
03:10:01  sda (8-0)     0%    0.00    0.0      0.06    5.9   1.00   5.44 ms<br>
03:20:01  sda (8-0)     0%    0.00    0.0      0.07    6.2   1.02   5.20 ms<br>
03:30:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   5.73 ms<br>
03:40:01  sda (8-0)     0%    0.00    0.0      0.06    5.9   1.00   5.44 ms<br>
03:50:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   5.07 ms<br>
04:00:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   4.80 ms<br>
04:10:01  sda (8-0)     0%    0.00    0.0      0.06    5.8   1.00   5.22 ms<br>
04:20:01  sda (8-0)     0%    0.00    0.0      0.06    5.9   1.00   5.89 ms<br>
04:30:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   5.47 ms<br>
04:40:01  sda (8-0)     0%    0.00    0.0      0.06    5.9   1.00   5.56 ms<br>
04:50:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   6.00 ms<br>
05:00:01  sda (8-0)     0%    0.00    0.0      0.05    6.0   1.00   5.73 ms<br>
05:10:01  sda (8-0)     0%    0.00    4.0      0.20    5.8   1.01   5.32 ms<br>
05:20:01  sda (8-0)     0%    0.00    0.0      0.08    5.7   1.00   5.22 ms<br>
05:30:01  sda (8-0)     0%    0.00    0.0      0.38    6.2   1.06   5.98 ms<br>
</code></pre>

เลือกอ่านข้อมูลดิสก์ด้วยตัวเลือก -d<br>
<pre><code>prachya@pcubusrv104&gt; sar -d | head -20<br>
<br>
Linux  pcubusrv104  2.6.32-33-generic-pae  #70-Ubuntu SMP Thu Jul 7 22:51:12 UTC 2011  i686  11/14/2012<br>
<br>
00:00:01  device            read/s rdKb/s   write/s wrKb/s        rdwr/s _disk_<br>
00:10:01  disk008-000         0.00   0.00      0.06   0.38          0.06<br>
00:20:01  disk008-000         0.00   0.00      0.06   0.33          0.06<br>
00:30:01  disk008-000         0.00   0.00      0.05   0.28          0.05<br>
00:40:01  disk008-000         0.00   0.00      0.06   0.33          0.06<br>
00:50:01  disk008-000         0.00   0.00      0.05   0.28          0.05<br>
01:00:01  disk008-000         0.00   0.00      0.05   0.29          0.05<br>
01:10:01  disk008-000         0.00   0.00      0.07   0.41          0.07<br>
01:20:01  disk008-000         0.00   0.00      0.06   0.33          0.06<br>
01:30:02  disk008-000         0.00   0.00      0.05   0.29          0.05<br>
01:40:01  disk008-000         0.00   0.00      0.07   0.43          0.07<br>
01:50:01  disk008-000         0.00   0.00      0.05   0.31          0.05<br>
02:00:01  disk008-000         0.00   0.00      0.05   0.29          0.05<br>
02:10:01  disk008-000         0.00   0.00      0.06   0.35          0.06<br>
02:20:01  disk008-000         0.00   0.00      0.05   0.33          0.05<br>
02:30:01  disk008-000         0.00   0.00      0.05   0.29          0.05<br>
02:40:01  disk008-000         0.00   0.00      0.06   0.35          0.06<br>
</code></pre>

สมมุติว่าเราสนใจแต่ประสิทธิภาพของการเขียนดิสก์ ในคอลัมน์ write/s และ wrKb/s เพื่อจะนำมา plot เป็นกราฟโดยใช้ Google Chart<br>
<h2>สกัดข้อมูลที่ต้องการด้วย awk</h2>
ในบรรทัดที่มีข้อมูลจะมีข้อความ disk008 อยู่ดังนั้นเราจะสกัดข้อมูลที่ต้องการในคอลัมน์ 5 และ 6 ด้วย awk ดังนี้<br>
<pre><code>sar -d |grep disk008 |awk '{print $1 "  " $5 "  " $6}'<br>
</code></pre>
จะได้ข้อมูลเชิงตัวเลขของของ เวลาที่บันทึก write/s และ wrKb/s ดังนี้ (ข้อมูลจริงยาวกว่านี้)<br>
<pre><code>13:20:01 0.11 0.73<br>
13:30:01 0.06 0.32<br>
13:40:01 0.09 0.55<br>
13:50:01 0.08 0.47<br>
14:00:01 0.05 0.29<br>
14:10:01 0.17 1.01<br>
14:20:01 0.07 0.45<br>
14:30:01 0.07 0.37<br>
</code></pre>

<h2>วาดกราฟด้วย Google Chart</h2>
ข้อมูลข้างต้นสามารถนำมาเขียนเป็น HTML เพื่อเรียกไลบรารี่ของ Google Chart เพื่อวาดกราฟให้ตามที่เราต้องการ ในกรณีนี้เราต้องการวาดกราฟ ยกตัวอย่าง กราฟใน <a href='http://10.134.64.45/prachya/perl/gchart-test1.html'>http://10.134.64.45/prachya/perl/gchart-test1.html</a> สามารถเขียนเป็น HTML (จากเว็บของ Google <a href='http://code.google.com/apis/ajax/playground/?type=visualization#line_chart'>http://code.google.com/apis/ajax/playground/?type=visualization#line_chart</a>) ได้ดังนี้<br>
<br>
<img width='400' src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/Figures/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%A0%E0%B8%B2%E0%B8%9E2.png'>

<pre><code>&lt;!--<br>
You are free to copy and use this sample in accordance with the terms of the<br>
Apache license (http://www.apache.org/licenses/LICENSE-2.0.html)<br>
--&gt;<br>
<br>
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;<br>
&lt;html xmlns="http://www.w3.org/1999/xhtml"&gt;<br>
  &lt;head&gt;<br>
    &lt;meta http-equiv="content-type" content="text/html; charset=utf-8"/&gt;<br>
    &lt;title&gt;<br>
      Google Visualization API Sample<br>
    &lt;/title&gt;<br>
    &lt;script type="text/javascript" src="http://www.google.com/jsapi"&gt;&lt;/script&gt;<br>
    &lt;script type="text/javascript"&gt;<br>
      google.load('visualization', '1', {packages: ['corechart']});<br>
    &lt;/script&gt;<br>
    &lt;script type="text/javascript"&gt;<br>
      function drawVisualization() {<br>
        // Create and populate the data table.<br>
        var data = google.visualization.arrayToDataTable([<br>
          ['x', 'Cats', 'Blanket 1', 'Blanket 2'],<br>
          ['A',   1,       1,           0.5],<br>
          ['B',   2,       0.5,         1],<br>
          ['C',   4,       1,           0.5],<br>
          ['D',   8,       0.5,         1],<br>
          ['E',   7,       1,           0.5],<br>
          ['F',   7,       0.5,         1],<br>
          ['G',   8,       1,           0.5],<br>
          ['H',   4,       0.5,         1],<br>
          ['I',   2,       1,           0.5],<br>
          ['J',   3.5,     0.5,         1],<br>
          ['K',   3,       1,           0.5],<br>
          ['L',   3.5,     0.5,         1],<br>
          ['M',   1,       1,           0.5],<br>
          ['N',   1,       0.5,         1]<br>
        ]);<br>
      <br>
        // Create and draw the visualization.<br>
        new google.visualization.LineChart(document.getElementById('visualization')).<br>
            draw(data, {curveType: "function",<br>
                        width: 500, height: 400,<br>
                        vAxis: {maxValue: 10}}<br>
                );<br>
      }<br>
      <br>
      google.setOnLoadCallback(drawVisualization);<br>
    &lt;/script&gt;<br>
  &lt;/head&gt;<br>
  &lt;body style="font-family: Arial;border: 0 none;"&gt;<br>
    &lt;div id="visualization" style="width: 500px; height: 400px;"&gt;&lt;/div&gt;<br>
  &lt;/body&gt;<br>
&lt;/html&gt;<br>
</code></pre>

จากตัวอย่าง HTML โค้ดข้างต้นเราจะใช้ perl ในการดึงข้อมูลสถิติของดิสก์ที่ได้ นำมาเขียนเป็นสคริปต์ที่เรียก API ของ Google Chart เพื่อสร้างกราฟที่ต้องการ<br>
<br>
<h2>สร้าง gchar-disk.pl</h2>
นำหน้า html ข้างต้นมาเขียนเป็นสคริปต์เพื่อให้ perl สามารถสร้างหน้าเว็บได้เช่นเดียวกัน<br>
<pre><code># gchart-disk.pl<br>
#&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;<br>
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
print "        // Create and populate the data table.\n";<br>
print "        var data = google.visualization.arrayToDataTable([\n";<br>
print "          ['x', 'Cats', 'Blanket 1', 'Blanket 2'],\n";<br>
print "          ['A',   1,       1,           0.5],\n";<br>
print "          ['B',   2,       0.5,         1],\n";<br>
print "          ['C',   4,       1,           0.5],\n";<br>
print "          ['D',   8,       0.5,         1],\n";<br>
print "          ['E',   7,       1,           0.5],\n";<br>
print "          ['F',   7,       0.5,         1],\n";<br>
print "          ['G',   8,       1,           0.5],\n";<br>
print "          ['H',   4,       0.5,         1],\n";<br>
print "          ['I',   2,       1,           0.5],\n";<br>
print "          ['J',   3.5,     0.5,         1],\n";<br>
print "          ['K',   3,       1,           0.5],\n";<br>
print "          ['L',   3.5,     0.5,         1],\n";<br>
print "          ['M',   1,       1,           0.5],\n";<br>
print "          ['N',   1,       0.5,         1]\n";<br>
print "        ]);\n";<br>
print "      \n";<br>
print "        // Create and draw the visualization.\n";<br>
print "        new google.visualization.LineChart(document.getElementById('visualization')).\n";<br>
print "            draw(data, {curveType: \"function\",\n";<br>
print "                        width: 500, height: 400,\n";<br>
print "                        vAxis: {maxValue: 10}}\n";<br>
print "                );\n";<br>
print "      }\n";<br>
print "      \n";<br>
print "\n";<br>
print "      google.setOnLoadCallback(drawVisualization);\n";<br>
print "    &lt;/script&gt;\n";<br>
print "  &lt;/head&gt;\n";<br>
print "  &lt;body style=\"font-family: Arial;border: 0 none;\"&gt;\n";<br>
print "    &lt;div id=\"visualization\" style=\"width: 500px; height: 400px;\"&gt;&lt;/div&gt;\n";<br>
print "  &lt;/body&gt;\n";<br>
print "&lt;/html&gt;\n";<br>
</code></pre>

ทดสอบด้วยการรัน<br>
<pre><code>perl gchart-disk.pl &gt; tg1.html<br>
</code></pre>
ลองเปิดลิงค์ของ <a href='http://10.134.64.45/prachya/perl/tg1.html'>tg1.html</a>

จากนั้นเราจะแก้ไข <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/perl/gchart-mem.pl'>gchart-disk.pl</a> เพื่อให้แสดงข้อมูลที่อัพเดทเมื่อรันได้ต่อไปนี้<br>
<pre><code># gchart-disk.pl<br>
#&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;<br>
print "&lt;html xmlns=\"http://www.w3.org/1999/xhtml\"&gt;\n";<br>
print "  &lt;head&gt;\n";<br>
print "    &lt;meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/&gt;\n";<br>
print "    &lt;title&gt;\n";<br>
print "      SAR Disk Stats\n";<br>
print "    &lt;/title&gt;\n";<br>
print "    &lt;script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"&gt;&lt;/script&gt;\n";<br>
print "    &lt;script type=\"text/javascript\"&gt;\n";<br>
print "      google.load('visualization', '1', {packages: ['corechart']});\n";<br>
print "    &lt;/script&gt;\n";<br>
print "    &lt;script type=\"text/javascript\"&gt;\n";<br>
print "      function drawVisualization() {\n";<br>
print "        // Create and populate the data table.\n";<br>
print "        var data = google.visualization.arrayToDataTable([\n";<br>
print "          ['x', 'wr/s', 'wrKB/s'],\n";<br>
# now getting numerical data using sar and store in disk.dat<br>
system("sar -d |grep 'disk008'&gt; tmp.dat");<br>
open FILE, "&lt;", "tmp.dat" or die $!;<br>
foreach $buf (&lt;FILE&gt;) {<br>
#print $lines[0],"\n";<br>
  $buf =~ s/[ \t]+/;/g ;<br>
#  print $buf,"\n";<br>
  $x=@col=split(/;/,$buf);<br>
#print $x,"\n";<br>
  print "          ['$col[0]',   $col[4],       $col[5]],\n";<br>
}<br>
print "        ]);\n";<br>
print "      \n";<br>
print "        // Create and draw the visualization.\n";<br>
print "        new google.visualization.LineChart(document.getElementById('visualization')).\n";<br>
print "            draw(data, {curveType: \"function\",\n";<br>
print "                        width: 500, height: 400,\n";<br>
print "                        vAxis: {maxValue: 10}}\n";<br>
print "                );\n";<br>
print "      }\n";<br>
print "      \n";<br>
print "\n";<br>
print "      google.setOnLoadCallback(drawVisualization);\n";<br>
print "    &lt;/script&gt;\n";<br>
print "  &lt;/head&gt;\n";<br>
print "  &lt;body style=\"font-family: Arial;border: 0 none;\"&gt;\n";<br>
print "    &lt;div id=\"visualization\" style=\"width: 500px; height: 400px;\"&gt;&lt;/div&gt;\n";<br>
print "  &lt;/body&gt;\n";<br>
print "&lt;/html&gt;\n";<br>
</code></pre>
ส่วนสำคัญที่เราเปลี่ยนโค้ดในที่นี้คือ<br>
<pre><code># now getting numerical data using sar and store in disk.dat<br>
system("sar -d |grep 'disk008'&gt; tmp.dat");<br>
open FILE, "&lt;", "tmp.dat" or die $!;<br>
foreach $buf (&lt;FILE&gt;) {<br>
  $buf =~ s/[ \t]+/;/g ;<br>
  $x=@col=split(/;/,$buf);<br>
  print "          ['$col[0]',   $col[4],       $col[5]],\n";<br>
}<br>
</code></pre>
ซึ่งจะอธิบายการทำงานของ perl ดังต่อไปนี้<br>
<pre><code>system("sar -d |grep 'disk008'&gt; tmp.dat");<br>
</code></pre>
เรียก system call ด้วยคำสั่ง sar -d แล้ว grep เอาเฉพาะบรรทัดที่มี disk008 แล้วนำไปเก็บไว้ในไฟล์ tmp.dat<br>
จากนั้นเปิดไฟล์เพื่ออ่าน (<code>"&lt;"</code>) โดยมีตัวแปร FILE เป็น file handler<br>
<pre><code>open FILE, "&lt;", "tmp.dat" or die $!;<br>
</code></pre>
จากนั้นอ่านแต่ละบรรทัดของไฟล์ไปเรื่อย ๆ<br>
<pre><code>foreach $buf (&lt;FILE&gt;) {<br>
</code></pre>
แล้วกำจัด space และ tab แทนที่ด้วยเซมิโคล่อน (;) โดยใช้ regular expression<br>
<pre><code>  $buf =~ s/[ \t]+/;/g ;<br>
</code></pre>
จากนั้นแตกสตริง buf ให้เป็น array เพื่อเตรียมเลือกข้อมูลที่ต้องการในคอลัมน์ 1, 4, และ 5 เก็บไว้ในตัวแปร @col ในที่นี้ $x จะนับจำนวนสมาชิก<br>
<pre><code>  $x=@col=split(/;/,$buf);<br>
</code></pre>
พิมพ์ HTML โค้ดสำหรับ Google Chart<br>
<pre><code>  print "          ['$col[0]',   $col[4],       $col[5]],\n";<br>
</code></pre>

<h2>รันสคริปต์ gchart-disk.pl</h2>
รันสคริปต์ gchart-disk.pl ที่สร้างขึ้นแล้ส่งผลลัพธ์ไปที่ tg.html ด้วยคำสั่ง<br>
<pre><code>perl gchart-disk.pl &gt; tg.html<br>
</code></pre>
ทดลองเปิดดูกราฟที่สร้างขึ้นใน <a href='http://10.134.64.45/prachya/perl/tg.html'>tg.html</a>
และหากต้องการให้อัพเดทตามห้วงเวลาก็สามารถนำสคริปต์นี้ตามห้วงเวลาที่กำหนด เช่นทุก 5 นาที โดยใช้ crontab<br>
<br>
<img width='400' src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/Figures/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%A0%E0%B8%B2%E0%B8%9E3.png'>

<h2>เปรียบเทียบการแก้ไขโค้ด</h2>
<pre><code># gchart-disk.pl                                                # gchart-disk.pl<br>
#&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "ht   #&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "ht<br>
print "&lt;html xmlns=\"http://www.w3.org/1999/xhtml\"&gt;\n";        print "&lt;html xmlns=\"http://www.w3.org/1999/xhtml\"&gt;\n";<br>
print "  &lt;head&gt;\n";                                             print "  &lt;head&gt;\n";<br>
print "    &lt;meta http-equiv=\"content-type\" content=\"text/h   print "    &lt;meta http-equiv=\"content-type\" content=\"text/h<br>
print "    &lt;title&gt;\n";                                          print "    &lt;title&gt;\n";<br>
print "      SAR Disk Stats\n";                               | print "      Google Visualization API Sample\n";<br>
print "    &lt;/title&gt;\n";                                         print "    &lt;/title&gt;\n";<br>
print "    &lt;script type=\"text/javascript\" src=\"http://www.   print "    &lt;script type=\"text/javascript\" src=\"http://www.<br>
print "    &lt;script type=\"text/javascript\"&gt;\n";                print "    &lt;script type=\"text/javascript\"&gt;\n";<br>
print "      google.load('visualization', '1', {packages: ['c   print "      google.load('visualization', '1', {packages: ['c<br>
print "    &lt;/script&gt;\n";                                        print "    &lt;/script&gt;\n";<br>
print "    &lt;script type=\"text/javascript\"&gt;\n";                print "    &lt;script type=\"text/javascript\"&gt;\n";<br>
print "      function drawVisualization() {\n";                 print "      function drawVisualization() {\n";<br>
print "        // Create and populate the data table.\n";       print "        // Create and populate the data table.\n";<br>
print "        var data = google.visualization.arrayToDataTab   print "        var data = google.visualization.arrayToDataTab<br>
print "          ['x', 'wr/s', 'wrKB/s'],\n";                 &lt;<br>
# now getting numerical data using sar and store in disk.dat    # now getting numerical data using sar and store in disk.dat<br>
system("sar -d |grep 'disk008'&gt; tmp.dat");                    | exec("sar -d |grep disk008 |awk '{print $1 i\"  \" $5 \"  \"<br>
open FILE, "&lt;", "tmp.dat" or die $!;                          | print "          ['x', 'Cats', 'Blanket 1', 'Blanket 2'],\n";<br>
foreach $buf (&lt;FILE&gt;) {                                       | print "          ['A',   1,       1,           0.5],\n";<br>
#print $lines[0],"\n";                                        | print "          ['B',   2,       0.5,         1],\n";<br>
  $buf =~ s/[ \t]+/;/g ;                                      | print "          ['C',   4,       1,           0.5],\n";<br>
#  print $buf,"\n";                                           | print "          ['D',   8,       0.5,         1],\n";<br>
  $x=@col=split(/;/,$buf);                                    | print "          ['E',   7,       1,           0.5],\n";<br>
#print $x,"\n";                                               | print "          ['F',   7,       0.5,         1],\n";<br>
  print "          ['$col[0]',   $col[4],       $col[5]],\n"; | print "          ['G',   8,       1,           0.5],\n";<br>
}                                                             | print "          ['H',   4,       0.5,         1],\n";<br>
                                                              &gt; print "          ['I',   2,       1,           0.5],\n";<br>
                                                              &gt; print "          ['J',   3.5,     0.5,         1],\n";<br>
                                                              &gt; print "          ['K',   3,       1,           0.5],\n";<br>
                                                              &gt; print "          ['L',   3.5,     0.5,         1],\n";<br>
                                                              &gt; print "          ['M',   1,       1,           0.5],\n";<br>
                                                              &gt; print "          ['N',   1,       0.5,         1]\n";<br>
print "        ]);\n";                                          print "        ]);\n";<br>
print "      \n";                                               print "      \n";<br>
print "        // Create and draw the visualization.\n";        print "        // Create and draw the visualization.\n";<br>
print "        new google.visualization.LineChart(document.ge   print "        new google.visualization.LineChart(document.ge<br>
print "            draw(data, {curveType: \"function\",\n";     print "            draw(data, {curveType: \"function\",\n";<br>
print "                        width: 500, height: 400,\n";     print "                        width: 500, height: 400,\n";<br>
print "                        vAxis: {maxValue: 10}}\n";       print "                        vAxis: {maxValue: 10}}\n";<br>
print "                );\n";                                   print "                );\n";<br>
print "      }\n";                                              print "      }\n";<br>
print "      \n";                                               print "      \n";<br>
print "\n";                                                     print "\n";<br>
print "      google.setOnLoadCallback(drawVisualization);\n";   print "      google.setOnLoadCallback(drawVisualization);\n";<br>
print "    &lt;/script&gt;\n";                                        print "    &lt;/script&gt;\n";<br>
print "  &lt;/head&gt;\n";                                            print "  &lt;/head&gt;\n";<br>
print "  &lt;body style=\"font-family: Arial;border: 0 none;\"&gt;\   print "  &lt;body style=\"font-family: Arial;border: 0 none;\"&gt;\<br>
print "    &lt;div id=\"visualization\" style=\"width: 500px; he   print "    &lt;div id=\"visualization\" style=\"width: 500px; he<br>
print "  &lt;/body&gt;\n";                                            print "  &lt;/body&gt;\n";<br>
print "&lt;/html&gt;\n";                                              print "&lt;/html&gt;\n";<br>
</code></pre>

<h2>References</h2>
<ul><li>sar man page, <a href='http://zux221-127-001.adsl.green.ch/cgi-bin/man/man2html?atsar+1'>http://zux221-127-001.adsl.green.ch/cgi-bin/man/man2html?atsar+1</a>
</li><li><a href='http://theengguy.blogspot.com/2012/08/updated-sar2cvs-with-google-charts.html'>http://theengguy.blogspot.com/2012/08/updated-sar2cvs-with-google-charts.html</a></li></ul>

<h1>References</h1>
<ol><li>Wiil-Hans Steeb, et al, <i>Linux, Shell Programming and Perl</i> <a href='http://issc.uj.ac.za/downloads/linux.pdf'>PDF</a>
</li><li>systat Tutorial, <a href='http://sebastien.godard.pagesperso-orange.fr/tutorial.html'>http://sebastien.godard.pagesperso-orange.fr/tutorial.html</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='perlProgApp2.md'>การประยุกต์ใช้ Perl 2</a></li></ol>

<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/perlProgApp'>Edit</a>