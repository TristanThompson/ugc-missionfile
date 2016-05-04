/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Fort Baxter HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Highway Police Dept.","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Los Diablos","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_4","Flughafen","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","Justizvollzugsanstalt","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		if(license_civ_rebel) then {
			_return = [
				["civ_spawn_1","Lakeside City","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Los Diablos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison Town","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Cristobal","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["reb_spawn_1","Rebellen SW","\A3L_Map_Markers\store_icon_red.paa"],
				["reb_spawn_2","Rebellen W","\A3L_Map_Markers\store_icon_red.paa"],
				["reb_spawn_3","Rebellen Bauernhof","\A3L_Map_Markers\store_icon_red.paa"]
			];
		} else {
			_return = [
				["civ_spawn_1","Lakeside City","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Los Diablos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Morrison Town","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","San Cristobal","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\A3L_Map_Markers\house_icon_green.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_2","Lakeside City","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Los Diablos","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_1","Morrison Town","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_central","Zentralklinikum","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};

	case east: {
		if((call life_adaclevel) > 9) then {
			_return = [
				["justiz_spawn_1","Lakeside Gericht","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		} else {
			_return = [
				["adac_spawn_1","Lakeside City","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["adac_spawn_2","Los Diablos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
	};
};

_return;
