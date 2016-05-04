/*
	File: fn_openHandyMenu.sqf
	Author: Variatox Sandrox
	Server: lakeside-reallife.de
	
	Description:
	Hauptdatei zum öffnen des Handy-Menüs
*/

if(player getVariable "ace_captives_isHandcuffed") exitWith {
	closeDialog 0;
	hint localize "STR_Global_Restrained"; 
};

if(life_is_arrested) exitWith {
	closeDialog 0;
	hint "Seit wann haben Gefangene im Gefängnis ein Handy??";
};

createDialog "Life_my_smartphone";