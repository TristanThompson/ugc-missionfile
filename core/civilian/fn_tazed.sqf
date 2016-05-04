/*
/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!life_istazed) then
	{
		diag_log format ["= TAZER NOTIFICATION :: %1 wurde von %2 tazed.",name _unit, name _shooter];
		life_istazed = true;
		player setVariable ["tf_unable_to_use_radio", true];
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};
		
		[_unit,1] remoteExecCall ["life_fnc_tazeSound",-2];
	
	/* New Animation (Ragdoll Effect) */
	
		enableCamshake true;
		addCamShake [50,5,30];
		
		disableUserInput true;
		player allowDamage false;
		if (vehicle player == player) then {
			private ["_ragdoll"];
			player allowDamage false;
			_ragdoll = "Land_Can_V3_F" createVehicleLocal [0,0,0];
			_ragdoll setMass 1e10;
			_ragdoll attachTo [player, [0,0,0], "Spine3"];
			_ragdoll setVelocity [0,0,6];
			player allowDamage false;
			detach _ragdoll;
			0 = _ragdoll spawn {
				deleteVehicle _this;
				player allowDamage true;
			};
		};
		sleep 0.5;
		player allowDamage true;	//Double-Check
		sleep 4;
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		
		[player,"static_dead"] remoteExec ["life_fnc_animSync",-2];
		
		
		_unit attachTo [_obj,[0,0,0]];
		sleep 12;
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["life_fnc_animSync",-2];
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		player setVariable ["tf_unable_to_use_radio", false];
		life_istazed = false;
		player allowDamage true;
		disableUserInput false;
	};
}
	else
{
	_unit allowDamage true;
	life_istazed = false;
};

player setVariable ["tf_unable_to_use_radio", false];