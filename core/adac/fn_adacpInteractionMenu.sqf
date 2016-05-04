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
//#define Title 37401


private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
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

//Set Ticket Button
_Btn1 ctrlSetText "Rechnung";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_rechnungAction;";

_Btn2 ctrlShow false;
_Btn2 ctrlEnable false;
_Btn3 ctrlShow false;
_Btn3 ctrlEnable false;
_Btn4 ctrlShow false;
_Btn4 ctrlEnable false;
_Btn5 ctrlShow false;
_Btn5 ctrlEnable false;
_Btn6 ctrlShow false;
_Btn7 ctrlEnable false;
_Btn7 ctrlShow false;
_Btn7 ctrlEnable false;
_Btn8 ctrlShow false;
_Btn8 ctrlEnable false;
_Btn9 ctrlShow false;
_Btn9 ctrlEnable false;
_Btn10 ctrlShow false;
_Btn10 ctrlEnable false;
_Btn11 ctrlShow false;
_Btn11 ctrlEnable false;
_Btn12 ctrlShow false;
_Btn12 ctrlEnable false;