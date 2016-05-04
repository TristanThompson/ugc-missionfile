#include <macro.h>
/*
	File: fn_atmMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the bank menu.
*/
private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

[] call life_fnc_roundMoney;

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;
_units = _display displayCtrl 2703;

lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[c00l3_b4Nck3h13R] call life_fnc_numberText,[v4r14t0X_isTc00L] call life_fnc_numberText];

{
	if(alive _x) then
	{
		_units lbAdd format["%1",_x getVariable["realname",name _x]];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;
lbSort [_units,"ASC"];

lbSetCurSel [2703,0];

/*if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
};*/