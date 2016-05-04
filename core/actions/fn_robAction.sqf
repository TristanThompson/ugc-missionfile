/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	edited by	Marcel "Variatox" Koch (lsrl.de)
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(life_istazed OR lrl_knockedOut OR life_knockout) exitWith {};
if(player getVariable "ace_captives_isHandcuffed") exitWith {};

if(_target getVariable["robbed",false]) exitWith {};

if(currentWeapon player in lrl_noWeapons) exitWith {hint localize "STR_NOTF_NoWeaponEquip"}; //Ausrauben ohne gueltige Waffe

[player] remoteExec ["life_fnc_robPerson",_target];
_target setVariable["robbed",TRUE,TRUE];