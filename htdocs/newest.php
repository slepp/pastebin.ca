<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require("include/global.inc.php");

$newest = PasteUtil::mostRecent();

$t = new Template();
header("Location: ".$t->_tpl_vars['url']['root']."/$newest");
Template::Simple("Going to Newest Paste", "You are now being redirected to the newest paste, ".$t->_tpl_vars['url']['root']."/$newest");
?>
