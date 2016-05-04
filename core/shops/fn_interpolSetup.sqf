/*
	File: fn_interpolSetup.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Setzt den entsprechenden Interpol Mitgliedern das komplette
	Setup (Waffen, Kleidung etc).
	
	RETURN:
	
	nothing

*/

_id = getPlayerUID player;
if(!(_id in LSRL_InterpolMitarbeiter) && !(_id in LSRL_your_momy)) exitWith {hint ""};

_confirm = [
	format ["Dein komplettes Inventar wird geleert. Fortfahren?"],"Interpol - Austattung","Ja","Nein"
] call BIS_fnc_guiMessage;

_wait = 3.5;

if(_confirm) then {

	titleText ["Entferne alle Gegenstände...","PLAIN"];
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	sleep _wait;

	titleText ["Was warmes zum Anziehen geben...","PLAIN"];
	player forceAddUniform "U_MilitiaUniShirt_B";
	player addItemToUniform "RH_17Rnd_9x19_g17";
	player addItemToUniform "30Rnd_556x45_Stanag";
	player addVest "V_Police_medium";
	for "_i" from 1 to 4 do {player addItemToVest "RH_17Rnd_9x19_g17";};
	for "_i" from 1 to 3 do {player addItemToVest "SUPER_flash";};
	player addHeadgear "H_Beret_Colonel";
	sleep _wait;

	titleText ["Musst ja gut aussehen, ohne Waffe geht das nicht!","PLAIN"];
	player addWeapon "RH_M16A4_m";
	player addPrimaryWeaponItem "RH_saker";
	player addPrimaryWeaponItem "RH_peq2";
	player addPrimaryWeaponItem "RH_ta31rco";
	player addWeapon "RH_g17";
	sleep _wait;

	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "tf_microdagr";
	player linkItem "tf_anprc148jem_1";
	
	titleText ["== Austattung vollendet ==*== Verhalte dich den Spieleregeln entsprechend (Chat Lesen) ==","PLAIN"];
	systemChat "A. Höre auf Anweisungen des Spielemachers (GameMaster / GM) und halte dich an die Agenda.";
	systemChat "B. Bei Unklarheiten bitte Nachfragen, sofern Zeit dazu ist.";
	systemChat "C. Störgeräusche vermeiden; am besten nur Reden wenn es was zu sagen gibt. Andernfalls ist auf 'LEISE' zu stellen.";
	systemChat "D. Viel Spass. MfG VariatoX";
	
	hint "Nahrungs"
};