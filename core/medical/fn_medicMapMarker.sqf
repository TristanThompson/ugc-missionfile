/*
	File: fn_medicMapMarker.sqf
	Author: Marcel "Variatox" Koch (lsrl.de)
	
	Original File: 
	fn_copMarkers.sqf by Bryan "Tonic" Boardwine
	
	Description:
	Marker für alle Medics auf der Karte
*/

private["_markers","_ems"];

_markers = [];
_ems = [];

sleep 0.5;
if(visibleMap && lrl_emsLeitstelle) then {
	{if(side _x == independent) then {_ems pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "selector_selectedEnemy";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _ems;
		
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
			
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 2;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_ems = [];
}; 