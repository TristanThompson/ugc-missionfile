#include <macro.h>
/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_Error"};
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
if(!(getPlayerUID player in LSRL_your_momy)) exitWith {closeDialog 0; [3,player] call LRLAC_fnc_busted;};

private["_unit"];

_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

if(life_frozen) then {

	{disableUserInput false;} remoteExec ["BIS_fnc_spawn",_unit];
	hint format[localize "STR_ANOTF_Unfrozen",_unit getVariable["realname",_unit]];
	life_frozen = false;
} else {

	{disableUserInput true;} remoteExec ["BIS_fnc_spawn",_unit];
	hint format[localize "STR_ANOTF_Frozen",_unit getVariable["realname",_unit]];
	life_frozen = true;
};
