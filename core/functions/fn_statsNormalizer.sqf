/*
	File: fn_statsNormalizer.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de

	Description:
  Resettet entsprechende Werte, die über den Maximalwert
  hinausgehen (Fatigue, Essen / Trinken).

  //::TODO -> Manual add and remove (params -
  0 = Add / remove
  1 = Value
  2 = Mode - Food, Thirst, Fatigue)
*/

private _oldThirst = life_thirst;
private _oldFood = life_hunger;
private _oldFatigue = getFatigue player;

if(_oldThirst >= 100) then {life_thirst = 100};
if(_oldFood >= 100) then {life_hunger = 100};

if(_oldThirst < 0) then {life_thirst = 0;};
if(_oldFood < 0) then {life_hunger = 0};

if(_oldFatigue <= 0.0) then {player setFatigue 0;};
if(_oldFatigue >= 1.0) then {player setFatigue 1};
