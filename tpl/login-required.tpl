{include file='header.tpl'}
{box title="Login Required"}
<p>In order to access {if $logintitle}<i>{$logintitle}</i>{else}this section{/if}, you need to authenticate yourself.</p>
<div id="loginbox" style="border:2px solid black;font-size:18pt;color:black;background:#eef;text-align:center;margin:1em auto;width:75%;padding-top:3em;padding-bottom:3em;">
  <form method="get" action="/oid_login.php">
  <input type="hidden" name="return_url" value="{$postlogin|escape}" />
  <label for="openid_url">OpenID / LID / i-Name:</label><br />
        <input type="text" class="input-box" style="font-size:18pt;text-align:center;background:url(http://static.pastebin.ca/imgs/openid-bg.png) no-repeat #efe;color:#aaa" id="openid_url5" name="openid_url" size="30" onfocus="this.style.color='black';this.value=''" /><br />
        <script type="text/javascript">document.getElementById('openid_url5').value='Enter Your ID';</script>
        <input type="submit" name="s" value="Login to the Pastebin" style="border:2px solid black"/>
        <p style='padding-top:2em;font-size:14pt;text-align:center'>If you want to <a href="/oid.php">get an account</a>, take a look at the <a href="/oid.php">list of OpenID providers</a>.</p>
  </form>
</div>
{/box}
{include file='footer.tpl'}
