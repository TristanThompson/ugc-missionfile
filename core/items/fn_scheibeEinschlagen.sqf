/*
	File: fn_scheibeEinsclagen.sqf
	Author: Bryan "Tonic" Boardwine (lockpick.sqf)
			edited by VariatoX
	Server: lakeside-reallife.de

	Description:
	Schlägt die Scheibe eines Fahrzeuges ein (instant Lockpick)

*/
private["_target","_dis","_isVeh","_ran","_badDis"];

_target = cursorTarget;

if(life_action_inUse) exitWith {};
if(isNull _target) exitWith {}; //Bad type

_dis = ((boundingBox _target select 1) select 0) + 3;

if(player distance _target > _dis) exitWith {}; //Too far

_isVeh = if((_target isKindof "Car") OR (_target isKindOf "landVehicle") OR (_target isKindOf "Motorcycle") OR (_target isKindOf "A3L_Tahoe_Base")) then {true} else {false};
if(!_isVeh) exitWith {};

if(damage _target >= 1) exitWith {life_action_inUse = false;};
if(_isVeh && _target in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

if(!alive player OR life_istazed OR life_knockout OR lrl_knockedOut) exitWith {life_action_inUse = false;};
if((player getVariable["ace_captives_isHandcuffed",false])) exitWith {life_action_inUse = false;};
if(player != vehicle player) exitWith {titleText [localize "STR_NOTF_ActionInVehicle","PLAIN"]; life_action_inUse = false;};
if(playerSide in [civilian,west]) then {
	if(!([false,"nothammer",1] call life_fnc_handleInv)) exitWith {};
};


if(_isVeh) then {
//Schaden am Fahrzeug global machen
	if(local _target) then {
		_target setHitPointDamage ["hitHull",0.75];
	} else {
		[_target, "hitHull", 0.75] remoteExec ["life_fnc_setHitGlobal",_target];
	};
	
	[_target,0] remoteExec ["life_fnc_lockVehicle",_target];
	[_target,"locked",false,true] remoteExec ["TON_fnc_setObjVar",2];
	titleText["= Du hast das Fahrzeug erfolgreich aufgebrochen =","PLAIN"];
	
	playSound3D [KF_CHICKEN + "sounds\autoscheibe.ogg",_target,false,getposASL _target,1.2,1,130];
	[_target,"autoknacker"] call life_fnc_globalSound;
	
	_ran = random(10);
	if(playerSide == civilian) then {
		if(_ran > 2) then {
			player setFatigue 1;
			player setBleedingRemaining 30;
			hint "Autsch! Ich glaube ich hab mich am Glas geschnitten...";
		};
	} else {
		if(_ran == 10) then {
			player setFatigue 1;
			player setBleedingRemaining 30;
			hint "Autsch! Ich glaube ich hab mich am Glas geschnitten...";
		};
	};
};