<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

### Generate CSS for all the GeSHi languages

$langs = array(
'actionscript',
'ada',
'apache',
'asm',
'asp',
'asterisk-conf',
'asterisk-exten',
'bash',
'c',
'c_mac',
'caddcl',
'cadlisp',
'cpp',
'csharp',
'css',
'delphi',
'html4strict',
'java',
'javascript',
'lisp',
'lua',
'mpasm',
'nsis',
'objc',
'oobas',
'oracle8',
'pascal',
'perl',
'php-brief',
'php',
'python',
'qbasic',
'smarty',
'sql',
'vb',
'vbnet',
'visualfoxpro',
'xml');
require_once("geshi.php");
foreach($langs as $v) {
$g = new GeSHi("...", $v);
$g->enable_classes();
$g->enable_line_numbers(GESHI_FANCY_LINE_NUMBERS, 5);
$g->set_header_type(GESHI_HEADER_DIV);
#$g->set_overall_id('source');
#$g->set_overall_class($v);
$g->set_code_style('color:black;',"'Courier New', Courier, monospace");
$g->set_line_style('color:#838383;','',true);
$fd = fopen("css/lang/$v.css","w");
fwrite($fd, $g->get_stylesheet(false));
fclose($fd);
}
?>
