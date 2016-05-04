/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dis","_price"];
params[
	["_dp",ObjNull,[ObjNull]]
];
if(life_delivery_in_progress && !lrl_dpMission) exitWith { life_delivery_in_progress = false; };

life_delivery_in_progress = false;
lrl_dpMission = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(2.2 * _dis / 20);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
v4r14t0X_isTc00L = v4r14t0X_isTc00L + _price;
[0] call SOCK_fnc_updatePartial;