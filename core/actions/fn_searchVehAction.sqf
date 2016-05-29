/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if(getDammage _vehicle == 1) exitWith {hintSilent "Der Besitzer ist 'Schrottkarre' ... Funny oder? :P";};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "landVehicle") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "A3L_Tahoe_Base")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	_plate = _vehicle getVariable "plateString";
	if(isNil {_owners}) exitWith {
		hint "Fahrzeug wurde durch eine höhere Macht erstellt...";
	};
	life_action_inUse = true;
	hint localize "STR_NOTF_Searching";
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};

	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then
	{
		_owners = "Keine Halter. Beschlagnahmen!<br/>";
	};
	
	_copnumber = _vehicle getVariable "ugc_copNumber_car";
	_copnb = format ["%1", _copnumber];
	
		if(_copnb == "0" OR _copnb == "") then {
			hint parseText format[localize "STR_NOTF_SearchVeh",_owners, _plate];
		} else {
			_plateString = format ["LVPD-%1", _copnb];
			hint parseText format[localize "STR_NOTF_SearchVeh",_owners, _plateString];
		};
	
		
};