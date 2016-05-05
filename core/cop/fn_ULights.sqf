/*
	File: fn_ULights.sqf
	Author: mindstorm, modified by Adanteh
		re-modified by:
		Marcel Marcus "Variatox Sandrox" Koch-Weiss (lakeside-reallife.de)

	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	macht das undercover blaulicht für die geheimdienstler.
*/
if(isServer)exitWith{};
Private ["_bright","_veh","_lightRed","_lightBlue","_light","_leftRed","_xcar"];
_veh = _this select 0;	
_xcar = _veh getVariable "xcar";	
	
if(isNil "_veh" OR isNull _veh OR (isNil{_xcar})) exitWith {};

_lightBlue = [0,0,1];

_light = "#lightpoint" createVehicle getpos _veh;   
_light setLightColor _lightBlue; 
_light setLightBrightness 1;  
_light setLightAmbient [0.9,0.9,10];

switch (typeOf _veh) do{

	case "A3L_CVBlack":{ _light lightAttachObject [_veh, [-0.45, -0.1, 0.17]];};	
	case "A3L_CVGrey":{ _light lightAttachObject [_veh, [-0.45, -0.1, 0.17]];};
	case "A3L_CVWhite":{ _light lightAttachObject [_veh, [-0.45, -0.1, 0.17]];};
	case "cl3_e63_amg_black":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.04]];};
	case "cl3_e63_amg_white":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.04]];};
	case "cl3_e63_amg_lime":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.04]];};
	case "cl3_e63_amg_light_yellow":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.04]];};
	case "cl3_e60_m5_black":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.16]];};
	case "cl3_e60_m5_white":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.16]];};
	case "cl3_e60_m5_lime":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.16]];};
	case "cl3_e60_m5_light_yellow":{ _light lightAttachObject [_veh, [-0.48, -0.82, 0.16]];};
	
/*
**	U P D A T E
**    BLAULICHT
*/

//Mustang
	case "Mrshounka_mustang_mat":{	_light lightAttachObject[_veh,[-0.5, -0.1, 1.33]];};
	case "Mrshounka_mustang_noir":{	_light lightAttachObject[_veh,[-0.5, -0.1, 1.33]];};
	case "Mrshounka_mustang_mat_n":{	_light lightAttachObject[_veh,[-0.5, -0.1, 1.33]];};
	case "Mrshounka_mustang_bleufonce":{	_light lightAttachObject[_veh,[-0.5, -0.1, 1.33]];};
	case "Mrshounka_mustang_mat_b":{	_light lightAttachObject[_veh,[-0.5, -0.1, 1.33]];};
//Range Rover
	case "cl3_range_rover_white":{	_light lightAttachObject[_veh,[0, 0.25, -0.17]];};
	case "cl3_range_rover_lime":{	_light lightAttachObject[_veh,[0, 0.25, -0.17]];};
	case "cl3_range_rover_light_yellow":{	_light lightAttachObject[_veh,[0, 0.25, -0.17]];};
	case "cl3_range_rover_grey":{	_light lightAttachObject[_veh,[0, 0.25, -0.17]];};
	case "cl3_range_rover_burgundy":{	_light lightAttachObject[_veh,[0, 0.25, -0.17]];};
	case "cl3_range_rover_black":{	_light lightAttachObject[_veh,[0, 0.25, -0.17]];};
//SUV Black
	case "cl3_suv_black":{	_light lightAttachObject[_veh,[0, 0.8, -0.12]];};
//Hummer
	case "Mrshounka_hummer_civ_noir":{	_light lightAttachObject[_veh,[-0.2, 0.87, 0.97]];};
	case "Mrshounka_hummer_civ_bleufonce":{	_light lightAttachObject[_veh,[-0.2, 0.87, 0.97]];};
	case "Mrshounka_hummer_civ_rouge":{	_light lightAttachObject[_veh,[-0.2, 0.87, 0.97]];};
	case "Mrshounka_hummer_civ_rose":{	_light lightAttachObject[_veh,[-0.2, 0.87, 0.97]];};
//RS5 Audi
	case "shounka_a3_rs5_civ_noir":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_bleufonce":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_rouge":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_jaune":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_rose":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_grise":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_violet":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
	case "shounka_a3_rs5_civ_orange":{	_light lightAttachObject[_veh,[-0.5, -0.1, 0.2]];};
//Audi Silver SAL
	case "SAL_AudiCivSilver":{	_light lightAttachObject[_veh,[-0.4, 0.1, -0.27]];};
//Taurus
	case "A3L_TaurusBlack":{	_light lightAttachObject[_veh,[-0.4, 0.1, 0.27]];};
	case "A3L_TaurusBlue":{	_light lightAttachObject[_veh,[-0.4, 0.1, 0.27]];};
	case "A3L_TaurusRed":{	_light lightAttachObject[_veh,[-0.4, 0.1, 0.27]];};
	case "A3L_TaurusWhite":{	_light lightAttachObject[_veh,[-0.4, 0.1, 0.27]];};
//Opel Insignia
	case "cl3_insignia_white": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_purple": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_navy_blue": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_lime": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_light_yellow": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_light_blue": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_grey": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_gold": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_burgundy": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
	case "cl3_insignia_black": {	_light lightAttachObject[_veh,[-0.4, -0.4, 0.07]];};
//BMW M6
	case "Mrshounka_bmwm6_noir": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_bleufonce": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_rouge": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_jaune": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_rose": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_grise": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_violet": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
	case "Mrshounka_bmwm6_orange": {	_light lightAttachObject[_veh,[-0.4, 0, 1.28]];};
//BMW M1
	case "Mrshounka_bmwm1_civ_noir": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_bleufonce": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_rouge": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_jaune": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_rose": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_grise": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_violet": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
	case "Mrshounka_bmwm1_civ_orange": {	_light lightAttachObject[_veh,[-0.4, 0.15, 1.34]];};
//M3 DAR Mod
	case "DAR_M3CivBlack": {	_light lightAttachObject[_veh,[-0.4, -0.1, -0.2]];};
//AM 2015C
	case "AM_2015C_Green": {	_light lightAttachObject[_veh,[-0.84, 0, 0.02]];};
	case "AM_2015C_Red": {	_light lightAttachObject[_veh,[-0.84, 0, 0.02]];};
	case "AM_2015C_Grey": {	_light lightAttachObject[_veh,[-0.84, 0, 0.02]];};
	case "AM_2015C_Orange": {	_light lightAttachObject[_veh,[-0.84, 0, 0.02]];};
	case "AM_2015C_White": {	_light lightAttachObject[_veh,[-0.84, 0, 0.02]];};
	case "AM_2015C_Black": {	_light lightAttachObject[_veh,[-0.84, 0, 0.02]];};
//Jonzie
	case "Jonzie_Mini_Cooper": {	_light lightAttachObject[_veh,[-0.45, -1, -0.05]];};
	case "Jonzie_Mini_Cooper_R_spec": {	_light attachTo[_veh,[-0.45, -1, -0.05]];};
//VW Polo GTI
	case "cl3_polo_gti_lime": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
	case "cl3_polo_gti_light_yellow": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
	case "cl3_polo_gti_light_blue": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
	case "cl3_polo_gti_grey": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
	case "cl3_polo_gti_gold": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
	case "cl3_polo_gti_burgundy": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
	case "cl3_polo_gti_black": {	_light lightAttachObject[_veh,[-0.4, -0.55, 0.05]];};
//Golf MK2
	case "cl3_golf_mk2_light_yellow": {	_light lightAttachObject[_veh,[-0.4, -0.4, -0.04]];};
	case "cl3_golf_mk2_light_blue": {	_light lightAttachObject[_veh,[-0.4, -0.4, -0.04]];};
	case "cl3_golf_mk2_grey": {	_light lightAttachObject[_veh,[-0.4, -0.4, -0.04]];};
	case "cl3_golf_mk2_gold": {	_light lightAttachObject[_veh,[-0.4, -0.4, -0.04]];};
	case "cl3_golf_mk2_burgundy": {	_light lightAttachObject[_veh,[-0.4, -0.4, -0.04]];};
	case "cl3_golf_mk2_black": {	_light lightAttachObject[_veh,[-0.4, -0.4, -0.04]];};

//Update

	case "wirk_cayenne":{ _light attachTo[_veh,[-0.6,0,0.55]];};
	case "ALFR_GeK_Panamera":{ _light attachTo[_veh,[-0.5,0.1,0.1]];};
	case "S_PorscheRS_Black":{ _light attachTo[_veh,[-0.4,-0.1,0.03]];};

//Carrera GT
	case "cl3_carrera_gt_black":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_white":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_purple":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_navy_blue":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_lime":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_light_blue":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_grey":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_gold":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};
	case "cl3_carrera_gt_burgundy":{ _light attachTo[_veh,[-0.4,-0.2,-0.16]];};

//Bentley Continentale
	case "ivory_c":{ _light attachTo[_veh,[-0.5,0.1,0.05]];};
	case "ivory_c_livery1":{ _light attachTo[_veh,[-0.5,0.1,0.05]];};
	case "ivory_c_livery2":{ _light attachTo[_veh,[-0.5,0.1,0.05]];};
	case "ivory_c_livery3":{ _light attachTo[_veh,[-0.5,0.1,0.05]];};
	case "ivory_c_livery4":{ _light attachTo[_veh,[-0.5,0.1,0.05]];};
	 
//Lexus LFA
	case "ivory_lfa":{ _light attachTo[_veh,[-0.4,-0.2,0.09]];};
	case "ivory_lfa_sport1":{ _light attachTo[_veh,[-0.4,-0.2,0.09]];};
	case "ivory_lfa_sport2":{ _light attachTo[_veh,[-0.4,-0.2,0.09]];};
	case "ivory_lfa_sport3":{ _light attachTo[_veh,[-0.4,-0.2,0.09]];};
	case "ivory_lfa_sport4":{ _light attachTo[_veh,[-0.4,-0.2,0.09]];};
	case "ivory_lfa_sport5":{ _light attachTo[_veh,[-0.4,-0.2,0.09]];};
	 
//Lambo LP560
	case "ivory_lp560":{ _light attachTo[_veh,[-0.4,0,0.14]];};
	 
//Ferrari 458
	case "cl3_458_white":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_purple":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_navy_blue":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_lime":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_light_yellow":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_light_blue":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_grey":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_gold":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_burgundy":{ _light attachTo[_veh,[-0.4,0,-0.1]];};
	case "cl3_458_black":{ _light attachTo[_veh,[-0.4,0,-0.1]];};

//Aston Martin:
	case "S_Vantage_Red":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "S_Vantage_Blue":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "S_Vantage_Black":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "S_Vantage_Yellow":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "S_Vantage_LightBlue":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "S_Vantage_Purple":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "S_Vantage_White":{ _light attachTo[_veh,[-0.5,-0.19,-0.02]];};
	case "cl3_dbs_volante_white":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_purple":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_navy_blue":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_lime":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_light_yellow":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_light_blue":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_grey":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_gold":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_burgundy":{ _light attachTo[_veh,[0,0.5,0.86]];};
	case "cl3_dbs_volante_black":{ _light attachTo[_veh,[0,0.5,0.86]];};

//Subaru
	case "Jonzie_STI":{ _light attachTo[_veh,[0.5,-0.1,1.61]];};
	case "ivory_wrx":{ _light attachTo[_veh,[-0.4,-0.1,0.33]];};
	
//BMW:
	case "cl3_z4_2008_white":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_purple":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_navy_blue":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_lime":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_light_yellow":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_light_blue":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_grey":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_burgundy":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "cl3_z4_2008_black":{ _light attachTo[_veh,[-0.45,-0.4,-0.08]];};
	case "DAR_M3CivBlack":{ _light attachTo[_veh,[-0.35,-0.05,-0.21]];};
	case "DAR_M3CivWhite":{ _light attachTo[_veh,[-0.35,-0.05,-0.21]];};
	case "DAR_M3CivGrey":{ _light attachTo[_veh,[-0.35,-0.05,-0.21]];};
	 
//Nissan
	case "Mrshounka_a3_gtr_civ_noir":{ _light attachTo[_veh,[-0.5,-0.1,1.25]];};
	case "Mrshounka_a3_gtr_civ_bleu":{ _light attachTo[_veh,[-0.5,-0.1,1.25]];};
	case "Mrshounka_a3_gtr_civ_orange":{ _light attachTo[_veh,[-0.5,-0.1,1.25]];};
	case "Mrshounka_a3_gtr_civ_grau":{ _light attachTo[_veh,[-0.5,-0.1,1.25]];};
	case "Mrshounka_a3_gtr_civ_gruen":{ _light attachTo[_veh,[-0.5,-0.1,1.25]];};
	case "Mrshounka_a3_gtr_civ_violet":{ _light attachTo[_veh,[-0.5,-0.1,1.25]];};
	case "S_Skyline_Red":{ _light attachTo[_veh,[0.48,-0.1,0.1]];};
	case "S_Skyline_Blue":{ _light attachTo[_veh,[0.48,-0.1,0.1]];};
	case "S_Skyline_Black":{ _light attachTo[_veh,[0.48,-0.1,0.1]];};
	case "S_Skyline_Yellow":{ _light attachTo[_veh,[0.48,-0.1,0.1]];};
	case "S_Skyline_Purple":{ _light attachTo[_veh,[0.48,-0.1,0.1]];};
	case "S_Skyline_White":{ _light attachTo[_veh,[0.48,-0.1,0.1]];};

//Dodge
	case "cl3_dodge_charger_f_white":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_purple":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_blue":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_lime":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_grey":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_black":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_darkgreen":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_darkred":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};
	case "cl3_dodge_charger_f_orange":{ _light attachTo[_veh,[-0.48,0.18,1.4]];};  
	 
//Challenger
	case "A3L_Challenger":{ _light attachTo[_veh,[-0.46,-0.7,0.22]];};
	case "A3L_ChallengerGreen":{ _light attachTo[_veh,[-0.46,-0.7,0.22]];};
	case "A3L_ChallengerRed":{ _light attachTo[_veh,[-0.46,-0.7,0.22]];};
	case "A3L_ChallengerWhite":{ _light attachTo[_veh,[-0.46,-0.7,0.22]];};
	case "A3L_ChallengerBlack":{ _light attachTo[_veh,[-0.46,-0.7,0.22]];};
	case "A3L_ChallengerBlue":{ _light attachTo[_veh,[-0.46,-0.7,0.22]];};

//Ford:
	case "ivory_gt500":{ _light attachTo[_veh,[-0.5,-0.08,0.32]];};
	case "A3L_F350Black":{ _light attachTo[_veh,[0,1.5,0.02]];};
	case "A3L_F350Blue":{ _light attachTo[_veh,[0,1.5,0.02]];};
	case "A3L_F350Red":{ _light attachTo[_veh,[0,1.5,0.02]];};
	case "A3L_F350White":{ _light attachTo[_veh,[0,1.5,0.02]];};
	case "Jonzie_Raptor":{ _light attachTo[_veh,[0,1.18,1.01]];};
	case "Jonzie_XB":{ _light attachTo[_veh,[0.44,0.05,0.14]];};
	 
//Jeep
	case "Jonzie_Escalade":{ _light attachTo[_veh,[0,1.3,1.18]];};

//Renault
	case "Mrshounka_megane_rs_2015_noir":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_bleufonce":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_rouge":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_jaune":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_rose":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_grise":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_violet":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	case "Mrshounka_megane_rs_2015_orange":{ _light attachTo[_veh,[-0.5,-0.7,0.66]];};
	 
//Golf
	case "RDS_Golf4_Civ_01":{ _light attachTo[_veh,[-0.4,0.1,0.05]];};

//Gebrauchtwagen:
	case "Jonzie_Quattroporte":{ _light attachTo[_veh,[0.5,-0.2,0.03]];};
	case "Jonzie_Ute":{ _light attachTo[_veh,[0.5,-0.04,1.53]];};
	case "Jonzie_VE":{ _light attachTo[_veh,[0.5,0,1.59]];};
	case "Jonzie_Corolla":{ _light attachTo[_veh,[0.5,-0.3,0.6]];};
	case "Jonzie_Ceed":{ _light attachTo[_veh,[0.5,-0.3,0.06]];};
	case "Jonzie_Galant":{ _light attachTo[_veh,[0.5,-0.7,0.04]];};
	case "A3L_RX7_Blue":{ _light attachTo[_veh,[0.5,-0.1,0.08]];};
	case "A3L_RX7_Red":{ _light attachTo[_veh,[0.5,-0.1,0.08]];};
	case "A3L_RX7_White":{ _light attachTo[_veh,[0.5,-0.1,0.08]];};
	case "A3L_RX7_Black":{ _light attachTo[_veh,[0.5,-0.1,0.08]];};
	case "A3L_Camaro":{ _light attachTo[_veh,[-0.5,-0.5,-0.15]];};
	 
//Audi
	case "cl3_r8_spyder_white":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_purple":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_navy_blue":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_lime":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_light_yellow":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_light_blue":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_grey":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_gold":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_burgundy":{ _light attachTo[_veh,[0,0.85,0.8]];};
	case "cl3_r8_spyder_black":{ _light attachTo[_veh,[0,0.85,0.8]];};	
	case "IVORY_R8":{ _light attachTo[_veh,[-0.5,0.1,-0.1]];};
	case "Nhz_audia8limo":{ _light attachTo[_veh,[-0.5,1,0.11]];};
	
//DRPG
	case "DRPG_08Suburban_Black": {_light attachto [_veh,[-0.45,0.4,1.55]];};
	case "DRPG_08Suburban_White": {_light attachto [_veh,[-0.45,0.4,1.55]];};
	case "DRPG_08Suburban_blue": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					
	case "DRPG_09Tahoe_Black": {_light attachto [_veh,[-0.5,0.15,1.9]];};
	case "DRPG_09Tahoe_White": {_light attachto [_veh,[-0.5,0.15,1.9]];};
	case "DRPG_09Tahoe_blue": {_light attachto [_veh,[-0.5,0.15,1.9]];};
				
	case "DRPG_11RS3_Black": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
	case "DRPG_11RS3_White": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
	case "DRPG_11RS3_blue": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					
	case "DRPG_12M5_Black": {_light attachto [_veh,[-0.37,0.05,0.23]];};
	case "DRPG_12M5_Blue": {_light attachto [_veh,[-0.37,0.05,0.23]];};
	case "DRPG_12M5_Red": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					
	case "DRPG_06Victoria_Black": {_light attachto [_veh,[-0.49,0.1,1.525]];};
	case "DRPG_06Victoria_White": {_light attachto [_veh,[-0.49,0.1,1.525]];};
	case "DRPG_06Victoria_blue": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					
	case "DRPG_14Explorer_Black": {_light attachto [_veh,[-0.5,0.1,0.106]];};
	case "DRPG_14Explorer_White": {_light attachto [_veh,[-0.5,0.1,0.106]];};
	case "DRPG_14Explorer_blue": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					
	case "DRPG_15Charger_Black": {_light attachto [_veh,[-0.4,0.17,0.21]];};
	case "DRPG_15Charger_White": {_light attachto [_veh,[-0.4,0.17,0.21]];};
					
	case "DRPG_12Charger_Black": {_light attachto [_veh,[-0.4,0.3,0.18]];};
	case "DRPG_12Charger_White": {_light attachto [_veh,[-0.4,0.3,0.18]];};
					
//MrShounka
	case "Mrshounka_rs4_civ_noir": {_light attachto [_veh,[-0.5,0.1,1.38]];};
	case "Mrshounka_rs4_civ_grise": {_light attachto [_veh,[-0.5,0.1,1.38]];};
	case "Mrshounka_rs4_civ_bleufonce": {_light attachto [_veh,[-0.5,0.1,1.38]];};
	
	case "shounka_rs6_noir": {_light attachto [_veh,[-0.5,0.53,0.9]];};
	case "shounka_rs6_grise": {_light attachto [_veh,[-0.5,0.53,0.9]];};
	case "shounka_rs6_bleufonce": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					
	case "shounka_a3_rs5_civ_noir": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
	case "shounka_a3_rs5_civ_grise": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
	case "shounka_a3_rs5_civ_bleufonce": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					
	case "Mrshounka_bmwm6_noir": {_light attachto [_veh,[-0.5,0,1.34]];};
	case "Mrshounka_bmwm6_bleufonce": {_light attachto [_veh,[-0.5,0,1.34]];};
	case "Mrshounka_bmwm6_grise": {_light attachto [_veh,[-0.5,0,1.34]];};
					
	case "Mrshounka_bmwm1_civ_noir": {_light attachto [_veh,[-0.47,0.17,1.4]];};
	case "Mrshounka_bmwm1_civ_bleufonce": {_light attachto [_veh,[-0.47,0.17,1.4]];};
	case "Mrshounka_bmwm1_civ_grise": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					
	case "Mrshounka_raptor2_noir": {_light attachto [_veh,[0,1.2,1.1]];};
					
	case "Mrshounka_mustang_noircase": {_light attachto [_veh,[-0.55,0,1.38]];};
	case "Mrshounka_mustang_grise": {_light attachto [_veh,[-0.55,0,1.38]];};
					
	case "Mrshounka_Volkswagen_Touareg_noir": {_light attachto [_veh,[-0.55,0.46,1.55]];};
	case "Mrshounka_Volkswagen_Touareg_grise": {_light attachto [_veh,[-0.55,0.46,1.55]];};
					
	case "Mrshounka_cherokee_noir_blanc_mat": {_light attachto [_veh,[-0.6,0.1,1.58]];};
	case "Mrshounka_cherokee_noir_bleu_mat": {_light attachto [_veh,[-0.6,0.1,1.58]];};
	case "Mrshounka_cherokee_noir": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					
	case "Mrshounka_cayenne_p_noir": {_light attachto [_veh,[-0.6,0.1,1.6]];};
					
	case "Mrshounka_hummer_civ_noir": {_light attachto [_veh,[-0.8,0.7,1.58]];};
	case "Mrshounka_hummer_civ_grise": {_light attachto [_veh,[-0.8,0.7,1.58]];};
					
	case "shounka_h2_noir": {_light attachto [_veh,[-0.59,1.1,1.08]];};
	case "shounka_h2_grise": {_light attachto [_veh,[-0.59,1.1,1.08]];};
					
	case "Mrshounka_c63_2015_noir": {_light attachto [_veh,[-0.53,-0.3,0.81]];};
	case "Mrshounka_c63_2015_grise": {_light attachto [_veh,[-0.53,-0.3,0.81]];};
					
	case "shounka_clk_noir": {_light attachto [_veh,[-0.54,0.05,0.935]];};
	case "shounka_clk_grise": {_light attachto [_veh,[-0.54,0.05,0.935]];};
					
//Ivory
	case "ivory_m3": {_light attachto [_veh,[-0.4,-0.05,0.405]];};
	
};

_light setLightIntensity 10;
_light setLightFlareSize 0.78;
_light setLightFlareMaxDistance 150;
_light setLightUseFlare true;
_light setLightDayLight true;

_light setLightAttenuation [0.05, 0, 0, 500];

_leftRed = true;  
while{ (alive _veh)} do {  
	_xcar = _veh getVariable "xcar";	
	if((isNil{_xcar})) exitWith {deleteVehicle _light;};
	if(!(_xcar select 1)) exitWith {deleteVehicle _light;};
	_bright = 10 * sunOrMoon^4 + 2,5; // HAHA  Math.... Never thought i could use ýou  	
	if(_leftRed) then{  
		_leftRed = false;
		_light setLightBrightness _bright;  
	}else {  
		_leftRed = true;  
		_light setLightBrightness 0.0;  		
	};  
	sleep (_this select 1);  

}; //WHILE END

deleteVehicle _light;