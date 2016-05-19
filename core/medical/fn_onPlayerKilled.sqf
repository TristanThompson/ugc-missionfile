/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
if(lrl_isDead) exitWith { };
lrl_isDead = true;
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["ace_captives_isHandcuffed",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["isblinded",false,true];
_unit setVariable["intoxicated",false,true];

if(headgear _unit == "mgsr_headbag") then {removeHeadgear _unit};
removeAllWeapons _unit;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);


	_maxTime = time + (life_respawn_timer * 1);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 || isNull _this || Life_request_timer};

	if (Life_request_timer) then {
	_maxTime = time + (life_respawn_timer * 1);
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 || isNull _this};
	};

	Life_request_timer = false; //resets increased respawn timer

	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

Life_request_timer = false;

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};


_container = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],4];
{deleteVehicle _x;} foreach _container;

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	[3,0] remoteExecCall ["life_fnc_removeLicenses",player];
	//Did I rob the federal reserve?
	if(!life_use_atm && {v4r14t0X_isTc00L > 0}) then {
		[format[localize "STR_Cop_RobberDead",[v4r14t0X_isTc00L] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",-2];
		v4r14t0X_isTc00L = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

if(!lrl_died) then {
	lrl_died = true;
	_handle = [_unit] spawn life_fnc_dropItems;
	waitUntil {scriptDone _handle};
	[] spawn {
		sleep 30;
		lrl_died = false;
	};
};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_intox = 0.00;
v4r14t0X_isTc00L = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_sidechat,playerSide] remoteExec ["TON_fnc_managesc",2];
_format = format["%1 (%2) wurde von %3 (%4) getötet.",name player,getPlayerUID player, name _killer, getPlayerUID _killer];
[_format,0] remoteExecCall ["UGC_fnc_sendToYourMom",2];

[_killer getVariable ["steam64ID",getPlayerUID _killer], _killer getVariable ["realname", name _killer], getPlayerUID player, _unit getVariable["realname", profileName]] remoteExec ["UGC_fnc_logDead",2];

[] call SOCK_fnc_updateRequest;
