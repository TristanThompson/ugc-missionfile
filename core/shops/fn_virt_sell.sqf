#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice"];

//Duping Schutz
if(!lrl_sell) exitWith {titleText["Du kannst nur jede Sekunde etwas verkaufen!","PLAIN"];};
lrl_sell = false;

[] spawn {
	sleep 0.5;
	lrl_sell = true;
};

if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;

//#2 Anfang
_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
//#2 Ende

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;

if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	v4r14t0X_isTc00L = v4r14t0X_isTc00L + _price;
	_format = format["%1 (%2) verkaufte %3 (%4 Mal) für insgesamt $%5.",name player,getPlayerUID player, _name, _amount, [_price] call life_fnc_numberText];
	[_format,4] remoteExecCall ["UGC_fnc_sendToYourMom",2];
	//#2 Anfang
	if(_marketprice != -1) then
    {
		[_type, _amount] spawn
		{
			sleep 45;
			[_this select 0,_this select 1] call life_fnc_marketSell;
		};
	//#2 Ende
	};
	[] call life_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[3] call SOCK_fnc_updatePartial;