/*
	File: fn_rechnungPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(v4r14t0X_isTc00L < life_ticket_val) exitWith
{
	if(c00l3_b4Nck3h13R < life_ticket_val) exitWith 
	{
		hint "Du hast nicht genug Geld auf deinem Konto, um die Rechnung zu begleichen!";
[1,format["%1 hat nicht genug Geld auf dem Konto!",profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format["Du hast $%1 bezahlt",[life_ticket_val] call life_fnc_numberText];
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - life_ticket_val;
	life_ticket_paid = true;
[1,format[localize "STR_Cop_Ticket_PaidNOTF_3",profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExec ["life_fnc_rechnungPaid",life_ticket_cop];
	closeDialog 0;
};

v4r14t0X_isTc00L = v4r14t0X_isTc00L - life_ticket_val;
life_ticket_paid = true;

closeDialog 0;

[1,format[localize "STR_Cop_Ticket_PaidNOTF_3",profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExec ["life_fnc_rechnungPaid",life_ticket_cop];
