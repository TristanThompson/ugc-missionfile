/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(v4r14t0X_isTc00L < life_ticket_val) exitWith
{
	if(c00l3_b4Nck3h13R < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,format[localize "STR_Cop_Ticket_NotEnoughNOTF",profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - life_ticket_val;
	life_ticket_paid = true;
	[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
	[life_ticket_val,player,life_ticket_cop] remoteExec ["life_fnc_ticketPaid",life_ticket_cop];
	closeDialog 0;
};

v4r14t0X_isTc00L = v4r14t0X_isTc00L - life_ticket_val;
life_ticket_paid = true;

[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
closeDialog 0;
[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExec ["life_fnc_ticketPaid",life_ticket_cop];

[1] call SOCK_fnc_updatePartial;