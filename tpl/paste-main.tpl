{include file='header.tpl'}
{box title=$paste->poster subtitle=$paste->epoch|date_format:"%B %e, %Y at %l:%M:%S%P %Z" paste='1'}
{include file='paste.tpl' paste=$paste}
{/box}
{include file='paste-form.tpl' paste=$paste}
{include file='footer.tpl'}
