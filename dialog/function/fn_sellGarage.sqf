#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_newPrice"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
if (life_action_inUse) exitWith {};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

life_action_inUse = true;
if(isNil "life_cgar_inUse") then {life_cgar_inUse = time-301;};
if(life_cgar_inUse+(300) >= time) exitWith {closeDialog 0;hint format["Du kannst nur alle 5 Minuten ein Fahrzeug verkaufen %1 | %2",4 - floor ((time - life_cgar_inUse) / 60),59 - round (time - life_cgar_inUse - (floor ((time - life_cgar_inUse) / 60)) * 60)];};

_price = [_vehicle,__GETC__(life_garage_sell)] call TON_fnc_index;
if(_price == -1) then {_price = 50;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

[_vid,_pid,_price,player,life_garage_type] remoteExec ["TON_fnc_vehicleDelete",2];
[1,format[localize "STR_Garage_SoldCar",_price]] remoteExec ["life_fnc_broadcast",player];

if(playerSide != civilian) then {
	_newPrice = round(_price / 10);
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + _newPrice;
	_state = 1;
} else {
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + _price;
	_state = 0;
};

_format = "nix";
if(_state == 1) then {
	_format = format["%1 (%2) verkaufte das Fahrzeug %3 für insgesamt $%4.",name player,getPlayerUID player, _vehicle, _price];
} else {
	_format = format["%1 (%2) verkaufte das Fahrzeug %3 für insgesamt $%4.",name player,getPlayerUID player, _vehicle, _newPrice];
};
[_format,1] remoteExecCall ["UGC_fnc_sendToYourMom",2];

life_action_inUse = false;
closeDialog 0;
life_cgar_inUse = time
