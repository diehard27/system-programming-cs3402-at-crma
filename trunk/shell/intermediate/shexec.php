<html>
<body>
<table width=500><td>
<!-- written by pyavinci@gmail.com -->
<font color=grey>
CS3402: System Programming, pyavinci@gmail.com<br>
<?php 
$output = shell_exec("date");
echo "$output";
?>
</font>
<table width=500 bgcolor=#33CC33><td>
<form action="shexec.php" method="post">
Command: <input type="text" name="cmd" />
Params: <input type="text" name="params" />
<input type="submit" />
</form>
</td></table>
<hr>
<table width=500><tr>
<td width=200><font color=grey>Shell command executed :</fon></td>
<td bgcolor=#FF9900 widht=20></td> 
<td bgcolor=#FFCC00><b> 
<?php echo "  "; ?>
<?php echo $_POST["cmd"]; ?>
<?php echo $_POST["params"]; ?> 
</b></td>
</tr></table>
<hr>
<table width=500 bgcolor=#CCFFCC><td>
<?php
$lcmd =  $_POST["cmd"]." ".$_POST["params"];
$output = shell_exec($lcmd);
echo "<pre>$output</pre>";
?>
</td></table>
</td></table>
</body>
</html>
