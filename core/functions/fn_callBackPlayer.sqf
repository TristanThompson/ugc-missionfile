/*
	File: fn_vibration.sqf
	Author: Bastian "Janl1.DE" Schumacher
	Server: lakeside-reallife.de

	Description:
	Sendet die Nachricht an den Spieler

*/

params [
	"_msg"
];

hint parseText format ["%1",_msg];