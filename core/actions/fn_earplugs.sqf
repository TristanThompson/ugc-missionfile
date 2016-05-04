/*
	Author: VariatoX
	File: fn_earplugs.sqf
	
	Description:
	Einfaches Earplug (Ohrstöpsel) Skript, dass die Lautstärke herunterdreht.
	Scroll-Menü Funktion wurde entfernt, da eine permanente Abfrage vorhanden war.

*/


if(life_earplugs) then {
	life_earplugs = false;
	hintSilent "Du hast deine Ohrstöpsel rausgezogen.";
	3 fadeSound 1;
	playSound "plop";
	
} else {
	life_earplugs = true;
	hintSilent "Du hast deine Ohrstöpsel hineingesteckt.";
	3 fadeSound 0.1;
};