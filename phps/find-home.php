<?php
$output = shell_exec('find /home/c* |sort');
echo "<pre>$output</pre>";
?>
