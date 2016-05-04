/*
	File: fn_spikeStripEffect.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't work without the server-side effect but shifted part of it clientside
	so code can easily be changed. Ultimately it just pops the tires.
*/

params [
	["_vehicle",ObjNull,[ObjNull]]
];

if(isNull _vehicle) exitWith {}; //Bad vehicle type

_vehicle setHitPointDamage["HitLFWheel",1];
_vehicle setHitPointDamage["HitLF2Wheel",1];
_vehicle setHitPointDamage["HitRFWheel",1];
_vehicle setHitPointDamage["HitRF2Wheel",1];

playSound3D [KF_CHICKEN + "sounds\spikes.ogg",_vehicle,false,getPosASL _vehicle,4.5,1,40];