#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.


switch(_craft) do
{
		case "weapon":
	{
		_return = [
				["KA_FNP45_shield", ["life_inv_panzerglas",1,"life_inv_stahlschild",1]]
			];
	};
	
/*		case "visiere":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
			];
	};*/

/*
	case "uniform":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
			];
	};

	case "backpack":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
			];
	};
*/
	case "item":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
				["life_inv_blastingcharge", ["life_inv_elektroteile",8,"life_inv_schwarzpulver",4,"life_inv_ironr",3]],
				["life_inv_bohrmaschine", ["life_inv_elektroteile",6,"life_inv_ironr",2,"life_inv_copperr",2]],
				["life_inv_nothammer", ["life_inv_ironr",1,"life_inv_holz",2,"life_inv_copperr",3]],
				["life_inv_brotteig", ["life_inv_mehl",3,"life_inv_water",1]],
				["life_inv_panzerglas", ["life_inv_glass",20]],
				["life_inv_stahlschild", ["life_inv_ironr",12,"life_inv_kohle",2]],
				["life_inv_tracker", ["life_inv_elektroteile",10,"life_inv_ironr",2]]
		];
	};
};

_return;
