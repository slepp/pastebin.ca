<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require_once("localsettings.inc.php");
require_once("VirtualBin.class.php");
require_once("Template.class.php");
require_once("Paste.class.php");
require_once("PasteUtil.class.php");
require_once("Account.class.php");
require_once("apikey.inc.php");

session_name('pbck');
session_start();

global $vbin;
$vbin = new VirtualBin($_SERVER["HTTP_HOST"]);
?>
