<dl class="bookend h3">
  <dt>This URL: <a href="/{$urlid}">{$url.root}/{$urlid}</a></dt>
  <dd>{if $paste->id_mask == ''}Alternatives: <a href="/raw/{$paste->id}">Raw</a>{/if}
  {if $paste->ascendants > 0} | <a href="/tree{$paste->id}">Tree</a>{/if}
  {if $paste->children > 0} | <a href="/desc{$paste->id}">Descendants ({$paste->children})</a>{/if}</dd>
  <dt>Language: {$paste->type->name}</dt>
  <dd><span style="padding-right:1.25em">Age: {age time=$paste->epoch}</span></dd>
</dl>
{if $paste->description != ''}
<div style="margin:0.5em;border:1px solid blue;background:#ddddee;text-align:justify">
  <h3>description of this post</h3>
  <p>{$paste->description|escape}</p>
</div>
{/if}
{$paste->highlightedContent()}
<h3 style="border-bottom:none;border-top:1px solid black">Total Paste Views: {$paste->hits} &mdash; <a href="{$url.root}/trackback.php/{$paste->id}">Trackback</a> ({$paste->trackbacks})
&mdash; <a href="{$url.root}/{$paste->id}">PermaLink</a>
{if $paste->owner($user.id) or $user.adminLevel}
&mdash; <a href="/remove.php?id={$paste->id}">Remove Paste</a>
{else}
&mdash; <a href="/request-removal.php?id={$paste->id}">Request Removal</a>
{/if}
{if $user.adminLevel}
&mdash; <a href="/remove-spam.php?id={$paste->id}">Spam</a>
{/if}
</h3>
