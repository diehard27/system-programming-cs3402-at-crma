#!/bin/bash
#written by pyavinci@gmail.com (P. Chalermwat)
let i=1
  printf "DEC\t OCT\t HEX\t BIN\n"
while [ $i -le "20" ]; do
  b=$(echo "ibase=10; obase=2; $i" | bc)
  printf "%d\t %o\t %X\t %s\n" $i $i $i $b
  let i++
done
