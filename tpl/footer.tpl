</div>

    <div id="sidebar-left" style="position:absolute;top:2.25em">
      <div class="bl"><div class="br"><div class="tl"><div class="tr">
      <div class="menu" id="idmenu0"><div class="menutitle"><h2><img src="http://static.pastebin.ca/imgs/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('idmenu0-collapse',this,'eeeeee')" alt="" />
<script type="text/javascript">showhideobj['idmenu0-collapse'] = 'block';</script>{t}Stuff to Do{/t}</h2></div><div class="items" id="idmenu0-collapse">
<div class="link"><a href="/new.php">{t}New Post{/t}</a></div>
<div class="link"><a href="/upload.php">{t}Upload a Post{/t}</a></div>
<div class="link"><a href="/newest.php">{t}Goto Newest{/t}</a></div>
<div class="link"><a href="/search.php">{t}Search{/t}</a></div>
<div class="link"><a href="/archive1">{t}Archives{/t}</a></div>
<div class="link"><a href="/tools.php">{t}Tools / APIs{/t}</a></div>
<div class="link"><a href="/donate.php">{t}Donate{/t}</a>
</div>
</div>
</div>

<div class="menu" id="idmenu1"><div class="menutitle"><h2><img src="http://static.pastebin.ca/imgs/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('idmenu1-collapse',this,'eeeeee')" alt="" />
<script type="text/javascript">showhideobj['idmenu1-collapse'] = 'block';</script>{t}Information{/t}</h2></div><div class="items" id="idmenu1-collapse">
<div class="link"><a href="/news.php">{t}Site News{/t}</a></div>
<div class="link"><a href="/makesub.php" style="color:green">{t}Get a Pastebin{/t}</a></div>
<div class="link"><a href="/what.php">{t}What is This?{/t}</a></div>
<div class="link"><a href="/statistics.php">{t}Statistics{/t}</a></div>
{dynamic}
{if $vbin->isVirtual}
<div class="link"><a href="http://pastebin.ca">{t}Main Pastebin{/t}</a></div>
{/if}
{/dynamic}
</div>
</div>

<div class="menu" id="idmenu2"><div class="menutitle"><h2><img src="http://static.pastebin.ca/imgs/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('idmenu2-collapse',this,'eeeeee')" alt="" /><script type="text/javascript">showhideobj['idmenu2-collapse'] = 'block';</script>{t}Related{/t}</h2></div>
<div class="items" id="idmenu2-collapse">
<div class="link"><a href="http://imagebin.ca/">Imagebin</a></div>
<div class="link"><a href="http://filebin.ca/">Filebin</a></div>
<div class="link"><a href="http://turl.ca/">TURL</a></div>
</div>
</div>

{dynamic}
      {if $user.authed}
      <div class="menu" id="idmenulogin">
        <div class="menutitle">
          <h2><img src="{$url.imgs}/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('idmenulogin-collapse',this,'eeeeee')" alt="" /><script type="text/javascript">showhideobj['idmenulogin-collapse'] = 'block';</script>{t}Your Account{/t}</h2>
        </div>
	<div class="items" id="idmenulogin-collapse">
		<div class="link" style="text-align:center">{$user.nick}</div>
		<div class="link"><a href="/history.php">{t}Your Pastes{/t}</a></div>
		<div class="link"><a href="/settings.php">{t}Settings{/t}</a></div>
		<div class="link"><a href="/oid_logout.php">{t}Logout{/t}</a></div>
	</div>
      </div>
      {else}
      <div class="menu" id="idmenulogin">
        <div class="menutitle">
          <h2><img src="{$url.imgs}/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('idmenulogin-collapse',this,'eeeeee')" alt="" /><script type="text/javascript">showhideobj['idmenulogin-collapse'] = 'block';</script>{t}Login{/t}</h2>
        </div>
	<div style="display:block">
        <form method="get" action="/oid_login.php">
          <fieldset id="lbar" class="searchbar">
          <div id="openid">
          <input type="text" size="15" name="openid_url" id="openid_url" class="input-box" style="width:9em;background:url(http://static.pastebin.ca/imgs/openid-bg.png) no-repeat #efe;background-position:0 50%;padding-left:18px;" />
          <a style="font-size:8pt;color:#444;text-decoration:underline" href="/oid.php">{t}Want an account?{/t}</a>
  	  </div>
          <input type="submit" name="ls" value="{t}Login{/t}" class="submit-button" onclick="this.value='{t}Trying...{/t}'" />
	  </fieldset>
	</form>
	</div>
      </div>
      {/if}
{/dynamic}
	                <div class="menu" id="id2243084">
	                  <div class="menutitle">
	                    <h2><img src="http://static.pastebin.ca/imgs/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('id2243084-collapse',this,'eeeeee')" alt="" /><script type="text/javascript">showhideobj['id2243084-collapse'] = 'block';</script>{t}Quick Search{/t}</h2>
	                  </div>
	
	                  <div id="id2243084-collapse">
	                    <form method="get" action="/search.php">

	                      <fieldset id="searchbar" class="searchbar">
	                        <input type="text" name="q" size="15" style="width:10em" class="input-box" />
	                        <br />
	                        <input type="submit" value="{t}Search{/t}" class="submit-button" onclick="this.value='{t}Searching...{/t}'" />
	                        <br />
	                      </fieldset>
	                    </form>
			    <form method="get" action="http://www.google.ca/custom">
			      <fieldset id="googlebar" class="searchbar">

				<label for="sbi" style="display: none">{t}Enter your search terms{/t}</label>
				<input type="text" name="q" size="15" maxlength="255" value="" id="sbi" style="width:10em" class="input-box"></input>
				<label for="sbb" style="display: none">{t}Submit search form{/t}</label>
				<input type="submit" name="sa" value="{t}Google Search{/t}" id="sbb" class="submit-button"></input>
				<input type="hidden" name="client" value="pub-2465070471312787"></input>
				<input type="hidden" name="forid" value="1"></input>
				<input type="hidden" name="channel" value="3894827078"></input>
				<input type="hidden" name="ie" value="utf-8"></input>
				<input type="hidden" name="oe" value="utf-8"></input>
				<input type="hidden" name="flav" value="0000"></input>
				<input type="hidden" name="sig" value="D_4zQVlomYNJjvNC"></input>
				<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:336699;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;FORID:1"></input>
				<input type="hidden" name="hl" value="{$lang.short}"></input>
			      </fieldset>
			    </form>
<!--	                    <form method="get" action="/multi-search.php">
	                      <fieldset id="searchbar" class="searchbar">
	                        <input type="text" name="q" size="15" style="width:10em" class="input-box" />
				<br />
				<select class="input-box" name="engine"><option value="php">PHP</option><option value="mysql">MySQL</option></select>
	                        <br />
	                        <input type="submit" value="Search" class="submit-button" onclick="this.value='Searching...'" />
	                        <br />
	                      </fieldset>
	                    </form> -->
	                  </div>

	                </div>
      {if !empty($recent)}
      <div class="menu" id="idmenurecent">
        <div class="menutitle">
          <h2><img src="{$url.imgs}/svg.php/arrow-up-10-eeeeee.png" style="width:10px;height:10px;float:right;margin-top:0.25em;margin-bottom:0.25em;margin-right:10px" onclick="javascript:showHideDiv('idmenurecent-collapse',this,'eeeeee')" alt="" /><script type="text/javascript">showhideobj['idmenurecent-collapse'] = 'block';</script>{t}Recent Posts{/t}</h2>
        </div>
        <div class="items" id="idmenurecent-collapse">
{dynamic}
          {foreach from=$recent item=r}
          <div class="recent{if isset($paste) && $r.id == $paste->id}cur{/if}link" style="overflow:hidden"><a href="/{$r.id}">{$r.poster|escape}</a>
            <div class="recentdetail">{if $r.name != 'Raw'}<i>{t}{$r.name}{/t}</i><br/>{/if}{age steps=2 time=$r.posted}</div>
          </div>
          {/foreach}
{/dynamic}
        </div>
      </div>
      {/if}
      </div></div></div></div>
    </div>

    <div id="runner" style="position:absolute;top:2px;right:2px;height:12px;padding:none;margin:none"><a href="javascript:showHideMenu()" id="showhide">{t}Hide Menu{/t}</a> --
      <a href="{$proto}://en.pastebin.ca{$smarty.server.REQUEST_URI}"><img src="{$url.imgs}/ca.gif" width="18" height="12" style="border:2px solid black" alt="{t}English{/t} (CA)" /></a>
      <a href="{$proto}://fr.pastebin.ca{$smarty.server.REQUEST_URI}"><img src="{$url.imgs}/fr.gif" width="18" height="12" style="border:2px solid #6464c8" alt="{t}French{/t}" /></a>
      <a href="{$proto}://de.pastebin.ca{$smarty.server.REQUEST_URI}"><img src="{$url.imgs}/de.gif" width="18" height="12" style="border:2px solid #6464c8" alt="{t}German{/t}" /></a>
      <a href="{$proto}://ja.pastebin.ca{$smarty.server.REQUEST_URI}"><img src="{$url.imgs}/jp.png" width="18" height="12" style="border:2px solid #6464c8" alt="{t}Japanese{/t}" /></a>
    </div>
</div>
<div id="footer" style="background:inherit;margin-left:12em;margin-right:0.5em;color:#888;width:inherit;line-height:1em">
<p style="text-align:center;margin:0px;margin-bottom:0.25em;padding:0px;"><a href="/about.php">{t}About{/t}</a> &mdash; <a href="/privacy.php">{t}Privacy Policy{/t}</a> &mdash; <a href="/disclaimer.php">{t}Disclaimer{/t}</a> &mdash; <a href="/copyright.php">{t}Copyright{/t}</a> &copy; 2002-2007</p>
<p style="text-align:center;margin:0px;margin-bottom:0.25em;padding:0px;">{t escape=none}services written and provided by <a href="http://blog.slepp.ca/" style="color:#888">Stephen Olesen</a>{/t}</p>
<p style="text-align:center">
<span style="text-align:left;width:8em;border:1px solid #ccc;font-family:helvetica,arial,sans-serif;font-size:70%;font-weight:bold;line-height:1em;margin-bottom:0.25em"><a href="http://validator.w3.org/check?uri=referer" style="background:#fc6"><span style="padding:0 0.4em;background-color:#fff;color:#0c479d;">W3C</span><span style="padding-left:0.25em;padding-right:0.25em;color:black;text-decoration:none;background:#fc6">XHTML</span></a></span>
<span style="text-align:left;width:8em;border:1px solid #ccc;font-family:helvetica,arial,sans-serif;font-size:70%;font-weight:bold;line-height:1em;margin-bottom:0.25em"><a href="http://jigsaw.w3.org/css-validator/" style="background:#fc6"><span style="padding:0 0.4em;background-color:#fff;color:#0c479d;">W3C</span><span style="padding-left:0.25em;padding-right:0.25em;color:black;text-decoration:none;background:#fc6">CSS</span></a></span>
</p>
</div>
</body>
</html>
