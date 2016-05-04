/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	edit by: Variatox Sandrox

	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_hungerP","_waterP","_sumH"];

params [
	["_food","",[""]]
];

if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_hungerP = 5; _waterP = 5;};
		case "rabbit":{ _hungerP = 20; _waterP = 0;};
		case "salema": {_hungerP = 35; _waterP = 0;};
		case "ornate": {_hungerP = 35; _waterP = 0;};
		case "mackerel": {_hungerP = 35; _waterP = 0;};
		case "tuna": {_hungerP = 95; _waterP = 0;};
		case "mullet": {_hungerP = 85; _waterP = 0;};
		case "catshark": {_hungerP = 100; _waterP = 0;};
		case "turtle": {_hungerP = 100; _waterP = 0;};
		case "turtlesoup": {_hungerP = 100; _waterP = 25;};
		case "donuts": {_hungerP = 20; _waterP = 0;};
		case "tbacon": {_hungerP = 20; _waterP = 0;};
		case "peach": {_hungerP = 5; _waterP = 5;};
		case "keks": {_hungerP = 5; _waterP = 0;};
		case "pizzabrot": {_hungerP = 25; _waterP = 0;};
		case "pizza": {_hungerP = 45; _waterP = 0;};
		case "brotteig": {_hungerP = 95; _waterP = -10;};
	};
	playsound "essen";
	_sumH = life_hunger + _hungerP;
	_sumW = life_thrist + _waterP;

	if(_sumH > 100) then {_sumH = 100; player setFatigue 1; titleText ["Ich fühle mich total überfressen...","PLAIN"];};
	//TODO:: -- Herzinfarkt Risiko ://

	life_hunger = _sumH;
	life_thrist = _sumW;
	
	if(round(random 10) <= 2) then { playSound3D [KF_CHICKEN + "sounds\burp.ogg",player,false,getPosASL player, 4.5,1,10];}; //Rülpsen

	[] call life_fnc_statsNormalizer;
};
