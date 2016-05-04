/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_id"];
params[
	["_unit",ObjNull,[ObjNull]]
];
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "ace_captives_isHandcuffed")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid


[getPlayerUID _unit,_unit,player,false] remoteExec ["life_fnc_wantedBounty",2];

if(isNull _unit) exitWith {}; //Not valid
detach _unit;
[_unit,false] remoteExec ["life_fnc_jail",_unit];
[0,format[localize "STR_NOTF_Arrested_1", _unit getVariable["realname",name _unit], profileName]] remoteExec ["life_fnc_broadcast",0];
