/*
	File: fn_adacMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers"];
_markers = [];
sleep 0.25;
if(visibleMap) then {
	{
			_marker = createMarkerLocal [format["%1_adac_marker",_x select 0],getPos (_x select 0)];
			_marker setMarkerColorLocal "ColorYellow";
			_marker setMarkerTypeLocal "hd_warning";
			_vehicleType = typeOf (_x select 0);
			_marker setMarkerTextLocal format["%1 mit: %2 benötigt Hilfe",_x select 1,_vehicleType];
			_markers pushBack _marker;
	} foreach life_adacMarker;

	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};