#!/bin/bash
subfunc() {
  echo "____.____Started subfunc()"
}
myfunc() {
  echo "____Started myfunc()"
  subfunc
}

## main script body ##
echo Started main script
myfunc
exit 0
