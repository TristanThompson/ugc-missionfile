/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 5) exitWith {hint "Fehler: Sie können eine Überweisung nur mit mehr als $50 tätigen."};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > c00l3_b4Nck3h13R) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > c00l3_b4Nck3h13R) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - (_val + _tax);

[_val,profileName] remoteExec ["TON_fnc_clientWireTransfer",_unit];
[] call life_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
_format = ["%1 (%2) sendete an %3 (%4) den Geldbetrag $%5 (Steuer $%6).",name player, getPlayerUID player, _unit getVariable ["realname", name _unit], _unit getVariable ["steamID64",getPlayerUID _unit],[_val] call life_fnc_numberText,[_tax] call life_fnc_numberText];
[_format,9] remoteExecCall ["UGC_fnc_sendToYourMom",2];
[1] call SOCK_fnc_updatePartial;
