<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

class VirtualBin {
    var $id;
    var $username;
    var $password;
    var $hostname;
    var $private;
    var $email;
    var $active;
    var $fullname;
    var $notifier_method;
    var $notifier_params;
    var $title_name;
    var $bin_name;
    
    function VirtualBin($hostname = null) {
        if($hostname != null && $this->loadByHost($hostname))
          return;
        $this->setDefaultHost($hostname);
    }
    
    function loadByHost($hostname) {
        if(empty($hostname))
          return false;
        
        $stmt = Database::prepare("SELECT * FROM users WHERE hostname=LOWER(?) AND active");
        $res = $stmt->cachedExecute(array($hostname), 3600);
        $stmt = null;
        
        if(empty($res))
          return false;
        
        foreach(array('id','username','password','hostname','private','email','active','fullname','notifier_method','notifier_params','title_name') as $n) {
            $this->$n =& $res[$n];
        }
        
        if($this->active == 't')
          $this->active = true;
        else
          $this->active = false;

        if($this->private == 't')
          $this->private = true;
        else
          $this->private = false;

        $this->bin_name = ($this->title_name ? $this->title_name : $this->fullname);
        
        return true;
    }
    
    function setDefaultHost($hostname) {
        $this->id = null;
        $this->username = null;
        $this->password = null;
        $this->hostname = $hostname;
        $this->private = false;
        $this->email = null;
        $this->active = true;
        $this->fullname = _('General Pastebin');
        $this->notifier_method = null;
        $this->notifier_params = null;
        $this->title_name = _('General Pastebin');
        $this->bin_name = $this->title_name;
    }
}
?>
