/*

	Resets market by calling marketConfiguration

*/
if(call(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_Error";};
if(!(getPlayerUID player in (life_8_b4lls))) exitWith {closeDialog 0; [8,player] call LRLAC_fnc_busted;};

[] call life_fnc_marketconfiguration;

[0,format["ADMIN: %1 hat die Marktpreise auf Standard gesetzt.",name player]] remoteExec ["life_fnc_broadcast",-2];

hint "Markpreise resettet.";