<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require_once("Database.class.php");

class Account {
    var $id;
    var $nickname;
    var $fullname;
    var $email;
    var $country;
    var $language;
    var $timezone;
    var $active;
    var $created;
    var $last_login;
    var $identifiers;
    var $prefs;
    var $adminLevel;
    var $apikey;
    var $guid;
    
    function Account($id = null) {
        if($id != null)
          $this->load($id);
    }
    
    public static function createAccount() {
        $db =& Database::getDB();
        
        $db->beginTransaction();
        $stmt = $db->prepare("SELECT nextval('accounts_id_seq')");
        $stmt->execute();
        $row = $stmt->fetch();
        
        $id = $row[0][0];
        $stmt = $db->prepare("INSERT INTO accounts (id,created,last_login) VALUES (?,now(),now())");
        $stmt->execute(array($id));
        $db->commitTransaction();
        
        return new Account($id);
    }
        
    function addUsername($username, $username, $pretty) {
        if(!isset($this->id) || empty($this->id))
          return false;
                
        $stmt = Database::prepare("INSERT INTO account_identifiers (account_id,username,pretty_name) VALUES (?,lower(?),?)");
        $stmt->execute(array($this->id,$username,$pretty));
        return true;
    }
    
    function setDetails($sreg) {
        if(!isset($this->id) || empty($this->id))
          return false;
        
        $stmt = Database::prepare("UPDATE accounts (nickname,email,fullname,country,language,timezone,active) VALUES (?,?,?,?,?,?,?)");
        $stmt->execute(array($sreg['nickname'],$sreg['email'],$sreg['fullname'],$sreg['country'],$sreg['language'],$sreg['timezone'],'t'));
        
        return true;
    }
    
    function setAPIKey($key) {
        if(!isset($this->id) || empty($this->id))
          return false;

        $stmt = Database::prepare("INSERT INTO account_apikeys (acct_id,apikey) VALUES (?,?)");
        $stmt->execute(array($this->id, $key));
        return true;
    }
    
    function setGUID($guid) {
        if(!isset($this->id) || empty($this->id))
          return false;

        $stmt = Database::prepare("INSERT INTO account_guids (acct_id,guid) VALUES (?,?)");
        $stmt->execute(array($this->id, $guid));
        return true;
    }
    
    function updateLastLogin() {
        if(!isset($this->id) || empty($this->id))
          return false;
        
        $stmt = Database::prepare("UPDATE accounts SET last_login=now() WHERE id=?");
        $stmt->execute(array($this->id));
        return true;
    }
    
    function load($id) {
        if(is_numeric($id)) {
            $stmt = Database::prepare('SELECT accounts.*,account_apikeys.apikey,account_guids.guid FROM accounts LEFT OUTER JOIN account_apikeys ON account_apikeys.acct_id=accounts.id LEFT OUTER JOIN account_guids ON account_guids.acct_id=accounts.id WHERE id=?');
        } else if(is_string($id)) {
            $stmt = Database::prepare('SELECT accounts.*,account_apikeys.apikey,account_guids.guid FROM accounts LEFT OUTER JOIN account_apikeys ON account_apikeys.acct_id=accounts.id LEFT OUTER JOIN account_guids ON account_guids.acct_id=accounts.id WHERE id IN (SELECT account_id FROM account_identifiers WHERE username=lower(?)) LIMIT 1');
        } else {
            return false;
        }
        $arr =& $stmt->cachedExecute(array($id), 3);
        if(empty($arr))
          return false;
        $arr = $arr[0];
        
        $this->id =& $arr['id'];
        $this->nickname =& $arr['nickname'];
        $this->fullname =& $arr['fullname'];
        $this->email =& $arr['email'];
        $this->country =& $arr['country'];
        $this->language =& $arr['language'];
        $this->timezone =& $arr['timezone'];
        $this->active =& $arr['active'];
        $this->created =& $arr['created'];
        $this->last_login =& $arr['last_login'];
        $this->adminLevel = ($arr['admin'] == 't'?true:false);
        $this->apikey =& $arr['apikey'];
        $this->guid   =& $arr['guid'];
        
        $this->loadSettings();
        
        return true;
    }
    
    function save() {
        $stmt = Database::prepare("UPDATE accounts SET nickname=?,email=?,fullname=?,country=?,language=?,timezone=?,active=? WHERE id=?");
        $stmt->execute(array($this->nickname,
                             $this->email,
                             $this->fullname,
                             $this->country,
                             $this->language,
                             $this->timezone,
                             ($this->active?'t':'f'),
                             $this->id));
        
        $stmts = Database::prepare("SELECT acct_id FROM account_settings WHERE acct_id=? AND name=?");
        $stmt1 = Database::prepare("INSERT INTO account_settings (acct_id,name,value) VALUES (?,?,?)");
        $stmt2 = Database::prepare("UPDATE account_settings SET value=? WHERE acct_id=? AND name=?");
        foreach($this->prefs as $k => $v) {
            $stmts->execute(array($this->id, $k));
            if($stmts->rowCount())
              $stmt2->execute(array($v, $this->id, $k));
            else
              $stmt1->execute(array($this->id, $k, $v));
        }
        $stmt = null;
        $stmt1 = null;
        $stmt2 = null;
        
        return true;
    }
    
    function loadIdentifiers() {
        if(!isset($this->id) || empty($this->id)) {
            return false;
        }
        
        $stmt = Database::prepare("SELECT * FROM account_identifiers WHERE account_id=?");
        $this->identifiers =& $stmt->uncachedExecute(array($this->id));
        return count($this->identifiers);
    }
    
    function loadSettings() {
        if(!isset($this->id) || empty($this->id)) {
            return false;
        }

        $stmt = Database::prepare("SELECT name,value FROM account_settings WHERE acct_id=?");
        $arr =& $stmt->uncachedExecute(array($this->id));
        foreach($arr as $v) {
            $this->prefs[$v[0]] = $v[1];
        }
        
        return count($this->prefs);
    }
    
    public static function existsByOID($oid) {
        $stmt = Database::prepare('SELECT id FROM accounts WHERE accounts.id IN (SELECT account_id FROM account_identifiers WHERE username=lower(?)) LIMIT 1');
        $arr =& $stmt->cachedExecute(array($oid), 3);
        if(empty($arr))
          return false;
        return $arr[0][0];
    }
}
?>
