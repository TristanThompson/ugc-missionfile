/*
	File: fn_gpsMarker.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de
	
	Description:
	Erstellt den Fahrzeug Marker für das Fahrzeug und führt checks durch.
*/

_vehicle = param [0,ObjNull,[ObjNull]];
private _countVeh = format ["7A5X0%1 - GPS v1.53",lrl_trackedVehicles];

_m1 = format["%1_tracking_gps",_vehicle];
_marker = createMarkerLocal [_m1, visiblePosition _vehicle];
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerTypeLocal "selector_selectedMission";
_marker setMarkerTextLocal _countVeh;
_marker setMarkerPosLocal (getPos _vehicle);
while {alive _vehicle} do {
	if(isNull _vehicle) exitWith {deleteMarkerLocal _m1;};
	if(!alive _vehicle) exitWith {deleteMarkerLocal _m1;};
	if(!alive player) exitWith {deleteMarkerLocal _m1; _vehicle setVariable ["trackedveh",false,true]};
	if(!(_vehicle getVariable "trackedveh")) exitWith {deleteMarkerLocal _m1;};
	if((round(random(50))) <= 3) then {playSound3D [KF_CHICKEN + "sounds\beep.ogg",_vehicle,false,getPosASL _vehicle, 8,1,15];};
	_marker setMarkerPosLocal getPos _vehicle;
	sleep 4; //TODO:: Funktürme mit einbeziehen
};
deleteMarkerLocal _m1;