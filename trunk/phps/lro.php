<?php
$output = shell_exec('ls -alR /var/www');
echo "<pre>$output</pre>";
?>
