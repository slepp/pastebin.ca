{include file="header.tpl"}
{box title="Your Settings"}
<p>{t escape=none}On this page, you may set the various configuration options available for your account. All of these settings are entirely <b>optional</b>.{/t}</p>
<form method="post" action="/settings.php" class="generalform">

<fieldset><legend>{t}Your Associated OpenIDs{/t}</legend>
<p>{t escape=none 1=$smarty.session.user.username}You are currently logged in as <code>%1</code>{/t}.{if $others}Other IDs associated with this account are:{/if}</p>
{if $others}
<ul>
{foreach from=$others item=oid}
<li>{$oid}</li>
{/foreach}
</ul>
{/if}
</fieldset>

<fieldset><legend>{t}Your API Key{/t}</legend>
<p>{t escape=none}You may use this API key with <a href="/tools.php">automated scripts</a> and the <a href="/tools.php">various APIs</a> available to the Pastebin.{/t}</p>
<p>By using this key, pastes can be associated and managed with your account.</p>
<p style="text-align:center;border:1px solid green;background:#dfd;padding:0.5em"><b>{t}Your API key is:{/t}</b> <code>{$account->apikey}</code></p>
</fieldset>

<fieldset><legend>{t}General Settings{/t}</legend>
<fieldset><legend>{t}Pastebin Settings{/t}</legend>
<p>{t}All of these settings relate to how your pastes to the Pastebin will be handled by default.{/t}</p>
<table>
<tr><td><label for="expiry">{t}Default Expiry:{/t}</label></td><td>{html_options id="expiry" name="kvp[expiry]" class="general" options=$expiryOptions selected=$account->prefs.expiry}</td></tr>
<tr><td><label for="defname">{t}Default Name/Title:{/t}</label></td><td><input type="text" name="kvp[name]" class="general" id="defname" value="{$account->prefs.name|escape}" size="32" length="32" /></td></tr>
</table>
</fieldset>

<fieldset><legend>{t}Personal Information{/t}</legend>
<p>{t}These settings are mainly used for display purposes.{/t}</p>
<table>
<tr><td><label for="nickname">{t}Nickname:{/t}</label></td><td><input type="text" name="nickname" id="nickname" value="{$account->nickname|escape}" size="30" /></td></tr>
<tr><td><label for="fullname">{t}Full Name:{/t}</label></td><td><input type="text" name="fullname" id="fullname" value="{$account->fullname|escape}" size="30" /></td></tr>
<tr><td><label for="email">{t}E-mail:{/t}</label></td><td><input type="text" name="email" id="email" value="{$account->email|escape}" size="30" /></td></tr>
</table>
</fieldset>

<fieldset><legend>regional information</legend>
<table>
<tr><td><label for="country">{t}Country:{/t}</label></td><td>{html_options id="country" name="country" class="general" options=$countries selected=$account->country}</td></tr>
<tr><td><label for="language">{t}Language:{/t}</label></td><td>{html_options id="language" name="language" class="general" options=$languages selected=$account->language}</td></tr>
<tr><td><label for="timezone">{t}Timezone:{/t}</label></td><td>{html_options id="timezone" name="timezone" class="general" options=$timezones selected=$account->timezone}</td></tr>
</table>
</fieldset>

<input type="submit" name="s" value="{t}Modify Account{/t}" class="submit" />

</fieldset>

</form>
{/box}
{box title='Add a New OpenID Association'}
<p>{t}If you have more than one OpenID account, and would like to be able to use any of them to login to the Pastebin, then you may add it below. Once you are authenticated to that OpenID provider, it will be added to the Pastebin as well.{/t}</p>
<form method="get" action="/oid_login.php" class="generalform">
<fieldset><legend>{t}New OpenID to Associate{/t}</legend>
<p><input class="general" type="text" name="openid_url" value="" size="50" /> <input type="submit" name="s" value="{t}Associate ID{/t}" class="submit" /></form></p>
</fieldset>
</form>
{/box}
{include file="footer.tpl"}
