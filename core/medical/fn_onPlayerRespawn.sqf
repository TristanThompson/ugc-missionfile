#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
params ["_unit","_corpse"];

life_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.

//Set some vars on our new body.
//#1
_unit setUnconscious false;
_unit setVariable["ace_captives_isHandcuffed",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.
_unit setVariable["isblinded",false,true];
_copnumber = call ugc_plate;
player setVariable["ugc_copNumber",_copnumber,true];
player setVariable["ace_captives_isHandcuffed",FALSE,TRUE];
_unit playMove "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon";

_unit setVariable ["ace_captives_isHandcuffed", false, true];
[_unit, "setCaptive", "ace_captives_isHandcuffed", false] call ace_common_fnc_statusEffect_set;

//remove AnimChanged EH
private _animChangedEHID = _unit getVariable ["ace_captives_handcuffAnimEHID", -1];
_unit removeEventHandler ["AnimChanged", _animChangedEHID];
_unit setVariable ["ace_captives_handcuffAnimEHID", -1];

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon";
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[_unit,life_sidechat,playerSide] remoteExec ["TON_fnc_managesc",2];
player enableFatigue (__GETC__(life_enableFatigue));