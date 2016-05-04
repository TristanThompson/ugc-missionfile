/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine
*/
if((vehicle player == player)) exitWith {};
if(player getVariable "ace_captives_isHandcuffed") then
{
	detach player;
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
};

player action ["Eject", vehicle player];
player action ["GetOut", vehicle player];
titleText[localize "STR_NOTF_PulledOut","PLAIN"];
titleFadeOut 4;