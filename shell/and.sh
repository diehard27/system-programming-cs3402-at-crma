#!/bin/bash
echo "Please enter 3 numbers"
echo "First number:"
read n1
echo "Second number:"
read n2
echo "Third number:"
read n3

if [ "$n1" = "1" ] && [ "$n2" = "3" ] && [ "$n3" = "5" ]
then
     echo "All numbers are odd"
else 
    echo "Some of them might be even"
fi
exit 0
