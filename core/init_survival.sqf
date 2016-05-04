/*
	Author: Bryan "Tonic" Boardwine
	File: init_survival.sqf
	
	Description:
	Adds all the food 'n drink stuff to the game
*/


[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {
			player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";
		} else {
			life_hunger = life_hunger - 10;
			[] call life_fnc_hudUpdate;
			if(life_hunger < 2) then {
				player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";
			};
			switch(life_hunger) do {
				case 30: {hint localize "STR_NOTF_EatMSG_1";};
				case 20: {hint localize "STR_NOTF_EatMSG_2";};
				case 10: {hint localize "STR_NOTF_EatMSG_3"; player setFatigue 1;};
				};
			};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};
	
	while{true} do
	{
		sleep 450;
		[] call _fnc_food;
		sleep 100;
		[] call _fnc_water;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};


//Intox Start
private["_obj"];
[] spawn  
{
	while{true} do
	{
		sleep 180;
		if(life_intox > 0) then 
		{
			if(life_intox <= 0.02) then {life_intox = 0.00;} else {life_intox = life_intox - 0.02;};
			[] call life_fnc_hudUpdate;
			switch(true) do {
				case (life_intox == 0.00): {hint "Du hast nun einen Rauschlevel von 0,0%!";};
				case (life_intox == 0.08): {hint "Du hast nun einen Rauschlevel von 0,08% und darfst legal ein Fahrzeug bedienen!";};
			};
		};
	};
};

[] spawn  
{
	while{true} do
	{
		waitUntil {life_intox > 0.08};
		player setVariable["intoxicated",true,true];
		[0,format["%1 ist überdosiert.",name player]] remoteExec ["life_fnc_broadcast",(position player) nearEntities [["Man"], 15]];
		while{life_intox > 0.08} do 
		{
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [round ((1+(life_intox-.1))^10)];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		player setVariable["intoxicated",false,true];
	};
};

[] spawn  
{
	while{true} do
	{
		waitUntil {life_intox > 0.30};
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
		_obj setPosATL (getPosATL player);
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExec ["life_fnc_animSync",-2];
		player attachTo [_obj,[0,0,0]];
		[0,format["%1 fiel in Ohnmacht.",name player]] remoteExec ["life_fnc_broadcast",(position player) nearEntities [["Man"], 15]];
		while{life_intox > 0.30} do 
		{
			hint "Dein Rauschlevel ist über 0,30%. Das ist ein gefährlich hohes Maß!";
			sleep 60;
		};
		detach player;
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["life_fnc_animSync",-2];
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		if(backpack player in ["tf_mr3000","tf_anarc164"]) then {
			(unitBackpack player) setObjectTextureGlobal [0,""];
		};
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 700;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 10;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

//Auto Sync (alle 15 Minuten)
[] spawn {
	while {true} do {
		sleep 900;
		[] call SOCK_fnc_updateRequest;
	};
};


_markerCop = ["funk_cop_1","funk_cop_2","funk_cop_3","funk_cop_4","funk_cop_5","ausbildung_cop_1"];
_markerEMS = ["funk_ems"];
_markerLAC = ["funk_lac"];

if (playerSide != west) then {
	{ deleteMarkerLocal _x; } forEach _markerCop;
};

if (playerSide == civilian) then {
	{ deleteMarkerLocal _x; } forEach _markerEMS;
	{ deleteMarkerLocal _x; } forEach _markerLAC;
};