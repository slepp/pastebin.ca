<pre>
<?php
require_once("include/global.inc.php");
var_dump($_SESSION);
var_dump(new Account($_SESSION['user']['id']));
?>
</pre>
