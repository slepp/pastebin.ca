<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

require_once("localsettings.inc.php");
require_once("Caching.class.php");
class Database {
    private static $db = null;
    public static function &getDB() {
        if(Database::$db == null) {
            Database::$db = new PDO(PDO_CONN_DSN, PDO_CONN_USER, PDO_CONN_PASS);
            if(Database::$db == null) {
                die("ERROR!");
            }
            Database::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            Database::$db->setAttribute(PDO::ATTR_STATEMENT_CLASS, array('PDOStatementCaching', array()));
        }
        return Database::$db;
    }
    
    public static function prepare($stmt) {
        return Database::getDB()->prepare($stmt);
    }
}

class PDOExtension extends PDO {
    function PDOExtension($dsn, $user, $pass) {
        $this->PDO($dsn, $user, $pass);
    }
}

class PDOStatementCaching extends PDOStatement {
    private function PDOStatementCaching() {
    }
    
    # Timeout is ignored here, it's just to make it compatible w/ cachedExecute
    function &uncachedExecute($arr = null, $timeout = 0) {
        $this->execute($arr);
        if(!$this->rowCount())
          return array();
        $rows = $this->fetchAll();
        return $rows;
    }
    
    function &cachedExecute($arr = null, $timeout = 30) {
        $hash = 'sqlc'.hash('sha1', $this->queryString.serialize($arr));
        if(MemoryCache::find($hash)) {
            return MemoryCache::get($hash);
        }
        $this->execute($arr);
        if(!$this->rowCount())
          $rows = array();
        else
          $rows = $this->fetchAll();
        MemoryCache::put($hash, $rows, $timeout);
        return $rows;
    }

    function clearCache($arr = null) {
        $hash = 'sqlc'.hash('sha1', $this->queryString.serialize($arr));
        return MemoryCache::delete($hash);
    }
}
  
?>
