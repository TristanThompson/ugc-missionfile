/*
	Kommunikationsgeräte entfernen (Spieler - lokal)
*/

params [
	["_unit",ObjNull,[ObjNull]]
];
if(isNull _unit) exitWith {};
if(!alive _unit) exitWith {};

player setVariable ["tf_unable_to_use_radio", true];

private ["_items"];

_items = [];
{_items pushBack _x} forEach assignedItems player;
{player unlinkItem _x} forEach _items;

sleep 1;

hint "Dir wurden deine Kommunikationsgeräte entfernt.";


player setVariable ["tf_unable_to_use_radio", false];