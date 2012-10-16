#!/bin/bash
#written by pyavinci@gmail.com
a=(0 1 2 3 4 5 6 7 8 9 A B C D E F)
echo ${a[*]}
echo ${a[0]} ... ${a[15]}
i=0
until [ $i -gt 15 ]; do
  echo $i - ${a[$i]}
  let i++
done
a[16]=X
echo ${a[*]}
