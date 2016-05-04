/*
	File: fn_umbrellus.sqf
	Author: Bryan "Tonic" Boardwine
	Edit by: Variatox Sandrox
	
	Description:
	Starts the umbrella-theme song (hearable for other player)
*/
private["_vehicle"];

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "umbrellus"}) exitWith {};

while {true} do
{
	if(!(_vehicle getVariable "umbrellus")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["umbrellus",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};

	_vehicle say3D "umbrellam";

	sleep 16.9749;

	if(!(_vehicle getVariable "umbrellus")) exitWith {};
};