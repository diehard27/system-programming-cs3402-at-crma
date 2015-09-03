[กลับไปหน้าหลัก](CourseSchedule2555_2.md)-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: [ทบทวนก่อนสอบระหว่างภาค](midtermReview.md)
<table width='500'>
<td>
<br>
<h1>Base Numbers</h1>
ตัวอย่างต่อไปนี้ไฟล์ <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/shell/advanced/basenum.sh'>basenum.sh</a> แสดงให้เห็นการประยุกต์ใช้คำสั่ง printf ซึ่งสามารถควบคุมรูปแบบของผลลัพธ์ที่เกี่ยวข้องกับเลขฐานสิบหก สิบ และแปดได้ ส่วนเลขฐานสองนั้นเราประยุกต์ใช้การติดต่อกับโปรแกรม bc แทน<br>
<pre><code>     1  #!/bin/bash<br>
     2  #written by pyavinci@gmail.com (P. Chalermwat)<br>
     3  let i=1<br>
     4    printf "DEC\t OCT\t HEX\t BIN\n"<br>
     5  while [ $i -le "20" ]; do<br>
     6    b=$(echo "obase=2; ibase=10; $i" | bc)<br>
     7    printf "%d\t %o\t %X\t %s\n" $i $i $i $b<br>
     8    let i++<br>
     9  done<br>
</code></pre>

<h2>อธิบายโปรแกรม</h2>
<pre><code>     4    printf "DEC\t OCT\t HEX\t BIN\n"<br>
</code></pre>
พิมพ์ข้อความหัวตารางด้วยคำสั่ง printf โดยใช้ tab (\t) ช่วยจัดการฟอร์แม็ต<br>
<pre><code>     5  while [ $i -le "20" ]; do<br>
</code></pre>
สร้าง loop เพื่อให้ i มีค่าตั้งแต่ 1-20 ตัวทดสอบ -le หมายถึง less than or equal<br>
<pre><code>     6    b=$(echo "obase=2; ibase=10; $i" | bc)<br>
</code></pre>
แปลง $i ซึ่งเป็นเลขฐานสิบ ให้เป็นเลขฐานสองด้วยโปรแกรม bc โดยกำหนด obase=2 (ฐานของเลขเอาท์พุท) และ ibase=10 (ฐานของเลขอินพุท) แล้วส่งค่า $i เข้าไปที่ bc ด้วยการทำ pipe (เครื่องหมาย |)<br>
<pre><code>     7    printf "%d\t %o\t %X\t %s\n" $i $i $i $b<br>
</code></pre>
พิมพ์ผลลัพธ์ของการแปลงสำหรับแต่ละค่า $i ด้วยคำสั่ง printf โดยที่ %d หมายถึงให้ฟอร์แม็ตเป็นเลข decimal ฐานสิบ, %o (ตัวอักษรโอ) หมายถึงเลข octal ฐานแปด, %X หมายถึงเลขฐานสิบหกโดยให้พิมพ์เป็นอักษรตัวใหญ่ ถ้าใช้ x ตัวเล็กก็จะพิมพ์ออกมาเป็นอักษร a-f ตัวเล็ก, ในส่วนของเลขไบนารี่เนื่องจากเราแปลงค่าให้เป็น 0-1 ด้วยคำสั่ง bc มาแล้ว จึงใช้ฟอร์แม็ต %s เพื่อการแสดงผล แล้วขึ้นบรรทัดใหม่ด้วย \n<br>
<br>
เมื่อรันโปรแกรมด้วยคำสั่ง<br>
<pre><code>prachya@pcubusrv104&gt; ./basenum.sh<br>
</code></pre>
จะได้ผลลัพธ์ดังนี้<br>
<pre><code>DEC      OCT     HEX     BIN<br>
1        1       1       1<br>
2        2       2       10<br>
3        3       3       11<br>
4        4       4       100<br>
5        5       5       101<br>
6        6       6       110<br>
7        7       7       111<br>
8        10      8       1000<br>
9        11      9       1001<br>
10       12      A       1010<br>
11       13      B       1011<br>
12       14      C       1100<br>
13       15      D       1101<br>
14       16      E       1110<br>
15       17      F       1111<br>
16       20      10      10000<br>
17       21      11      10001<br>
18       22      12      10010<br>
19       23      13      10011<br>
20       24      14      10100<br>
</code></pre>


อย่างไรก็ตามคำสั่ง printf ไม่สามารถแปลงเลข hex ให้กลับมาเป็นเลขฐาน 10 หรือฐาน 2 ได้ เราต้องการใช้ฟอร์แม็ตแบบพิเศษคือ <code>$((16#$i))</code> ในบรรทัดที่ 14 เพื่อแปลงเลขฐาน 16 ให้กลับมาเป็นฐาน 10 ดังแสดงตัวอย่างในไฟล์<br>
<a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/shell/advanced/basenum2.sh'>basenum2.sh</a> ต่อไปนี้<br>
<br>
<pre><code>     1  #!/bin/bash<br>
     2  #written by pyavinci@gmail.com (P. Chalermwat)<br>
     3  let i=1<br>
     4  #create input hex sequence<br>
     5  h=$(while [ $i -le "20" ]; do<br>
     6    printf "%X " $i<br>
     7    let i++<br>
     8    done)<br>
     9  echo INPUT=$h<br>
    10  echo "Converting to decimal..."<br>
    11  printf "HEX\t DEC\t BIN\n"<br>
    12  for i in $h; do<br>
    13    b=$(echo "obase=2; ibase=16; $i" | bc)<br>
    14    printf "%s\t %s\t %s\n" $i $((16#$i)) $b<br>
    15  done<br>
</code></pre>

เมื่อรันคำสั่งต่อไปนี้<br>
<pre><code>prachya@pcubusrv104&gt; ./basenum2.sh<br>
</code></pre>
จะได้ผลลัพธ์ตามนี้<br>
<pre><code>INPUT=1 2 3 4 5 6 7 8 9 A B C D E F 10 11 12 13 14<br>
Converting to decimal...<br>
HEX      DEC     BIN<br>
1        1       1<br>
2        2       10<br>
3        3       11<br>
4        4       100<br>
5        5       101<br>
6        6       110<br>
7        7       111<br>
8        8       1000<br>
9        9       1001<br>
A        10      1010<br>
B        11      1011<br>
C        12      1100<br>
D        13      1101<br>
E        14      1110<br>
F        15      1111<br>
10       16      10000<br>
11       17      10001<br>
12       18      10010<br>
13       19      10011<br>
14       20      10100<br>
</code></pre>
<h1>Trap Command</h1>
คำสั่ง trap ใช้สำหรับกำหนดการกระทำคำสั่งใด ๆ เมื่อได้รับสัญญาณ (<a href='http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_01.html'>signal</a>) (ดูรายละเอียดด้วยการรันคำสั่ง man -s 7 signal บนเครื่องแม่ข่ายของวิชา) การใช้งานทั่วไปจะใช้ในการให้สคริปต์ทำงานเมื่อได้รับการ <a href='interruptExplain.md'>interrupt</a> จากสัญญาณใด รูปแบบของคำสั่ง trap คือ<br>
<pre><code>trap command signal<br>
</code></pre>
สัญญาณ (signal) ที่เป็นที่ทราบ/ใช้กันมาก<br>
<table><thead><th>Signal(หมายเลข )</th><th> คำอธิบาย</th></thead><tbody>
<tr><td>HUP (1)         </td><td>Hang up; ใช้ส่งไปให้ terminal นั้นเป็น offline หรือผู้ใช้ล็อกเอาท์ออกจากระบบ</td></tr>
<tr><td>INT (2)         </td><td>Interrupt; ส่งด้วยการกดคีย์ <code>&lt;Ctrl-C&gt;</code></td></tr>
<tr><td>QUIT(3)         </td><td>Quit; ส่งสัญญาณด้วยการกดคีย์ <code>&lt;Ctrl-\&gt;</code></td></tr>
<tr><td>ABRT(6)         </td><td>Abort; ส่งเมื่อการปัญหาในการรันโปรแกรม</td></tr>
<tr><td>ALRM(14)        </td><td> Alarm; ส่งเพื่อสื่อสารเกี่ยวกับการแจ้งเตือนการหมดเวลา (time-outs)</td></tr>
<tr><td>TERM(15)        </td><td> Terminate; ส่งเมื่อระบบจะหยุดการทำงาน (shutting down)</td></tr></tbody></table>

<h2>ตัวอย่าง</h2>
ไฟล์ซอร์สโค้ดสามารถดูได้ที่ <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/shell/advanced/trap.sh'>trap.sh</a>
<pre><code>     1  #! /bin/bash<br>
     2  # from Steeb WH, Linux, Shell Programming and Perl<br>
     3  trap 'rm -f /tmp/my_tmp_file_$$' INT<br>
     4  echo creating file /tmp/my_tmp_file_$$<br>
     5  date &gt; /tmp/my_tmp_file_$$<br>
     6  echo "press interrupt (CRTL-C) to interrupt ... "<br>
     7  while [ -f /tmp/my_tmp_file_$$ ]; do<br>
     8    echo File exists<br>
     9    sleep 1<br>
    10  done<br>
    11  echo The file no longer exists<br>
    12  trap - INT<br>
    13  echo creating file /tmp/my_tmp_file_$$<br>
    14  date &gt; /tmp/my_tmp_file_$$<br>
    15  echo "press interrupt (CRTL-C) to interrupt ... "<br>
    16  while [ -f /tmp/my_tmp_file_$$ ]; do<br>
    17    echo File exists<br>
    18    sleep 1<br>
    19  done<br>
    20  echo We never get here<br>
    21  exit 0<br>
</code></pre>

รันเชลล์นี้ด้วยคำสั่ง<br>
<pre><code>prachya@pcubusrv104&gt; ./trap.sh<br>
</code></pre>
จะได้ผลลัพธ์ดังนี้ ให้กด Ctrl-C เพื่อส่งสัญญาณ INT (2) ไปยังเชลล์เมื่อเชลล์ได้รับสัญญาณ ก็จะทำคำสั่งที่กำหนดไว้ใน trap ในบรรทัดที่ 3 คือ <code>rm -f /tmp/my_tmp_file_$$</code>
<pre><code>creating file /tmp/my_tmp_file_16658<br>
press interrupt (CRTL-C) to interrupt ...<br>
File exists<br>
File exists<br>
File exists<br>
^CThe file no longer exists<br>
creating file /tmp/my_tmp_file_16658<br>
press interrupt (CRTL-C) to interrupt ...<br>
File exists<br>
File exists<br>
File exists<br>
File exists<br>
File exists<br>
^C<br>
</code></pre>

<h1>Google Search</h1>

ไฟล์ต้นฉบับสามารถดูได้ที่ <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/shell/advanced/google.sh'>google.sh</a>
<pre><code>     1  #!/bin/bash<br>
     2  # http://stackoverflow.com/questions/5506561/getting-the-urls-for-the-first-google-search-results-in-a-shell-script<br>
     3  clear<br>
     4  echo ""<br>
     5  echo ".=========================================================."<br>
     6  echo "|                                                         |"<br>
     7  echo "|  COMMAND LINE GOOGLE SEARCH                             |"<br>
     8  echo "|  ---------------------------------------------------    |"<br>
     9  echo "|                                                         |"<br>
    10  echo "|  Version: 1.0                                           |"<br>
    11  echo "|  Developed by: Rishi Narang                             |"<br>
    12  echo "|  Blog: www.wtfuzz.com                                   |"<br>
    13  echo "|                                                         |"<br>
    14  echo "|  Usage: ./gocmd.sh &lt;search strings&gt;                     |"<br>
    15  echo "|  Example: ./gocmd.sh example and test                   |"<br>
    16  echo "|                                                         |"<br>
    17  echo ".=========================================================."<br>
    18  echo ""<br>
    19<br>
    20  if [ -z $1 ]<br>
    21  then<br>
    22   echo "ERROR: No search string supplied."<br>
    23   echo "USAGE: ./gocmd.sh &lt;search srting&gt;"<br>
    24   echo ""<br>
    25   echo -n "Anyways for now, supply the search string here: "<br>
    26   read SEARCH<br>
    27  else<br>
    28   SEARCH=$@<br>
    29  fi<br>
    30<br>
    31  URL="http://google.com/search?hl=en&amp;safe=off&amp;q="<br>
    32  STRING=`echo $SEARCH | sed 's/ /%20/g'`<br>
    33  URI="$URL%22$STRING%22"<br>
    34<br>
    35  lynx -dump $URI &gt; gone.tmp<br>
    36  sed 's/http/\^http/g' gone.tmp | tr -s "^" "\n" | grep http| sed 's/\ .*//g' &gt; gtwo.tmp<br>
    37  rm gone.tmp<br>
    38  sed '/google.com/d' gtwo.tmp &gt; urls<br>
    39  rm gtwo.tmp<br>
    40<br>
    41  echo "SUCCESS: Extracted `wc -l urls` and listed them in '`pwd`/urls' file for reference."<br>
    42  echo ""<br>
    43  cat urls<br>
    44  echo "<br>
</code></pre>

<h1>GCD: Greatest Common Divisor</h1>
การหาตัวหารร่วมมาก (ห.ร.ม.) หรือ GCD สามารถคำนวณได้ด้วยการใช้เชลล์สคริปต์ตามตัวอย่างในไฟล์ <a href='https://code.google.com/p/system-programming-cs3402-at-crma/source/browse/trunk/shell/advanced/gcd.sh'>gcd.sh</a> ด้านล่าง<br>
<pre><code>#!/bin/bash<br>
# gcd.sh: greatest common divisor<br>
#         Uses Euclid's algorithm<br>
<br>
#  The "greatest common divisor" (gcd) of two integers<br>
#+ is the largest integer that will divide both, leaving no remainder.<br>
<br>
#  Euclid's algorithm uses successive division.<br>
#    In each pass,<br>
#+      dividend &lt;---  divisor<br>
#+      divisor  &lt;---  remainder<br>
#+   until remainder = 0.<br>
#    The gcd = dividend, on the final pass.<br>
#<br>
#  For an excellent discussion of Euclid's algorithm, see<br>
#+ Jim Loy's site, http://www.jimloy.com/number/euclids.htm.<br>
<br>
<br>
# ------------------------------------------------------<br>
# Argument check<br>
ARGS=2<br>
E_BADARGS=85<br>
<br>
if [ $# -ne "$ARGS" ]<br>
then<br>
  echo "Usage: `basename $0` first-number second-number"<br>
  exit $E_BADARGS<br>
fi<br>
# ------------------------------------------------------<br>
<br>
gcd ()<br>
{<br>
<br>
  dividend=$1             #  Arbitrary assignment.<br>
  divisor=$2              #! It doesn't matter which of the two is larger.<br>
                          #  Why not?<br>
<br>
  remainder=1             #  If an uninitialized variable is used inside<br>
                          #+ test brackets, an error message results.<br>
<br>
  until [ "$remainder" -eq 0 ]<br>
  do    #  ^^^^^^^^^^  Must be previously initialized!<br>
    let "remainder = $dividend % $divisor"<br>
    dividend=$divisor     # Now repeat with 2 smallest numbers.<br>
    divisor=$remainder<br>
  done                    # Euclid's algorithm<br>
<br>
}                         # Last $dividend is the gcd.<br>
<br>
<br>
gcd $1 $2<br>
<br>
echo; echo "GCD of $1 and $2 = $dividend"; echo<br>
<br>
<br>
# Exercises :<br>
# ---------<br>
# 1) Check command-line arguments to make sure they are integers,<br>
#+   and exit the script with an appropriate error message if not.<br>
# 2) Rewrite the gcd () function to use local variables.<br>
<br>
exit 0<br>
</code></pre>


<h1>References</h1>
<ul><li>Mendel Cooper, <i>Advanced Bash-Scripting Guide: An in-depth exploration of the art of shell scripting</i>, <a href='http://tldp.org/LDP/abs/html/'>http://tldp.org/LDP/abs/html/</a>
</li><li>Machtelt Garrels, <i>Bash Guide for Beginners</i> , <a href='http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html'>http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html</a>