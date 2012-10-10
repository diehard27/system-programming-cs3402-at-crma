#!/bin/bash
echo 1 > 1_temp
echo 2 > 2_temp
echo 3 > 3_temp
for i in 1 2 3
do
  cat ${i}_temp
done
