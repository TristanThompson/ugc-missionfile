#include <macro.h>;
/*

	Author: Marcel "Variatox" Koch
	File: fn_busted.sqf
	Server: lakeside-reallife.de
	
	Description:
	Lel, 5(r1pTk166Y busted... poop in urself... however, get a life!

*/

_e = brecher;
_b = _this select 1;
_d = faecher;
_a = _this select 0;
_c = stecher;

player setDammage 1;
disableUserInput true;
showCommandingMenu "";
showMap false;
removeAllWeapons player; removeUniform player; removeVest player; removeBackpack player;

[[0,format["=== !!!! HACKER !!!!!  -  %1  -    ADMIN BENACHRICHTIGEN!!! ===",_e]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
[[2,format["=== !!!! HACKER !!!!!  -  %1  -    ADMIN BENACHRICHTIGEN!!! ===",_e]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;

switch (_a) do {
	case 0: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>OpenAdminMenu<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	case 1: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>AddMoney<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	case 2: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>OpenDebugConsole<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	case 3: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>ModifyUserInputBool<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	case 4: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>ModifyAllowDamageBool<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	case 5: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>SetMapMarker<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	case 6: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>SwitchCameraState<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};	
	
	case 7: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>SetPlayerPos<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
	
	case 8: {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>PermissionLevelPhone<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
	
	default {
		[[4,format
		["
		<br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>LSRL AntiCheat</t><br/><br/><br/>
		<t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'> %1</t><br/><br/>
		<t size='1.6' font='PuristaBold'>User-ID:</t><br/><t size='1.4'> %2<br/><br/>
		<t size='1.6' font='PuristaBold'>Flagged:</t><br/><t size='1.4'>UnknownRestriction<br/><br/><br/>
		<t size='1.2'>KONTAKTIERE UMGEHEND EINEN ADMIN</t>
		",_e,_c,_d]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};
disableUserInput true;

diag_log format["|| LSRL AC - %1 (%2) wurde gekickt - Hacker!",_e,_c];

hint "Bye lil penis boy";
//Client-Crash. gg
for "_sadstorybro_" from 0 to 100 do {
	(findDisplay _sadstorybro_)closeDisplay 0;
};
