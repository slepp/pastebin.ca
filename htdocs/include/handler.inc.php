<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

### All the language handlers

require_once("highlight.inc.php");
require_once("geshi.php");

function handle_geshi($content, $language) {
    $g = new GeSHi($content, $language);
    $g->enable_classes();
    $g->set_header_type(GESHI_HEADER_DIV);
    $g->enable_line_numbers(GESHI_FANCY_LINE_NUMBERS, 5);
    #$g->set_overall_style('color:black');
    $g->set_overall_id('source');
    $g->set_code_style('color:black;',"'Courier New', Courier, monospace");
    $g->set_line_style('color:#838383;','',true);
    return $g->parse_code();
}
function escape_it($content) {
    $content = htmlspecialchars($content);
    $content = preg_replace('/\|\|\|\|\|\|\/span\|\|\|\|\|\|/', '</span>', $content);
    $content = preg_replace('/\|\|\|\|\|\|([^\|]+)\|\|\|\|\|\|/', '<span class="\1">', $content);
    return $content;
}
function raw_handler($content) {
//    return htmlentities($content);
    return handle_geshi($content, "raw");
}
function ast_handler($content) {
    return handle_geshi($content, "asterisk-exten");
}
function diff_handler($content) {
    return handle_geshi($content, "diff");
}
function c_handler($content) {
    return handle_geshi($content, "c");
}
function cpp_handler($content) {
    return handle_geshi($content, "cpp");
}
function php_handler($content) {
    return handle_geshi($content, "php");
}
function perl_handler($content) {
    return handle_geshi($content, "perl");
}
function java_handler($content) {
    return handle_geshi($content, "java");
}
function vb_handler($content) {
    return handle_geshi($content, "vb");
}
function csharp_handler($content) {
    return handle_geshi($content, "csharp");
}
function ruby_handler($content) {
    return handle_geshi($content, "ruby");
    //return '<div id="source"><pre>'.escape_it(syntax_highlight($content, "Ruby")).'</pre></div>';
}
function python_handler($content) {
    return handle_geshi($content, "python");
}
function pascal_handler($content) {
    return handle_geshi($content, "pascal");
}
function mirc_handler($content) {
    return handle_geshi($content, "mirc");
    //return '<div id="source"><pre>'.escape_it(syntax_highlight($content, "mIRC")).'</pre></div>';
}
function pli_handler($content) {
    return '<div id="source"><pre>'.escape_it(syntax_highlight($content, "PL/I")).'</pre></div>';
}
function scheme_handler($content) {
    return handle_geshi($content, "scheme");
    //return '<div id="source"><pre>'.escape_it(syntax_highlight($content, "Scheme")).'</pre></div>';
}
function xml_handler($content) {
    return handle_geshi($content, "xml");
}
function sql_handler($content) {
    return handle_geshi($content, "sql");
}
function actionscript_handler($content) {
    return handle_geshi($content, "actionscript");
}
function ada_handler($content) {
    return handle_geshi($content, "ada");
}
function apache_conf_handler($content) {
    return handle_geshi($content, "apache");
}
function asm_handler($content) {
    return handle_geshi($content, "asm");
}
function asp_handler($content) {
    return handle_geshi($content, "asp");
}
function bash_handler($content) {
    return handle_geshi($content, "bash");
}
function css_handler($content) {
            return handle_geshi($content,"css");
}
function delphi_handler($content) {
    return handle_geshi($content,"delphi");
}
function html4strict_handler($content) {
    return handle_geshi($content,"html4strict");
}
function javascript_handler($content) {
    return handle_geshi($content,"javascript");
}
function lisp_handler($content) {
    return handle_geshi($content,"lisp");
}
function lua_handler($content) {
    return handle_geshi($content,"lua");
}
function mpasm_handler($content) {
    return handle_geshi($content,"mpasm");
}
function objc_handler($content) {
    return handle_geshi($content,"objc");
}
function vbnet_handler($content) {
    return handle_geshi($content,"vbnet");
}
function alsa_handler($content) {
    $c = '<div class="c" id="source" style="font-family:monospace;"><ol>';
    $ca = explode("\n",$content);
    $i = 1;
    foreach($ca as $l) {
        if($i % 5 == 0)
          $c .= '<li class="li2">';
        else
          $c .= '<li class="li1">';
        if(empty($l))
          $l = '&nbsp;';
/*        else if(preg_match(',^(ALSA Inform|Linux Dis|Kernel Info|ALSA Vers|Loaded ALSA|Soundscards rec|PCI Soundcards inst|Advanced info|HDA-Intel|ALSA Device),', $l))
          $l = '<span class="de1" style="color:brown;font-weight:bold;font-family:monospace">'.preg_replace('/  /', ' &nbsp;', htmlspecialchars($l)).'</span>';*/
        else if(substr($l, 0, 2) == '!!')
          $l = '<span class="de1" style="color:brown;font-weight:bold;font-family:monospace">'.preg_replace('/  /', ' &nbsp;', htmlspecialchars(substr($l,2))).'</span>';
        else if(preg_match(",^(Simple mixer control ')([^']+)('.*),", $l, $matches))
          $l = '<span class="de1">'.htmlspecialchars($matches[1]).'<span class="st0">'.preg_replace('/  /', ' &nbsp;', htmlspecialchars($matches[2])).'</span>'.htmlspecialchars($matches[3]).'</span>';
/*        else if(preg_match(',^([a-zA-Z0-9 ]+): (.*),',$l,$matches))
          $l = '<span class="de1"><span class="st0">'.htmlspecialchars($matches[1]).':</span> '.preg_replace('/  /', ' &nbsp;', htmlspecialchars($matches[2])).'</span>'; */
        else
          $l = '<span class="de1">'.preg_replace('/  /', ' &nbsp;', htmlspecialchars($l)).'</span>';
        $l = preg_replace('/([ \(\[>])(([0-9]|-[0-9])[0-9.-]*([%]))([ \)\]<])/', '\1<span class="nu0">\2</span>\5', $l);
        $l = preg_replace("/\t/", "&nbsp; &nbsp; &nbsp; &nbsp ", $l);
        $c .= $l.'</li>';
    }
    $c .= '</div>';
    return $c;
}
?>
