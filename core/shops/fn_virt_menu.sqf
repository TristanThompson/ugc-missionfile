/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
#include <macro.h>
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};

life_shop_type = _shop;
life_shop_npc = _this select 0;

if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "market" && playerSide != civilian) exitWith {hint localize "STR_NOTF_NotAZiv"};
if(_shop == "rebel" && !license_civ_rebel) exitWith {hint localize "STR_NOTF_NotARebel"};
if(_shop == "ems" && playerSide != independent) exitWith {hint localize "STR_NOTF_NotAMedic"};
if(_shop == "adac" && playerSide != east) exitWith {hint localize "STR_NOTF_NotAADAC"};
if(_shop == "adacdriver" && ((__GETC__(life_adaclevel) < 2) OR playerSide != east)) exitWith {hint localize "STR_NOTF_NotAADAC"};
if(_shop == "itemfbi" && ((__GETC__(life_donator) < 4) OR playerSide != west)) exitWith {hint "Du gehoerst nicht zum FBI!"};
if(_shop == "coppresse" && ((__GETC__(life_coplevel) < 4) OR playerSide != west)) exitWith {hint "Du musst mindestens Dienstgrad 4 erreicht haben!"};
if(_shop == "fishmarket" && !license_civ_fischerei) exitWith {hint "Du besitzt die benötige Lizenz nicht! Fischereischein benötigt."};

createDialog "shops_menu";

[] call life_fnc_virt_update;