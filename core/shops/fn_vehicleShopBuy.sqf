/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_newPrice"];

_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
_statemode = "(KAUF)";
 if(!_mode) then {_basePrice = round(_basePrice / 3); _statemode = "(MIETE)"};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(c00l3_b4Nck3h13R < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - c00l3_b4Nck3h13R] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};

if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};

_state = 0;
if(playerSide != civilian) then {
	_newPrice = round(_basePrice / 10);
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - _newPrice;
	_state = 1;
} else {
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - _basePrice;
	_state = 0;
};
if(playerSide != civilian) then {
	hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_newPrice] call life_fnc_numberText];
} else {
	hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];
};
	
[[player,"buycarniggah"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle",-2];
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["TON_fnc_setObjVar",2];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TON_fnc_setObjVar",2];
	
//	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	if(!(_vehicle isKindOf "Ship")) then {
		if(!(_vehicle isKindOf "Air")) then {
			_vehicle setPosATL (_vehicle modelToWorld [0,0,0.65]);
		} else {
			_vehicle setPosATL (_vehicle modelToWorld [0,0,0.08]);
		};
	};
	[_vehicle,_colorIndex] remoteExec ["life_fnc_colorVehicle",-2];
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[_vehicle,"trunk_in_use",false,true] remoteExec ["TON_fnc_setObjVar",2];
	[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TON_fnc_setObjVar",2];
	
//	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

if(_className in ["I_Heli_light_03_unarmed_F","EC635_Unarmed_BW","EC635_SAR"]) then {		//Cop Veh
	_vehicle disableTIEquipment false;
} else {
	_vehicle disableTIEquipment true;
};

switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_className == "IVORY_PRIUS") then {
			[_vehicle,"cop_prius",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "IVORY_REV") then {
			[_vehicle,"cop_rev",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "B_APC_Wheeled_01_cannon_F") then {
			[_vehicle,"cop_apc",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case civilian: {
		if(_className == "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "IVORY_PRIUS" && _colorIndex == 11) then {
			[_vehicle,"taxi_prius",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "IVORY_PRIUS" && (_colorIndex == 7 OR _colorIndex == 8 OR _colorIndex == 9 OR _colorIndex == 10)) then {
			[_vehicle,"sports_prius",true] spawn life_fnc_vehicleAnimate;
		};
	};

	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_className == "IVORY_PRIUS") then {
			[_vehicle,"med_prius",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case east: {
		if(_className == "C_Offroad_01_F") then {
			[_vehicle,"adac",true] spawn life_fnc_vehicleAnimate;
		};
	};
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExec ["TON_fnc_keyManagement",2];

if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExec ["TON_fnc_vehicleCreate",2];
	};
};

_format = "nix";
if(_state == 1) then {
	_format = format["%1 (%2) kaufte das Fahrzeug %3 für $%4. %5",name player,getPlayerUID player, _className, [_newPrice] call life_fnc_numberText, _statemode];
} else {
	_format = format["%1 (%2) kaufte das Fahrzeug %3 für $%4. %5",name player,getPlayerUID player, _className, [_basePrice] call life_fnc_numberText, _statemode];
};
[_format,2] remoteExecCall ["UGC_fnc_sendToYourMom",2];

[6] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently..
closeDialog 0; //Exit the menu.
true;