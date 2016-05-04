/*
	File: fn_fbiShowCard.sqf
	Author: Oesi94

	Server: lakeside-reallife.de

	Description:
	Show ID Card as a FBI to target player
	All pictures are copyright by its creator (in this case VariatoX)

*/

private ["_target","_id","_message"];

_target = cursorTarget;

if(isNull _target) exitWith {};
if(!(_target isKindOf "Man")) exitWith {};
if(!(alive _target)) exitWith {};
if(!alive player) exitWith {};

_id = "<img image='images\idcards\civ\id_card.paa' size='8'/>";

_message = format["<t size='1.25'>%1</t><br/><br/>%2<br/>",name player,_id];
[_message] remoteExec ["life_fnc_copLicenseShown",_target];