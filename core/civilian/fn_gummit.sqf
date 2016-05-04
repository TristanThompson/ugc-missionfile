/*
	File: fn_gummit.sqf
	Author: Marcel "VariatoX" Koch
	
	Source file 'fn_tazed.sqf' by Bryan "Tonic" Boardwine.
	
	Description:
	Gummigeschosse für die SDAR 5.56mm
*/
private["_curWep","_curMags","_attach"];
params [
	["_unit",ObjNull,[ObjNull]],
	["_shooter",ObjNull,[ObjNull]]
];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; lrl_gummit = false;};

if(_shooter isKindOf "Man" && alive player) then {
	if(!lrl_gummit) then {
		lrl_gummit = true;
		player setVariable ["tf_unable_to_use_radio", true];
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then {
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then {
			{player addMagazine _x;} foreach _curMags;
		};
		
		[_shooter,2] remoteExecCall ["life_fnc_tazeSound",-2];
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExec ["life_fnc_animSync",-2];
		disableUserInput true;
		enableCamshake true; addCamShake [50,5,30];
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		_unit attachTo [_obj,[0,0,0]];
		
		sleep 12;
		
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["life_fnc_animSync",-2];
		
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		
		lrl_gummit = false;
		player allowDamage true;
		disableUserInput false;
	};
} else {
	_unit allowDamage true;
	lrl_gummit = false;
};

player setVariable ["tf_unable_to_use_radio", false];