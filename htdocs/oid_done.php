<?php
require("template.php");
pageHeader(_("you are now logged in"));
pageSidebar();
makeSection(_("now logged in"));
print '<p>'._('You are now logged in with your account. Thanks!').'</p>';
pageFooter();
?>
