/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;

[getPlayerUID player,profileName,v4r14t0X_isTc00L,c00l3_b4Nck3h13R,player] remoteExecCall ["DB_fnc_insertRequest",2];