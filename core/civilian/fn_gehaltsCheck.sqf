/*
	File: fn_gehaltsCheck.sqf
	Author: Bastian "Janl1.DE" Schumacher
  Server: lakeside-reallife.de

	Description:
	24h PayCheck für bestimmte Gruppen
*/

private ["_player", "_group"];
closeDialog 0;

lrl_coinsCheck = true;

_group = "NULL";
_player = player;
_pid = getPlayerUID player;

if(playerSide != civilian) exitWith {hint "Gehaltschecks können nur von Zivilisten abgehoben werden.";};
if(!license_civ_wsd) exitWith {hint "Es wurde kein Gehaltscheck für dich gefunden!";};
if(lrl_coinsDelay) exitWith  {hint "Du kannst nur alle 15 Minuten eine Abfrage durchfuehren!";};

lrl_coinsDelay = true;

if(license_civ_wsd) then {_group = "WSD";};

[player, _group, _pid] remoteExec ["UGC_fnc_getGehaltsCheck", 2];

[] spawn {
	sleep (60 * 10);
	lrl_coinsDelay = false;
};
