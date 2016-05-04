/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 500000) exitWith {hint localize "STR_Cop_TicketOver100"};
[0,format[localize "STR_Cop_TicketGive",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]] remoteExec ["life_fnc_broadcast",west];
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;
[player,"CL3_anim_Ticket"] remoteExec ["life_fnc_animSync",-2];