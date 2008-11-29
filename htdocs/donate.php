<?php
require("include/global.inc.php");
$t = new Template("Donate to the Pastebin");

$db = new PDO("pgsql:dbname=paypal", "paypal", "");
$stmt = $db->prepare("select custom,option_selection1,first_name,last_name,payer_business_name,coalesce(settle_amount,mc_gross) as amount,coalesce(settle_currency,mc_currency) as currency from ipn,sender where sender.id=ipn.sender and mc_gross-mc_fee > '\$0.00' ORDER BY sender DESC");
$stmt->execute();
$donations = $stmt->fetchAll();
$totals = array('cad' => 0, 'usd' => 0);
foreach($donations as $v) {
    if($v['currency'] == 'CAD') {
        $totals['cad'] += substr($v['amount'],1);
    } else if($v['currency'] == 'USD') {
        $totals['usd'] += substr($v['amount'],1);
    }
}
foreach($totals as $k => $v) {
    $totals[$k] = sprintf("$%0.02f", $v);
}
$t->assign("totals", $totals);
$t->assign("donations", $donations);
$t->display("donate.tpl");
?>
