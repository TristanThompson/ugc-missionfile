/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(v4r14t0X_isTc00L > 5) then
{
	[v4r14t0X_isTc00L] remoteExec ["life_fnc_robReceive",_robber];
	[1,format[localize "STR_NOTF_Robbed",_robber getVariable["realname",name _robber],profileName,[v4r14t0X_isTc00L] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",-2];
	v4r14t0X_isTc00L = 0;
}
	else
{
	[2,format[localize "STR_NOTF_RobFail",profileName]] remoteExecCall ["life_fnc_broadcast",_robber];
};