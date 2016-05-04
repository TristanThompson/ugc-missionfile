#include <macro.h>
/*

	File: fn_adminHeal.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de

	Description:
	Macht den Admin unsichtbar / wieder sichtbar.
*/

if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_Error";};
if(!(getPlayerUID player in LSRL_your_momy)) exitWith {closeDialog 0; [7,player] call LRLAC_fnc_busted;};

if(uniform player == "U_VirtualMan_F") then {
	systemChat "Die Uniform wird entfernt! Du wirst in Kürze wieder sichtbar.";
	sleep 4;
	removeUniform player;
} else {
	systemChat "Dir wirst in Kürze unsichtbar.";
	systemChat "Personen sehen dich nicht mehr im Z-Menü oder im Schlüsselbund-Menü";
	systemChat "Du kannst weiterhin mit Benutzern kollidieren - sei vorsichtig!";
	sleep 4;
	player forceAdduniform "U_VirtualMan_F";
};

closeDialog 0;
