/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
		edited: Bastian "Janl1.DE" Schumacher

	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;

if(_mode == 1) then {
	lrl_licenseGotRemoved = true;
};

switch (_state) do
{
	//Führerscheine weg
	case 0:
	{
		If(!license_civ_permdriver) then {
			license_civ_driver = false;
			license_civ_truck = false;
			license_civ_bus = false;
			license_civ_bike = false;
			hint localize "STR_Civ_LicenseRemove_3";
		};
	};

	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_ilgun = false;
		license_civ_presse = false;
		license_civ_taxischein = false;
		hint localize "STR_Jail_LicenseNOTF";
	};

	//Führerschein nach Tod
	case 2:
	{
		license_civ_driver = false;
		license_civ_truck = false;
		license_civ_bus = false;
		license_civ_bike = false;
	};

	//Erschossen von Cop
	case 3:
	{
		license_civ_rebel = false;
		systemChat "LIZENZ> Rebellen-Lizenz entzogen!";
	};


	// Drivers License
	case 10:
	{
		license_civ_driver = false;
		hint localize "STR_Civ_RevokeLicense_Driver";
	};
	// Truck License
	case 11:
	{
		license_civ_truck = false;
		hint localize "STR_Civ_RevokeLicense_Truck";
	};
	// Pilot License
	case 12:
	{
		license_civ_air = false;
		hint localize "STR_Civ_RevokeLicense_Pilot";
	};
	// Boating License
	case 13:
	{
		license_civ_boat = false;
		hint localize "STR_Civ_RevokeLicense_Boating";
	};
	// Diving License
	case 14:
	{
		license_civ_dive = false;
		hint localize "STR_Civ_RevokeLicense_Diving";
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
	//Gun Lizenz - Fix
	case 15:
	{
		license_civ_gun = false;
		hint localize "STR_Civ_RevokeLicense_Firearm";
	};
	//Presseausweis --TODO: Cop Interaktionsmenü
	//Führerscheine A und D Cop Interaktionsmenü
	case 19:
	{
		license_civ_permdriver = false;
		hint localize "STR_Civ_RevokeLicense_PermF";
	};
};
