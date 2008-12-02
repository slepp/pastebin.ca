<?php
function _encrypt($key, $algo, $data) {
    $td = mcrypt_module_open($algo, '', 'cfb', '');
    $is = mcrypt_enc_get_iv_size($td);
    $iv = mcrypt_create_iv($is, MCRYPT_DEV_URANDOM);
    $ks = mcrypt_enc_get_key_size($td);
    $key = substr($key, 0, $ks);
    mcrypt_generic_init($td, $key, $iv);
    $enc_data = mcrypt_generic($td, hash('sha1',$data).$data);
    mcrypt_generic_deinit($td);
    mcrypt_module_close($td);
    return base64_encode($iv.$enc_data);
}

function &_decrypt($key, $algo, $enc_data) {
    $enc_data = base64_decode($enc_data);
    $td = mcrypt_module_open($algo, '', 'cfb', '');
    $is = mcrypt_enc_get_iv_size($td);
    $iv = substr($enc_data, 0, $is);
    $ks = mcrypt_enc_get_key_size($td);
    $key = substr($key, 0, $ks);
    mcrypt_generic_init($td, $key, $iv);
    $data = mdecrypt_generic($td, substr($enc_data, $is));
    $sha1 = substr($data, 0, 40);
    $data = substr($data, 40);
    mcrypt_generic_deinit($td);
    mcrypt_module_close($td);
    if(hash('sha1',$data) == $sha1) {
        return $data;
    }
    return false;
}
?>
