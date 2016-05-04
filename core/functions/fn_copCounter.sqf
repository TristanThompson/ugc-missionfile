/*
	File: fn_copCounter.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Zählt alle Polizisten die online sind.
	
	ARGUMENTE:
	0 = Integer (um Cops ab Rang X zu zählen)
	
	RETURN
	Number of elements in array

*/

private _minrank = [_this,0,0,[0]] call BIS_fnc_param;
private _coplist = [];

if(_minrank == 0) then {
	{
		if(side _x == west) then {_coplist pushBack _x};
	} forEach playableUnits;
} else {
	{
		if(side _x == west) then {
			if(_x getVariable "rank" >= _minrank) then {
				_coplist pushBack _x;
			};
		};
	} forEach playableUnits;
};
_return = count _coplist;

_return