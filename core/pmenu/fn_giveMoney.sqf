/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint localize "STR_Global_NoSelection";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du darfst den ATM derzeit nicht verwenden.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint localize "STR_MISC_Under1";ctrlShow[2001,true];};
if(player getVariable["ace_captives_isHandcuffed",true]) exitWith {hint localize "STR_Global_Restrained"};
if(parseNumber(_amount) > v4r14t0X_isTc00L) exitWith {hint localize "STR_MISC_NotTooMuchDabei";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Die ausgewählte Person ist nicht mehr in Reichweite.";};
hint format["Du hast %2 insgesamt $%1 gegeben.",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
v4r14t0X_isTc00L = v4r14t0X_isTc00L - (parseNumber(_amount));
_format = ["%1 (%2) gab %3 (%4) insgesamt $%5.",name player, getPlayerUID player, _unit getVariable["realname", name _unit], _unit getVariable ["steam64ID",getPlayerUID _unit],[(parseNumber(_amount))] call life_fnc_numberText ];
[_format,8] remoteExecCall ["UGC_fnc_sendToYourMom",2];
[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteExec ["life_fnc_receiveMoney",_unit];
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];