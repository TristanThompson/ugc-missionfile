/*
	File: fn_stempelUhrToggel.sqf
	Author: Bastian "Janl1.DE" Schumacher
	Server: lakeside-reallife.de
	
	Description:
	Die Stempeluhr die stempelt...
*/
params[
	["_status","",["NO_STATUS"]]
];

if(_status == "NO_STATUS") exitWith {hint "Es ist ein Fehler aufgetreten! 0x0087335286";};
if(_status != "LOGIN" OR _status != "LOGOUT") exitWith {hint "Es ist ein Fehler aufgetreten! 0x0041389283";};

if(_status == "LOGIN") then 
{
	if(lrl_stempelUhr) exitWith {hint "Du hast dich bereits eingecheckt!";};
	[name player, getPlayerUID player, "LOGIN"] remoteExec ["life_fnc_stempelUhr",2];
	lrl_stempelUhr = true;
};

if(_status == "LOGOUT") then 
{
	if(!lrl_stempelUhr) exitWith {hint "Du hast dich noch nicht eingecheckt! Du musst dich erst einchecken!";};
	[name player, getPlayerUID player, "LOGOUT"] remoteExec ["life_fnc_stempelUhr",2];
	lrl_stempelUhr = false;
};