/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for buyable houses?
*/
private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
switch (true) do {
	case (_house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]): {[35000,0]}; //Garage
	case (_house in ["Land_Slum_House01_F","Land_Slum_House03_F","Land_Slum_House02_F","Land_cargo_house_slum_F"]): {[70000,1]}; //Holzschuppen, 1 Stellplatz, Faktor 0,7
	case (_house in ["Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Medevac_house_V1_F","Land_Research_house_V1_F"]): {[85000,1]}; //Militärcontainer, 1 Stellplatz, Faktor 0,85
	case (_house in ["Land_i_Addon_02_V1_F"]): {[90000,1]}; //Steinhaus Schön, 1 Stellplatz, Faktor 0,9
	case (_house in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]): {[100000,1]}; //Steinhaus, 1 Stellplatz, Faktor 1,0	
	case (_house in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]): {[240000,2]}; //Steinhaus, 2 Stellplätze, Faktor 1,2
	case (_house in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]): {[260000,2]}; //Steinhaus, 2 Stellplätze, Faktor 1,3	
	case (_house in ["Land_i_House_Small_03_V1_F"]): {[390000,3]}; //Steinhaus, 3 Stellplätze, Faktor 1,3		
	case (_house in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"]): {[450000,3]}; //Steinhaus, 3 Stellplätze, 2 Etagen, Faktor 1,5 
	case (_house in ["Land_e76_us_house02a","Land_e76_us_house01","Land_e76_us_house01a","Land_e76_us_house01a","Land_e76_us_house01b"]): {[520000,4]}; //Modhaus, 4 Stellplätze, Faktor 1,3
	case (_house in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"]): {[600000,4]}; //Steinhaus, 4 Stellplätze, 2 Etagen, Faktor 1,5
	case (_house in ["Land_Offices_01_V1_F","Land_MilOffices_V1_F"]): {[750000,5]}; //Gewerbeobjekte, 5 Stellplätze, Faktor 1,5	
	case (_house in ["Land_A_Villa_EP1"]): {[900000,6]}; //Villa, 6 Stellplätze, Faktor 1,5		
	//case (_house in ["Land_mbg_ger_pub_1","Land_mbg_ger_pub_2"]): {[250000,4]};	
	//case (_house in ["Land_i_Shed_Ind_F"]): {[125000,4]};
	//case (_house in ["Land_Stone_Gate_F"]): {[1250,0]};
	default {[]};
};