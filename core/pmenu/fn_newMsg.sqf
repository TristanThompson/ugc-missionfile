#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";ctrlShow[88885, true];};
		[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Du hast eine Nachricht an %1 gesendet: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";ctrlShow[888895,true];};
		[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
		_to = "Polizei";
		hint format["Du hast der %1 folgenden Notruf gesendet: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";ctrlShow[888896,true];};
		[ObjNull,_msg,player,2] remoteExec ["TON_fnc_handleMessages",2];
		_to = "Admins";
		hint format["Du hast den %1 folgende Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später erneut!"];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";ctrlShow[888899,true];};
		[ObjNull,_msg,player,3] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Der EM-Service wurde benachrichtigt mit: %1",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {[8,player] call LRLAC_fnc_busted;};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";};
		[life_smartphoneTarget,_msg,player,4] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Admin-Nachricht gesendet zu: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
		
	//Cop-Rundfunk Button
		if(playerSide != west) then {
			ctrlShow[888828,false];
		} else {
			ctrlShow[888828,true];
		};

	//EMS-Rundfunk Button
		if(playerSide != independent) then {
			ctrlShow[888829,false];	
		} else {
			ctrlShow[888829,true];
		};
		
	//LAC-Rundfunk Button
		if(playerSide != east) then {
			ctrlShow[888830,false];	
		} else {
			ctrlShow[888830,true];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {[8,player] call LRLAC_fnc_busted;};
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";};
		[ObjNull,_msg,player,5] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Admin-Rundruf An Alle: %1",_msg];
		closeDialog 887890;
	};

	//LAC
	case 8:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["Zurzeit ist kein LAC im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";ctrlShow[888899,true];};
		[ObjNull,_msg,player,6] remoteExec ["TON_fnc_handleMessages",2];
		hint format["Der LAC wurde wie folgt benachrichtigt: %1",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	
	//cop rundfunk
	case 9: {
		if(playerSide in [independent, east, civilian]) exitWith {hint "Du bist kein Polizist!"};
		if(__GETC__(life_coplevel) < 4 && !lrl_copLeitstelle) exitWith {hint "Du musst mindestens den Rang Sergeant oder Leitstelle sein!"};
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";};
		[ObjNull,_msg,player,7] remoteExec ["TON_fnc_handleMessages",2];
		hint format["LVPD-Rundmail: %1",_msg];
		closeDialog 887890;
	};
	
	//ems rundfunk
	case 10: {
		if(playerSide in [west, east, civilian]) exitWith {hint "Du bist kein Sanitäter!"};
		if(__GETC__(life_medicLevel) < 5 && !lrl_emsLeitstelle) exitWith {hint "Du musst mindestens den Rang Oberarzt oder Leitstelle sein!"};
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";};
		[ObjNull,_msg,player,8] remoteExec ["TON_fnc_handleMessages",2];
		hint format["EMS-Rundmail: %1",_msg];
		closeDialog 887890;
	};
	
	//lac rundfunk
	case 11: {
		if(playerSide in [west, independent, civilian]) exitWith {hint "Du bist kein LAC Beamter!"};
		if(__GETC__(life_adaclevel) < 6 && !lrl_lacLeitstelle) exitWith {hint "Du musst mindestens den Rang LAC-Ausbilder oder Leitstelle sein!"};
		if(_msg == "") exitWith {hint localize "STR_SMARTPHONE_MissingMessage";};
		if(lrl_judikative) then {
			[ObjNull,_msg,player,10] remoteExec ["TON_fnc_handleMessages",2];
			hint format["JUSTIZ-Rundmail: %1",_msg];
		} else {
			[ObjNull,_msg,player,9] remoteExec ["TON_fnc_handleMessages",2];
			hint format["LAC-Rundmail: %1",_msg];
		};

		closeDialog 887890;
	};
};