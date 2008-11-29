<?php
define('L_WARN', 1);

function debugLog($level, $msg) {
    print time()." ";
    switch($level) {
     case L_WARN: print "WARN: "; break;
     default: print "DEBUG: "; break;
    }
    print $msg."\n";
}
