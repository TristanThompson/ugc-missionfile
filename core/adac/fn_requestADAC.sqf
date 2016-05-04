/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/
private["_adacOnline","_vehicle"];
if(life_adac_request) exitWith {hint "Du kannst den ADAC nur alle 5 Minuten rufen";};
_adacOnline = {_x != player && {side _x == east} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.
if(!_adacOnline) exitWith {hint "Es ist kein ADAC online";};
_vehicle = cursorTarget;

[_vehicle,name player] remoteExec ["life_fnc_adacRequest",east];
_vehicle setVariable["pName",name player,true];
_vehicle setVariable ["adac_called",true,true];
hint "ADAC wurde gerufen";

[] spawn 
{
	life_adac_request = true;
	sleep (5 * 60);
	life_adac_request = false;
};
