/*
	File: fn_rechnungGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/

private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};

_val = ctrlText 8752;

if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 80000) exitWith {hint "Die Rechnung darf nicht mehr als $80.000 betragen!"};

[0,format["%1 hat %3 eine Rechnung von $%2 ausgestellt.",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]] remoteExec ["life_fnc_broadcast",independent];
[player,(parseNumber _val)] remoteExec ["life_fnc_rechnungPrompt",life_ticket_unit];

[player, "CL3_anim_Ticket"] remoteExec ["life_fnc_animSync", 0];

closeDialog 0;
