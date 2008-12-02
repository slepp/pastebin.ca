<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

define('L_WARN', 1);

function debugLog($level, $msg) {
    print time()." ";
    switch($level) {
     case L_WARN: print "WARN: "; break;
     default: print "DEBUG: "; break;
    }
    print $msg."\n";
}
