/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Impounds the vehicle
*/
private["_vehicle","_uid","_owner","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP"];

_vehicle = cursorTarget;

if(!((_vehicle isKindOf "Car") || (_vehicle isKindof "landVehicle") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "A3L_Tahoe_Base"))) exitWith {};
if(player distance cursorTarget > 10) exitWith {};
if(damage _vehicle == 1) exitWith {hint "Dieses Fahrzeug ist zerstört und kann nicht abgeschleppt werden."; deleteVehicle _vehicle};
if((_vehicle isKindOf "Car") || (_vehicle isKindof "landVehicle") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "A3L_Tahoe_Base")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {	//Fahrzeug Bug (keine Besitzer) - sprich: Falsches/Fehlendes MP Paket
		hint "Fahrzeug wurde vermutlich durch eine höhere Macht erstellt...";
	};
	_uid = getPlayerUID player;
	_owner = (_vehicleData select 0) select 0;
	if(_uid == _owner) exitWith {hint localize "STR_NOTF_CannotImpoundOwn";};
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	if(playerside == west) then
	{
		[0,format[localize "STR_NOTF_BeingImpounded",(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast",-2];
	} else {
		[0,format[localize "STR_NOTF_BeingImpoundedadac",(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast",-2];
	};
	life_action_inUse = true;
	
	_upp = localize "STR_NOTF_Impounding";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		sleep 0.09;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};
	5 cutText ["","PLAIN"];
	
	if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; life_action_inUse = false;};
	if(!alive player) exitWith {life_action_inUse = false;};

	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindof "landVehicle") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "A3L_Tahoe_Base"))) exitWith {life_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = (call life_impound_car);};
			case (_vehicle isKindOf "Ship"): {_price = (call life_impound_boat);};
			case (_vehicle isKindOf "Air"): {_price = (call life_impound_air);};
			case (_vehicle isKindOf "Motorcycle"): {_price = (call life_impound_car);};			//A3L Vehicle
			case (_vehicle isKindOf "A3L_Tahoe_Base"): {_price = (call life_impound_car);};		//A3L Vehicle
		};
		if(playerSide == west && playersNumber east > 2) then {_vehicle setFuel 0}; //Wenn mehr als 2 IPDler da sind, und ein Cop das KFZ beschlagnahmt -> KFZ Fuel = 0
		life_impound_inuse = true;
		
		//Blaulicht FBI Entfernen
		{if(typeOf _x == "UGC_Einsatzlicht_Blau")then{
				detach _x;
				deleteVehicle _x;
			};
		}forEach attachedObjects _vehicle;

		[_vehicle,true,player] remoteExec ["TON_fnc_vehicleStore",2];
		waitUntil {!life_impound_inuse};
		hint format[localize "STR_NOTF_Impounded",_type,_price];
[0,format[localize "STR_NOTF_HasImpounded",profileName,(_vehicleData select 0) select 1,_vehicleName]] remoteExec ["life_fnc_broadcast",0];
		c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + _price;
	}
		else
	{
		hint localize "STR_NOTF_ImpoundingCancelled";
	};
};
life_action_inUse = false;
