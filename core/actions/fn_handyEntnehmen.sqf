private["_target"];

_target = cursorTarget;

if!(_target isKindOf "Man") exitWith { };
if!(alive _target) exitWith { };
if(player distance _target > 3) exitWith {hint "Die Person ist zu weit weg."};

[player] remoteExec ["life_fnc_handyEntnommen",_target];