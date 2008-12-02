<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require("include/global.inc.php");
$_SESSION = array();

if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time()-42000, '/');
}

#// Finally, destroy the session.
session_destroy();

header("Location: http://".$_SERVER["SERVER_NAME"]);
?>
