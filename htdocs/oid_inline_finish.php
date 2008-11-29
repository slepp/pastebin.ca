<?php
//require('template.php');
//session_start();

require_once "oid_common.php";

// Complete the authentication process using the server's response.
$response = $consumer->complete($_GET);

if ($response->status == Auth_OpenID_CANCEL) {
    // This means the authentication was cancelled.
    print 'Verification canceled.';
    exit;
} else if ($response->status == Auth_OpenID_FAILURE) {
    print "OpenID authentication failed: " . $response->message;
    exit;
} else if ($response->status == Auth_OpenID_SUCCESS) {
    OpenDatabase();
    
    // This means the authentication succeeded.
    $openid = $response->identity_url;
    if ($response->endpoint->canonicalID) {
        $canon = $response->endpoint->canonicalID;
    }

    $sreg = $response->extensionResponse('sreg');

    $addition = false;
    if($_SESSION["acct_auth"] && $_SESSION["acct_official"] != ($canon?$canon:$openid)) {
        # New OpenID associated
        $s = findAccount($_SESSION["acct_official"]);
        addAccountUsername($s['id'], ($canon?$canon:$openid), $openid);
        $addition = true;
    }
    
    $_SESSION["acct_auth"] = true;
    $_SESSION["acct_username"] = $openid;
    $_SESSION["acct_sreg"] = $sreg;
    
    if(isset($canon))
      $_SESSION["acct_canon"] = $canon;
    else
      unset($_SESSION["acct_canon"]);
    
    $_SESSION["acct_official"] = ($_SESSION["acct_canon"]?$_SESSION["acct_canon"]:$_SESSION["acct_username"]);
    
    if(!$addition) {
        $account = findAccount($_SESSION["acct_official"]);
        if($account === false) {
            $id = createAccount();
            addAccountUsername($id, $_SESSION["acct_official"], $_SESSION["acct_username"]);
            setAccountDetails($id, $sreg);
            if(isset($_COOKIE["pbguid"])) {
                setAccountGUID($id, $_COOKIE["pbguid"]);
            }
            setAccountAPIKey($id, makeApiKey());
            $account = findAccount($_SESSION["acct_official"]);
        } else {
            pg_Exec($DB, "UPDATE accounts SET last_login=now() WHERE id=".$account['id']);
        }
        $_SESSION["acct_id"] = $account['id'];
        $_SESSION["acct_sreg"] = $account;
        $_SESSION["kvp"] = findAccountKVP($account['id']);
    } else {
        pageHeader(_("new OpenID associated"));
        pageSidebar();
        makeSection(_("your new OpenID has been associated"));
        print '<p>Thank you! Your new OpenID username has been associated with this account. You may now <a href="/settings.php">continue with more settings</a>.</p>';
        pageFooter();
        exit;
    }
} else {
    print "Sorry, there was a general authentication failure.. <a href=\"/login.php\">Please try again.</a>";
    exit;
}
?>
