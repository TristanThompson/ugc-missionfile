/*
	File: fn_readyForJail.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Macht den Spieler bereits für das Gefängnis.

*/

removeAllWeapons player;
removeHeadgear player;
removeGoggles player;
removeVest player;
removeBackpack player;
{player removeMagazine _x} foreach (magazines player);