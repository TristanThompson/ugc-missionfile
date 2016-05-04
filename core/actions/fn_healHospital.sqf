/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(playersNumber independent > 0) exitWith { hint "Es sind Medic´s im Diest. Suchen Sie diese auf!"};
if(v4r14t0X_isTc00L < 50) exitWith {hint format[localize "STR_NOTF_HS_NoCash",50];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
sleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setdamage 0;
v4r14t0X_isTc00L = v4r14t0X_isTc00L - 50;