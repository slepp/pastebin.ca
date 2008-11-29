<?php
require_once("Database.class.php");
require_once("Caching.class.php");
require_once("handler.inc.php");

define('RANDOM_CHARACTER_LIST', '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-');
define('RANDOM_START_CHARACTER_LIST', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
define('PASTE_SELECT_SQL',
       "SELECT ".
       "    bin.*,".
       "    EXTRACT(EPOCH FROM bin.posted) AS epoch,".
       "    COALESCE(ltree2text(bin_ltree.path),bin.id::text) AS path,".
       "    (SELECT COUNT(*)-1 FROM bin_ltree l WHERE path <@ bin_ltree.path) AS children,".
       "    NLEVEL(path)-1 AS ascendants,".
       "    types.handler,".
       "    hits,".
       "    (SELECT count(*) FROM trackbacks WHERE trackbacks.bin_id=bin.id) AS trackbacks".
       "  FROM bin".
       "    JOIN types ON types.id=bin.type".
       "    LEFT OUTER JOIN bin_ltree ON bin_ltree.bin_id=bin.id".
       "    JOIN bin_hits ON bin_hits.bin_id=bin.id");

class Paste {
    var $id;
    var $poster;
    var $remote;
    var $content;
    var $posted;
    var $epoch;
    var $type;
    var $user_id;
    var $formatted_content;
    var $highlighter_timestamp;
    var $expiry;
    var $expires;
    var $description;
    var $poster_id;
    var $md5;
    var $cipher;
    var $id_mask;
    var $lang;
    var $acct_id;
    var $path;
    var $children;
    var $ascendants;
    var $hits;
    var $trackbacks;
    
    function Paste($id = null) {
        if($id != null)
          $this->load($id);
    }
    
    function load($id) {
        if(is_numeric($id)) { # Use numeric ID
            $stmt = Database::getDB()->prepare(PASTE_SELECT_SQL." WHERE bin.id=? AND (expires IS NULL OR expires > now())");
            $stmt->execute(array(intval($id)));
        } else if(is_string($id)) { # Assume id_mask
            $stmt = Database::getDB()->prepare(PASTE_SELECT_SQL." WHERE bin.id_mask=? AND (expires IS NULL OR expires > now())");
            $stmt->execute(array($id));            
        } else { # Hmm, not a good ID
            return false;
        }
        
        if($stmt->rowCount() != 1) {
            return false;
        }
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        
        $this->id =& $row['id'];
        $this->poster =& $row['poster'];
        $this->remote =& $row['remote'];
        $this->content =& $row['content'];
        $this->posted =& $row['posted'];
        $this->epoch =& $row['epoch'];
        $this->type =& new Type($row['type']);
        $this->user_id =& $row['user_id'];
        $this->formatted_content =& $row['formatted_content'];
        $this->highlighter_timestamp =& $row['highlighter_timestamp'];
        $this->expiry =& $row['expiry'];
        $this->expires =& $row['expires'];
        $this->description =& $row['description'];
        $this->poster_id =& $row['poster_id'];
        $this->md5 =& $row['md5'];
        $this->cipher =& $row['cipher'];
        $this->id_mask =& $row['id_mask'];
        $this->lang =& $row['lang'];
        $this->acct_id =& $row['acct_id'];
        $this->path =& $row['path'];
        $this->children =& $row['children'];
        $this->ascendants =& $row['ascendants'];
        $this->handler =& $row['handler'];
        $this->hits =& $row['hits'];
        $this->trackbacks =& $row['trackbacks'];
        
        return true;
    }

    function save() {
        Database::getDB()->beginTransaction();
        
        if(!isset($this->id) || empty($this->id)) {
            // Get a new ID
            $stmt = Database::prepare("SELECT nextval('bin_id_seq')");
            $arr =& $stmt->uncachedExecute();
            $this->id = $arr[0][0];
            
            // If it's encrypted, then forcibly expire it and mask it
            if(isset($this->cipher)) {
                $this->id_mask = $this->generateIDMask();
                if($this->expiry == "")
                  $this->expiry = '3 months';
            }
            
            $stmt = Database::prepare("INSERT INTO bin (id,poster,content,description,posted,type,remote,user_id,expiry,expires,     md5,id_mask,cipher,lang,acct_id) VALUES ".
                                                      "(?, ?,     ?,      ?,          now(), ?,   ?,     ?,      ?,now()+?::interval,?,  ?,      ?,     ?,   ?)");
            $stmt->execute(array($this->id, $this->poster, $this->content, $this->description, $this->type->id, $this->remote, $this->user_id, $this->expiry, $this->expiry,
                                 $this->md5, $this->id_mask, $this->cipher, $this->lang, $this->acct_id));
            
            $stmt = Database::prepare("INSERT INTO bin_ltree (bin_id,path) VALUES (?,?)");
            $stmt->execute(array($this->id, (!empty($this->path)?"{$this->path}.":"") . $this->id));
            
            $stmt = Database::prepare("INSERT INTO bin_hits (bin_id) VALUES (?)");
            $stmt->execute(array($this->id));
            
            #$stmt = Database::prepare("INSERT INTO postkey_to_bin (postkey_id,bin_id) 
            
        } else {
            
        }
        
        Database::getDB()->commitTransaction();
    }
    
    ## Generate a unique ID Mask for this paste
    function generateIDMask() {
        $str = "";
        if($len == -1)
          $len = mt_rand(6,8);
        $len-=2;
        $str .= substr(RANDOM_START_CHARACTER_LIST, mt_rand(0,25), 1);
        for($i = 0; $i < $len; $i++) {
            $str .= substr(RANDOM_CHARACTER_LIST, mt_rand(0,62), 1);
        }
        $str .= substr(RANDOM_CHARACTER_LIST, mt_rand(0,61), 1);
        return $str;
    }
    
    ## Encrypt a paste, and replace the content with the encryption.
    function encrypt($key, $algo = 'rijndael-256') {
        $this->content =& _encrypt($key, $algo, $this->content);
        if($this->description != null)
          $this->description =& _encrypt($key, $algo, $this->description);
        $this->cipher = $algo;
        return true;
    }
    
    ## Attempt to decrypt a paste. Returns FALSE on failure.
    function decrypt($key) {
        if($this->cipher == null)
          return false;
        
        $data_content =& _decrypt($key, $this->cipher, $this->content);
        if($this->description != null)
          $data_description =& _decrypt($key, $this->cipher, $this->description);
        
        if($data_content !== false) {
            $this->content =& $data;
            if($this->description != null)
              $this->description =& $data_description;
            return true;
        }
        
        return false;
    }
    
    ## This function returns the highlighted paste content.
    ## If it isn't already highlighted, it will take care of it.
    function &highlightedContent() {
        if(isset($this->id)) {
            if(GeneralCache::find($this->id)) {
                return GeneralCache::get($this->id);
            }
            $handler = $this->handler."_handler";
            if(function_exists($handler))
              $highlighted = $handler($this->content);
            else
              $highlighted =& $this->content;
            GeneralCache::put($this->id, &$highlighted, 0);
            return $highlighted;
        }
        return false;
    }
    
    function owner($id) {
        if(isset($id) && !empty($id) && $this->acct_id == $id)
          return true;
        return false;
    }
        
    ## This function will clean up a paste to consistent standards
    function sanitize() {
        # Filter the name
        $this->name = preg_replace('/[^a-zA-Z0-9 .,_\?\'\!\/\[\]\{\}\(\)@#$%^*+:;\\\|-]/', "", $_POST["name"]);
        if(strlen($this->name) > 32)
          $this->name = substr($this->name, 0, 32);
    }
}

class Type {
    var $id;
    var $name;
    var $description;
    var $handler;
    var $highlighter_name;
    
    function Type($id = null) {
        if($id != null)
          $this->load($id);
    }
    
    function load($id) {
        $stmt = Database::getDB()->prepare("SELECT * FROM types WHERE id=?");
        $stmt->execute(array($id));            
        
        if($stmt->rowCount() != 1) {
            return false;
        }
        
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        
        $this->id               =& $row['id'];
        $this->name             =& $row['name'];
        $this->description      =& $row['description'];
        $this->handler          =& $row['handler'];
        $this->highlighter_name =& $row['highlighter_name'];
        
        return true;
    }
}
?>
