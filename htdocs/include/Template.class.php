<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require_once("localsettings.inc.php");
require_once(SMARTY_DIR."/Smarty.class.php");
require_once("PasteUtil.class.php");
require_once("dates.inc.php");
require_once("oid_inline_finish.inc.php");
require_once("gettext.inc.php");

function smarty_block_dynamic($param, $content, &$smarty) {
    return $content;
}

$_postkey = null;
function smarty_function_postkey($param, &$smarty) {
    global $_postkey;
    if($_postkey == null) {
        $_postkey = getPostKey(sha1(serialize($_SERVER)));
    }
    return $_postkey[0];
}

function smarty_function_postkeysig($param, &$smarty) {
    global $_postkey;
    if($_postkey == null) {
        $_postkey = getPostKey(sha1(serialize($_SERVER)));
    }    
    return $_postkey[1];
}

class Template extends Smarty {
    private $startTime;
    public $isVirtual;
    public $isPrivate;
    
    function Template($title = null) {        
        global $vbin;
        
        $this->Smarty();
        $this->template_dir = TEMPLATE_DIR;
        $this->compile_dir  = CACHE_DIR."/smarty/compiled/";
        $this->config_dir   = TEMPLATE_DIR."/configs/";
        $this->cache_dir    = CACHE_DIR."/smarty/cached/";
        $this->caching      = false;
        
        $myLang = al2gt(array("en_CA.utf-8",
                              "en_GB.utf-8",
                              "en_US.utf-8",
                              "fr_FR.utf-8",
                              "fr_CA.utf-8",
                              "de_DE.utf-8",
                              "es_ES.utf-8",
                              "ja_JP.utf-8"
                              ), "text/html");
	$myLangShort = substr($myLang, 0, 2);        

        setlocale(LC_MESSAGES, $myLang);
        bindtextdomain("pastebin", "/web/devel.pastebin.ca/locale/");
        textdomain("pastebin");
        bind_textdomain_codeset("pastebin", "utf-8");
        
        if(empty($title)) $title = _("General Pastebin");
        
        $this->vbin =& $vbin;
        
        if(isset($this->vbin->id))
          $this->isVirtual = true;
        else {
            $this->isVirtual = false;
            $this->vbin->setDefaultHost((isset($_SERVER["HTTP_HOST"]) ? $_SERVER["HTTP_HOST"] : $_SERVER["SERVER_NAME"]));
        }
        $this->assign('virtual', $this->isVirtual);
        
        if(isset($this->vbin->private) && $this->vbin->private)
          $this->isPrivate = true;
        else
          $this->isPrivate = false;
        $this->assign('private', $this->isPrivate);
        
        $proto = (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on" ? 'https' : 'http');
        $this->assign('url', array('root' => $proto.'://'.$_SERVER["SERVER_NAME"],
                                   'host' => (isset($_SERVER["HTTP_HOST"]) ? $_SERVER["HTTP_HOST"] : $_SERVER["SERVER_NAME"]),
                                   'css'  => 'http://static.pastebin.ca/css',
                                   'imgs' => 'http://static.pastebin.ca/imgs')
                      );
        $this->assign('ssl', ($proto == 'http'?false:true));
        $this->assign('proto', $proto);
        $this->assign('lang', array('short' => $myLangShort, 'long' => $myLang));
        $this->assign('charset', 'UTF-8');
        $this->assign('recent', PasteUtil::getRecent());
        $this->assign('expiryOptions', array("" => _("Never"),
                                             "5 minutes" => _("5 minutes"),
                                             "10 minutes" => _("10 minutes"),
                                             "15 minutes" => _("15 minutes"),
                                             "30 minutes" => _("30 minutes"),
                                             "45 minutes" => _("45 minutes"),
                                             "1 hour" => _("1 hour"),
                                             "2 hours" => _("2 hours"),
                                             "4 hours" => _("4 hours"),
                                             "8 hours" => _("8 hours"),
                                             "12 hours" => _("12 hours"),
                                             "1 day" => _("1 day"),
                                             "2 days" => _("2 days"),
                                             "3 days" => _("3 days"),
                                             "1 week" => _("1 week"),
                                             "2 weeks" => _("2 weeks"),
                                             "3 weeks" => _("3 weeks"),
                                             "1 month" => _("1 month"),
                                             "2 months" => _("2 months"),
                                             "3 months" => _("3 months"),
                                             "4 months" => _("4 months"),
                                             "5 months" => _("5 months"),
                                             "6 months" => _("6 months"),
                                             "1 year" => _("1 year")));
        $this->assign('vbin', &$this->vbin);
        $this->assign('title', $title);
        
        if(isset($_SESSION) && isset($_SESSION['user']) && $_SESSION['user']['authed']) {
            $this->assign('user', array('authed'   => true,
                                        'id'       => $_SESSION['user']['id'],
                                        'username' => htmlentities($_SESSION['user']['username']),
                                        'fullname' => htmlentities($_SESSION['user']['fullname']),
                                        'nick'     => htmlentities($_SESSION['user']['nick']),
                                        'apikey'   => htmlentities($_SESSION['user']['apikey']),
                                        'prefs'    => $_SESSION['user']['prefs'],
                                        'adminLevel' => $_SESSION['user']['adminLevel'],
                                        'timezone' => $_SESSION['user']['timezone']
                                        )
                          );
            putenv('TZ='.$_SESSION['user']['timezone']);
        }
        
        $this->register_function('when', 'simpleDate', false, array('time'));
        $this->register_function('age', 'age', false, array('time','steps'));
        $this->register_block('dynamic', 'smarty_block_dynamic', false);
        
        $this->register_function('postkey', 'smarty_function_postkey', false);
        $this->register_function('postkeysig', 'smarty_function_postkeysig', false);
    }
    
    function headers() {
        header("Content-Type: text/html; charset=UTF-8");
    }
    
    function requireAuth($immediate = true) {
        if(!isset($_SESSION) || !isset($_SESSION['user']) || !isset($_SESSION['user']['authed'])) {
            if($immediate) {
                header("HTTP/1.1 403 Forbidden - Login Required");
                $this->assign('logintitle', $this->_tpl_vars['title']);
                $this->assign('postlogin', $_SERVER["REQUEST_URI"]);
                $this->caching = false;
                $this->display('login-required.tpl');
                exit;
            }
            return false;
        }
        return true;
    }
    
    public static function Error($title, $msg, $http = "200 OK") {
        if($http != "200 OK") {
            header("HTTP/1.1 $http");
        }
        $tpl = new Template();
        $tpl->assign('title', $title);
        $tpl->assign('errormsg', $msg);
        $tpl->caching = false;
        $tpl->display('error.tpl');
    }
    
    public static function Simple($title, $msg, $http = "200 OK") {
        if($http != "200 OK") {
            header("HTTP/1.1 $http");
        }
        $tpl = new Template();
        $tpl->assign('title', $title);
        $tpl->assign('msg', $msg);
        $tpl->caching = false;
        $tpl->display('simple.tpl');
    }
}
?>
