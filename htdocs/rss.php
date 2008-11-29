<?php
###
### Pastebin.ca (c) 2003-2005 Stephen Olesen
### All rights reserved.
###
### $Id: rss.php 233 2005-05-05 20:46:56Z slepp $
###

### RSS feeds of news and posts

require("include/global.inc.php");

if(!isset($_SERVER["PATH_INFO"]) || empty($_SERVER["PATH_INFO"]) || $_SERVER["PATH_INFO"] == '/') {
	header("HTTP/1.0 403 Forbidden");
	print "<html><head><title>403 "._('Forbidden').'</title></head><body><h1>403 '._('Forbidden').'</h1>'._('Access to this directory is denied.')."</body></html>\n";
	exit;
}

#header("Content-Type: application/rss+xml");
if($_SERVER["PATH_INFO"] == "/posts.rss") {
    header("Content-Type: application/rss+xml");

    print '<?xml version="1.0"?>'."\n";
    $db = OpenDatabase();
    ?>		
<rss version="0.91">
  <channel>
    <title>Pastebin.ca Posts</title>
    <link>http://pastebin.ca/</link>
    <description>Pastebin.ca Recent Posts</description>
    <?php
    $fields =  "bin.id,".
      "poster,".
      "to_char(posted,'FMDay, Month FMDDth, YYYY "._('at')." FMHH12:MI:SSam TZ') as posted_format,".
      "posted,".
      "type,".
      "expiry,".
      "types.handler,".
      "types.name,".
      "highlighter_timestamp,".
      "date_trunc('second',age('now',posted)) as age,".
      "date_trunc('second',(expiry - age(now(),posted))) as expires_in";
    if(!($VirtualUser = GetUserIDByHost($_SERVER["HTTP_HOST"])) && !IsPrivatePB($VirtualUser)) {
        $Res = GetPostList();
        #$Res = cache_pg_Exec($db, "SELECT $fields FROM bin,types WHERE types.id=bin.type AND user_id IS NULL AND expiry IS NULL ORDER BY id DESC LIMIT 15", 300);
    } else {
        $Res = GetPostList($VirtualUser);
        #$Res = cache_pg_Exec($db, "SELECT $fields FROM bin,types WHERE types.id=bin.type AND user_id='$VirtualUser' AND expiry IS NULL ORDER BY id DESC LIMIT 15", 300);
    }
    for($i = 0; $i < count($Res); $i++) {
        $r = $Res[$i];
        print '<item>';
        print '<title>'.$r['poster'].'</title>';
        print '<link>http://pastebin.ca/'.$r['id'].'</link>';
        #        printf("<description>"._('Post number %d pasted %s of type %s is now %s old.')."</description>", $r['id'], $r['posted'], $r['name'], $r['age']);
        printf("<description>"._('Post number %d of type %s is now %s old.')."</description>", $r['id'], $r['name'], $r['age']);
        print '</item>'."\n";
    }
    ?>
  </channel>
</rss>
    <?php
    CloseDatabase();
} else if($_SERVER["PATH_INFO"] == "/news.rss") {

    header("Content-Type: application/rss+xml");

    print '<?xml version="1.0"?>'."\n";
    ?>
<rss version="0.91">
  <channel>
    <title><?php print _('PasteBin.ca News')?></title>
    <link>http://pastebin.ca/news.php</link>
    <description><?php print _('PasteBin.ca News')?></description>
	<item>
	  <title>Translations in Progress</title>
	  <link>http://pastebin.ca/news.php#4</link>
	  <description>I have started on the translations from English into French and German. The little flags at the top right will change the page into the language the flag represents. Of course, I cheated and used Google, but I would like to hear from anyone willing to fix up the translations.</description>
	</item>
	<item>
	  <title>New Features and Planned Updates</title>
	  <link>http://pastebin.ca/news.php#3</link>
	  <description>I added a list of randomized 'Anonymous' names to the system, so instead of all the posts labelled Anonymous, there will now be a bit of a mix up in names so that it might be easier to identify untitled posts on the sidebar. Let me know if you have any suggestions of other random titles to set when it is left blank.</description>
	</item>
	<item>
	  <title>Advertising Auctions Open</title>
	  <link>http://pastebin.ca/news.php#2</link>
	  <description>Advertising information is available for those who wish to look into it. I didn't want to step on any toes of the people who were asking, so I made it an open forum to try for advertising space. (Sorry)</description>
	</item>
	<item>
	  <title>Domain Name Purchase Offer</title>
	  <link>http://pastebin.ca/news.php#1</link>
	  <description>Someone offered a lot of money for the domain name, and I'm curious who. If it was you, I'd like to know. I said no, if anyone is curious.</description>
	</item>
  </channel>
</rss>
    <?php
} else {
    header("HTTP/1.0 404 Not Found");
	print "<html><head><title>404 "._('Not Found')."</title></head><body><h1>404 "._('Not Found')."</h1>"._('RSS feed not found.')."</body></html>\n";
}
?>
