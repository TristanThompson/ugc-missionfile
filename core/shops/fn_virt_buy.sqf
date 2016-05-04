#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];

//Duping Schutz
if(!lrl_buy) exitWith {titleText["Du kannst nur jede Sekunde etwas kaufen!","PLAIN"];};
lrl_buy = false;
[] spawn {
	sleep 0.5;
	lrl_buy = true;
};
if((lbCurSel 2401) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;

//#2 Anfang
_marketprice = [_type] call life_fnc_marketGetBuyPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
//#2 Ende


if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > v4r14t0X_isTc00L && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[v4r14t0X_isTc00L] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[1,grpPlayer] remoteExec ["TON_fnc_updateGang",2];
		} else {
			if((_price * _amount) > v4r14t0X_isTc00L) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			__SUB__(v4r14t0X_isTc00L,_price * _amount);
			_format = format["%1 (%2) kaufte %3 (%4 Mal) für insgesamt $%5 (Stückkosten: $%6)",name player,getPlayerUID player, _name, _amount, [(_price * _amount)] call life_fnc_numberText, [_price] call life_fnc_numberText];
			[_format,3] remoteExecCall ["UGC_fnc_sendToYourMom",2];
		};
	} else {
		if((_price * _amount) > v4r14t0X_isTc00L) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call life_fnc_handleInv;};
		hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		__SUB__(v4r14t0X_isTc00L,(_price * _amount));
		_format = format["%1 (%2) kaufte %3 (%4 Mal) für insgesamt $%5 (Stückkosten: $%6)",name player,getPlayerUID player, _name, _amount, [(_price * _amount)] call life_fnc_numberText, [_price] call life_fnc_numberText];
		[_format,3] remoteExecCall ["UGC_fnc_sendToYourMom",2];
	};
	//#2 Anfang
	if(_marketprice != -1) then
    {
		[_type, _amount] spawn
		{
			sleep 45;
			[_this select 0,_this select 1] call life_fnc_marketBuy;
		};	
    };
	//#2 Ende
	[] call life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;