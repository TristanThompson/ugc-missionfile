/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindof "Car") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air") OR (_curTarget isKindOf "Motorcycle") OR (_curTarget isKindOf "A3L_Tahoe_Base")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_vInact_curTarget = _curTarget;

//Unused Buttons
_Btn7 ctrlEnable false;	
_Btn8 ctrlShow false;

//Repair
_Btn1 ctrlSetText localize "STR_vInAct_RepairAdac";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairAdac; closeDialog 0;";
_Btn1 ctrlEnable false;

//Impound Vehicle
_Btn2 ctrlSetText localize "STR_vInAct_Impound";
_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction; closeDialog 0;";

//Vehicle Owner Check
_Btn5 ctrlSetText localize "STR_vInAct_Registration";
_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";

if("A3l_Spanner" in (items player) OR currentWeapon player == "A3l_Spanner") then {
	if(damage _curTarget < 1) then {
		_Btn1 ctrlEnable true;
	};
};

_Btn6 ctrlSetText localize "STR_vInAct_Einschlagen";
_Btn6 buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_scheibeEinschlagen;";
_Btn6 ctrlEnable false;

if(life_inv_nothammer > 0) then {_Btn6 ctrlEnable true};

if(_curTarget isKindOf "Ship") then {
	_Btn3 ctrlSetText localize "STR_vInAct_PushBoat";
	_Btn3 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false};
} else {
	if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
		_Btn3 ctrlSetText localize "STR_vInAct_GetInKart";
		_Btn3 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
		if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false};
	} else {
		_Btn3 ctrlSetText localize "STR_vInAct_Unflip";
		_Btn3 buttonSetAction "life_vInact_curTarget setPos [(getPos life_vInact_curTarget select 0) + 0.025, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		//if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn3 ctrlEnable false;} else {_Btn3 ctrlEnable true;}; - Bug?
	};
};

_Btn4 ctrlSetText "LAC eingetroffen";
_Btn4 buttonSetAction "[cursorTarget] remoteExec [""life_fnc_deleteADAC"",east]; closeDialog 0;";
