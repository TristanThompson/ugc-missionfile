/*
	File: fn_dropItemsFloor.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Try tu put item on the floor.
*/
private["_obj","_unit","_item","_value","_data","_data2","_death","_total","_weight","_exit","_ind"];
_unit = _this select 0;
_death = _this select 1;
_data = "";
_value = "";
_exit = false;
if (_death) then {
	_data2 = life_inv_items + ["v4r14t0X_isTc00L"];
} else {
	_data = lbData[2005,(lbCurSel 2005)];
	if (_data == "") exitWith{hint "Du musst ein Gegenstand auswählen";_exit = true;};
	_data2 = [_data,0] call life_fnc_varHandle;
	_data2 = [_data2];
	if(life_is_processing) exitWith {hint "Du bist am Verarbeiten!";_exit = true;};
	if(player != vehicle player) exitWith {titleText["Im Fahrzeug kannst du nichts wegwerfen","PLAIN"];_exit = true;};
	if(side player != west) then {
		_ind = [_data,life_illegal_items] call TON_fnc_index;
		if(_ind != -1 && ([west,getPos player,150] call life_fnc_nearUnits)) exitWith {titleText["Es sind Polizisten in der nähe du kannst nichts wegwerfen!","PLAIN"];_exit = true;};
	};
};
if(_exit) exitWith {};
if (count _data2 < 1) exitWith{};

if((time - life_action_delay) < 3 && !(_death)) exitWith {hint "You can not let go of things so quickly. Try to let go of the packet!"};
life_action_delay = time;

{
	_item = _x;
	_var = [_item,1] call life_fnc_varHandle;
	_total = missionNamespace getVariable _item;
	if (_death) then {
		_value = missionNamespace getVariable _item;
		if(_item!="v4r14t0X_isTc00L") then {
			[false,_var,_value] call life_fnc_handleInv;
		};
	} else {
		_value = ctrlText 2010;
		if(parseNumber(_value) <= 0) exitWith {hint "Bitte eine Menge auswählen.";_exit = true;};
		if(!([false,_var,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "You can not let go as an object, maybe you do not have enough?";_exit = true;};
		_value = (parseNumber _value);
	};
	if(_exit) exitWith {};
	_weight = ([_var] call life_fnc_itemWeight) * _value;
	
	switch(_item) do
	{
		case "life_inv_cannabis":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_fresh_weed" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_marijuana":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_weed_bag" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_heroinp":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_heroin_bag" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_opium":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_fresh_Opium" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_glass":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_glass" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_sand":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_sand" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_cement":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_cement" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_kohle":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_coal" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_grillkohle":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_coal" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_holz":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_wood" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_oilp":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_oil" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_oilu":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_oil" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_ironore":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_iron_ore" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_copperore":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_ore_base" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_lockpick":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_lock_pick" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_schwarzpulver":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_coal" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_elektroteile":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Battery_F" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_bohrmaschine":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_DrillAku_F" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_axt":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Axe_F" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_blastingcharge":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_c4" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_ironr":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_iron" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_water":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos;
				//_obj setVariable["water",_value,true];
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		case "life_inv_tbacon":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_TacticalBacon_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		case "life_inv_donuts":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_donut" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_redgull":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		case "life_inv_ziptie":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_MetalWire_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_bloodbag":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_BloodBag_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelE":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		case "life_inv_fuelF":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_CanisterFuel_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		case "life_inv_coffee":
		{
			if (_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Can_V3_F" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		case "v4r14t0X_isTc00L":
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "Land_Money_F" createVehicle _pos;
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				["cash","set",(_total - _value)] call life_fnc_updateCash;
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
				_obj = "cl_package" createVehicle _pos;
				//[[_obj],"life_fnc_simDisable",nil,true] spawn BIS_fnc_mp;
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				//missionNamespace setVariable[_x,(_total - _value)];
				//life_carryWeight = life_carryWeight - _weight;
			};
		};
	};
	if (_value > 0) then {_obj setVariable["idleTime",time,true];};
} foreach (_data2);

[] call life_fnc_p_updateMenu;