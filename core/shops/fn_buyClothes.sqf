/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > v4r14t0X_isTc00L) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
v4r14t0X_isTc00L = v4r14t0X_isTc00L - _price;

life_clothesPurchased = true;
closeDialog 0;