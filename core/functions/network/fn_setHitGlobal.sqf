/*
	Author: VariatoX
	
	Description:
	Benötigt für MP-Exec
*/
private["_object","_point","_damage"];

_object = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_point = [_this,1,""] call BIS_fnc_param;
_damage = [_this,2,0] call BIS_fnc_param;

if(isNull _object) exitWith {};
if(_point == "") exitWith {};

_object setHitPointDamage [_point, _damage];