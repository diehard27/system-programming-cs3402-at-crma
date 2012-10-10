#!/bin/bash
#usage: ./sine.sh <degrees>
#written by pyavinci@gmail.com
if [ -z $1 ]; then
  echo -e \\a
  echo Usage: $0 \<degrees\>
  echo Example: $0 90
  echo will give answer about 1.0
  exit 1
fi
# 1 degree = 0.0174532925 radians
r=$(echo "$1*0.0174532925"|bc -l)
echo $r radiants
x=$(echo "s($r)" |bc -l)
echo Sine\($1 degrees\)=$x
