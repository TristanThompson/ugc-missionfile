/*
	File: fn_bankLsrlCoinsCheck.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de
	
	Description:
	Fragt die verfügbaren LSRL Coins des Forums vom Benutzer ab.
*/


if(!alive player) exitWith {closeDialog 0;}; //Spieler ist tot
if(isNull player) exitWith {}; //WAT!?!?
if(vehicle player != player) exitWith {closeDialog 0; hint "Du kannst dies vom Fahrzeug aus nicht tun!"};
if(lrl_noAction) exitWith {closeDialog 0; hint "Du kannst das momentan nicht tun!"};
if(player getVariable "ace_captives_isHandcuffed") exitWith {closeDialog 0; hint "Im gefesselten Zustand kannst du das nicht tun!"};
if(lrl_coinsDelay) exitWith {closeDialog 0; hint localize "STR_LSRLC_CoinsDelayActive"};
if(lrl_coinsCheck) exitWith {closeDialog 0; hint localize "STR_LSRLC_StillChecking"};

lrl_coinsCheck = true; //Keine doppelten Abfragen ;)
lrl_coinsDelay = true;

[getPlayerUID player,player] remoteExec ["TON_fnc_getLsrlCoins", 2];

closeDialog 0;

//Coins Check nur alle 15 min.
[] spawn {
	sleep (60 * 10);
	lrl_coinsDelay = false;
};