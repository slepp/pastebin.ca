<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require("template.php");
pageHeader(_("you are now logged in"));
pageSidebar();
makeSection(_("now logged in"));
print '<p>'._('You are now logged in with your account. Thanks!').'</p>';
pageFooter();
?>
