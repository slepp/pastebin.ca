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
			'include', 'switch'
			),
#		2 => array('SIP', 'IAX2', 'Local', 'H323', 'OH323', 'MGCP', 'Modem', 'Zap'),
		3 => array(
'AbsoluteTimeout','AddQueueMember','ADSIProg','AgentCallbackLogin','AgentLogin','AgentMonitorOutgoing','AGI',
'AlarmReceiver','Answer','AppendCDRUserField','Authenticate','BackGround','BackgroundDetect','Busy','CallingPres',
'ChangeMonitor','ChanGrab','ChanIsAvail','CheckGroup','Congestion','ControlPlayback','Curl','Cut','DateTime','DBdel',
'DBdeltree','DBget','DBput','DeadAGI','Dial','DigitTimeout','Directory','DISA','DumpChan','DUNDiLookup','EAGI','Echo',
'EndWhile','EnumLookup','Eval','Exec','ExecIf','Festival','Flash','ForkCDR','GetCPEID','GetGroupCount','GetGroupMatchCount',
'Goto','GotoIf','GotoIfTime','Hangup','HasNewVoicemail','HasVoicemail','IAX2Provision','icd_add_member','icd_agent','icd_agent_callback',
'icd_customer','icd_customer_callback','icd_logout','icd_queue','icd_remove_member','ICES','ImportVar','LookupBlacklist','LookupCIDName',
'Macro','MacroIf','MailboxExists','Math','MeetMe','MeetMeAdmin','MeetMeCount','Milliwatt','Monitor','MP3Player','MusicOnHold',
'NBScat','NoCDR','NoOp','ODBCdel','ODBCdeltree','ODBCget','ODBCput','Park','ParkAndAnnounce','ParkedCall','Playback','Playtones',
'Prefix','PrivacyManager','Progress','Queue','Random','Read','RealTime','RealTimeUpdate','Record','RemoveQueueMember','ResetCDR',
'ResponseTimeout','Ringing','RxFAX','SayAlpha','SayDigits','SayNumber','SayPhonetic','SayUnixTime','SendDTMF','SendImage','SendText',
'SendURL','SetAccount','SetAMAFlags','SetCallerID','SetCallerPres','SetCDRUserField','SetCIDName','SetCIDNum','SetGlobalVar',
'SetGroup','SetLanguage','SetMusicOnHold','SetVar','SIPAddHeader','SIPDtmfMode','SIPGetHeader','SMS','SoftHangup','StopMonitor','StopPlaytones',
'StripLSD','StripMSD','SubString','Suffix','System','TestClient','TestServer','Transfer','TrySystem','TxFAX','TXTCIDName','UserEvent',
'Verbose','VMAuthenticate','VoiceMail','VoiceMailMain','Wait','WaitExten','WaitExtenOrContinue','WaitForRing','WaitForSilence',
'WaitForVoice','WaitMusicOnHold','While','Zapateller','ZapBarge','ZapRAS','ZapScan',
			)
		),
	'SYMBOLS' => array(
		'(', ')', '[', ']', '!', '@', '%', '&', '*', '|', '/', '<', '>'
		),
	'CASE_SENSITIVE' => array(
		GESHI_COMMENTS => false,
		1 => false,
		2 => false,
		3 => false,
		),
	'STYLES' => array(
		'KEYWORDS' => array(
			1 => 'color: #717100;',
			2 => 'color: #ff0000;',
			3 => 'color: #000066;'
			),
		'COMMENTS' => array(
			1 => 'color: #808080; font-style: italic;',
			2 => 'color: #00ff00; font-style: bold;',
			),
		'ESCAPE_CHAR' => array(
			0 => 'color: #000099; font-weight: bold;'
			),
		'BRACKETS' => array(
#			0 => 'color: #006600;'
			),
		'STRINGS' => array(
			0 => 'color: #ff0000;'
			),
		'NUMBERS' => array(
#			0 => 'color: #0000ff;'
			),
		'METHODS' => array(
			),
		'SYMBOLS' => array(
			0 => 'color: #66cc66;'
			),
		'REGEXPS' => array(
			0 => 'color: #006600;',
			1 => 'color: #660000;',
			2 => 'color: #0000ff;',
			3 => 'color: #990000;',
			4 => 'color: #ff0000;',
			),
		'SCRIPT' => array(
			)
		),
	'URLS' => array(
		1 => '',
		3 => 'http://www.voip-info.org/tiki-index.php?page=Asterisk+cmd+{FNAME}'
		),
	'OOLANG' => false,
	'OBJECT_SPLITTERS' => array(
		),
	'REGEXPS' => array(
		0 => "\\[[^\\]]+\\]",
		1 => '\\$\\{[a-zA-Z_][a-zA-Z0-9_:]*?\\}',
		2 => '_([0-9NX.]+)',
		3 => '(SIP/([0-9A-Za-z-_@]+)?|Zap/[gr0-9]+(/[0-9ABCD]+)?)'
		),
	'STRICT_MODE_APPLIES' => GESHI_NEVER,
	'SCRIPT_DELIMITERS' => array(
		),
	'HIGHLIGHT_STRICT_BLOCK' => array(
		1 => true,
		2 => true,
		3 => true
		)
);

?>
