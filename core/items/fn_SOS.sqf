/*
	File: fn_SOS.sqf
	Author: Variatox Sandrox
	Server: lakeside-reallife.de
	
	Description:
	Führt die Funktionen für den SOS-Knopf aus.
*/
private ["_sosItem","_pos"];

_sosItem = _this select 0;

if(isNull player OR !alive player) exitWith {};
if(playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"}; //No cop
if(life_istazed OR lrl_knockedOut OR life_knockOut) exitWith {}; //Meeeeeeeehhh
if(player getVariable "ace_captives_isHandcuffed") exitWith {hint localize "STR_Global_Restrained"};
if(!([false, _sosItem ,1] call life_fnc_handleInv)) exitWith {};

_pos = mapGridPosition player;

sleep (1 + random(5));

[4,format["<t size='2' color='#EAF200'>• • • - - - • • •</t><br/><t size='2.7' color='#00B4F5'>S O S</t><br/><t size='2' color='#EAF200'>• • • - - - • • •</t><br/><br/><br/><t color='#ff0000' size='1.5'>%1</t><br/><br/><t color='#6DCE5D' size='1.3'>%2</t><br/><br/><t size='1.2'><br/>Drückte Den SOS-Knopf</t><br/>", profileName, _pos]] remoteExec ["life_fnc_broadcast",west]; 
for "_i" from 0 to 7 step 1 do {
	[0,format["SOS -- %1", profileName, _pos]] remoteExec ["life_fnc_broadcast",west];
};

playSound3D [KF_CHICKEN + "sounds\sos.ogg",player,false,getposasl player,2,1.2,12];

if(player getVariable "inSOS") exitWith {};

[] spawn {
	player setVariable ["inSOS",true,true];
	sleep 30;
	player setVariable ["inSOS",false,true];
};