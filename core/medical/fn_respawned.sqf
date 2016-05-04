/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
//#1
player setUnconscious false;
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
v4r14t0X_isTc00L = 0; //Make sure we don't get our cash back.
life_respawned = false;
lrl_isDead = false;
player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
life_corpse setVariable["intoxicated",false,true];
life_corpse setVariable["isblinded",false,true];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["isblinded",false,true];
player setVariable["intoxicated",false,true];

1 fadeSound 1;
life_earplugs = false;
lrl_vibratooor = false;
life_action_in_use = false;
life_intox = 0.00;

//Führerschein B und C entfernen
[2] call life_fnc_removeLicenses;

//CSE bedingter Fatigue + Damage Bug
player setDammage 0;
player setFatigue 0;

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};
	case east: {
		_handle = [] spawn life_fnc_adacLoadout;
	};
	waitUntil {scriptDone _handle};
};

814945 cutText [" ","BLACK FADED"];
814945 cutFadeOut 2;

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	//hideBody life_corpse;
	deleteVehicle life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	[false,false,life_arrestMinutes,life_arrestReason] call fnc_jailsetup;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[getPlayerUID player,player,life_copRecieve,true] remoteExec ["life_fnc_wantedBounty",2];
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
};

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.