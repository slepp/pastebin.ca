<?php
require("include/global.inc.php");
$_SESSION = array();

if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time()-42000, '/');
}

#// Finally, destroy the session.
session_destroy();

header("Location: http://".$_SERVER["SERVER_NAME"]);
?>
