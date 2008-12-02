<?php
function getPostKey($uniq) {
    return array($uniq, base64_encode(hash_hmac('sha256',$uniq,API_KEY_CRYPTO,true)));
}

function makeApiKey() {
    $uniq = substr(base64_encode(sha1(serialize($_SERVER)+gettimeofday(true), true)),0,27);
    return $uniq.substr(base64_encode(hash_hmac('ripemd160',$uniq.'--'.$uniq.'++'.$uniq,API_KEY_CRYPTO,true)),4,5);
}

function checkApiKey($key) {
    if(strlen($key) == 32) {
        $uniq = substr($key, 0, 27);
        $hash = substr($key, 27, 5);
        if($hash == substr(base64_encode(hash_hmac('ripemd160',$uniq.'--'.$uniq.'++'.$uniq,API_KEY_CRYPTO,true)),4,5))
          return true;
        return false;
    }
    return false;
}
?>
