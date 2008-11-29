<?php
/*************************************************************************************
 * bash.php
 * --------
 * Author: Andreas Gohr (andi@splitbrain.org)
 * Copyright: (c) 2004 Andreas Gohr, Nigel McNie (http://qbnz.com/highlighter)
 * Release Version: 1.0.6
 * CVS Revision Version: $Revision: 1.1 $
 * Date Started: 2004/08/20
 * Last Modified: $Date: 2005/01/29 01:48:39 $
 *
 * BASH language file for GeSHi.
 *
 * CHANGES
 * -------
 * 2004/11/27 (1.0.2)
 *  -  Added support for multiple object splitters
 * 2004/10/27 (1.0.1)
 *   -  Added support for URLs
 * 2004/08/20 (1.0.0)
 *   -  First Release
 *
 * TODO (updated 2004/11/27)
 * -------------------------
 * * Get symbols working
 * * Highlight builtin vars
 *
 *************************************************************************************
 *
 *     This file is part of GeSHi.
 *
 *   GeSHi is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   GeSHi is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with GeSHi; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 ************************************************************************************/

$language_data = array (
	'LANG_NAME' => 'Asterisk Configuration',
	'COMMENT_SINGLE' => array(1 => ';', 2 => '#include'),
	'COMMENT_MULTI' => array(),
	'CASE_KEYWORDS' => GESHI_CAPS_NO_CHANGE,
	'QUOTEMARKS' => array('"'),
	'ESCAPE_CHAR' => '\\',
	'KEYWORDS' => array(
		1 => array(
			'exten', 'static', 'writeprotect', 'autofallthrough',
			'include', 'switch', 'autocreatepeer', 'context', 'recordhistory',
			'realm', 'port', 'bindaddr', 'srvlookup', 'pedantic', 'tos',
			'maxexpirey', 'maxexpiry', 'defaultexpirey', 'defaultexpiry',
			'notifymimetype', 'videosupport', 'canreinvite', 'disallow',
			'allow', 'musicclass', 'language', 'relaxdtmf', 'rtptimeout',
			'rtpholdtimeout', 'trustrpid', 'progressinband', 'useragent',
			'nat', 'promiscredir', 'dtmfmode', 'register', 'username',
			'secret', 'md5secret', 'host', 'defaultip', 'accountcode',
			'permit', 'deny', 'auth', 'callgroup', 'pickupgroup', 'insecure',
			'callerid', 'amaflags', 'incominglimit', 'outgoinglimit',
			'restrictcid', 'mailbox', 'template', 'fromdomain', 'fromuser',
			'mask', 'qualify',
			'dbsecret', 'mailboxdetail', 'trunk', 'auth', 'notransfer',
			'jitterbuffer', 'defaultip', 'regexten', 'peercontext',
			'sendani', 'outkey', 'inkeys', 'timezone', 'setvar',
			'autologoff', 'ackcall', 'wrapuptime', 'musiconhold',
			'updatecdr', 'group', 'recordagentcalls', 'recordformat',
			'createlink', 'urlprefix', 'savecallsin', 'custom_beep',
			'agent',
			'alignment', 'greeting',
			'timestampformat', 'eventcmd', 'eventspooldir', 'logindividualevents',
			'fdtimeout', 'sdtimeout', 'loudness', 'db-family',
			'autoanswer', 'extension', 'silencesuppression', 'silencethreshold',
			'input_device', 'output_device',
			'astetcdir', 'astmoddir', 'astvarlibdir', 'astagidir', 'astspooldir',
			'astrundir', 'astlogdir',
			'dsn', 'username', 'password', 'loguniqueid',
			'hostname', 'dbname',
			'department', 'organization', 'locality', 'stateprov', 'country', 'email',
			'phone', 'entityid', 'ttl', 'autokill', 'secretpath', 'mapserver',
			'mapport', 'mapinterval', 'mapcontext', 'mappeers_per_pkt', 'storehistory',
			'model', 'inkey', 'order',
			'search', 'h323driver',
			'parkext', 'parkpos', 'parkingtime', 'transferdigittimeout', 'courtesytone',
			'adsipark', 'pickupexten',
			'usecache', 'cachedir', 'festivalcommand',
			'tos', 'gatekeeper', 'allowgkrouted', 'e164', 'prefix',
			'iaxcompat', 'delayreject', 'bandwidth', 'jitterbuffer',
			'dropcount', 'maxjitterbuffer', 'maxexcessbuffer', 'minexcessbuffer', 'jittershrinkrate',
			'trunkfreq', 'authdebug',
			'server', 'altserver', 'serverport', 'codec', 'flags',
			'country', 'description', 'ringcadance', 'dial', 'busy', 'ring', 'congestion',
			'callwaiting', 'dialrecall', 'record', 'info', 'alias',
			'debug', 'console', 'dateformat', 'messages', 'full', 'queue_log',
			'enabled', 'read', 'write',
			'conf',
			'line', 'threewaycalling', 'cancallforward', 'callwaiting',
			'driver', 'type', 'stripmsd', 'dialtype', 'mode', 'device', 'msn',
			'incomingmsn', 'outgoingmsn',
			'autoload', 'noload', 'load',
			'listenAddress', 'listenPort', 'connectPort', 'tcpStart', 'tcpEnd',
			'udpStart', 'udpEnd', 'fastStart', 'h245Tunnelling', 'h245inSetup',
			'inBandDTMF', 'silenceSuppression', 'jitterMin', 'jitterMax',
			'ipTos', 'outboundMax', 'inboundMax', 'simultaneousMax',
			'bandwidthLimit', 'wrapLibTraceLevel', 'libTraceLevel', 'libTraceFile',
			'gatekeeper', 'gatekeeperPassword', 'gatekeeperTTL', 'userInputMode',
			'gwprefix', 'frames',
'AllowGKRouted','UseLoopDrop','accelerate','accountCode','accountcode','ackcall','adsi','adsipark','agent',
'alias','alignment','allow','altserver','amaFlags','amaflags','announce','announce-frequency','announce-holdtime',
'announce-round-seconds','astagidir','astetcdir','astlogdir','astmoddir','astrundir','astspooldir','astvarlibdir',
'attach','auth','authdebug','autoanswer','autocreatepeer','autofallthrough','autokill','autoload','autologin',
'autologoff','bal1','bal2','bal3','bandwidth','bandwidthLimit','bindaddr','board','busy','cacert','cachedir',
'callback','callerid','calleridcallwaiting','callgroup','callreturn','callwait','callwaiting','callwaitingcallerid','cancallforward',
'canreinvite','cards','chan_modem.so','channel','codec','conf','congestion','connectPort','connection','console','context',
'country','courtesytone','createlink','custom_beep','dateFormat','dateformat','db-family','dbfile','dbname','dboption','dbsecret',
'debug','default','defaultexpirey','delayreject','delete','deny','department','description','device','dial','dialout','dialrecall',
'dialtype','directoryintro','disallow','dring1','dring1context','dring2','dring2context','dring3','dring3context','driver',
'dropcount','dsn','dtmfmode','dundi-test','dundi_context','dynamic','e164','echocancel','echocancelwhenbridged','element',
'email','emailbody','emailsubject','enabled','entityid','enum.conf','envelope','eventcmd','eventspooldir','exten','extension',
'externnotify','facility','fast','fastStart','fdtimeout','festivalcommand','flags','format','frames','fromdomain','fromstring',
'fromuser','full','gatekeeper','gatekeeperPassword','gatekeeperTTL','gmt','greeting','group','gwprefix','h245Tunnelling','h245inSetup',
'h323driver','hangtime','hears','hidecallerid','host','hostname','iaxcompat','id','idrecording','idtime','immediate','inBandDTMF',
'inboundMax','include','incominglimit','incomingmsn','info','inkey','inkeys','input_device','insecure','iobase','ipTos','jitterMax','jitterMin',
'jitterbuffer','jittershrinkrate','keepAlive','keepalive','label','language','libTraceFile','libTraceLevel','line','linelabel',
'listenAddress','listenPort','localcert','locality','logindividualevents','loguniqueid','loudness','mailbox','mailboxdetail','mailcmd',
'mapcontext','mapinterval','mappeers_per_pkt','mapport','mapserver','maxconnections','maxexcessbuffer','maxexpirey','maxgreet','maxjitterbuffer',
'maxlen','maxlogins','maxmessage','maxretries','maxsilence','meetme.conf','member','messages','minexcessbuffer','minmessage','mode',
'model','monitor-format','monitor-join','mountain','msn','muppets','music','musicclass','musiconhold','name','nat','network','nextaftercmd',
'noload','notifymimetype','notransfer','notransfers','operator','order','organization','outboundMax','outgoing','outgoinglimit','outgoingmsn',
'outkey','output_device','parkext','parkingtime','parkpos','pass','password','pbxskip','pedantic','permit','phone','pickupexten','pickupgroup',
'pin','politeid','port','pre-connect','prefix','priv','privatekey','progressinband','promiscredir','qualify','queue-callswaiting','queue-holdtime',
'queue-minutes','queue-seconds','queue-thankyou','queue-thereare','queue-youarenext','queue_log','read','realm','record','recordagentcalls',
'recordformat','recordhistory','register','relaxdtmf','reload','remote','retry','retrydelay','retrylimit','review','ring','ringcadance','ringcadence',
'ringmobile','rtpend','rtpholdtimeout','rtpstart','rtptimeout','rxchannel','rxgain','rxhwgain','rxwink','savecallsin','saycid','sdtimeout','search',
'secret','secretpath','sendani','server','serveremail','serverport','servicepoint','signalling','silenceSuppression','silencesuppression',
'silencesupression','silencethreshold','simple','simultaneousMax','sipfriends','skipms','slow','source','speeddial','srvlookup','stateprov',
'static','std','storehistory','strategy','stripmsd','stutter','switchtype','syslog.local0','table','tcpEnd','tcpStart','template','threewaycalling',
'timeout','timestampformat','tonelist','tonezone','tos','totime','transfer','transferdigittimeout','trunk','trunkfreq','trustrpid','ttl','txchannel',
'txgain','txhwgain','type','tz','udpEnd','udpStart','updatecdr','urlprefix','usecache','usecallerid','usecallingpres','usedistinctiveringdetection',
'user','userInputMode','useragent','username','version','videosupport','voicemail','wrapLibTraceLevel','wrapuptime','write','writeprotect'
			),
		3 => array(
			)
		),
	'SYMBOLS' => array(
		'(', ')', '[', ']', '!', '@', '%', '&', '*', '|', '/', '<', '>'
		),
	'CASE_SENSITIVE' => array(
		GESHI_COMMENTS => false,
		1 => true,
		3 => true,
		),
	'STYLES' => array(
		'KEYWORDS' => array(
			1 => 'color: #b1b100;',
			3 => 'color: #000066;'
			),
		'COMMENTS' => array(
			1 => 'color: #808080; font-style: italic;',
			),
		'ESCAPE_CHAR' => array(
			0 => 'color: #000099; font-weight: bold;'
			),
		'BRACKETS' => array(
			0 => 'color: #66cc66;'
			),
		'STRINGS' => array(
			0 => 'color: #ff0000;'
			),
		'NUMBERS' => array(
			0 => 'color: #cc66cc;'
			),
		'METHODS' => array(
			),
		'SYMBOLS' => array(
			0 => 'color: #66cc66;'
			),
		'REGEXPS' => array(
			0 => 'color: #0000ff;',
			1 => 'color: #0000ff;',
			2 => 'color: #0000ff;'
			),
		'SCRIPT' => array(
			)
		),
	'URLS' => array(
		1 => '',
		3 => ''
		),
	'OOLANG' => false,
	'OBJECT_SPLITTERS' => array(
		),
	'REGEXPS' => array(
		0 => "\\[[^\\]]+\\]"
		),
	'STRICT_MODE_APPLIES' => GESHI_NEVER,
	'SCRIPT_DELIMITERS' => array(
		),
	'HIGHLIGHT_STRICT_BLOCK' => array(
		)
);

?>
