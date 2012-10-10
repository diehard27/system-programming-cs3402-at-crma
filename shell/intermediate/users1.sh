#!/bin/bash
#LOGIN:PWD:UID:GID:COMMENT:HOME:SHELL
#c30chaiya:x:5530:5500::/home/c30chaiya:/bin/bash
j=1
echo "<html>"
echo "NO:LOGIN:PWD:UID:GID:COMMENT:HOME:SHELL<br>"
for i in $(cat /etc/passwd); do
  echo "$j: $i <br>"
  let j++
done
echo "</html>"
