/*
	File: fn_rechnungAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/

params[["_unit",ObjNull,[ObjNull]]];
disableSerialization;
if(!(createDialog "life_rechnung_give")) exitWith {hint "Fehler: Der Dialog life_rechnung_give wurde nicht gefunden!"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[8751,format["Rechnung an %1",_unit getVariable["realname",name _unit]]];
life_ticket_unit = _unit;