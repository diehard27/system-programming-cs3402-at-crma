# gchart-disk.pl
#<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
print "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n";
print "  <head>\n";
print "    <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/>\n";
print "    <title>\n";
print "      SAR Disk Stats\n";
print "    </title>\n";
print "    <script type=\"text/javascript\" src=\"http://www.google.com/jsapi\"></script>\n";
print "    <script type=\"text/javascript\">\n";
print "      google.load('visualization', '1', {packages: ['corechart']});\n";
print "    </script>\n";
print "    <script type=\"text/javascript\">\n";
print "      function drawVisualization() {\n";
print "        // Create and populate the data table.\n";
print "        var data = google.visualization.arrayToDataTable([\n";
print "          ['x', 'wr/s', 'wrKB/s'],\n";
# now getting numerical data using sar and store in disk.dat
system("sar -d |grep 'disk008'> tmp.dat");
open FILE, "<", "tmp.dat" or die $!;
foreach $buf (<FILE>) {
#print $lines[0],"\n";
  $buf =~ s/[ \t]+/;/g ;
#  print $buf,"\n";
  $x=@col=split(/;/,$buf);
#print $x,"\n";
  print "          ['$col[0]',   $col[4],       $col[5]],\n";
}
print "        ]);\n";
print "      \n";
print "        // Create and draw the visualization.\n";
print "        new google.visualization.LineChart(document.getElementById('visualization')).\n";
print "            draw(data, {curveType: \"function\",\n";
print "                        title:'Disk Performance',\n";
print "                        width: 500, height: 400,\n";
print "                        vAxis: {maxValue: 10}}\n";
print "                );\n";
print "      }\n";
print "      \n";
print "\n";
print "      google.setOnLoadCallback(drawVisualization);\n";
print "    </script>\n";
print "  </head>\n";
print "  <body style=\"font-family: Arial;border: 0 none;\">\n";
print "    <div id=\"visualization\" style=\"width: 500px; height: 400px;\"></div>\n";
print "  </body>\n";
print "</html>\n";
