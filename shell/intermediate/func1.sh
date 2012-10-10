# Append to .bashrc or call it from there.
# Save some typing at the command line :)
# src: http://www.shelldorado.com/shelltips/intermediate.html
# longlist a directory, by page
# lo [directoryname]
lo () {
      if [ -d "$1" ] ; then
         ls -al "$1" | less
      else
         ls -al $(pwd) | less
      fi
}

# Same as above but recursive
lro () {
      if [ -d "$1" ] ; then
         ls -alR "$1" | less
      else
         ls -alR $(pwd) | less
      fi
}
export -f lo lro
