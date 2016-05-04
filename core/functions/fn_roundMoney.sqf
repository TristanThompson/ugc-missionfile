/*
	File: fn_roundMoney.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Rundet das Geld auf.

*/

private ["_money_old","_money_new"];

_money_old = v4r14t0X_isTc00L; //Never work with global vars... god dammit!

if(_money_old >= 10) exitWith {};

_money_new = round(_money_old);
v4r14t0X_isTc00L = _money_new;