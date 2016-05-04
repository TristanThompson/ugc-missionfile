/*
	File: fn_rechnungPrompt
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val","_display","_control"];
if(!isNull (findDisplay 8700)) exitwith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "life_rechnung_pay";
disableSerialization;
waitUntil {!isnull (findDisplay 8700)};
_display = findDisplay 8700;
_control = _display displayCtrl 8701;
life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
_control ctrlSetStructuredText parseText format["<t align='center'>Quittung<t size='.8px'>Von %1 habe ich eine Rechnung in Höhe von $%2 ausgestellt bekommen und habe diese auch gezahlt.</t></t>",_cop getVariable["realname",name _cop],_val];
[] spawn
{
	disableSerialization;
	waitUntil {life_ticket_paid OR (isNull (findDisplay 8700))};
	if(isNull (findDisplay 8700) && !life_ticket_paid) then
	{
[1,format["%1 weigert sich die Rechnung zu zahlen.",profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
	};
};
