/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
/*sleep 0.2;
_syncsucces = "\A3L_Client2\tablet_new\other\syncmenu\syncmenu.paa";
_cannotsync = "\A3L_Client2\tablet_new\other\syncmenu\cannotsync.paa";*/

_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

[] call life_fnc_roundMoney;
[] call SOCK_fnc_updateRequest;
systemChat "TETRIS> Spielstand wurde erfolgreich gespeichert!";

playSound "synced";

lrl_sell = true;
lrl_buy = true;

[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};