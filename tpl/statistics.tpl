{include file='header.tpl' title='Pastebin Statistics'}
{box title='Pastebin Statistics'}
<p>
{php}
$stmt = Database::prepare("SELECT * FROM statistics");
$stmt->execute();
$res = $stmt->fetch();
$this->assign('basestats', $res);
{/php}
<table>
<tr><th>Total Pastes:</th><td>{$basestats.total|number_format}</td></tr>
<tr><th>Expired or Expiring:</th><td>{$basestats.expiring|number_format}</td></tr>
<tr><th>Marked as Spam:</th><td>{$basestats.spam|number_format}</td></tr>
</table>
{/box}
{include file='footer.tpl'}
