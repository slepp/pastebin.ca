<?php
require_once('include/global.inc.php');

require_once "oid_common.php";

// Complete the authentication process using the server's response.
$response = $consumer->complete($_GET);

if ($response->status == Auth_OpenID_CANCEL) {
    // This means the authentication was cancelled.
    Template::Error("Verification Canceled", "The verification process was canceled. You may wish to try again.");
    exit;
} else if ($response->status == Auth_OpenID_FAILURE) {
    Template::Error("OpenID Authentication Failed", "The OpenID authentication attempt failed with this message: <b>".$response->message."</b>");
    exit;
} else if ($response->status == Auth_OpenID_SUCCESS) {
    // This means the authentication succeeded.
    $openid = $response->identity_url;
    if ($response->endpoint->canonicalID) {
        $canon = $response->endpoint->canonicalID;
    }

    $sreg = $response->extensionResponse('sreg');

    $addition = false;
    if($_SESSION['user']['authed'] && $_SESSION["user"]["official"] != ($canon?$canon:$openid)) {
        # New OpenID associated
        $u = new Account($_SESSION["user"]["official"]);
        $u->addUsername(($canon?$canon:$openid), $openid);
        $addition = true;
    }
    
    $_SESSION['user']['authed'] = true;
    $_SESSION['user']['username'] = $openid;
    
    if(isset($canon))
      $_SESSION["user"]["canon"] = $canon;
    else
      unset($_SESSION["user"]["canon"]);
    
    $_SESSION["user"]["official"] = ($_SESSION["user"]["canon"]?$_SESSION["user"]["canon"]:$_SESSION["user"]["username"]);
    
    if(!$addition) {
        $acct = Account::existsByOID($_SESSION["user"]["official"]);
        if($acct === false) {
            $acct = Account::createAccount();
            $acct->addUsername($_SESSION["user"]["official"], $_SESSION["user"]["username"]);
            $acct->setDetails($id, $sreg);
            //$acct->save();
            if(isset($_COOKIE["pbguid"])) {
                $acct->setGUID($_COOKIE["pbguid"]);
            }
            $acct->setAPIKey(makeApiKey());
            $acct = new Account($acct->id);
        } else {
            $acct = new Account($acct);
            $acct->updateLastLogin();
        }
        $acct->load($acct->id);
        $_SESSION["user"]["id"] = $acct->id;
        $_SESSION["user"]["prefs"] = $acct->prefs;
        $_SESSION["user"]["nick"] = (!empty($acct->nickname)?$acct->nickname:$openid);
        $_SESSION["user"]["fullname"] = $acct->fullname;
        $_SESSION["user"]["apikey"] = $acct->apikey;
        $_SESSION["user"]["guid"] = $acct->guid;
        $_SESSION["user"]["adminLevel"] = $acct->adminLevel;
        $_SESSION["user"]["timezone"] = $acct->timezone;
    } else {
        Template::Simple("New OpenID Associated", "Thank you! Your new OpenID username has been associated with this account. You may now <a href='/settings.php'>continue with more settings</a>.");
        exit;
    }
    session_write_close();
    if(isset($_GET["redir"])) {
        if(preg_match(',/login\.php$,',$_GET["redir"])) {
            header("Location: http://".$_SERVER["SERVER_NAME"]);
        } else if(preg_match(',/oid\.php$,',$_GET["redir"])) {
            header("Location: http://".$_SERVER["SERVER_NAME"]."/settings.php");
        } else {
            header("Location: ".$_GET["redir"]);
        }
    } else {
        header("Location: http://".$_SERVER["SERVER_NAME"]);
    }
} else {
    Template::Error("General Authentication Failure", "Sorry, there was a general authentication failure.. <a href=\"/login.php\">Please try again.</a>");
    exit;
}
?>
