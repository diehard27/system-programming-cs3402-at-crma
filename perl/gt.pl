print "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n";
print "  <head>\n";
print "    <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/>\n";
print "    <title>\n";
print "      Google Visualization API Sample\n";
print "    </title>\n";
print "    <script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"></script>\n";
print "    <script type=\"text/javascript\">\n";
print "      google.load('visualization', '1', {packages: ['corechart']});\n";
print "    </script>\n";
print "    <script type=\"text/javascript\">\n";
print "      function drawVisualization() {\n";
print "        // Some raw data (not necessarily accurate)\n";
print "        var data = google.visualization.arrayToDataTable([\n";
print "          ['Time',   'Used', 'free', 'buffer'],\n";
system("sar -r > tmp.dat");
open FILE, "<", "tmp.dat" or die $!;
$i=0;
foreach $buf (<FILE>) {
  $buf =~s/[ \t\n]+/;/g ;
  if ($i>5) {
#  print $buf,"\n";
    $tstamp=$col[0];  $tstamp=~s/[ \t]+//g;
#    if (!$tstamp) { print "YAKK\n";}
    $x=@col=split(/;/,$buf);
#print $x,"\n";
    $total=$col[1];  $total=~s/M//g;
    $free=$col[2];  $free=~s/M//g;
    $buffer=$col[3]; $buffer=~s/M//g;
    my $used=$total-$free;
#    print "          [$used,   $free,       $buffer],\n";
    if ($total!=0) {
    print "          [\'$tstamp\', $used,   $free,       $buffer],\n";
    }
  }
  $i++;
}
#print "          ['2004/05',    165,      938,         522,             998,           450],\n";
#print "          ['2005/06',    135,      1120,        599,             1268,          288],\n";
#print "          ['2006/07',    157,      1167,        587,             807,           397],\n";
#print "          ['2007/08',    139,      1110,        615,             968,           215],\n";
#print "          ['2008/09',    136,      691,         629,             1026,          366]\n";
print "        ]);\n";
print "        // Create and draw the visualization.\n";
print "        var ac = new google.visualization.AreaChart(document.getElementById('visualization'));\n";
print "        ac.draw(data, {\n";
print "          title : 'Memory Usage',\n";
print "          isStacked: true,\n";
print "          width: 600,\n";
print "          height: 400,\n";
print "          vAxis: {title: \"MB\"},\n";
print "          hAxis: {title: \"Time\"}\n";
print "        });\n";
print "      }\n";
print "      \n";
print "\n";
print "      google.setOnLoadCallback(drawVisualization);\n";
print "    </script>\n";
print "  </head>\n";
print "  <body style=\"font-family: Arial;border: 0 none;\">\n";
print "    <div id=\"visualization\" style=\"width: 600px; height: 400px;\"></div>\n";
print "  </body>\n";
print "</html>\n";
