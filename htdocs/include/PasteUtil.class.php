<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

class PasteUtil {
    public static function &getRecent($userId = null, $limit = 15) {
        if($userId != null) {
            $stmt = Database::prepare("SELECT bin.id, bin.poster, date_trunc('second'::text, age(now(), bin.posted)) AS age, types.name, ".
                                      " date_part('epoch'::text, bin.posted) AS posted, date_part('epoch'::text, bin.expires) AS expires ".
                                      " FROM bin, types ".
                                      " WHERE types.id = bin.\"type\" AND bin.user_id=? AND (bin.expires IS NULL OR bin.expires > now()) AND bin.id_mask IS NULL ".
                                      " ORDER BY bin.id DESC LIMIT ?");
            $arr =& $stmt->cachedExecute(array($userId, $limit), 600);
        } else {
            $stmt = Database::prepare("SELECT * FROM bin_recent_list LIMIT ?");
            $arr =& $stmt->cachedExecute(array($limit), 60);
        }
        $stmt = null;
        return $arr;
    }    
    
    public static function mostRecent($userId = null) {
        if($userId != null) {
            $stmt = Database::prepare("SELECT MAX(id) FROM bin WHERE user_id=? AND (expires IS NULL OR expires > now())");
            $stmt->execute(array($userId));
        } else {
            $stmt = Database::prepare("SELECT MAX(id) FROM bin WHERE user_id IS NULL AND (expires is NULL or expires > now())");
            $stmt->execute();
        }
        $res = $stmt->fetch();
        $stmt = null;
        return $res['max'];
    }
}

class TypeUtil {
    public static function &getOptionList() {
        $stmt = Database::prepare("SELECT id,name FROM types ORDER BY name");
        $arr =& $stmt->uncachedExecute(null, 86400);
        $stmt = null;

        foreach($arr as $v) {
            $ret[$v['id']] = $v['name'];
        }
        
        return $ret;
    }
}


?>
