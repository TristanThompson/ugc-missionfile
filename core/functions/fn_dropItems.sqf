/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	switch(_item) do
	{
		case "life_inv_cannabis":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[1,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_fresh_weed" createVehicle _pos;

				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_marijuana":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[1.5,3.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_weed_bag" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_heroinp":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[2,4,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_heroin_bag" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_opium":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[2.5,4.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_fresh_Opium" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_glass":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[3,5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_glass" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_sand":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-0.5,-2.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_sand" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_cement":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-1,-2,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_cement" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_kohle":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-1.5,-1.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_coal" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_grillkohle":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-2,-1,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_coal" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_holz":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-2.5,-0.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_wood" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_oilp":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[3,1,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_oil" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_oilu":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[2.5,1.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_oil" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_ironore":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[2,2,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_iron_ore" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_copperore":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[1.5,2.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_ore_base" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_lockpick":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[1,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_lock_pick" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_schwarzpulver":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-1,-3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_coal" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_elektroteile":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-1.5,-2.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Battery_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_bohrmaschine":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-2,-2,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_DrillAku_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_axt":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-2.5,-1.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Axe_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_blastingcharge":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-3,-1,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_c4" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_ironr":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[-3.5,-0.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_iron" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_water":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[5,1,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_tbacon":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[4.5,1.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_donuts":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[4,2,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_donut" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_redgull":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[3.5,2.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelE":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[3,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelF":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[3.5,2.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_coffee":
		{
			if (_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[4,2,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "v4r14t0X_isTc00L":
		{
			if(v4r14t0X_isTc00L > 0) then
			{
				_pos = _unit modelToWorld[4.5,1.5,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				missionNamespace setVariable[_x,0];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[5,1,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_package" createVehicle _pos;
				[_obj] remoteExecCall ["life_fnc_simDisable",0];
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
	};
} foreach (life_inv_items + ["v4r14t0X_isTc00L"]);