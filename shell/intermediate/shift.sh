#/bin/bash
#shitf.sh
echo "-----------|-------------"
echo "Value of \$1: Value of \$*"
echo "-----------|-------------"
while [ "$1" != "" ]; do
  echo "$1        |  $*"
  shift
done
