<?php
require_once("include/global.inc.php");

$tpl = new Template();
$tpl->assign('typeOptions', TypeUtil::getOptionList());

if(isset($_GET["id"])) {
    $p = new Paste();
    if($p->load($_GET["id"])) {
        $tpl->assign('paste', $p);
        $tpl->headers();
        if($p->id_mask != null) {
            $tpl->assign('urlid', $p->id_mask);
        } else {
            $tpl->assign('urlid', $p->id);
        }
        $tpl->assign('title', _("General Pastebin")." - ".htmlentities($p->poster,ENT_COMPAT,"UTF-8")." - "._("Paste number")." ".$p->id);
        $tpl->display('paste-main.tpl', $p->id);
        exit;
    }
}

$tpl->headers();
$tpl->display('main.tpl');
?>
