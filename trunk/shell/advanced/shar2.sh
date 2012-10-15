#!/bin/sh
#Assume $1=n processes $2=host $3=user $4=password $5=filename
# From WH Steeb, Linux, Shell Programming and Perl, p.178
n="$1"
host="$2"
ftpuser="$3"
ftppass="$4"
filename="$5"
file=$(basename "$filename")
#obtain the filesize
name=$(\
{
  echo user "$ftpuser" \'"$ftppass"\'
  echo bin
  echo size "$filename"
  echo quit
  } | ftp -n "\$host" | \
  {
  while [ "$name" != "$filename" ]
  do
    read name filesize
    echo -n $name $filesize
  done
})

set --set $name
filesize=$2
chunksize=$(($n-1))
chunksize=$(($filesize/$chunksize))
if [ "$chunksize" -eq 0 ]
then
chunksize=$filesize
n=1
fi
i=0
set --#start the ftp processes
while [ $i -lt $n ]
do
  if [ ! -e \$\{file\}.\$i ]
  then
  dd if=/dev/zero of=${file}.$i bs=$chunksize count=$i \
  > /dev/null 2> /dev/null
  fi
  rm -f $file 2> /dev/null
  {
    echo user "$ftpuser" \'"$ftppass"\'
    echo bin
    echo reget $filename ${file}.$i
    echo quit
  } | ftp -nv \$host > /dev/null &
  # a list of process ids for the ftp processes
  set $* $!
  i=$(($i+1))
done

i=0
for j in $*
do
  csize=0
  k=$(($i+1))
  k=$(($k*$chunksize))
  while [ "$csize" -le "$k" ] \&\& [ "$csize" -lt $filesize ]
  do
    set -- $(ls -l ${file}.$i)
    csize=$5
    printf "$csize / $filesize of $file \r"
    sleep 1
  done
  kill $j > /dev/null 2> /dev/null
  dd if=${file}.$i bs=$chunksize skip=$i count=1 >> $file 2> /dev/null
  rmfiles="$rmfiles ${file}.$i"
  i=$(($i+1))
done
echo
#only do this at the end so that an interrupted
# download can continue
rm $rmfiles
