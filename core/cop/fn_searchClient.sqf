/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_money"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inv = [];
_money = v4r14t0X_isTc00L;
//_robber = false;
//Illegal items
{
	_var = [_x select 0,0] call life_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call life_fnc_handleInv;
	};
} foreach life_illegal_items;

[player,_inv,_money] remoteExec ["life_fnc_copSearch",_cop];