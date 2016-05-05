#include <macro.h>
/*
	File: fn_clothing_ausbilder.sqf
	Author: Bastian "Janl1.DE" Schumacher
	Server: lakeside-reallife.de
	Description:
	Master config file for Cop (Ausbildung) clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Ausbildungskleidung"];

_ret = [];
switch (_filter) do
{

	//Uniform
	
	case 0:
	{
		_ret pushBack ["U_CombatUniShirtMercB_A","Ausbilder",20];
	};
	
	//Huete
	case 1:
	{
		_ret pushBack ["H_Hat_Cap_Thai","Ausbilder Mütze",1];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["TRYK_US_ESS_Glasses","Einsatzbrille LVPD",5],
			["TRYK_US_ESS_Glasses_TAN","Einsatzbrille Sheriff",5],
			["G_Bandanna_tan","Mundtuch Braun",5],
			["G_Bandanna_oli","Mundtuch Grün",5],
			["G_Bandanna_aviator","Mundtuch Schwarz",5],
			["G_Shades_Black",nil,5],
			["Mask_M40","Gasmaske",5],
			["G_Shades_Blue",nil,5],
			["G_Sport_Blackred",nil,5],
			["G_Sport_Checkered",nil,5],
			["G_Sport_Blackyellow",nil,5],
			["G_Sport_BlackWhite",nil,5],
			["G_Aviator",nil,5],
			["G_Squares",nil,5],
			["G_Spectacles_Tinted",nil,5],
			["G_Sport_Red",nil,5],
			["G_Sport_Greenblack",nil,5],
			["G_Tactical_Clear",nil,5],
			["G_Tactical_Black",nil,5],
			["G_Lady_Mirror",nil,5],
			["G_Lady_Dark",nil,5],
			["G_Lady_Blue",nil,5],
			["G_Lowprofile",nil,5],
			["G_Combat",nil,5],
			["G_B_Diving",nil,5],
			["G_Balaclava_blk",nil,5],
			["G_Balaclava_combat",nil,5],
			["G_Balaclava_lowprofile",nil,5],
			["A3L_Balaclava",nil,5],
			["SFG_Tac_BeardD","Bart (Dunkel)",10],
			["SFG_Tac_BeardB","Bart (Blond)",10],
			["SFG_Tac_BeardG","Bart (Ginger)",10],
			["SFG_Tac_BeardO","Bart (Alt)",10],
			["SFG_Tac_ChopsD","Mutton Chops (Dunkel)",10],
			["SFG_Tac_ChopsG","Mutton Chops (Ginger)",10],
			["SFG_Tac_ChopsB","Mutton Chops (Blond)",10],
			["SFG_Tac_ChopsO","Mutton Chops (Alt)",10],
			["SFG_Tac_moustacheD","Moustache (Dunkel)",10],
			["SFG_Tac_moustacheG","Moustache (Ginger)",10],
			["SFG_Tac_moustacheB","Moustache (Blond)",10],
			["SFG_Tac_moustacheO","Moustache (Alt)",10],
			["SFG_Tac_chinlessbD","Chinless Beard (Dunkel)",10],
			["SFG_Tac_chinlessbG","Chinless Beard (Ginger)",10],
			["SFG_Tac_chinlessbB","Chinless Beard (Blond)",10],
			["SFG_Tac_chinlessbO","Chinless Beard (Alt)",10]
			
		];
	};
	
	//Westen
	case 3:
	{
	//	_ret pushBack ["do_polizeiguertel",nil,50];
	//	_ret pushBack ["do_polizeiguertelMen",nil,50];
		_ret pushBack ["A3L_policevest2","DOJ",100];
		
	//	_ret pushBack ["A3L_sheriffvest2","LVPD",100];
		_ret pushBack ["TRYK_V_Bulletproof","LVPD",200];
		_ret pushBack ["TRYK_V_tacv1_P_BK","Einsatzweste LVPD",200];
		
	//	_ret pushBack ["A3L_sheriffvest1","Sheriff",100];
		_ret pushBack ["TRYK_V_Bulletproof_BL","Sheriff",100];
		_ret pushBack ["TRYK_V_tacv1_SHERIFF_BK","Einsatzweste Sheriff",100];
		
	//	_ret pushBack ["V_Vest_light_Invisible","Deeskalationsweste",200]; //Bis Fix raus
		_ret pushBack ["V_Press_F","Presseweste",75];
		_ret pushBack ["V_RebreatherB",nil,75];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["TRYK_B_Carryall_blk",nil,100],
			["TRYK_B_Carryall_JSDF",nil,100],
			["TRYK_B_Alicepack",nil,100],
			["B_Carryall_oucamo",nil,100],
			["B_Carryall_cbr",nil,100],
			["B_Carryall_ocamo",nil,100],
			["B_Carryall_mcamo",nil,100],
			["B_Carryall_oli",nil,100],
			["B_Carryall_khk",nil,100],
			["ACE_TacticalLadder_Pack",nil,250],
			["B_Parachute",nil,500]
		];
	};
};

_ret;
