/*
	File: fn_pInteraction_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 47450
#define Btn2 47451
#define Btn3 47452
#define Btn4 47453
#define Btn5 47454
#define Btn6 47455

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
if(!dialog) then {
	createDialog "pInteraction_Reb";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(_curTarget isKindOf "House_F") exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		_display = findDisplay 47400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;

		life_pInact_curTarget = _curTarget;
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
	} else {
		closeDialog 0;
	};
};
		
//if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 47400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;

life_pInact_curTarget = _curTarget;

//Entfesseln
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
_Btn1 ctrlEnable false;

//Foltern
_Btn2 ctrlSetText localize "STR_pInAct_Foltern";
_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_TorturePlayer; closeDialog 0;";

//Ins Auto
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_putInCar;";
_Btn3 ctrlEnable false;

//Eskortieren
if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu; closeDialog 0;";
	_Btn4 ctrlEnable false;
} else {
	_Btn4 ctrlSetText localize "STR_pInAct_Escort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	_Btn4 ctrlEnable false;
};

//Kommunikationsmittel Entfernen
_Btn5 ctrlSetText "Kommunikation entfernen";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_HandyEntnehmen; closeDialog 0;";

//Augenbinde
if((_curTarget getVariable["isblinded",false])) then {
	_Btn6 ctrlSetText localize "STR_pInAct_AugenbindeAus";
	_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_augenbindeAus; closeDialog 0;";
} else {
	_Btn6 ctrlSetText localize "STR_pInAct_AugenbindeAn";
	_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_augenbindeAction; closeDialog 0;";
	if(life_inv_augenbinde == 0 ) then { _Btn6 ctrlEnable false};
};

if(!license_civ_rebel) then
{
    _Btn2 ctrlShow false;
    _Btn3 ctrlShow false;
    _Btn4 ctrlShow false;
	_Btn5 ctrlShow false;
};
