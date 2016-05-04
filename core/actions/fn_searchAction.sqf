/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/

params[["_unit",ObjNull,[ObjNull]]];
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
sleep 2;
if(player distance _unit > 3) exitWith {hint localize "STR_NOTF_PersonTooFarAway"};
if(!alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;