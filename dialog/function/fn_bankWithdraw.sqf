/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > c00l3_b4Nck3h13R) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 5 && c00l3_b4Nck3h13R > 999999) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

v4r14t0X_isTc00L = v4r14t0X_isTc00L + _val;
c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
