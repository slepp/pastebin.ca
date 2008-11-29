{if $paste}
  {assign var='title' value='Update this Paste'}
{else}
  {assign var='title' value='Create a Paste'}
{/if}
{box title=$title}
<p>
{if $paste}
Either update this post and resubmit it with changes, or <a href="index.php?a=n">make a new post</a>.</p><p>You may also <a href="/comments.php?bin_id={$paste->id}">comment on this post</a>. Any changes you make will create a new post and not modify the original.
{else}
Welcome to the Pastebin. For information on what this is, take a look at the <a href="/what.php">What is This?</a> page. You may also want to see the <a href="/newest.php">most recent post</a> to the pastebin.
{/if}
</p>

<form method="post" action="/index.php" class="pasteform" id="form">

<fieldset>
{if $paste}
<legend>{t}update paste below{/t}</legend>
{else}
<legend>{t}create a new paste{/t}</legend>
{/if}
	<div style="text-align: center">
	<textarea rows="20" cols="80" id="pastearea" name="content" class="pastecontent">{$paste->content|escape}</textarea>
	<div style="float:right">
	<input type="submit" name="s" value="{t}Submit Post{/t}" id="submit" class="submit" /> <input type="reset" value="{t}Reset Form{/t}" id="reset" class="reset" />
	</div>
	</div>
	<fieldset style="clear:right">
	<legend>{t}details of the post (optional){/t}</legend>
	<p class="note">
	{t escape=none}<b>Note:</b> Only the paste content is required, though the following information can be useful to others.{/t}
	</p>
	<div id="detail" class="detail">
	<input type="hidden" name="postkey" value="{postkey}" />
	<input type="hidden" name="postkeysig" value="{postkeysig}" />
	<input type="hidden" name="ltree_path" value="{$paste->path}" />
	<label for="name">Name / Title:</label><input type="text" id="name" name="name" size="20" class="general" value="{dynamic}{$user.prefs.name}{/dynamic}"/> <input class="general" type="checkbox" name="save" value="1" /> Save name / title?<br />
	<label for="description">{t}Description / Question:{/t}</label><textarea class="general" id="description" name="description" rows="4" cols="40"></textarea><br />
	<label for="tags">Tags:</label><input type="text" id="tags" name="tags" size="30" class="general" value=""/> <i>(space separated, optional)</i><br />
	<label for="type">Content Type:</label>	{html_options id="type" name="type" class="general" options=$typeOptions selected=$paste->type->id} <br />
	<label for="expire">Expire this post in:</label> {dynamic}{html_options id="expire" name="expiry" class="general" options=$expiryOptions selected=$user.prefs.expiry}{/dynamic} <br />
	<input style="display:inline;margin-left:12.5em;vertical-align:middle" type="checkbox" id="encrypt" name="encrypt" value="true" onchange="document.getElementById('encpw').style.visibility=(this.checked?'visible':'hidden');" /><label for="encrypt" class="checkbox">Encrypt this paste.</label><span style="visibility:hidden" id="encpw"> <label for="encryptpw" class="checkbox">Password:</label> <input style="border:1px solid black" type="text" name="encryptpw" id="encryptpw" size="20" /></span><br />
	<div style="clear:left"><input type="submit" name="s" value="Submit Post" id="submit2" class="submit" style="margin-left: 12em" /> <input type="reset" value="Reset Form" id="reset2" class="reset" />
	</div></div>
	</fieldset>
</fieldset>
</form>
<p class="warn">Please note that information posted here will not expire by default. If you want it to expire, please set the expiry time above. If it is set to expire, web search engines will not be allowed to index it prior to it expiring. Items that are not marked to expire will be indexable by search engines. Be careful with your passwords.</p>
{/box}
