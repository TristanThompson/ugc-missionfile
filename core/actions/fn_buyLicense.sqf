/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(_license select 0 == "license_civ_driver" || _license select 0 == "driver" && lrl_licenseGotRemoved) exitWith { closeDialog 0; hint "Dein Führerschein wurde dir doch von der Polizei entzogen!";};

if(v4r14t0X_isTc00L < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

v4r14t0X_isTc00L = v4r14t0X_isTc00L - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];

[0] call SOCK_fnc_updatePartial;