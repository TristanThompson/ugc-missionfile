/*
	File: fn_escortAction.sqf
*/

params[
	["_unit",ObjNull,[ObjNull]]
];
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;