#include <macro.h>
/*
	File: fn_adminToggle.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de
	
	Description:
	Toggles Admin-Status (An / Aus)
*/

if(isDedicated) exitWith {}; 
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_Error"};
if(!(getPlayerUID player in LSRL_your_momy)) exitWith {closeDialog 0; [0,player] call LRLAC_fnc_busted;};

if(lrl_noAdmin) then {
	lrl_noAdmin = false;
	systemChat "ADMIN-STATUS> Aktiviert";
	titleText ["== Du bist nun wieder Administrator und erhälst alle Nachrichten ==","PLAIN"];
} else {
	lrl_noAdmin = true;
	systemChat "ADMIN-STATUS> Deaktiviert";
	titleText ["== Du bist kein Admin mehr und erhälst keine Admin-Anfragen mehr ==","PLAIN"];
};