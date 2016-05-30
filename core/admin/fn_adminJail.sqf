#include <macro.h>
/*
	File: fn_adminJail.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de
	
	Description:
	Jails selected player. 4-ever.
*/

if(isDedicated) exitWith {}; //Nah!
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_Error"};
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
if(!(getPlayerUID player in LSRL_your_momy)) exitWith {closeDialog 0; [0,player] call LRLAC_fnc_busted;};

if(!(getPlayerUID player == "76561198082967169")) exitWith {closeDialog 0;};
private["_target"];

_target = lbData[2902, lbCurSel (2902) ];
_target = call compile format["%1", _target];

if(isNil "_target") exitWith {};
if(isNull _target) exitWith {};

if(_target == player) exitWith {hint "nope.";};

{for "__countme_" from 0 to 100 do {(findDisplay __countme_)closeDisplay 0;};} remoteExec ["BIS_fnc_spawn",_target];
hint "loool. okay.";
