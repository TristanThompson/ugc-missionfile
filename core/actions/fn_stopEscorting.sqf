/*
	File: fn_stopEscorting.sqf
	
	Description:
	ASFSDFHAGFASF
*/

params[
	["_unit",ObjNull,[ObjNull]]
];

if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "Escorting")) exitWith {};

detach _unit;
_unit setVariable["Escorting",false,true];