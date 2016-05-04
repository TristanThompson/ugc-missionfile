/*
	File: fn_jerryRefuelLAC.sqf
	Author: Bryan "Tonic" Boardwine (fn_jerryRefuel.sqf)
	edit by	VariatoX SandroX
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorTarget;
life_interrupted = false;
if(playerSide != east) exitWith {};
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};
if(!([false,"fuelE",1] call life_fnc_handleInv)) exitWith {};

life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];
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
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.395;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	
	if(_cP >= 1) exitWith {
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		life_action_inUse = false;
	};
	
	if(!alive player) exitWith {
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		life_action_inUse = false;
	};
	
	if(life_interrupted) exitWith {
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		life_action_inUse = false;
	};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.25] remoteExec ["life_fnc_setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.25);
		};
	};
	
	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.4] remoteExec ["life_fnc_setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.4);
		};
	};
	
	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.4] remoteExec ["life_fnc_setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.4);
		};
	};
};
titleText[format[localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];