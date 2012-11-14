limite="5";
load5=$(awk '{print $1}' /proc/loadavg);
echo "http://chart.apis.google.com/chart?chxr=0,0,5&chxt=y&chs=700x240&cht=gm&chds=0," $limite"&chd=t:"$load5"&chl="$load5"&chtt=$(hostname)+load+average"
