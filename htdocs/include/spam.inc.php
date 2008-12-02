<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

function checkSpam($paste) {
    if(!is_object($paste))
      return $paste;
    
    if(preg_match(',(\.carkity\.net|\.pkpar\.net|\.tooret\.com|top-oem-soft\.info/|\.(sjuubb|piiwoh)\.info|humano\.ya\.com/adenk|advertisersworld\.com/|hydrocodone-br1.blogspot.com|Hi\,i.m found very Interesting site!Check out!),', $_POST["content"]))
      return 'Spam rule 1';
    
    if(preg_match(',^abby[a-z]{3}$,', $_POST["name"]))
      return 'Spam rule 2';
    
    if(preg_match(',(http://www\.freewebtown\.com/|http://adultfriendfinder\.eqo\.de|http://www\.freewebs\.com/poker|http://chinesefreewebs\.com/|http://www\.volny\.cz/|onazwl\.info|reportti\.com|bankoti\.com|findtopz|TRAMADOL|phentermine|viagra|online gambling|kliktop\.|Peoplefinders\.com|AMY VET44TER|pcu2h9yh.tripod.com|url=.*blogspot.com),i', $_POST["content"]))
      return 'Spam rule 3';
    
    if(preg_match(',(aoswav|nzcgwr|alldatafree)\.info,', $_POST["content"]))
      return 'Spam rule 4';
    
    if((preg_match(',angelfire.com,', $_POST["content"]) && $name == 'ZZzz'))
      return 'Spam rule 5';
    
    if(preg_match(',<color=#FF0000>100% FREE EXCLUSIVE MOVIE GALLERIES</color>,', $_POST["content"]))
      return 'Spam rule 6';
    
    
}
?>
                                                       
    
