/*
	Tortures the player
*/
private["_rand", "_fatigue"];
params[["_unit",ObjNull,[ObjNull]]];
if(isNull _unit) exitWith {};
if(isNull player) exitWith {};
if(life_action_inUse) exitWith {};

if(player distance _unit > 3 || !alive player || !alive _unit) exitWith {hint "Du kannst die Person nicht foltern."};

life_action_inUse = true;

_rand = [0,5] call life_fnc_randomRound;

switch(_rand) do 
{
	case 0:
	{
		hintSilent "Du hast der Person in den Magen geschlagen.";
		
		_fatigue = ((getFatigue _unit) + 0.15);
		_unit setFatigue _fatigue;
		
		if(getFatigue _unit >= 1) then { _unit setFatigue 1; };
	
		playSound3D [KF_CHICKEN + "sounds\punch.ogg",_unit,false,getPosASL _unit,0.8,1,25];
	};
	case 1:
	{
		hintSilent "Du hast der Person eine Ohrfeige gegeben.";
		
		_fatigue = ((getFatigue _unit) + 0.05);
		_unit setFatigue _fatigue;
		
		if(getFatigue _unit >= 1) then { _unit setFatigue 1; };
		
		playSound3D [KF_CHICKEN + "sounds\punch.ogg",_unit,false,getPosASL _unit,0.8,1,30];
	};
	case 2:
	{
		hintSilent "Du hast der Person gegen das Schienbein getreten.";
		
		playSound3D [KF_CHICKEN + "sounds\punch_break.ogg",_unit,false,getPosASL _unit,0.8,1,35];
	};
	case 3:
	{
		hintSilent "Du hast der Person in den Genitalbereich getreten.";
		
		_unit setFatigue 1;
		
		playSound3D [KF_CHICKEN + "sounds\punch_balls.ogg",_unit,false,getPosASL _unit,0.8,1,50];
	};
	
	case 4:
	{
		hintSilent "Du hast der Person einige Zähne ausgeschlagen.";
		
		_fatigue = ((getFatigue _unit) + 0.1);
		_unit setFatigue _fatigue;
		
		if(getFatigue _unit >= 1) then { _unit setFatigue 1; };
		
		playSound3D [KF_CHICKEN + "sounds\bone2.ogg",_unit,false,getPosASL _unit,0.8,1,35];
	};
	
	default
	{
		hintSilent "Du hast der Person einige Zähne ausgeschlagen.";
		
		_fatigue = ((getFatigue _unit) + 0.1);
		_unit setFatigue _fatigue;
		
		if(getFatigue _unit >= 1) then { _unit setFatigue 1; };
		
		playSound3D [KF_CHICKEN + "sounds\bone2.ogg",_unit,false,getPosASL _unit,0.8,1,35];
	};
};

life_action_inUse = false;