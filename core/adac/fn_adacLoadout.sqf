/*
	File: fn_adacloadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the adac out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if((call life_adaclevel) < 9) then {
	player forceAddUniform "A3L_Worker_Outfit";
	player addBackpack "tf_mr3000";

	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";

	player addItem "tf_fadak";
	player assignItem "tf_fadak";

} else {
	player forceAddUniform "A3L_Suit_Uniform";

	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";

};

[] call life_fnc_saveGear;