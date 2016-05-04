/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	edited by Marcel "Variatox" Koch (lsrl.de)
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops","_SOScops","_SOSmarkers"];
_markers = [];
_cops = [];
_SOScops = [];
_SOSmarkers = [];

sleep 0.5;
if(visibleMap && lrl_copLeitstelle) then {
	{if(side _x == west && ("ItemGPS" in assignedItems _x) && (!(_x getVariable "inSOS") OR isNil {_x getVariable "inSOS"}) ) then {_cops pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	{if(side _x == west && ("ItemGPS" in assignedItems _x) && (_x getVariable "inSOS")) then {_SOScops pushBack _x};} foreach playAbleUnits;
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _cops;
	
	{
		_SOSmarker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_SOSmarker setMarkerColorLocal "ColorRed";
		_SOSmarker setMarkerTypeLocal "mil_dot";
		_SOSmarker setMarkerTextLocal format["SOS - %1", _x getVariable["realname",name _x]];
	
		_SOSmarkers pushBack [_SOSmarker,_x];
	} foreach _SOScops;
		
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
					if ("ItemGPS" in assignedItems _unit && !(_unit getVariable "inSOS")) then
					{
						_marker setMarkerPosLocal (visiblePosition _unit);
					};
				};
			};
			
		} foreach _markers;
		sleep 0.2;
		{
			private["_SOSmarker","_SOSunit"];
			_SOSmarker = _x select 0;
			_SOSunit = _x select 1;
			
			if(!isNil "_SOSunit") then
			{
				if(!isNull _SOSunit) then
				{
					if ("ItemGPS" in assignedItems _SOSunit && _SOSunit getVariable "inSOS") then
					{
						_SOSmarker setMarkerPosLocal (visiblePosition _SOSunit);
					};
				};
			};
			
		} foreach _SOSmarkers;
		
		if(!visibleMap) exitWith {};
		sleep 2;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	{deleteMarkerLocal (_x select 0);} foreach _SOSmarkers;
	_markers = [];
	_cops = [];
	_SOScops = [];
	_SOSmarkers = [];
}; 