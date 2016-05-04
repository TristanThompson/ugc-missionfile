/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew","_cur"];
_cur = cursortarget;
if(speed _cur > 10) exitWith {}; //fucking troll-kiddy

_crew = crew _cur;
{
	_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
	[_x] remoteExec ["life_fnc_pulloutVeh",_x];
} foreach _crew;