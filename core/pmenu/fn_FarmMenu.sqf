/*
	File: fn_Farmmenu.sqf
	Author: Dome Pwny
	Website: Lakeside-Reallife.de
	
	Description:
	Opens the Player Farmmenu
*/
#define Btn1 40111
#define Btn2 40112
#define Title 47400
private["_display","_Btn1","_Btn2"];

if(!dialog) then {
	createDialog "life_farming_menu";
};
disableSerialization;

_display = findDisplay 40100;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;

if(!alive player) exitWith {}; //Prevent them from opening this for exploits while dead.
if(life_action_inUse || life_istazed || lrl_knockedOut || delay_pickaxe) exitWith {};
//closedialog 0;

_Btn1 ctrlSetText localize "STR_FarmMenu_PickUse";
_Btn1 buttonSetAction "[] spawn life_fnc_pickAxeUse;";
_Btn1 ctrlEnable false;

{
	_str = [_x] call life_fnc_varToStr; _val = missionNameSpace getVariable _x;
	if(_val > 0 ) then {if( _str == "Spitzhacke" || _str == "pickaxe" ) then {_Btn1 ctrlEnable true;};};
} foreach life_inv_items;

_Btn2 ctrlSetText localize "STR_FarmMenu_AxeUse";
_Btn2 buttonSetAction "[] spawn life_fnc_axtUse;";
_Btn2 ctrlEnable false;

{
	_str = [_x] call life_fnc_varToStr; _val = missionNameSpace getVariable _x;
	if(_val > 0 ) then {if( _str == "Axt" || _str == "axt" ) then {_Btn2 ctrlEnable true;};};
} foreach life_inv_items;