/*
	File: fn_unrestrain.sqf
*/

params[["_unit",ObjNull,[ObjNull]]];
if(isNull _unit OR !(_unit getVariable["ace_captives_isHandcuffed",FALSE])) exitWith {}; //Error check?

_unit setVariable["ace_captives_isHandcuffed",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
_unit setVariable["ace_captives_isHandcuffed",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];

playSound3D [KF_CHICKEN + "sounds\uncuff.ogg",_unit,false,getposASL _unit,0.8,1,20];
