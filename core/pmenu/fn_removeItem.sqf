/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint localize "STR_Global_NoSelection";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat"};
if(parseNumber(_value) <= 0) exitWith {hint localize "STR_MISC_Under1"};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,50] call life_fnc_nearUnits) && playerSide == civilian) exitWith {};
if(player getVariable["ace_captives_isHandcuffed",true]) exitWith {hint localize "STR_Global_Restrained"};
if(player != vehicle player) exitWith {titleText["Du kannst nichts wegwerfen, wenn du in einem Fahrzeug sitzt.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint localize "STR_MISC_NotTooMuchDabei"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %2(%1x) entfernt.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;