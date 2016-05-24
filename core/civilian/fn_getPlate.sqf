/*
	File: fn_getPlate.sqf
	Author: Bastian "Janl1.DE" Schumacher
	
	Description:
	Gibt das Kennzeichen zurück
*/

_vehicle = cursorTarget;
_plate = _vehicle getVariable "plateString";
_copnumber = _vehicle getVariable "ugc_copNumber_car";

if(_copnumber == "0") then {
	hint format ["Das Fahrzeug hat das Kennzeichen: <br/>%1", _plate];
} else {
	hint format ["Das Fahrzeug hat das Kennzeichen: <br/>LVPD-%1", _copnumber];
};
