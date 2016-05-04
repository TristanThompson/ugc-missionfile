/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) == -1) exitWith {hint localize "STR_Global_NoSelectionPerson";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_Global_NoSelection";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint localize "STR_MISC_Under1";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Spieler ausser Reichweite!";};
if(player getVariable["ace_captives_isHandcuffed",true]) exitWith {hint localize "STR_Global_Restrained"};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint localize "STR_MISC_NotTooMuchDabei";ctrlShow[2002,true];};
[_unit,_val,_item,player] remoteExec ["life_fnc_receiveItem",_unit];
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %3 %2 gegeben.",_unit getVariable["realname",name _unit],_val,_type];
_format = ["%1 (%2) gab %3 (%4) Item %6 (%5 Mal).",name player,getPlayerUID player, _unit getVariable["realname",name _unit], _unit getVariable ["steam64ID", getPlayerUID _unit], _val, _type];
[_format,7] remoteExecCall ["UGC_fnc_sendToYourMom",2];
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];