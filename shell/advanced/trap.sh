#! /bin/bash
# from Steeb WH, Linux, Shell Programming and Perl
trap 'rm -f /tmp/my_tmp_file_$$' INT
echo creating file /tmp/my_tmp_file_$$
date > /tmp/my_tmp_file_$$
echo "press interrupt (CRTL-C) to interrupt ... "
while [ -f /tmp/my_tmp_file_$$ ]; do
  echo File exists
  sleep 1
done
echo The file no longer exists
trap - INT
echo creating file /tmp/my_tmp_file_$$
date > /tmp/my_tmp_file_$$
echo "press interrupt (CRTL-C) to interrupt ... "
while [ -f /tmp/my_tmp_file_$$ ]; do
  echo File exists
  sleep 1
done
echo We never get here
exit 0
