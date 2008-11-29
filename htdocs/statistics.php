<?php
###
### Pastebin.ca (c) 2003-2005 Stephen Olesen
### All rights reserved.
###
### $Id: statistics.php 233 2005-05-05 20:46:56Z slepp $
###

### Overall Pastebin statistics

require("include/global.inc.php");

$t = new Template("Pastebin Statistics");

$t->display('statistics.tpl');
exit;

if(preg_match(',(msnbot|Googlebot),', $_SERVER["HTTP_USER_AGENT"])) {
	header("403 Robots Not Allowed");
	print "Robots are not allowed access to this page. Please respect robots.txt.";
	exit;
}

require("template.php");
session_write_close();
pageHeader(_("pastebin.ca statistics"));
pageSidebar();
$db = OpenDatabase();
print '<style type="text/css">table td, table th { padding-left: 5pt; padding-right: 5pt; }</style>';
makeSection(_('statistics'));
$res = cache_pg_exec($db, "SELECT count(*) AS posts,sum(case when expiry is null then 1 else 0 end) as non_expiring,sum(case when expiry='-30 minutes' then 1 else 0 end) as spam,avg(length(content)) AS avg_content,avg(length(formatted_content)) AS avg_formatted,avg(expiry) AS avg_expiry,sum(length(content)) AS sum_content,sum(length(formatted_Content)) AS sum_formatted,min(expiry) as min_expiry,max(expiry) as max_expiry,min(length(content)) as min_content,max(length(content)) as max_content FROM bin", 3600);
$r = $res[0];
$res2 = cache_pg_exec($db, "SELECT avg(hits) AS hits FROM bin_hits", 86400);
$r2 = $res2[0];
print '<p>'._('Here are some operational statistics for the Pastebin. These include all private and public subdomains. All of the Pastebin runs on 17,431 lines of PHP and Perl written by slePP. Total line count with all the other packages included is 117,329.').'</p>';

makeSection(_('posts'));
print '<table style="text-align:left">';
print '<tr><th>'._('Total Posts').':</th><td>'.number_format($r['posts'],0).'</td></tr>';
print '<tr><th>'._('Never Expiring').':</th><td>'.number_format($r['non_expiring'],0).' ('.sprintf("%0.1f", ($r['non_expiring']/$r['posts'])*100).'%)</td></tr>';
print '<tr><th>'._('Expired or Expiring').':</th><td>'.number_format($r['posts']-$r['non_expiring']-$r['spam'],0).' ('.sprintf("%0.1f", (($r['posts']-$r['non_expiring']-$r['spam'])/$r['posts'])*100).'%)</td></tr>';
print '<tr><th>'._('Tagged as Spam').':</th><td>'.number_format($r['spam'],0).' ('.sprintf("%0.1f", (($r['spam'])/$r['posts'])*100).'%)</td></tr>';
print '<tr><th>'._('Average Hits per Post').':</th><td>'.number_format($r2['hits'],2).'</td></tr>';
print '</table>';

makeSection(_('sizes'));
print '<table style="text-align:left">';
print '<tr><th>'._('Shortest Post').':</th><td>'.number_format($r['min_content'],0).'</td></tr>';
print '<tr><th>'._('Longest Post').':</th><td>'.number_format($r['max_content'],0).'</td></tr>';
print '<tr><th>'._('Average Content Length').':</th><td>'.number_format($r['avg_content'],0).'</td></tr>';
print '<tr><th>'._('Total Content Length').':</th><td>'.number_format($r['sum_content'],0).'</td></tr>';
print '<tr><th>'._('Average Formatted Length').':</th><td>'.number_format($r['avg_formatted'],0).'</td></tr>';
print '<tr><th>'._('Total Formatted Length').':</th><td>'.number_format($r['sum_formatted'],0).'</td></tr>';
print '</table>';

makeSection(_('expiration'));
print '<table style="text-align:left">';
print '<tr><th>'._('Shortest Expiry').':</th><td>'.substr($r['min_expiry'],2).'</td></tr>';
print '<tr><th>'._('Average Expiry').':</th><td>'.substr($r['avg_expiry'],2).'</td></tr>';
print '<tr><th>'._('Longest Expiry').':</th><td>'.substr($r['max_expiry'],2).'</td></tr>';
print '</table>';

$totalposts = $r['posts'];

makeSection(_('posts by type'));
$res = cache_pg_exec($db, "select name,count(*) as count from bin join types on types.id=bin.type group by name order by count(*) desc", 3600);
print '<table style="text-align:left">';
for($i = 0; $i < count($res); $i++) {
    $r = $res[$i];
    print '<tr><th>'.$r['name'].':</th><td>'.number_format($r['count'],0).'</td><td>'.sprintf("(%0.1f%%)", ($r['count']/$totalposts)*100).'</td></tr>';
}
print '</table>';

makeSection(_('post trees'));
print '<table style="text-align:left">';
$res = cache_pg_exec($db, "SELECT sum(case when nlevel(path)<=1 then 1 else 0 end),avg(nlevel(path)),max(nlevel(path)) FROM bin_ltree", 3600);
$r = $res[0];
print '<tr><th>'._('Total Trees').':</th><td>'.number_format($r['sum'],0).'</td></tr>';
#$res = cache_pg_exec($db, "SELECT COUNT(DISTINCT tree_id),MAX((rgt-lft-1)/2),AVG((rgt-lft-1)/2) FROM bin_tree WHERE rgt>2");
#$r = pg_fetch_array($res, 0);
//print '<tr><th>'._('Total Trees With Children').':</th><td>'.number_format($r['count'],0).'</td></tr>';
print '<tr><th>'._('Deepest Tree').':</th><td>'.number_format($r['max'],0).'</td></tr>';
print '<tr><th>'._('Average Depth').':</th><td>'.number_format($r['avg'],2).'</td></tr>';
print '</table>';

makeSection(_('poll statistics'));
print '<table style="text-align:left">';
$totpolls = 0;
$res = cache_pg_exec($db, "SELECT COUNT(*) FROM poll_questions WHERE active", 86400);
$r = $res[0];
$totpolls += $r['count'];
print '<tr><th>'._('Total Active Polls').':</th><td>'.number_format($r['count'],0).'</td></tr>';
$res = cache_pg_exec($db, "SELECT COUNT(*) FROM poll_questions WHERE NOT active", 86400);
$r = $res[0];
$totpolls += $r['count'];
print '<tr><th>'._('Total Finished Polls').':</th><td>'.number_format($r['count'],0).'</td></tr>';
$res = cache_pg_exec($db, "SELECT COUNT(*) FROM poll_answers", 14400);
$r = $res[0];
print '<tr><th>'._('Total Poll Responses').':</th><td>'.number_format($r['count'],0).'</td></tr>';
print '<tr><th>'._('Average Responses per Poll').':</th><td>'.number_format($r['count']/$totpolls,1).'</td></tr>';
print '</table>';

makeSection(_('comments'));
print '<table style="text-align:left">';
$totpolls = 0;
$res = cache_pg_exec($db, "SELECT COUNT(DISTINCT tree_id),COUNT(*) AS totcount FROM comments", 3600);
$r = $res[0];
print '<tr><th>'._('Total Comment Threads').':</th><td>'.number_format($r['count'],0).'</td></tr>';
print '<tr><th>'._('Total Comments').':</th><td>'.number_format($r['totcount'],0).'</td></tr>';
print '</table>';

makeSection(_('top 5 posting days'));
print '<table style="text-align:left">';
$res = cache_pg_exec($db, "SELECT to_char(date_trunc('day',posted),'FMMonth FMDDth, YYYY') AS day,COUNT(*) FROM bin GROUP BY date_trunc('day',posted) ORDER BY count DESC LIMIT 5", 86400);
for($i = 0; $i < count($res); $i++) {
    $r = $res[$i];
    print '<tr><th>'.$r['day'].':</th><td>'.number_format($r['count'],0).' '._('posts').'</td></tr>';
}
print '</table>';

makeSection(_('total posts by day of the week'));
print '<table><tr><td>';
print '<table style="text-align:left">';
$res = cache_pg_exec($db, "SELECT date_part('dow',posted) AS day,COUNT(*) FROM bin GROUP BY day ORDER BY day", 86400);
$days = array(
              _('Sunday'),_('Monday'),_('Tuesday'),_('Wednesday'),_('Thursday'),_('Friday'),_('Saturday')
              );
for($i = 0; $i < count($res); $i++) {
    $r = $res[$i];
    print '<tr><th>'.$days[$r['day']].':</th><td>'.number_format($r['count'],0).' '._('posts').' '.sprintf("(%0.1f%%)", ($r['count']/$totalposts)*100).'</td></tr>';
}
print '</table></td><td style="text-align:right"><img src="/stat-img-dow.php" width="300" height="250" /></td></tr></table>';

makeSection(_('total posts by hour of the day (MST/MDT)'));
print '<table><tr><td><table style="text-align:left">';
$res = cache_pg_exec($db, "SELECT date_part('hour',posted) AS day,COUNT(*) FROM bin GROUP BY day ORDER BY day", 3600);
for($i = 0; $i < count($res); $i++) {
    $r = $res[$i];
    if($r['day'] > 12) {
        $r['day'] = ($r['day'] - 12)."pm";
    } else if($r['day'] == 12) {
        $r['day'] .= "pm";
    } else if($r['day'] == 0) {
        $r['day'] = '12am';
    } else {
        $r['day'] .= "am";
    }
    $a[$i] = array($r['day'], $r['count']);
}
for($i = 0; $i < 12; $i++) {
    print '<tr>';
    print '<th>'.$a[$i][0].':</th><td>'.number_format($a[$i][1],0).' '._('posts').' '.sprintf("(%0.1f%%)", ($a[$i][1]/$totalposts)*100).'</td>';
    print '<th>'.$a[$i+12][0].':</th><td>'.number_format($a[$i+12][1],0).' '._('posts').' '.sprintf("(%0.1f%%)", ($a[$i+12][1]/$totalposts)*100).'</td>';
    print '</tr>';
}
print '</table></td><td style="text-align:right"><img src="/stat-img-hour.php" width="400" height="250" /></td></tr></table>';

$cache1 = new Memcache;
$cache1->pconnect('localhost','11211');
$cache2 = new Memcache;
$cache2->pconnect('localhost','11212');
$dur = new Duration;

$cs1 = $cache1->getStats();
$cs2 = $cache2->getStats();

makeSection(_('cache statistics'));
print '<table style="text-align:left"><tr><th>Statistic</th><th>Cache 1</th><th>Cache 2</th>';
print '<tr><th>Uptime</th><td>'.$dur->AgeAsString($cs1['uptime']).'</td><td>'.$dur->AgeAsString($cs2['uptime']).'</td></tr>';
print '<tr><th>Item Count</th><td>'.number_format($cs1['curr_items'],0).'</td><td>'.number_format($cs2['curr_items'],0).'</td></tr>';
print '<tr><th>Utilization</th><td>'.sprintf("%0.01f",($cs1['bytes']/$cs1['limit_maxbytes'])*100.0).'%</td><td>'.sprintf("%0.01f",($cs2['bytes']/$cs2['limit_maxbytes'])*100.0).'%</td></tr>';
print '<tr><th>Hit Efficiency</th><td>'.sprintf("%0.01f",($cs1['get_hits'] / $cs1['get_misses']))." to 1 (".sprintf("%0.02f", ($cs1['cmd_get']+$cs1['cmd_set'])/$cs1['uptime'])." req/s)</td><td>".sprintf("%0.01f",($cs2['get_hits'] / $cs2['get_misses'])).' to 1 ('.sprintf("%0.02f", ($cs2['cmd_get']+$cs2['cmd_set'])/$cs2['uptime']).' req/s)</td></tr>';
print '<tr><th>Byte Efficiency</th><td>'.sprintf("%0.01f",($cs1['bytes_written'] / $cs1['bytes_read']))." to 1</td><td>".sprintf("%0.01f",($cs2['bytes_written'] / $cs2['bytes_read'])).' to 1</td></tr>';
print '<tr><th>Average Object Size</th><td>'.number_format($cs1['bytes'] / $cs1['curr_items'], 0).' bytes</td><td>'.number_format($cs2['bytes'] / $cs2['curr_items'], 0).' bytes</td></tr>';
print '</table>';

$res = cache_pg_Exec($db, "SELECT COUNT(*) AS count,MAX(period) AS max_period,AVG(period) AS avg_period,SUM(hits) AS hits,MAX(hits) AS max_hits FROM spammers", 60);
$res = $res[0];
makeSection(_('spammer statistics'));
print '<table style="text-align:left">';
print '<tr><th>Active Spammer Count:</th><td>'.number_format($res['count']).'</td></tr>';
print '<tr><th>Denied Spammer Requests:</th><td>'.number_format($res['hits']).'</td></tr>';
print '<tr><th>Highest Single Denied Spammer Count:</th><td>'.number_format($res['max_hits']).'</td></tr>';
print '<tr><th>Maximum Ban Period:</th><td>'.substr($res['max_period'],2).'</td></tr>';
print '<tr><th>Average Ban Period:</th><td>'.substr($res['avg_period'],2).'</td></tr>';
print '</table>';

/*    [pid] => 8805
    [uptime] => 2354
    [time] => 1172487043
    [version] => 1.1.12
    [rusage_user] => 0.188011
    [rusage_system] => 0.268016
    [curr_items] => 797
    [total_items] => 833
    [bytes] => 14138019
    [curr_connections] => 16
    [total_connections] => 331
    [connection_structures] => 17
    [cmd_get] => 1427
    [cmd_set] => 833
    [get_hits] => 1049
    [get_misses] => 378
    [bytes_read] => 15836307
    [bytes_written] => 24503674
    [limit_maxbytes] => 100663296*/

endSection();
pageFooter();
?>
