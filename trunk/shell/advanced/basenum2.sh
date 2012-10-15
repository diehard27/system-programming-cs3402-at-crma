#!/bin/bash
#written by pyavinci@gmail.com (P. Chalermwat)
let i=1
#create input hex sequence
h=$(while [ $i -le "20" ]; do
  printf "%X " $i
  let i++
  done)
echo INPUT=$h
echo "Converting to decimal..."
printf "HEX\t DEC\t BIN\n"
for i in $h; do
  b=$(echo "obase=2; ibase=16; $i" | bc)
  printf "%s\t %s\t %s\n" $i $((16#$i)) $b
done
