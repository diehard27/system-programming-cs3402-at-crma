#!/bin/bash
echo "Is it morning? Please answer yes or no"
read answ
if [ $answ = "yes" ]; then
        echo "Good morning na ja"
else
        echo "Good afternoon na ka"
fi
exit 0
