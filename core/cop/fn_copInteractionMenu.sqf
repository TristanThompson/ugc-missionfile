/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Btn11 37460
#define Btn12 37461
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(_curTarget isKindOf "House_F") exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		_Btn9 = _display displayCtrl Btn9;
		_Btn10 = _display displayCtrl Btn10;
		_Btn11 = _display displayCtrl Btn11;
		_Btn12 = _display displayCtrl Btn12;

		life_pInact_curTarget = _curTarget;
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_repairDoor;";
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
		_Btn11 ctrlShow false;
		_Btn12 ctrlShow false;
	} else {
		closeDialog 0;
	};
};
		
if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;

life_pInact_curTarget = _curTarget;

if(!(cursorTarget getVariable["ace_captives_isHandcuffed",false])) then 
{
	_Btn1 ctrlEnable false;
	_Btn3 ctrlEnable false;
	_Btn4 ctrlEnable false;
	_Btn6 ctrlEnable false;
	_Btn7 ctrlEnable false;
	_Btn8 ctrlEnable false;
	_Btn11 ctrlEnable false;
	_Btn12 ctrlEnable false;
};

if(_curTarget getVariable "surrender") then {
	_Btn3 ctrlEnable true;
	_Btn11 ctrlEnable true;
};

//Entfesseln, Put in Car, Eskortieren,

//Entfesseln
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_unrestrain;";
_Btn1 ctrlEnable false;

//License Check
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "closeDialog 0; [player] remoteExec [""life_fnc_licenseCheck"",life_pInact_curTarget];";

//Durchsuchen
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_searchAction;";

//Strafzettel
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_ticketAction;";

//Ins Auto
_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_putInCar;";
_Btn7 ctrlEnable false;

//Foltern
_Btn8 ctrlSetText localize "STR_pInAct_Foltern";
_Btn8 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_TorturePlayer;";

//Intox Level
_Btn9 ctrlSetText localize "STR_pInAct_TestIntox";
_Btn9 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_testIntox;";

//Lizenz Entfernen
_Btn10 ctrlSetText localize "STR_pInAct_RevokeLicense";
_Btn10 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_revokeLicense;";

//Kommunikationsmittel entfernen
_Btn11 ctrlSetText "Kommunikation entfernen";
_Btn11 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_HandyEntnehmen;";

//Eskortieren
if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn4 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
	_Btn4 ctrlEnable false;
} else {
	_Btn4 ctrlSetText localize "STR_pInAct_Escort";
	_Btn4 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_escortAction;";
	_Btn4 ctrlEnable false;
};

//Augenbinde
if((_curTarget getVariable["isblinded",false])) then {
	_Btn12 ctrlSetText localize "STR_pInAct_AugenbindeAus";
	_Btn12 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_augenbindeAus;";
} else {
	_Btn12 ctrlSetText localize "STR_pInAct_AugenbindeAn";
	_Btn12 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_augenbindeAction;";
	if(life_inv_augenbinde == 0 ) then { _Btn12 ctrlEnable false};
};

//Jail
_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
_Btn6 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call fnc_arrestmenu;";
_Btn6 ctrlEnable false;

if(player distance (getMarkerPos "jail_marker") < 40) then {_Btn6 ctrlEnable true};