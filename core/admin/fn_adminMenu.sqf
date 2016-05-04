#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/

if(__GETC__(life_adminlevel) < 2) exitWith {hint localize "STR_ANOTF_Error";};
if(!(getPlayerUID player in LSRL_your_momy)) exitWith {closeDialog 0; [0,player] call LRLAC_fnc_busted;};

	systemChat "Verfizierter Administrator.";

	private["_display","_list","_side"];
	disableSerialization;
	waitUntil {!isNull (findDisplay 2900)};
	_display = findDisplay 2900;
	_list = _display displayCtrl 2902;

	lbClear _list;

	{
		_side = switch(side _x) do {case west: {"LVPD"}; case civilian : {"ZIV"}; case independent : {"EMS"}; case east: {"LAC"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach playableUnits;
	
lbSort [_list,"ASC"];