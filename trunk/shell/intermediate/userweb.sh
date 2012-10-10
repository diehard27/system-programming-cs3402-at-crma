#!/bin/bash
#written by pyavinci@gmail.com
echo "<html><body>"
echo "<title>CS3402: System Programming</title>"
echo "<h1><a href='https://code.google.com/p/system-programming-cs3402-at-crma/'>CS3402</a>: System Programming</h1>"
echo "<a name='top'></a>"
echo "<table width=500><td>"
echo "<table widht=500><tr><td>"
echo "<img src='https://dl.dropbox.com/u/37142998/2012%20System%20Programming/References/Books/linux%20system%20programming%20-%20cover.png' width=150>"
echo "</td><td>"
u="$(ls /home | grep c[0-9]) phnarong prachya"
for i in $u ; do
  echo "<a href=#$i>$i</a>"
done
echo "</td>"
echo "</tr></table>"
echo "<hr>"
for i in $u ; do
  echo "<a name="$i"><h2>$i</h2></a>"
  echo "[<a href=/$i>Dir</a>],[<a href=#top>Top</a>], "
  lc=$(last $i|wc -l)
  let lc=lc-2
  echo "Last Log: login $lc times<br>"
  x="&#9775"
  # http://natural-innovations.com/wa/doc-charset.html
  bar=""
  while [ $lc -gt "0" ]; do
    bar=$bar$x
    let lc--
  done
  echo "Frequency: $bar<br>"
  echo "$(last $i|head -1)<br>"
  echo "<hr>"
done
echo "</td></table>"
echo "</body></html>"
