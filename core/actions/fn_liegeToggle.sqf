/*
	File: fn_liegeToggle.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de
	
	Description:
	Parkt die Personentrage ein und aus.
*/

_target = cursorTarget;

if(isNull _target) exitWith {hintSilent "Veh is null"};
if(((typeOf _target) != "Jonzie_Ambulance")) exitWith {hintSilent "Das ist kein JONZIE-Krankenwagen."};

_pos = getPos _target;

if(isNil "lrl_liegeActive") then {lrl_liegeActive = false;};
if(!lrl_liegeActive) then {
	lrl_liegeActive = true;
	_veh = createVehicle ["A3L_Stretcher_F", [0,0,999] , [], 0, "CAN_COLLIDE"];
	_veh allowDamage false;
	_veh setPos [(getpos _target select 0),(getpos _target select 1) - 5.5,(getpos _target select 2) + 1];
	_veh allowDamage true;
	hintSilent "Die Liege wurde ausgeladen."
} else {
	lrl_liegeActive = false;
	_array = [];
	{
		_array pushBack _x;
	} forEach nearestObjects [player,["A3L_Stretcher_F"],8];
	{
		_crew = crew _x;
		hint str(_crew);
		if((count _crew) >= 1) then {
			{
				_x action ["Eject", vehicle player];
				_x action ["GetOut", vehicle player];
				uiSleep 1;
				[_target] remoteExecCall ["ugc_mission_fnc_moveInAmbulance",_x];
			} forEach _crew;
		};
		
		deleteVehicle _x;
	} forEach _array;
	hintSilent "Die Liege wurde eingeladen.";
};