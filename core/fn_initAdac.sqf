#include <macro.h>
/*
	File: fn_initAdac.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/

// TFR Variables API
tf_no_auto_long_range_radio = false;

private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};

_end = false;

if((str(player) in ["ADAC_2","ADAC_3","ADAC_4","ADAC_5","ADAC_6","ADAC_7"])) then {
	if((__GETC__(life_adaclevel) < 1)) then {
		disableUserInput true;
		["IPDWhitelist",false,true] call BIS_fnc_endMission;
		sleep 35;
		disableUserInput false;
	};
};

if((str(player) in ["ADAC_8","ADAC_9","ADAC_10"])) then {
	if((__GETC__(life_adaclevel) < 11)) then {
		disableUserInput true;
		["RichterWhitelist",false,true] call BIS_fnc_endMission;
		sleep 35;
		disableUserInput false;
	};
};

if((str(player) in ["ADAC_1"])) then {
	if((__GETC__(life_adaclevel) < 4)) then {
		disableUserInput true;
		["LACLStelleWhitelist",false,true] call BIS_fnc_endMission;
		sleep 35;
		disableUserInput false;
	};
	lrl_lacLeitstelle = true;
};

if(!(str(player) in ["ADAC_3"])) then {
	switch(__GETC__(life_adaclevel)) do
	{//Standard Paycheck: 1.500
		case 1: {life_paycheck = life_paycheck + 15;};		//Auszubildender
		case 2: {life_paycheck = life_paycheck + 35;}; 	//KFZ Mechaniker
		case 3: {life_paycheck = life_paycheck + 50;}; 	//KFZ Mechatroniker
		case 4: {life_paycheck = life_paycheck + 75;}; 	//KFZ Meister
		case 5: {life_paycheck = life_paycheck + 90;}; 	//KFZ Ausbilder
		case 6: {life_paycheck = life_paycheck + 90;}; 	//Personalleiter
		case 7: {life_paycheck = life_paycheck + 125;}; 	//Stellv. IPD Leitung
		case 8: {life_paycheck = life_paycheck + 150;}; 	//IPD Leitung
		case 9: {life_paycheck = life_paycheck - 75;}; 	//NICHT BELEGTER SLOT - NICHT VERWENDEN
		case 10: {life_paycheck = life_paycheck + 150; lrl_judikative = true;};	//Staatsanwalt
		case 11: {life_paycheck = life_paycheck + 160; lrl_judikative = true;}; 	//Richter
	};
} else {
	life_paycheck = life_paycheck + 125;
};

player setVariable ["copLevel",1,true];
[] call life_fnc_spawnMenu;
[] execVM "core\initJVM.sqf";
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
