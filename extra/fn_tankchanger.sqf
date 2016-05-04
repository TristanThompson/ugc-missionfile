private["_veh","_veh_type","_factor","_factor_calculated","_fuel","_fuel_old","_fuel_new","_fuel_diff"];
while {true} do
{
	waitUntil {sleep 0.1; (vehicle player != player && (driver (vehicle player)) == player)};
	_veh = vehicle player;
	_veh_type = typeof _veh;
	_fuel_old = fuel _veh;
	
	switch(true) do
	{
		case (_veh_type == "A3L_Camaro"): {_factor = 1.5;};
		
	
		case (_veh_type == "A3L_SuburbanCSO"): {_factor = 2;};
		case (_veh_type == "A3L_Suburban"): {_factor = 2;};
		
		case (_veh_type == "A3L_PuntoRed"): {_factor = 1.5;};
		case (_veh_type == "A3L_PuntoBlack"): {_factor = 1.5;};
		case (_veh_type == "A3L_PuntoWhite"): {_factor = 1.5;};
		case (_veh_type == "A3L_PuntoGrey"): {_factor = 1.5;};
		
		case (_veh_type == "B_Heli_Light_01_F"): {_factor = 2.5;};
		case (_veh_type == "C_Heli_Light_01_civil_F"): {_factor = 2.5;};
		default {_factor = 4;};
	};
	
	while {true} do
	{
		if(vehicle player == player) exitWith {};
		if((driver (vehicle player)) != player) exitWith {};
		if(!(alive (vehicle player))) exitWith {};
		
		_fuel = fuel _veh;
		_fuel_diff = _fuel_old - _fuel;
		_factor_calculated = _factor;
		if(_fuel_diff > 0) then
		{
			_fuel_new = _fuel - ((_factor_calculated * _fuel_diff) - _fuel_diff);
			if(_fuel_new < 0) then
			{
				_fuel_new = 0;
			};
			if(_factor_calculated != 1) then
			{
				_veh setFuel _fuel_new;
			};
		};
		_fuel_old = fuel _veh;
		sleep 0.5;
	};
};