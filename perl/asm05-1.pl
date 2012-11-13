$w=345;
@netmask=(0,0,0,0);
$netmask[0]=$w%256;
print $netmask[0],"\n";
