#!/bin/bash
mo=(January February March April May June July August September October November December)
i=0
#while [ $i -lt 12 ]; do
#  echo $i - ${mo[$((i++))]}
#done
echo $1 ${mo[$(($1-1))]}
