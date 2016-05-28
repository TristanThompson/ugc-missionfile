/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {250}; //Drivers License cost
	case "bus": {1400};
	case "bike": {150};
	case "boat": {500}; //Boating license cost
	case "pilot": {5000}; //Pilot/air license cost
	case "gun": {7500}; //Firearm/gun license cost
	case "ilgun": {20000}; //Illegal Firearm/gun license cost
	case "dive": {150}; //Diving license cost
	case "oil": {6500}; //Oil processing license cost
	case "cair": {2500}; //Cop Pilot License cost
	case "ausbilder": {5000}; //Nicht Kaufbar - Dennoch Preis, Logic? Welcome to sqf
	case "taktik": {5000}; //Nicht Kaufbar - Dennoch Preis, Logic? Welcome to sqf
	case "cg": {1000}; //Coast guard license cost
	case "heroin": {9000}; //Heroin processing license cost
	case "marijuana": {9000}; //Marijuana processing license cost
	case "medmarijuana": {75}; //Medical Marijuana processing license cost
	case "gang": {500}; //Gang license cost
	case "rebel": {25000}; //Rebel license cost
	case "truck": {1600}; //Truck license cost
	case "diamond": {6500};
	case "salt": {6500};
	case "cocaine": {9000};
	case "sand": {6500};
	case "iron": {6500};
	case "copper": {6500};
	case "cement": {6500};
	case "mair": {1250};
	case "home": {50000};
	case "elektriker": {6500};
	case "schreiner": {6500};
	case "grillmeister": {6500};
	case "presse": {1000};
	case "taxischein": {1000};
	case "fischerei": {2000};
	case "mehlmahl": {3750};
	case "permdriver": {5000};
	case "rebelbase": {25000}; //Rebellen Grundlizenz
	case "swat": {2500};
	case "fbi": {2500};
};
