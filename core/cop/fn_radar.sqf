/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon
	edited by: Marcel "Variatox" Koch (lsrl.de)
	
	Description:
	Looks like weird but radar?
*/
if(playerSide != west) exitWith {};
private ["_speed","_vehicle","_owners"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;

if(((_vehicle isKindOf "Car") || (_vehicle isKindOf "landVehicle") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "A3L_Tahoe_Base")) && (currentWeapon player) == "Radar_Gun") then {

	if(!alive _vehicle) exitWith {hint "Das Fahrzeug ist zerstört."};

	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) then {
		_owners = "Keinen Halter gefunden";
	};

	_owners = [_owners] call life_fnc_vehicleOwners;

	if(_owners == "any<br/>") then
	{
		_owners = "Keinen Halter gefunden<br/>";
	};

	switch (true) do 
	{
		case ((_speed > 10 && _speed <= 50)) : 
		{	
			hint parseText format ["<t align='center'><t color='#09D7F4'><t size='2' underline='true'>" +(localize "STR_Cop_Radar")+ "</t></t><br/><br/><t color='#33CC33'><t align='center'><t size='1.2'>" +(localize "STR_Cop_VehSpeed") + "</t><br/><br/><t color='#09D7F4' size='1.2' align='center'>Fahrzeughalter</t><br/><t color='#ff0000' size='0.9' align='center'>%2</t>",round  _speed, _owners];
		};
		
		case ((_speed > 51 && _speed <= 100)) : 
		{	
			hint parseText format ["<t align='center'><t color='#09D7F4'><t size='2' underline='true'>" +(localize "STR_Cop_Radar")+ "</t></t><br/><br/><t color='#E0CC14'><t align='center'><t size='1.2'>" +(localize "STR_Cop_VehSpeed") + "</t><br/><br/><t color='#09D7F4' size='1.2' align='center'>Fahrzeughalter</t><br/><t color='#ff0000' size='0.9' align='center'>%2</t>",round  _speed, _owners];
		};
		
		case ((_speed > 100 && _speed <= 200)) : 
		{	
			hint parseText format ["<t align='center'><t color='#09D7F4'><t size='2' underline='true'>" +(localize "STR_Cop_Radar")+ "</t></t><br/><br/><t color='#EE7711'><t align='center'><t size='1.2'>" +(localize "STR_Cop_VehSpeed") + "</t><br/><br/><t color='#09D7F4' size='1.2' align='center'>Fahrzeughalter</t><br/><t color='#ff0000' size='0.9' align='center'>%2</t>",round  _speed, _owners];
		};
		case ((_speed > 200)) : 
		{	
			hint parseText format ["<t align='center'><t color='#09D7F4'><t size='2' underline='true'>" +(localize "STR_Cop_Radar")+ "</t></t><br/><br/><t color='#FF0000'><t align='center'><t size='1.2'>" +(localize "STR_Cop_VehSpeed") + "</t><br/><br/><t color='#09D7F4' size='1.2' align='center'>Fahrzeughalter</t><br/><t color='#ff0000' size='0.9' align='center'>%2</t>",round  _speed, _owners];
		};
	};
};