/*
	File: fn_augenbindeAction.sqf
	Author: VariatoX
	Server: lakeside-reallife.de
	
	Description:
	Setzt die Variable, damit die Augenbinde angelegt werden kann.
*/

params [
	["_target",ObjNull,[ObjNull]]
];

if(isNull _target) exitWith {};
if(player == _target) exitWith {}; //Wtf
if(player distance _target > 3) exitWith {}; //Maximalabstand zum Ziel
if!(alive _target) exitWith {}; //Ziel ist tot
if(!([false,"augenbinde",1] call life_fnc_handleInv)) exitWith {hint "Du trägst keine Augenbinde mit dir!"};
if(_target getVariable "isblinded") exitWith {hint "Der Person wurde bereits eine Augenbinde angelegt."}; //Wir wollen dem Ziel nicht 2x die Augenbinde anlegen, oder?
if!(_target getVariable "ace_captives_isHandcuffed") exitWith {hint "Die Person ist nicht festgenommen. Daher kannst du auch keine Augenbinde anlegen."};

//[[player,"CL3_anim_drill_short"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;

[player,"CL3_anim_drill_short"] remoteExec ["life_fnc_animSync",0];
_target setVariable["isblinded",true,true];

//[[player],"life_fnc_augenbindeAn",_target,false] spawn life_fnc_MP;

[player] remoteExec ["life_fnc_augenbindeAn",_target];
hint localize "STR_MISC_AugenBinde_Attach";
