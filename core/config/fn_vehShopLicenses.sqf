/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

switch (life_veh_shop select 0) do
{
	case "fahrzeug": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "vw": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "honda": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "renault": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "jeep": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "ford": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "opel": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "dodge": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "nissan": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "mercedes": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "audi": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "bmw": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "subaru": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "astonmartin": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "porsche": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "ferrari": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "mclaren": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "lambo": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "luxus": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "peugeot": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "citroen": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "smart": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "agera": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "alfa": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "mitsubishi": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "lykan": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "transam": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "hummer": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "lkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "scanialkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "renaultlkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "volvolkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "manlkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "ivecolkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "macklkw": {_ret = if(license_civ_truck OR license_civ_permdriver) then {true} else {false};};
	case "bus": {_ret = if(license_civ_bus OR license_civ_permdriver) then {true} else {false};};
	case "motorrad": {_ret = if(license_civ_bike OR license_civ_permdriver) then {true} else {false};};
	
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = if(license_civ_driver OR license_civ_permdriver) then {true} else {false};};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_airhq": {_ret = license_cop_air;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "cop_car": {_ret = true;};
	case "fbi_cars": {_ret = true;};
	case "adac_veh": {_ret = true;};
	case "justiz_kfz": {_ret = true;};
	case "med_ship": {_ret = true;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;