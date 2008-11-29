<?php
require_once("include/global.inc.php");

require_once "oid_common.php";

/*if(!preg_match(',^([=@+$!].*|https?://.*|[a-zA-Z0-9./-]+)$,', $_GET["openid_url"])) {
    print "Invalid OpenID format... Please try again.\n";
    exit;
}*/

// Render a default page if we got a submission without an openid
// value.
if (empty($_GET['openid_url'])) {
    Template::Error('error', 'Sorry, you need to provide an OpenID URL to login. If you do not have an OpenID account, please visit the <a href="/oid.php">account creation page</a>.');
    exit;
}

if(!preg_match('/(^[=@$+!]|\.|^http:\/\/)/',$_GET["openid_url"])) {
  $_GET["openid_url"] = 'http://idbin.ca/'.urlencode($_GET["openid_url"]);
}

$scheme = 'http';
if (isset($_SERVER['HTTPS']) and $_SERVER['HTTPS'] == 'on') {
    $scheme .= 's';
}

$openid = $_GET['openid_url'];
$process_url = sprintf("$scheme://%s/oid_finish.php?redir=%s",
                       $_SERVER['SERVER_NAME'], urlencode($_SERVER["HTTP_REFERER"])
                       );

$trust_root = sprintf("$scheme://%s",$_SERVER['SERVER_NAME']); #,$_SERVER['SERVER_PORT']);

// Begin the OpenID authentication process.
$auth_request = $consumer->begin($openid);

// Handle failure status return values.
if (!$auth_request) {
    if(!preg_match('/(^[=@$+!]|^http:\/\/)/',$_GET["openid_url"])) {
        $_GET["openid_url"] = 'http://idbin.ca/'.urlencode($_GET["openid_url"]);
        $openid = $_GET['openid_url'];
        $auth_request = $consumer->begin($openid);
        if(!$auth_request) {
            Template::Error('authentication error', 'Sorry, there was a general authentication error. Please go back and check your username for accuracy. It should be a valid OpenID username.</p><p>If you need an account, <a href="/oid.php">you can get a new OpenID here</a>.');
            exit;
        }
    } else {
        Template::Error('authentication error', 'Sorry, there was a general authentication error. Please go back and check your username for accuracy. It should be a valid OpenID username.</p><p>If you need an account, <a href="/oid.php">you can get a new OpenID here</a>.');
        exit;
    }
}

if(!Account::existsByOID($_GET["openid_url"])) {
  $auth_request->addExtensionArg('sreg', 'optional', 'email,nickname,fullname,country,language,timezone');
}

// Redirect the user to the OpenID server for authentication.  Store
// the token for this authentication so we can verify the response.

$redirect_url = $auth_request->redirectURL($trust_root,
                                           $process_url);

header("Location: ".$redirect_url);
?>
