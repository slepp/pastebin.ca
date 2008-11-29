<?xml version="1.0" encoding="{$charset}"?>
<!DOCTYPE html PUBLIC
  "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html
  xmlns="http://www.w3.org/1999/xhtml"
  xml:lang="{$lang.short}">
<head>
  <title>{$vbin->bin_name} - {$title}</title>
  <meta http-equiv="Content-Type" content="text/html;charset={$charset}" />
  <meta name="microid" content="ca0462a24e49b118730aa3ba02c4e6cc5a55cd2d" />
  <link rel="stylesheet" href="{$url.css}/devel.css" type="text/css" />
  <link rel="stylesheet" href="{$url.css}/lang/everything.css" type="text/css" />
{if $stylesheets}
  {foreach from=$stylesheets item=stylesheet}
  <link rel="stylesheet" href="{$stylesheet}" type="text/css" />
  {/foreach}
{/if}
  <link rel="stylesheet" href="{$url.css}/print.css" type="text/css" media="print" />
  <link rel="alternate" hreflang="en" title="{t}English Translation{/t}" href="{$proto}://en.pastebin.ca" />
  <link rel="alternate" hreflang="fr" title="{t}French Translation{/t}" href="{$proto}://fr.pastebin.ca" />
  <link rel="alternate" hreflang="de" title="{t}German Translation{/t}" href="{$proto}://de.pastebin.ca" />
  <link rel="alternate" hreflang="ja" title="{t}Japanese Translation{/t}" href="{$proto}://ja.pastebin.ca" />
  <link rel="alternate" type="application/rss+xml" title="Posts" href="{$url.root}/rss/posts.rss" />
  <link rel="alternate" type="application/rss+xml" title="News" href="{$url.root}/rss/news.rss" />
  <link href="mailto:admin@pastebin.ca" rev="made" />
  <link rel="pingback" href="{$url.root}/xmlrpc.php" />
  <link rel="Help" href="/what.php" />
{if $robots}
  <meta name="robots" content="{$robots}" />
{/if}
{if $refresh}
  <meta http-equiv="Refresh" content="{$refresh}" />
{/if}
{if $relation}
  {foreach from=$relation key=rel item=url}
  <link rel="{$rel}" href="{$url}" />
  {/foreach}
{/if}
  <script type="text/javascript" src="/js/pb.js"></script>
{if $scripts}
  {foreach from=$scripts item=script}
    <script type="text/javascript" src="{$script}"></script>
  {/foreach}
{/if}
{if $inlineScripts}
  {foreach from=$inlineScripts item=script}
    <script type="text/javascript">{$script}</script>
  {/foreach}
{/if}
</head>
<body>
  <div id="header">
    <h1><a href="/" class="tlink">{$vbin->bin_name}</a> - {if $paste}{$paste->poster|escape} - {t 1=$paste->id}Paste number %1{/t}{else}{$title}{/if}</h1>
  </div>
  <div id="body">
    <div id="content">
<div style="text-align:center;padding-left:6pt;margin-top:0px;padding-top:0px;padding-right:6pt;height:60px;width:100%;margin-bottom:0.5em">
<script type="text/javascript"><!-- 
google_ad_client = "pub-2465070471312787";
google_alternate_ad_url = "http://pastebin.ca/google-publicservice.php";
google_ad_width = 468;
google_ad_height = 60;
google_ad_format = "468x60_as";
google_ad_channel ="4268816690";
google_color_border = "6464C8";
google_color_bg = "FFFFFF";
google_color_link = "0000FF";
google_color_url = "008000";
google_color_text = "000000";
//--></script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
</div>
