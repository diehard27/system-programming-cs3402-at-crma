#!/bin/bash
unset foo
echo foo is null using default value: ${foo:-bar}

foo=fud
echo foo=${foo:-bar}

foo=/usr/bin/X11R6/startx
echo find first slash in $foo from begining: ${foo#*/}
echo find last slash in $foo from beginning: ${foo##*/}

bar=/usr/local/etc/local/networks
echo find first local in $bar from behind: ${bar%local*}
echo find first local in $bar from behind: ${bar%%local*}
exit 0
