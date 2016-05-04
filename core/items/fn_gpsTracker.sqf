/*
	File: fn_gpsTracker.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de
	
	Description:
	Hauptaktion für den GPS Tracker
*/

_veh = param [0,ObjNull,[ObjNull]];

if(isNull _veh) exitWith {}; //Not a justin
if(!(_veh isKindOf "Car") && !(_veh isKindOf "landVehicle")) exitWith {}; //not a car
if(damage _veh >= 1) exitWith {}; //Destroyed
if(life_action_inUse) exitWith {};
if(_veh getVariable "trackedveh") exitWith {hint "An diesem Fahrzeug befindet sich bereits ein GPS-Tracker."};
if(!([false,"tracker",1] call life_fnc_handleInv)) exitWith {};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Bringe GPS-Tracker an...","%"];
_progress progressSetPosition 0.01;
_steps = 0.01;
_exit = false;

while {true} do {
	sleep  1;
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync"];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	_steps = _steps + 0.05 + random(0.05);
	_progress progressSetPosition _steps;
	_pgText ctrlSetText format["Bringe GPS-Tracker an..."];
	if(_steps >= 1) exitWith {};
	if(player distance _veh > 5) exitWith {_exit = true;};
	if!(alive player) exitWith {_exit = true;};
	if(life_istazed) exitWith {_exit = true;};
	if(isNull _veh) exitWith {_exit = true;};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
[player,""] remoteExecCall ["life_fnc_animSync"];

if(_exit) exitWith {};

lrl_trackedVehicles = lrl_trackedVehicles + 1;
_veh setVariable ["trackedveh",true,true];
[_veh] spawn life_fnc_gpsMarker;