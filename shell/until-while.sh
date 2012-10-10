#!/bin/bash
# Loop using until by pyavinci@gmail.com
# usage: ./until-while.sh <number>
# example: ./until-while.sh 2
x=$1
echo Using until loop...started with x=$x
until [ $x -gt 1 ]
do        
  let x++
  echo $x
done
echo Last value of x=$x
x=$1
echo Now trying while loop...started with x=$x
while [ $x -lt 1 ]
do
  let x++
  echo $x
done
echo Last value of x=$x
exit 0
