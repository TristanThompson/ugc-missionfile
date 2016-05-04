/*

    File: fn_initZeus.sqf

    Author: John "Paratus" VanderZwet

    

    Description:

    Zeus Initialization file.

*/

player addRating 9999999;

waitUntil {!(isNull (findDisplay 46))};

[] spawn life_fnc_copMarkers;

if(life_adminlevel < 3) exitWith

{
	[1,format["<br/><br/><br/><br/><t size='2.1' color='#ff0000' align='center' font='PuristaBold'>A3L AntiCheat</t><br/><br/><br/><t size='1.6' font='PuristaBold'>Spieler:</t><br/><t size='1.5'>%1</t><br/><br/><br/><t size='1.6' font='PuristaBold'>Restriction:</t><br/><t size='1.5'>JoinSideLogic<br/><br/><br/>",name player]] remoteExec ["life_fnc_broadcast",-2];
	[] call AC_fnc_checkThatShit;
};
