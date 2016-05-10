#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
		edited: Bastian "Janl1.DE" Schumacher
	Description:
	Yeah... Gets the vehicle from the garage.
*/
#define BtnVersichern 7777
#define BtnAusparken 8888

private["_vehicle","_vid","_pid","_unit","_price","_isInsured","_newPrice","_display","_BtnVersichern","_BtnAusparken","_insureinfo"];
disableSerialization;

//Schließt die Schaltfläche...
closeDialog 0; 
//next line added for insureance
_isInsured = [_this,0,false,[false]] call BIS_fnc_param;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(_price == -1) then {_price = 50;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};

//next line added for insureance
_basePrice = _price;
_insuredstate = "(RAW)";
if (_isInsured) then {
	if(license_civ_driver || license_civ_permdriver) then {
		_price = _basePrice * 3;
		_insuredstate = "(VERSICHERT)";
	} else {
		_isInsured = false;
		_insuredstate = "(RAW)";
		_price = _basePrice;
	};
} else {
    _price = _basePrice;
};

if(c00l3_b4Nck3h13R < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(typeName life_garage_sp == "ARRAY") then {
[_vid,_pid,life_garage_sp select 0,_unit,_price,_isInsured,life_garage_sp select 1] remoteExec ["TON_fnc_spawnVehicle",2];
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
[_vid,_pid,life_garage_sp,_unit,_price,_isInsured] remoteExec ["TON_fnc_spawnVehicle",2];
	} else {
[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,_isInsured,markerDir life_garage_sp] remoteExec ["TON_fnc_spawnVehicle",2];
	};
};

hint localize "STR_Garage_SpawningVeh";

_state = 0;
if(playerSide != civilian) then {
	_newPrice = round(_price / 4);
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - _newPrice;
	_state = 1;
} else {
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - _price;
	_state = 0;
};

_format = "nix";
if(_state == 1) then {
	_format = format["%1 (%2) parkte das Fahrzeug mit ID %3 für insgesamt $%4 aus. %5",name _unit,_pid, _vid, [_newPrice] call life_fnc_numberText, _insuredstate];
} else {
	_format = format["%1 (%2) parkte das Fahrzeug mit ID %3 für insgesamt $%4 aus. %5",name _unit,_pid, _vid, [_price] call life_fnc_numberText, _insuredstate];
};

[_format,6] remoteExecCall ["UGC_fnc_sendToYourMom",2];
