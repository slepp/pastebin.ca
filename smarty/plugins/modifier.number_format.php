<?php
function smarty_modifier_number_format($string, $decimals = 0)
{
    if ($string != '') {
        return number_format($string, $decimals);
    }
        return 0;
}
?>
