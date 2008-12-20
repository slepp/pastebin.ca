<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

/*abstract class CachingClass {
    abstract public static function find($id);
    abstract public static function &get($id);
    abstract public static function put($id, $val, $timeout = 0);
    abstract public static function delete($id);
}*/

interface Cache {
    public static function find($id);
    public static function &get($id);
    public static function put($id, $val, $timeout = 0);
    public static function delete($id);    
}

class DiskCache implements Cache {
    public static function find($id) {
        if(file_exists("/tmp/hcache-$id")) {
            return true;
        }
        return false;
    }
    
    public static function &get($id) {
        if(GeneralCache::find($id)) {
            $data =& unserialize(file_get_contents("/tmp/hcache-$id"));
            return $data;
        }
        return false;
    }
    
    public static function put($id, $val, $timeout = 0) {
        $fd = fopen("/tmp/hcache-$id", "w");
        flock($fd, LOCK_EX);
        fwrite($fd, serialize($val));
        fclose($fd);
    }
    
    public static function delete($id) {
        if(file_exists("/tmp/hcache-$id"))
          unlink("/tmp/hcache-$id");
    }
}

class MemoryCache implements Cache {
    private static $mc = null;
    
    private static function &getMC() {
        if(MemoryCache::$mc == null) {
            MemoryCache::$mc = new Memcache;
            MemoryCache::$mc->pconnect('127.0.0.1', '11211');
        }
        return MemoryCache::$mc;
    }
    
    public static function find($id) {
        if(MemoryCache::getMC()->get("mC".$id))
          return true;
        return false;
    }
    
    public static function &get($id) {
        return MemoryCache::getMC()->get("mC".$id);
    }
    
    public static function put($id, $val, $timeout = 30) {
        return MemoryCache::getMC()->set("mC".$id, $val, 0, $timeout);
    }
    
    public static function delete($id) {
        return MemoryCache::getMC()->delete("mC".$id);
    }
}

class GeneralCache implements Cache {
    public static function find($id) {
        if(MemoryCache::find($id) || DiskCache::find($id))
          return true;
        return false;
    }
    
    public static function &get($id) {
        if(MemoryCache::find($id))
          return MemoryCache::get($id);
        if(DiskCache::find($id))
          return DiskCache::get($id);
        return null;
    }
    
    public static function put($id, $val, $timeout = 30) {
        $res = MemoryCache::put($id, $val, $timeout);
        $res &= DiskCache::put($id, $val);
        return $res;
    }
    
    public static function delete($id) {
        $res = MemoryCache::delete($id);
        $res &= DiskCache::delete($id);
        return $res;
    }
}
?>
