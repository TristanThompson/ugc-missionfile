/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/

private["_target","_who","_obj"];

_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(lrl_knockedOut) exitWith {};
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

lrl_knockedOut = true;

titleText[format[localize "STR_Civ_KnockedOut"],"PLAIN"];
[player,"Cl3_anim_Knockout1In"] remoteExec ["life_fnc_animSync",0];
_random = random(50);
if(_random <= 15) then {playSound3D [KF_CHICKEN + "sounds\bone3.ogg",player,false,getPosASL player,1.35,1,7]; hint "Meine Nase... die ist hinüber..."; player setFatigue 1;};

sleep 3.603;
[0] spawn life_fnc_monitorColorizeEffect;

[player,"static_dead"] remoteExec ["life_fnc_animSync",-2];
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];

sleep 14;

[player,"CL3_anim_Knockout1End"] remoteExec ["life_fnc_animSync",-2];

detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];

lrl_knockedOut = false;