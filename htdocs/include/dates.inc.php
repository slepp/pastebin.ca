<?php
/*
  This file is part of the Pastebin package.
  Copyright (c) 2003-2008, Stephen Olesen
  All rights reserved.
  More information is available at http://pastebin.ca/
*/

class Duration {
	var $_LongNames = array('year','month','week','day','hour','minute','second');
	var $_ShortNames = array('yr','mth','wk','day','hr','min','sec');
	var $_Steps = array(31557600,2592000,604800,86400,3600,60,1);

	var $names, $steps, $terse;

	function Duration() { $this->__construct(); }
	function __construct() {
		$this->names =& $this->_LongNames;
		$this->steps =& $this->_Steps;
		$this->terse = false;
	}

	function short($bool = true) {
		if($bool)
			$this->names =& $this->_ShortNames;
		else
			$this->names =& $this->_LongNames;
	}

	function terse($terse = true) {
		$this->terse = $terse;
	}

	function Now() {
	        $gtod = gettimeofday();
        	$now = bcadd($gtod['sec'], bcdiv($gtod['usec'], 1000000, 6), 6);
		return $now;
	}

	function Diff($now, $then) {
		return bcsub($now, $then, 6);
	}

	function Age($when) {
		return $this->_age($when);
	}

	function AgeAsArray($when) {
		$arr = $this->_age($when);
		return $arr[2];
	}

	function AgeAsHash($when) {
		$arr = $this->_age($when);
		return $arr[1];
	}

	function AgeAsString($when) {
		$arr = $this->_age($when);
		return $arr[0];
	}

	private function _age($when, $step = 0, &$str = "", &$arr = array(), &$arr2 = array()) {
		if($when > 0 && $step < count($this->steps)) {
			if($when >= $this->steps[$step]) {
				$span = floor($when / $this->steps[$step]);
				$when %= $this->steps[$step];
				$arr[$this->_LongNames[$step]."s"] = $span;
				$arr2[] = $span." ".$this->names[$step].($span==1?"":"s");

				if($this->terse && !empty($str))
					$str .= " ";
				else if(!empty($str) && $when != 0)
					$str .= ", ";
				else if(!empty($str) && $when == 0 && count($arr) < 3)
					$str .= " and ";
				else if(!empty($str) && $when == 0 && count($arr) >= 3)
					$str .= ", and ";

				$str .= $span." ".$this->names[$step].($span==1?"":"s");
			}
			list($str, $arr) = $this->_age($when, $step + 1, &$str, &$arr, &$arr2);
		}
		return array((!empty($str)?$str:"less than 1 second"), &$arr, &$arr2);
	}
}

if (!function_exists('jddayofweek')) {
    function jddayofweek($a_jd,$a_mode){
        $tmp = get_jd_dmy($a_jd) ;
        $a_time = "$tmp[0]/$tmp[1]/$tmp[2]" ;
        switch($a_mode) {
         case 1:
            return strftime("%A, %d, %y",strtotime("$a_time")) ;
         case 2:
            return strftime("%a",strtotime("$a_time")) ;
         default:
            return strftime("%w",strtotime("$a_time")) ;
        }
    }
}

function simpleDate($params, &$smarty) {
    $t = ceil($params['time']);
    $n = time()+21600;
    $s = "";

    if($n == $t)
      return 'Now';

    $n -= $n%86400;

    if($t >= $n) {
        return 'Today';
    }

    $n -= 86400;

    if($t >= $n) {
        return 'Yesterday';
    }

    $n -= (86400-6);  # Week prior

    if($t >= $n) {
/*        $m = intval(strftime("%m", $t));
        $d = intval(strftime("%d", $t));
        $y = intval(strftime("%Y", $t));
        $h = intval(strftime("%H", $t));
        $min = intval(strftime("%M", $t));
        $s = intval(strftime("%S", $t));

        $a = ((14 - $m)/12);
        $y = $y + 4800 - $a;
        $m = $m + (12*$a) - 3;
        # JDN in Gregorian
        $jdn = $d + ((153*$m+2)/5) + (365*$y) + ($y/4) - ($y/100) + ($y/400) - 32045 + ( (($h-12)/24) + ($min/1440) + ($s/86400) );
        # JDN in Julian
        #$jdn = $d + ((153*$m+2)/5) + (365*$y) + ($y/4) - 32083;
        return $jdn; */
        return strftime("%A", $t);
    }

    $n = time();
    $n -= $n%86400;
    $n -= 365.25 * 86400;
    if($t >= $n) {
        return strftime("%B %e", $t);
    }

    return strftime("%B %e, %Y", $t);
}

function age($params, &$smarty) {
    $d = new Duration();
    $d->short();
    $d->terse();
    $a = $d->AgeAsArray(ceil($d->Diff(time(), $params["time"])));
    if(isset($params['steps'])) {
        return join(' ', array_slice($a, 0, $params['steps']));
    }
    return join(' ', $a);
}
?>
