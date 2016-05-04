/*
	File: fn_pumpRepair.sqf
	
	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(v4r14t0X_isTc00L < 500) then
{
	if(c00l3_b4Nck3h13R < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "You do not have $500 in cash or in your bank accoumt."};
	case 1: {vehicle player setDamage 0; v4r14t0X_isTc00L = v4r14t0X_isTc00L - 500; hint "You have repaired your vehicle for $500";};
	case 2: {vehicle player setDamage 0; c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - 500; hint "You have repaired your vehicle for $500";};
};