#!/bin/bash
let "b16 = 16#$1"
echo "Base16 of $1 in decimal = $b16"    # echo decimal output
echo "Base8 of $1 in binary = $((8#b16)) "    # echo decimal output
