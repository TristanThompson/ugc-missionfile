/*
	File: fn_smsSound.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	lokaler sound für sms
	
	Values:
	0 = Normale SMS
	1 = COP Notruf
	2 = Admin Anfrage
	3 = Admin Privat-Nachricht
	4 = Admin Rundfunk
	5 = EMS Notruf
	6 = LAC Notruf
	7 = COP Rundfunk
	8 = EMS Rundfunk
	9 = LAC Rundfunk
*/


params[
	"_yo",
	["_betina",ObjNull,[ObjNull]],
	"_msg",
	"_from"
];

if(isNil "_yo") exitWith {};
if(isNil "_betina") exitWith { };
if(isNull _betina) exitWith {};

_ee = lrl_vibratooor;

switch (_yo) do {
	case 0:
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,5,1,4];
		} else {
			_betina say3D "alert"; playSound3D [KF_CHICKEN + "sounds\alert.ogg",_betina,false,getposASL _betina,5,1,4];
		};
	};
	
	case 1: 
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,5,1,4];
		} else {
			_betina say3D "CopAlertSMS"; playSound3D [KF_CHICKEN + "sounds\copalert.ogg",_betina,false,getposASL _betina,4,1,4];
		};

		["PoliceDispatch",[format["%1 | MITTEILUNG >>>>> %2 <<<<<",_from,_msg]]] call bis_fnc_showNotification;
	};

	case 2: {_betina say3D "adminsound"};
	case 3: {_betina say3D "adminsound"};
	case 4: {_betina say3D "adminsound"};
	
	case 5: 
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,5,1,4];
		} else {
			_betina say3D "emsalert"; playSound3D [KF_CHICKEN + "sounds\emsalert.ogg",_betina,false,getposASL _betina,5,1,4];
		};
		["MedicalRequestEmerg",[format["%1 | MITTEILUNG >>>>> %2 <<<<<",_from,_msg]]] call bis_fnc_showNotification;
	};

	case 6: 
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,5,1,4];
		} else {
			_betina say3D "alert"; playSound3D [KF_CHICKEN + "sounds\alert.ogg",_betina,false,getposASL _betina,5,1,4];
		};
		["AdacMessage",[format["%1 | MITTEILUNG >>>>> %2 <<<<<",_from,_msg]]] call bis_fnc_showNotification;
	};

	case 7: 
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,5,1,4];
		} else {
			_betina say3D "alert"; playSound3D [KF_CHICKEN + "sounds\alert.ogg",_betina,false,getposASL _betina,5,1,4];
		};
	};

	case 8: 
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,0.4,1,4];
		} else {
			_betina say3D "alert"; playSound3D [KF_CHICKEN + "sounds\alert.ogg",_betina,false,getposASL _betina,5,1,4];
		};
	};
	
	case 9:
	{
		if(_ee) then {
			_betina say3D "vibration"; playSound3D [KF_CHICKEN + "sounds\vibration.ogg",_betina,false,getposASL _betina,0.4,1,4];
		} else {
			_betina say3D "alert"; playSound3D [KF_CHICKEN + "sounds\alert.ogg",_betina,false,getposASL _betina,5,1,4];
		};
	};
};