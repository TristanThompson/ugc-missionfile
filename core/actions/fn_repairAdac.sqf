/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if(getDammage _veh == 1) exitwith {hint "Dieses Fahrzeug ist komplett zerstört. Daher kannst du es nicht reparieren."};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "A3L_Tahoe_Base") OR (_veh isKindOf "Motorcycle")) then
{
	if(("A3l_Spanner" in (items player)) OR (currentWeapon player == "A3L_Spanner")) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
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
			if(animationState player != "HubFixingVehicleProne_idle1" ) then {
				player action ["SwitchWeapon", player, player, 100];
				[player,"HubFixingVehicleProne_idle1"] remoteExec ["life_fnc_animSync",0];
				player playActionNow "stop";
				[player,"HubFixingVehicleProne_idle1"] remoteExec ["life_fnc_animSync",0];
				player playActionNow "stop";
			};
			
			sleep 0.082;
			
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {life_action_inUse = false;};
			if(!alive player) exitWith {life_action_inUse = false;};
			if(player != vehicle player) exitWith {life_action_inUse = false;};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		[player,""] remoteExec ["life_fnc_animSync",0];
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {life_action_inUse = false; titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		_veh setDamage 0;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};