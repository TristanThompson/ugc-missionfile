/*
	File: fn_augenbindeAus.sqf
	Author: VariatoX
	Server: lakeside-reallife.de
	
	Description:
	Dem Ziel die Augenbinde entfernen.
*/

params [
	["_target",ObjNull,[ObjNull]]
];

if(isNull _target) exitWith {};
if(!alive _target) exitWith {};
if(!(_target getVariable["isblinded",false])) exitWith { };

//[[player,"CL3_anim_drill_short"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;

[player,"CL3_anim_drill_short"] remoteExec ["life_fnc_animSync",0];
[true,"augenbinde",1] call life_fnc_handleInv;
_target setVariable["isblinded",false,true];

//[[1,format["Jemand entfernt gerade deine Augenbinde..."]],"life_fnc_broadcast",_target,false] spawn life_fnc_MP;

[1,format["Jemand entfernt gerade deine Augenbinde..."]] remoteExec ["life_fnc_broadcast",_target];