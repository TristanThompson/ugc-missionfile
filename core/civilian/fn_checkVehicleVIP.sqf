#include <macro.h>
/*
	File: fn_checkVehicleVIP.sqf
	Author: Bastian "Janl1.DE" Schumacher
	Description:
	Testet ob der Besitzer ein VIP ist und speichet dann das neue VIP Kennzeichen
*/

if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_kennzeichen = ctrlText 9983;
if(_kennzeichen == "" OR _kennzeichen == "Neues Kennzeichen eingeben") exitWith {hint "Bitte gebe ein Kennzeichen ein!";};
_kennzeichen = [_kennzeichen] call DB_fnc_mresString; //<- Schutz gegen SQL-Injections
_length = count (toArray _kennzeichen);
if(_length > 7) exitWith {hint "Dein Kennzeichen darf max. 7 und min. 2 Zeichen haben!";};

diag_log format["DEBUG PlateChangedTry :: Player %1 changed the plate of veh-id %2 to %3",name player, _vid, _kennzeichen];
[_kennzeichen, _vid, _unit] remoteExec ["UGC_fnc_saveNewPlate",2];

