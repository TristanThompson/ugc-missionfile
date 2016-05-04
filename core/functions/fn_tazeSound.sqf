/*
	File: fn_tazeSound.sqf
	modified by Marcel "VariatoX" Koch
*/

params[
	["_source",ObjNull,[ObjNull]],
	["_type",-1,[0]]
];

if(isNull _source) exitWith {};
if(isNil "_type") exitWith {};

switch (_type) do {
	case 1: {if(life_istazed) then {playSound3D [KF_CHICKEN + "sounds\tazer.ogg",_source,false,getposASL _source,2,1,25];};};
	case 2: {if(lrl_gummit) then {playSound3D [KF_CHICKEN + "sounds\gummit.ogg",_source,false,getposASL _source,1,1,50];};};
	default {};
};