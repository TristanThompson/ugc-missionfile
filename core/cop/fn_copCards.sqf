/*
	File: fn_copCards.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Gibt dem Polizisten die entsprechende Cop Card zum Rang...
*/

if(playerSide != west) exitWith {};

if(call(life_coplevel) > 9) then {
	player addItem "ItemEmsCard";
	player assignItem "ItemEmsCard";
} else {
	if(player getVariable "isFbi") then {
		player addItem "ItemDeaCard";
		player assignItem "ItemDeaCard";
	} else {
		if(license_cop_swat) then {
			player addItem "ItemUnirCard";
			player assignItem "ItemUnirCard";
		} else {
			player addItem "ItemCopCard";
			player assignItem "ItemCopCard";
		};
	};
};
