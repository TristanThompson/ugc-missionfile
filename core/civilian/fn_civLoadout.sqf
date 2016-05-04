/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the civs out with the default gear.
*/
private["_handle","_clothings"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = 
[	"A3L_Bikini_Girl","U_BasicBodyICE123","A3L_Character_Uniform","A3L_Dude_Outfit","A3L_Farmer_Outfit","A3L_Priest_Uniform","taxi_uni","A3L_Worker_Outfit","HI1","GbGyBr_uni","RastaCiv","vacationshirt_uni","TRYK_shirts_DENIM_BK","TRYK_shirts_DENIM_BK_Sleeve",
	"TRYK_shirts_DENIM_BL","TRYK_shirts_DENIM_BL_Sleeve","TRYK_shirts_DENIM_BWH","TRYK_shirts_DENIM_BWH_Sleeve","TRYK_shirts_DENIM_R","TRYK_shirts_DENIM_R_Sleeve","TRYK_shirts_DENIM_RED2","TRYK_shirts_DENIM_RED2_Sleeve","TRYK_shirts_DENIM_WH",
	"TRYK_shirts_DENIM_WH_Sleeve","TRYK_shirts_DENIM_WHB","TRYK_shirts_DENIM_WHB_Sleeve","TRYK_shirts_DENIM_ylb","TRYK_shirts_DENIM_ylb_Sleeve","TRYK_shirts_DENIM_od","TRYK_shirts_DENIM_od_Sleeve","TRYK_shirts_OD_PAD","TRYK_shirts_OD_PAD_BK",
	"TRYK_shirts_OD_PAD_BL","TRYK_shirts_OD_PAD_BLW","TRYK_shirts_OD_PAD_BLU3","TRYK_shirts_OD_PAD_RED2","TRYK_shirts_OD_PAD_YEL","TRYK_shirts_BLK_PAD","TRYK_shirts_BLK_PAD_BK","SFG","TRYK_shirts_BLK_PAD_BL","TRYK_shirts_BLK_PAD_BLW","TRYK_shirts_BLK_PAD_BLU3",
	"TRYK_shirts_BLK_PAD_RED2","TRYK_shirts_BLK_PAD_YEL","TRYK_shirts_PAD","TRYK_shirts_PAD_BK","TRYK_shirts_PAD_BL","TRYK_shirts_PAD_BLW","TRYK_shirts_PAD_RED2","TRYK_shirts_PAD_BLU3","TRYK_shirts_PAD_YEL","TRYK_shirts_TAN_PAD","TRYK_shirts_TAN_PAD_BK",
	"TRYK_shirts_TAN_PAD_BL","TRYK_shirts_TAN_PAD_BLW","TRYK_shirts_TAN_PAD_BLU3","TRYK_shirts_TAN_PAD_RED2","TRYK_shirts_TAN_PAD_YEL","TRYK_U_B_RED_T_BR","TRYK_U_B_RED_T_BG_BR","TRYK_U_B_BLK_T_BK","TRYK_U_B_BLK_T_BG_BK","TRYK_U_B_BLK_T_WH",
	"TRYK_U_B_BLK_T_BG_WH","TRYK_U_B_Denim_T_BK","TRYK_U_B_Denim_T_BG_BK","TRYK_U_B_Denim_T_WH","TRYK_U_B_Denim_T_BG_WH","U_Rangemaster_A","U_Rangemaster_B","U_Rangemaster_C","U_Rangemaster_D","U_Rangemaster_E","U_Rangemaster_F","U_Rangemaster_G",
	"U_CivilianTShirt_A","U_CivilianTShirt_B","U_CivilianTShirt_C","U_CivilianTShirt_D","U_CivilianTShirt_E","U_CivilianTShirt_F","U_CivilianTShirt_G","cg_awesome1","cg_bb1","cg_beats1","cg_burgerking1","cg_catvideos1","cg_condoms1","cg_csgo1","cg_dad1",
	"cg_deeznuts1","cg_ea1","cg_et1","cg_evolution1","cg_ferrari1","cg_gameover1","cg_gamerepeat1","cg_got1","cg_hand1","cg_hearts1","cg_homer1","cg_illuminati1","cg_jason1","cg_joker1","cg_kfc1","cg_lambo1","cg_lego1","cg_loading1","cg_mario1","cg_mayan1",
	"cg_mtv1","cg_nike1","cg_masterrace1","cg_peanut1","cg_pepsi1","cg_pika1","cg_steam1","cg_stoned1","cg_strippers1","cg_superman1","cg_taylorswift1","cg_turtles1","cg_upyours1","cg_wow1","cg_jounie1"];
	
player addUniform (_clothings select (floor(random (count _clothings))));


/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[] call life_fnc_saveGear;