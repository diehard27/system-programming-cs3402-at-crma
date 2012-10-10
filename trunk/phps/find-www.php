<?php
$output = shell_exec('find /var/www |sort');
echo "<pre>$output</pre>";
?>
