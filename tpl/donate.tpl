{include file="header.tpl"}
{box title="Donate to the Pastebin"}
{t escape=none 1=$totals.usd 2=$totals.cad}
<p>
The Pastebin is provided as a free service, but it still costs some money to run.
The goal with the donations is to make enough each month to eliminate any advertising
from the site and to support future upgrades and enhancements. The donations also help
support <a href="http://imagebin.ca/">Imagebin</a>, <a href="http://filebin.ca">Filebin</a>
and <a href="http://turl.ca/">TURL</a>.
</p>

<p>
Your donation will go towards new hardware and paying the bills that keep the servers
running day after day. So far, %1 USD and %2 CAD has been donated.
</p>

<p>You are welcome to choose any donation value you like via the PayPal donation page.
To continue, follow the donation button below. If you want a little recognition for
your donation, you can check off the box below as well.</p>
<p>As part of the recognition, you can enter a URL you would like to show beside
your name and amount, but that is also optional.</p>
{/t}
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <fieldset style="text-align:center;border:1px solid black;margin:2em 5em 2em 5em;background:#ddd">
        <input type="hidden" name="cmd" value="_xclick"/>
        <input type="hidden" name="business" value="admin@pastebin.ca"/>
        <input type="hidden" name="no_shipping" value="1"/>
        <input type="hidden" name="return" value="http://pastebin.ca/thanks.php"/>
        <input type="hidden" name="cn" value="Optional Comments"/>
        <input type="hidden" name="tax" value="0"/>
        <input type="hidden" name="lc" value="CA"/>
        <input type="hidden" name="bn" value="PP-DonationsBF"/>
        <input type="hidden" name="item_name" value="Pastebin Donation"/>
        <input type="hidden" name="item_number" value="PBDonate01"/>
        <div style="text-align:center">
        <table class="simple" style="margin-left:auto;margin-right:auto">
        <tr><td>Donation Currency:</td><td><select name="currency_code">
        <option value="CAD">Canadian Dollars</option>
        <option value="USD">US Dollars</option>
        <option value="EUR">Euros</option>
        <option value="GBP">UK Sterling</option>
        <option value="JPY">Japanese Yen</option>
        </select></td></tr>
        <tr><td>Donation Amount:</td><td><input type="text" size="8" name="amount" value="" /> <i>(may be left blank on this page)</i></td></tr>
        <tr><td>Display Preference:</td><td>
        <input type="radio" name="custom" value="_show_"/> Yes, show my name and amount on the donations page.<br />
        <input type="radio" name="custom" value="_showname_"/> Yes, show only my name, not the amount.<br />
        <input type="radio" name="custom" value="" checked="checked" /> No, hide my name and amount.</td></tr>
        <tr><td><input type="hidden" name="on0" value="Optional URL"/>Optional URL:</td><td><input type="text" name="os0" value="" size="40" /><br/>If you enter a URL, it will be used to as a link for your name.</td></tr>
        <tr><td colspan="2"><input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but21.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" /></td></tr>
<!--        <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1"></td></tr> -->
        </table>
	</div>
        </fieldset>
        </form>

        <p>{t}That is all there is to it.{/t}</p>
        <p>{t}Sincerely,{/t}<br/>Slepp</p>
{/box}
{box title='Past Donations'}
<p>{t}So far, the following people have donated and requested that they are listed (two donations with a net amount of zero have been filtered):{/t}</p>
<table class="simple bordered"><tr><th>{t}Donator{/t}</th><th>{t}Amount{/t}</th><th>{t}Optional URL{/t}</th></tr>
{foreach from=$donations item=d}
<tr><td>
{if $d.custom == '_showname_' || $d.custom == '_show_'}
  {if $d.payer_business_name}
    {$d.payer_business_name|escape}
  {else}
    {$d.first_name|escape} {$d.last_name|escape}
  {/if}
  {else}
    {t}Anonymous{/t}
{/if}
</td><td>
{if $d.custom == '_showname_'}
  {t}Private{/t}
{else}
  {$d.amount} {$d.currency}
{/if}
</td>
<td>{if $d.option_selection1}<a href="{$d.option_selection1|escape}">{$d.option_selection1|escape}</a>{/if}</td></tr>
{/foreach}
</table>
{/box}
{include file="footer.tpl"}
