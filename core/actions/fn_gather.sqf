/*
	File: fn_gather.sqf
	Author: Arma 3 Life [www.arma3-life.com/]
	
	Description:
	Main functionality for gathering.
*/
closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_seeds"];
_resourceZones = ["wheat_1","wheat_2","sunflower_1","sunflower_2","corn_1","bean_1","cotton_1","olive_1","opium_1","cannabis_1","pumpkin_1","coke_1"];
_zone = "";

if(life_action_gathering) exitWith {};

{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	hint localize "STR_NOTF_notNearResource";
	life_action_gathering = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["wheat_1"]): {_gather = "Weizen"; _seeds = "wheat seed"; _val = 3;};
	case (_zone in ["wheat_2"]): {_gather = "Weizen"; _seeds = "wheat seed"; _val = 3;};
	case (_zone in ["sunflower_1"]): {_gather = "Sonnenblume"; _seeds = "sunflower seed"; _val = 3;};
	case (_zone in ["sunflower_2"]): {_gather = "Sonnenblume"; _seeds = "sunflower seed"; _val = 3;};
	case (_zone in ["corn_1"]): {_gather = "Mais"; _seeds = "corn seed"; _val = 3;};
	case (_zone in ["bean_1"]): {_gather = "Bohnen"; _seeds = "bean seed"; _val = 3;};
	case (_zone in ["cotton_1"]): {_gather = "Baumwolle"; _seeds = "cotton seed"; _val = 3;};
	//case (_zone in ["olive_1"]): {_gather = "Oliven"; _seeds = "olive seed"; _val = 3;};
	case (_zone in ["opium_1"]): {_gather = "Opium"; _seeds = "opium seed"; _val = 1;};
	case (_zone in ["coke_1"]): {_gather = "Unverarbeitetes Kokain"; _seeds = "coke seed"; _val = 1;};
	case (_zone in ["cannabis_1"]): {_gather = "Cannabis"; _seeds = "cannabis seed"; _val = 1;};
	case (_zone in ["pumpkin_1"]): {_gather = "Kürbis"; _seeds = "pumpkin seed"; _val = 1;};
	default {""};
};

//gather check??
if(vehicle player != player) exitWith {hint localize "STR_NOTF_GatherVeh";};

life_action_gathering = true;

_plantnearby = false;

_plantclsnamearr = [
"A3L_Wheat",
"A3L_Corn",
"A3L_Beans",
"A3L_Cannabis",
"A3L_Cotton",
"Ficus_Bush_1",
"A3L_Pumpkin",
"A3L_Sunflower",
"Oleander2"
];

{
	_objectarr = nearestObjects [player, [_x], 3];
	if (count _objectarr == 0) then {} else {_plantnearby = true;};
} foreach _plantclsnamearr;

if (_plantnearby) then {
	["Zu nah an einer anderen Pflanze",20,"red"] call A3L_Fnc_Msg;
	life_action_gathering = false;
} else {
	if(!([false,_seeds,1] call life_fnc_handleInv)) exitWith {
	["Du hast keine Samen mehr",20,"red"] call A3L_Fnc_Msg;
	life_action_gathering = false;
	};

	_plantedtext = format["Du hast %1 gesäet",_gather];
	[_plantedtext,20,"green"] call A3L_Fnc_Msg;
	[player,_gather] remoteExec ["svr_plantseed",2];
	life_action_gathering = false;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
};

/*

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

*/