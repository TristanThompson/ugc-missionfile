/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Verifies that the ticket was paid.
*/
private["_value","_unit","_cop"];
_value = [_this,0,5,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_cop = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR {_unit != life_ticket_unit}) exitWith {}; //NO
if(isNull _cop OR {_cop != player}) exitWith {}; //Double NO

v4r14t0X_isTc00L = v4r14t0X_isTc00L + (_value / 4);	//Bargeld statt Konto; nur 40% vom Ticket
sleep 1;

[0] call SOCK_fnc_updatePartial;