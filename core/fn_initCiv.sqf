/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

private["_spawnPos"];

switch (call(life_donator)) do {
	case 0: {life_paycheck = life_paycheck};
	case 1: {life_paycheck = life_paycheck + 75};
	case 2: {life_paycheck = life_paycheck};
	case 3: {life_paycheck = life_paycheck + 75};
	case 4: {life_paycheck = life_paycheck};
	case 5: {life_paycheck = life_paycheck + 75};
};

[] execVM "core\initJVM.sqf";

if(life_is_arrested) then {
	[false,false,life_arrestMinutes,life_arrestReason] call fnc_jailsetup;
} else {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

player addRating 9999999;

[] call life_fnc_zoneCreator;